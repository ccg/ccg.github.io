---
title: Miscellaneous Technical Tips and Tricks
author: Chad Glendenin
date: '2008-12-26'
slug: miscellaneous-technical-tips-and-tricks
categories: []
tags: []
---

# IRIX Networking

When moving an SGI IRIX box to a different subnet, edit `/etc/config/static-route.options` so that the gateway IP address is correct:

```
$ROUTE $QUIET add net default 192.168.0.1
```

# SGI Logo in Netscape on IRIX

Set the environment variable `$SGI_ANIM` in your shell to the value `/var/netscape/communicator/anim_cube.dat` to get the original, spinning-cube SGI logo as the throbber animation in Netscape. There are animations in that directory too.

<a href="../../../../img/2008/sgi-netscape.png">
  <img src="../../../../img/2008/thumbnail/sgi-netscape.png"/>
</a>
<a href="../../../../img/2008/sgi-netscape-google.png">
  <img src="../../../../img/2008/thumbnail/sgi-netscape-google.png"/>
</a>

# Thinkpad T41p, Ubuntu 8.04.1 LTS, and Clicking Hard Drive

The Hitachi HD in my T41p makes a 'tick-tick' noise about every five seconds. To make it stop: `sudo hdparm -B 254 /dev/sda` (you can put that command in `/etc/init.d/rc.local`.)

# Turn 'Caps Lock' into an additional Ctrl key on T41p and Ubuntu 8.04.1 LTS

Go to [GNOME], System, Keyboard Prefs, Layouts, Layout Options, "Ctrl key position" and choose "Make CapsLock an additional Ctrl." Unfortunately, a long-standing bug makes the Caps Lock-indicating light toggle every time you press CapsLock, even when it's acting as a Ctrl key. Create `~/.Xmodmap` and add the line `clear Lock`. Because of another long-standing bug, this makes the situation worse, because NumLock will now turn itself on and off. To fix *that* problem, add one more line to `.Xmodmap`:

`keycode 77 = Num_Lock`

That seems to fix everything.

In Ubuntu 8.10, this bug is fixed. It does not exist in openSUSE 11.1. 

# Disable Blinking Cursor in gnome-terminal

In Ubuntu 8.04 (GNOME 2.22), gnome-terminal must be recompiled. Patch. In case the patch disappears: somewhere around line 250, set `terminal_widget_set_cursor_blinks(screen->priv->term, FALSE);`

In Ubuntu 8.10 (GNOME 2.24), there is a setting in gnome-terminal, but there is not yet a UI for it. In gconf, set `/apps/gnome-terminal/profiles/Default/cursor_blink_mode` to the string `"off"`.

Related links:

* [Launchpad Bug #188732](https://bugs.launchpad.net/ubuntu/+source/gnome-terminal/+bug/188732)
* [Gnome Bug #342921](https://bugzilla.gnome.org/show_bug.cgi?id=342921)
* [Gnome Bug #533522](https://bugzilla.gnome.org/show_bug.cgi?id=533522)
