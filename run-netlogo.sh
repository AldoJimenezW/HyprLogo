#!/bin/bash

NETLOGO_DIR="$HOME/Documents/HyprLogo/NetLogo-6.2.1"

export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS="-Dsun.java2d.xrender=false -Dsun.java2d.opengl=false -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
export GDK_BACKEND=x11
export XDG_SESSION_TYPE=x11
export QT_QPA_PLATFORM=xcb

export LIBGL_ALWAYS_SOFTWARE=1

unset XLIB_SKIP_ARGB_VISUALS

cd "$NETLOGO_DIR" && ./NetLogo
