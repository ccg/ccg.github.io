---
title: HAVIT Low-Profile Mechanical Keyboard
author: Chad Glendenin
date: '2019-04-01'
slug: havit-low-profile-mechanical-keyboard
categories: []
tags: []
---

# Intro

In late 2017, I purchased the [HAVIT Low-Profile 87-Key keyboard](https://amzn.to/2IbNMST). (Full disclosure: Amazon affiliate link.) It's one of the best keyboards I've owned. I'm a fan of mechanical keyboards, but I don't always like the long key-strokes required on those keyboards, and they're often way too loud. This keyboard solves both those problems. The keystrokes are not quite as shallow as they are on an Apple keyboard, but I find it easier to type on than something like an IBM Model M keyboard with the old-fashioned buckling-spring keys. It's also somewhat quieter. It might still be a bit loud for an office setting (unless you're lucky enough to have a private office, which most software engineers are not), but I find that it's OK for a home office without driving my wife insane.

# Basic Setup

Unfortunately for Mac users, the keyboard has a PC layout. The following describes how to configure this keyboard for use on a Mac.

The first step is easy and does not require any third-party software. Mac and PC keyboards disagree about the position of the Command (Alt) and Option (Windows/Menu) keys. On the Mac, open System Preferences, then Modifier Keys:

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

# Developer Setup

If you're a software developer, you might want to use the function keys as actual function keys rather than media keys. You can control that behavior using the standard macOS behavior. I found that I wanted to be able to control the system's output volume using the keyboard, but that was a bit tricky with the function keys changed. I wrote a little configuration plugin for Karabiner that sets Option-PageUp and Option-PageDown as volume-up and volume-down, respectively. This way, the behavior matches what's printed on the keys. The configuration file is available here:

https://github.com/ccg/havit-tenkeyless-macos/blob/master/OptPageUpDownVolumeUpDown.json

I also wrote a config file that turns the `Print Screen` key into a `Misson Control` launcher:

https://github.com/ccg/havit-tenkeyless-macos/blob/master/PrintScreenMissionControl.json

Unfortunately, I never found an easy way of adding these complex modifications to Karabiner, and they are not available through the application's internet archive of downloadable modifications, so, to enable them, you'll need to create a directory and some symlinks, or you can try this installation script:

https://github.com/ccg/havit-tenkeyless-macos/blob/master/install.sh
