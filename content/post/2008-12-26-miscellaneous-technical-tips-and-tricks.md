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

# Turning 'Caps Lock' into an additional Ctrl key on T41p and Ubuntu 8.04.1 LTS

Go to [GNOME], System, Keyboard Prefs, Layouts, Layout Options, "Ctrl key position" and choose "Make CapsLock an additional Ctrl." Unfortunately, a long-standing bug makes the Caps Lock-indicating light toggle every time you press CapsLock, even when it's acting as a Ctrl key. Create `~/.Xmodmap` and add the line `clear Lock`. Because of another long-standing bug, this makes the situation worse, because NumLock will now turn itself on and off. To fix *that* problem, add one more line to `.Xmodmap`:

`keycode 77 = Num_Lock`

That seems to fix everything.

In Ubuntu 8.10, this bug is fixed. It does not exist in openSUSE 11.1. 
