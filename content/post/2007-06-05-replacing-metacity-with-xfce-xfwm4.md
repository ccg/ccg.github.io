---
title: Replacing Metacity with XFCE xfwm4
author: Chad Glendenin
date: '2007-06-05'
slug: replacing-metacity-with-xfce-xfwm4
categories: []
tags: []
---

# Replacing Metacity with XFCE's xfwm4

I found the following Ubuntu-specific pages with information about replacing Metacity with XFCE's xfwm4:

* http://doc.gwos.org/index.php/Xfwm4
* http://ubuntuforums.org/showthread.php?t=88393

Note that the Ubuntu instructions don't quite work for Debian because of Debian's customized /usr/bin/gnome-wm. On Fedora Core 6, GNOME doesn't seem to acknowledge the $WINDOW_MANAGER env var, so it's necessary to use gconf:

```sh
gconftool-2 --type string --set /apps/gnome-session/rh/window_manager /usr/bin/xfwm4
```

---

Why xfwm4 rules:

* Window placement can be configured to be non-annoying.
* Annoying window-snapping can be disabled.
* The compositor provides nice window shadows and transparency on non-focused windows, providing more visual clues about which window is focused. (And it looks nice.)
* Java Swing apps display correctly under xfwm with the compositor enabled. Under compiz, Swing apps don't render correctly; they show up as nothing more than grey rectangles.
* You can close a window by double-clicking its upper-left-corner window-menu icon. Metacity does not support this standard-since-the-1980's behavior.

 Downsides to using xfwm4 under GNOME:

* It does not use Metacity themes out of the box. (It has its own themes.) Fortunately, most of the XFWM themes pick up the GTK color scheme.
* Sticky windows are not displayed in all workspaces in the GNOME toolbar pager widget, unlike the XFCE pager widget.
* ~~With the compositor effects enabled, beep-media-player tends to cause X.org to consume all available CPU cycles.~~ Curiously, so far, I've only observed this under XFCE, not under GNOME.
* I had to modify a system file (/usr/bin/gnome-wm) to get xfwm to work properly with GNOME session-management stuff. I prefer not to modify files that are maintained by my distro provider. A more concrete problem is that I won't be able to switch to xfwm4 on systems on which I don't have root access.
* I cannot find a force-quit feature like Metacity has. Rhythmbox locks up every few minutes when I try to listen to Ogg-format internet music streams. With Metacity, I can click the window's Close button; Metacity will detect that there's no response after some timeout; and it will offer to force-quit the app. With xfwm4, I have to find a command-line to do 'killall rhythmbox'. (It's not just Rhythmbox, but that's usually the first and most frequent one.)
* xfwm4's focus-stealing prevention doesn't work, at least not with the versions of things on the Fedora Core 6 box I'm using right now.
