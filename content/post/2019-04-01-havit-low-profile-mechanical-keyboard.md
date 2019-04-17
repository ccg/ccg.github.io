---
title: HAVIT Low-Profile Mechanical Keyboard
author: Chad Glendenin
date: '2019-04-01'
slug: havit-low-profile-mechanical-keyboard
categories: []
tags: []
---

# Intro

In late 2017, I purchased the [HAVIT Low-Profile 87-Key keyboard](https://amzn.to/2IbNMST). (Full disclosure: Amazon affiliate link.) It's one of the best keyboards I've owned. I'm a fan of mechanical keyboards, but I don't always like the long keystrokes required on those keyboards, and they're often way too loud. This keyboard solves both those problems using the Kailh blue low-profile switches. The keystrokes are not quite as shallow as they are on an Apple keyboard, but I find it easier to type on than something like an IBM Model M keyboard with the old-fashioned buckling-spring keys. It's also somewhat quieter. It might still be a bit loud for an office setting, but I find that it's OK for a home office without driving my wife insane.

I'm also a big fan of the "tenkeyless" (87-key) keyboards like this one. I never use the numeric keypad when my keyboard has one, and with a tenkeyless keyboard, I can get my mouse closer to the centerline, which I find to be better ergonomically. Then again, 87-key keyboards like this one still have full-size navigation keys (arrows, page-up and page-down, etc.) and a full-size Control key on the right side.

This keyboard also has a backlight that is a slightly greenish, ice-blue color. It can be programmed with various animation effects on the backlight. It's a bit of a gimmic, but it's nice to have.

# Set Up As Your Only Keyboard

Unfortunately for Mac users, the keyboard has a PC layout. If it's going to be your only keyboard, then you can set it up without any third-party software.

Mac and PC keyboards disagree about the position of the Command (Alt) and Option (Windows/Menu) keys. On the Mac, open System Preferences, then Modifier Keys:

![System Preferences](../../../../img/2019/system-preferences.png)

![Modifier Keys](../../../../img/2019/modifier-keys.png)

![Command-Option Swap](../../../../img/2019/command-option.png)

# Fixing the Right Option Key

I found that the key that should be the right Option key (the Menu key on Windows) did not work correctly after the above configuration. To fix it, I installed an open-source application called [Karabiner](https://pqrs.org/osx/karabiner/).

After installing it, the configuration is simple:

Open `Karabiner-Elements` and then, under `Target Device`, choose your keyboard (for me, it's `USB-HID Keyboard (HOLTEK)`), then under `Simple Modifications`, choose `Add Item`.

![Karabiner: Add Item](../../../../img/2019/karabiner-add-item.png)

Then set `From key` to `application` and `To key` to `right_gui`.

![Karabiner: Fix Right Option Key](../../../../img/2019/right-option.png)

This setup fixes the majority of use cases.

# Set Up As An External Keyboard

In my setup, I use this keyboard as an external keyboard when my laptop is plugged in on my desktop with an external monitor, but sometimes I use my laptop by itself without this keyboard. For that use case, swapping the Command and Option keys in System Preferences does not do what I would want, because it swaps those keys for the built-in laptop keyboard as well.

I found that a better setup uses the Karabiner app (see above) exclusively to reconfigure the keyboard layout. If you changed the modifier keys in the System Preferences app, put it back to the default configuration. In the Karabiner app, under `Target Device` select `USB-HID Keyboard (HOLTEK)` and then set up the following mappings:

* `left_alt` to `left_gui`
* `left_gui` to `left_alt`
* `right_alt` to `right_gui`
* `application` to `right_alt`

![Karabiner: Fix Right Option Key](../../../../img/2019/karabiner-all-modifier-keys.png)

# Developer Setup

If you're a software developer, you might want to use the function keys as actual function keys rather than media keys. You can control that behavior using the standard macOS behavior. I found that I wanted to be able to control the system's output volume using the keyboard, but that was a bit tricky with the function keys changed. I wrote a little configuration plugin for Karabiner that sets Option-PageUp and Option-PageDown as volume-up and volume-down, respectively. This way, the behavior matches what's printed on the keys. The configuration file is available here:

https://github.com/ccg/havit-tenkeyless-macos/blob/master/OptPageUpDownVolumeUpDown.json

I also wrote a config file that turns the `Print Screen` key into a `Misson Control` launcher:

https://github.com/ccg/havit-tenkeyless-macos/blob/master/PrintScreenMissionControl.json

Unfortunately, I never found an easy way of adding these complex modifications to Karabiner, and they are not available through the application's internet archive of downloadable modifications, so, to enable them, you'll need to create a directory and some symlinks, or you can try this installation script:

https://github.com/ccg/havit-tenkeyless-macos/blob/master/install.sh
