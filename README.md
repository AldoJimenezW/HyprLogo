# WORKING ON NETLOGO SUPPORT FOR HYPRLAND

Add this to your hyprland config to setup NetLogo 

```
windowrulev2 = workspace 2, class:^(netlogo-gui-Startup)$
windowrulev2 = float, class:^(netlogo-gui-Startup)$

env = _JAVA_AWT_WM_NONREPARENTING,1
env = _JAVA_OPTIONS,-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dsun.java2d.opengl=true
env = GDK_BACKEND,x11
```
