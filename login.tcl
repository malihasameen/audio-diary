#############################################################################
# Generated by PAGE version 4.26
#  in conjunction with Tcl version 8.6
#  Dec 15, 2019 11:43:07 AM PKT  platform: Windows NT
set vTcl(timestamp) ""


if {!$vTcl(borrow) && !$vTcl(template)} {

set vTcl(actual_gui_bg) #d9d9d9
set vTcl(actual_gui_fg) #000000
set vTcl(actual_gui_analog) #ececec
set vTcl(actual_gui_menu_analog) #ececec
set vTcl(actual_gui_menu_bg) #d9d9d9
set vTcl(actual_gui_menu_fg) #000000
set vTcl(complement_color) #d9d9d9
set vTcl(analog_color_p) #d9d9d9
set vTcl(analog_color_m) #ececec
set vTcl(active_fg) #000000
set vTcl(actual_gui_menu_active_bg)  #ececec
set vTcl(active_menu_fg) #000000
}




proc vTclWindow.top42 {base} {
    global vTcl
    if {$base == ""} {
        set base .top42
    }
    if {[winfo exists $base]} {
        wm deiconify $base; return
    }
    set top $base
    ###################
    # CREATING WIDGETS
    ###################
    vTcl::widgets::core::toplevel::createCmd $top -class Toplevel \
        -background $vTcl(actual_gui_bg) 
    wm focusmodel $top passive
    wm geometry $top 600x347+444+46
    update
    # set in toplevel.wgt.
    global vTcl
    global img_list
    set vTcl(save,dflt,origin) 0
    wm maxsize $top 1370 749
    wm minsize $top 120 1
    wm overrideredirect $top 0
    wm resizable $top 1 1
    wm deiconify $top
    wm title $top "New Toplevel"
    vTcl:DefineAlias "$top" "Toplevel1" vTcl:Toplevel:WidgetProc "" 1
    label $top.lab46 \
        -background $vTcl(actual_gui_bg) -disabledforeground #a3a3a3 \
        -font {-family {Segoe UI} -size 21 -weight bold} \
        -foreground $vTcl(actual_gui_fg) -text {AUDIO DIARY} 
    vTcl:DefineAlias "$top.lab46" "Label1" vTcl:WidgetProc "Toplevel1" 1
    frame $top.fra47 \
        -borderwidth 2 -relief groove -background $vTcl(actual_gui_bg) \
        -height 235 -width 565 
    vTcl:DefineAlias "$top.fra47" "Frame1" vTcl:WidgetProc "Toplevel1" 1
    set site_3_0 $top.fra47
    ttk::entry $site_3_0.tEn51 \
        -font TkTextFont -foreground {} -background {} -takefocus {} \
        -cursor ibeam 
    vTcl:DefineAlias "$site_3_0.tEn51" "TEntry1" vTcl:WidgetProc "Toplevel1" 1
    ttk::entry $site_3_0.tEn52 \
        -font TkTextFont -foreground {} -background {} -takefocus {} \
        -cursor ibeam 
    vTcl:DefineAlias "$site_3_0.tEn52" "TEntry2" vTcl:WidgetProc "Toplevel1" 1
    label $site_3_0.lab53 \
        -background $vTcl(actual_gui_bg) -disabledforeground #a3a3a3 \
        -font {-family {Segoe UI} -size 11} -foreground $vTcl(actual_gui_fg) \
        -justify left -text Username: 
    vTcl:DefineAlias "$site_3_0.lab53" "Label2" vTcl:WidgetProc "Toplevel1" 1
    label $site_3_0.lab55 \
        -activebackground #f9f9f9 -activeforeground black \
        -background $vTcl(actual_gui_bg) -disabledforeground #a3a3a3 \
        -font {-family {Segoe UI} -size 11} -foreground $vTcl(actual_gui_fg) \
        -highlightbackground $vTcl(actual_gui_bg) -highlightcolor black \
        -justify left -text Password: 
    vTcl:DefineAlias "$site_3_0.lab55" "Label2_3" vTcl:WidgetProc "Toplevel1" 1
    place $site_3_0.tEn51 \
        -in $site_3_0 -x 220 -y 70 -width 236 -relwidth 0 -height 21 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.tEn52 \
        -in $site_3_0 -x 220 -y 110 -width 236 -relwidth 0 -height 21 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.lab53 \
        -in $site_3_0 -x 95 -y 70 -width 98 -relwidth 0 -height 21 \
        -relheight 0 -anchor nw -bordermode ignore 
    place $site_3_0.lab55 \
        -in $site_3_0 -x 98 -y 110 -width 92 -relwidth 0 -height 21 \
        -relheight 0 -anchor nw -bordermode ignore 
    button $top.but57 \
        -activebackground $vTcl(analog_color_m) -activeforeground #000000 \
        -background $vTcl(actual_gui_bg) -command login \
        -disabledforeground #a3a3a3 -font TkDefaultFont \
        -foreground $vTcl(actual_gui_fg) \
        -highlightbackground $vTcl(actual_gui_bg) -highlightcolor black \
        -pady 0 -text Login 
    vTcl:DefineAlias "$top.but57" "Button1" vTcl:WidgetProc "Toplevel1" 1
    ###################
    # SETTING GEOMETRY
    ###################
    place $top.lab46 \
        -in $top -x 10 -y 10 -width 578 -relwidth 0 -height 61 -relheight 0 \
        -anchor nw -bordermode ignore 
    place $top.fra47 \
        -in $top -x 20 -y 90 -width 565 -relwidth 0 -height 235 -relheight 0 \
        -anchor nw -bordermode ignore 
    place $top.but57 \
        -in $top -x 390 -y 240 -width 87 -relwidth 0 -height 34 -relheight 0 \
        -anchor nw -bordermode ignore 

    vTcl:FireEvent $base <<Ready>>
}

set btop ""
if {$vTcl(borrow)} {
    set btop .bor[expr int([expr rand() * 100])]
    while {[lsearch $btop $vTcl(tops)] != -1} {
        set btop .bor[expr int([expr rand() * 100])]
    }
}
set vTcl(btop) $btop
Window show .
Window show .top42 $btop
if {$vTcl(borrow)} {
    $btop configure -background plum
}

