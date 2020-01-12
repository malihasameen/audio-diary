#! /usr/bin/env python
#  -*- coding: utf-8 -*-
#
# Support module generated by PAGE version 4.26
#  in conjunction with Tcl version 8.6
#    Dec 15, 2019 12:56:56 PM PKT  platform: Windows NT
import hashlib
from Crypto.Cipher import AES
from Crypto import Random
import pyaudio
from _thread import *
import threading
import os
import wave
import winsound

try:
    import Tkinter as tk
except ImportError:
    import tkinter as tk
    from tkinter import filedialog

try:
    import ttk
    py3 = False
except ImportError:
    import tkinter.ttk as ttk
    py3 = True


def init(top, gui, *args, **kwargs):
    global w, top_level, root
    w = gui
    top_level = top
    root = top


def destroy_window():
    # Function which closes the window.
    global top_level
    top_level.destroy()
    top_level = None

lock = threading.Lock()
chunk = 1024  # Record in chunks of 1024 samples
sample_format = pyaudio.paInt16  # 16 bits per sample
channels = 2
audio_state = True
rate = 44100  # Record at 44100 samples per second
second = 300
playing_audio = False


def record_audio():
    print('record_and_play_support.record_audio')
    w.Label3.configure(text='''Start Recording...''')
    start_new_thread(record, ())


def record():
    global audio, frames, audio_state
    audio = pyaudio.PyAudio()

    p = pyaudio.PyAudio()  # Create an interface to PortAudio

    print('Recording')

    stream = p.open(format=sample_format,
                    channels=channels,
                    rate=rate,
                    frames_per_buffer=chunk,
                    input=True)

    frames = []  # Initialize array to store frames

    # Store data in chunks for 10 seconds
    for i in range(0, int(rate / chunk * second)):
        data = stream.read(chunk)
        frames.append(data)
        if not audio_state:
            break
        else:
            blah = 0

    # Stop and close the stream
    stream.stop_stream()
    stream.close()
    # Terminate the PortAudio interface
    p.terminate()

    print('Finished recording')


def stop_audio():
    global audio, frames, audio_state
    print('record_and_play_support.stop_audio')
    lock.acquire()
    audio_state = False
    lock.release()
    w.Label3.configure(text='''Stop Recording...''')
    print(len(frames))


password = "kitty"
key = hashlib.sha256(password.encode('utf-8')).digest()    


def save_audio():
    print('record_and_play_support.save_audio')
    w.Label3.configure(text='''Save Recording...''')

    filename = filedialog.asksaveasfilename(initialdir = "/",title="Save File",
        filetypes=[("Enc Files", "*.enc")])

    iv = Random.new().read(AES.block_size)
    encryptor = AES.new(key, AES.MODE_CBC, iv)

    with open(filename, 'wb') as outfile:
        outfile.write(iv)
        for frame in frames:
            if len(frame) % AES.block_size != 0:
                frame += b"\0" * (AES.block_size - len(frame) % AES.block_size)
            outfile.write(encryptor.encrypt(frame))

    w.Label3.configure(text='''Saved Recording''')


def select_file():
    filename = filedialog.askopenfilename(initialdir = "/",title="Save File",
        filetypes=[("Enc Files", "*.enc")])

    file = filename.split("/")[-1]
    w.Label5.configure(text=file)

    global decrypted_frames
    decrypted_frames = []
    with open(filename, 'rb') as infile:
        iv = infile.read(AES.block_size)
        decryptor = AES.new(key, AES.MODE_CBC, iv)

        while True:
            frame = infile.read(1024)
            if len(frame) == 0:
                break
            decrypted_frames.append(decryptor.decrypt(frame))

        decrypted_frames[-1] = decrypted_frames[-1].rstrip(b"\0")


def play_sound():
    global playing_audio
    if not playing_audio:
        playing_audio = True
        w.Button4.configure(text='''Stop Audio''')
        with wave.open("encrypted.wav", 'wb') as wf:
            wf.setnchannels(channels)
            wf.setsampwidth(2)
            wf.setframerate(rate)
            wf.writeframes(b''.join(decrypted_frames))

        ################
        # Play sound
        winsound.PlaySound(r'encrypted.wav', winsound.SND_ASYNC)

    else:
        playing_audio = False
        w.Button4.configure(text='''Play Audio''')
        winsound.PlaySound(None, winsound.SND_PURGE)
        if os.path.exists("encrypted.wav"):
            os.remove("encrypted.wav")
        else:
            blah = 0
