---
title: Metacity window-placement patch
author: Chad Glendenin
date: '2005-03-11'
slug: metacity-window-placement-patch
categories: []
tags: []
---

# Metacity window-placement patch

A patch to modify Metacity's window-placement algorithm so that all new windows are centered in the viewport.

---

### 2018-02-08 Update

I moved the files from my personal web server to a repo on GitHub:

https://github.com/ccg/metacity-window-placement-patches

The links below have been updated accordingly.
Also, I put '2005-03-11' as the date for this post. I lost the original revision
history for this page, and that date is my best guess based on the dates in the
patch files.

### 2012-10-11 Update

I haven't touched this page in over three years. I still get occasional emails about it, so I'm leaving it here, but I'm deleting a lot of the old stuff about native packages (Gentoo portage, etc.), because it's so old that I doubt it's useful any more, and I no longer do that sort of thing.

### 2009-06-25 Update

Clearly, this page is in need of a serious overhaul. In the meantime, please note that the GNOME project has moved their code from Subversion to Git (http://git.gnome.org/). So I made a copy of their Git repository on GitHub. Specifically, the official Metacity repo is currently here: http://git.gnome.org/cgit/metacity/. I pushed copies of their master and gnome-2-26 branches to my own metacity repository on GitHub. Then I reimplemented my center-placement changes on a new branch called gnome-2-26-center-placement for the GNOME 2.26 release of Metacity: http://github.com/ccg/metacity/tree/gnome-2-26-center-placement I'd be happy to write up instruction on how to straddle two git remote repositories like that if anybody is interested. If you're a new Git user, it's probably not immediately obvious how to do something like that. It took me a few weeks of day-to-day use to become comfortable with Git.

---

## Downloads

### New, simple patch that only implements center placement

For Metacity 2.14.5:

* New, simple patch: [place.c.patch](https://raw.githubusercontent.com/ccg/metacity-window-placement-patches/master/2.14/place.c.patch)
* Lines of code added: 20
* Lines of code deleted: 380

### Old, fancy patch with all the options

For Metacity 2.12:

* The patch: [metacity-2.12-placement.patch](https://raw.githubusercontent.com/ccg/metacity-window-placement-patches/master/2.12/metacity-2.12-placement.patch)
* [SUSE Linux 10.0 spec file](https://raw.githubusercontent.com/ccg/metacity-window-placement-patches/master/2.12/metacity.spec)

For Metacity 2.10:

* The patch: [metacity-2.10-window-placement.patch](https://raw.githubusercontent.com/ccg/metacity-window-placement-patches/master/2.10/metacity-2.10-window-placement.patch)
* [Fedora Core 4 spec file](https://raw.githubusercontent.com/ccg/metacity-window-placement-patches/master/2.10/metacity.spec)

For Metacity 2.8:

* The generic patch: [metacity-2.8-window-placement.patch](https://raw.githubusercontent.com/ccg/metacity-window-placement-patches/master/2.8/metacity-2.8-window-placement.patch)
* The patch for RHEL 4 or CentOS 4.3: [metacity-2.8.6.rhel4-window-placement.patch](https://raw.githubusercontent.com/ccg/metacity-window-placement-patches/master/2.8-rhel4/metacity-2.8.6.rhel4-window-placement.patch)
* [RHEL/CentOS-4 spec file.](https://raw.githubusercontent.com/ccg/metacity-window-placement-patches/master/2.8-rhel4/metacity.spec)

---

## Description

### New, simple patch

This patch modifies Metacity's window-placement behavior so that it merely centers new windows instead of trying to tile them in groups or cascade them from the upper-left corner.

### Old, fancy patch

This patch for Metacity adds a few window-placement options that can be configured in the graphical gconf-editor or with the gconftool-2 command-line program.

The following options are available:


* `"first_fit"` (`"smart"` is also accepted)
  + This is the default Metacity window-placement behavior. In this mode, Metacity will attempt to tile new windows on the screen so that they do not overlap. 
* `"cascade"`
  + This skips Metacity's center/tile behavior and cascades new windows the upper-left corner of the current desktop. It uses Metacity's built-in cascading algorithm. 
* `"center"`
  + This option will cause Metacity to place each new window at the center of its workspace. 
* `"origin"`
  + In this mode, Metacity will simply place each new window at the origin (the upper-left corner) of its workspace. 
* `"random"`
  + In this mode, Metacity will choose a random position on the screen for a new window. 

After installing the patched version of Metacity, you can change the option as follows:

In GNOME 2.10, open Configuration Editor from the following menu:

`Applications --> System Tools --> Configuration Editor`

Then navigate to the placement_mode key:

`/ --> apps --> metacity --> general`

Right-click on "placement_mode", choose "Edit Key..." from the pop-up menu, and then set the "Value:" field to the option you want.

To change the option from the command line, do this:

`gconftool-2 --type string --set /apps/metacity/general/placement_mode random`

(but replace "random" with whichever option you want).

---

## Build and install in a home directory

I like to avoid clutter in my home directory by installing locally built apps into _$HOME/opt/name-version_. In this case, it would be something like `$HOME/opt/metacity-2.16.3`. After patching the source:

```sh
./configure --prefix=$HOME/opt/metacity-2.16.3
make
export GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1
make install
unset GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL
```

I usually point my local copy of metacity at the system-wide theme directory:

```sh
cd ~/opt/metacity-2.16.3/share
mv themes themes.original
ln -s /usr/share/themes .
```
After running `make`, you can test your build by running `metacity --replace` from the source directory. You should be able to do this before or after installing.

If everything works, you can make the change permanent by adding a line like the following to `~/.gnomerc`:

```sh
export WINDOW_MANAGER=$HOME/opt/metacity-2.16.3/bin/metacity
```
