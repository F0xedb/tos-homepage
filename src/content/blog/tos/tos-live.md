---
title: "TOS LIVE"
date: 2019-07-11T22:32:00+02:00
image: "images/blog/toslive.png"
description: "Tos live is available"
author: "Tom Meyers"
type: "post"
---

> TOS is in a PRE-alpha stage. Installer may be buggy

TOS live is finally here. The custom linux version that fits all your needs. Tos is an operating system developed by Me (Tom Meyers).
It is actually a custom version build on top of arch linux. This version of linux has a bunch of features that make it better/easier to use than arch linux.
Some of them include

- Encryption by default
- Ships with a graphical environment
- Auto installs gpu support (both for nvidia and amd)
- Custom kernel version that includes many extra patches
- Possibility to install plain arch
- Extra repo's
- Much more

TOS installer iso also ships with a bunch of usefull tools.
It for example ships with a gui (unlike the arch iso)
It shows the custom i3 config (or sway if you are using wayland)

> New users should not use TOS since it is an advanced linux distribution. It is highly recommended that you know how i3/sway works otherwise it will be very difficult to use.

### Getting started

### Using the live iso

These are the bindings for navigating around the environment

| keybind              |                         effect                         |
| -------------------- | :----------------------------------------------------: |
| mod+enter            |                    open a terminal                     |
| mod+Shift+w          |             open firefox-developer-edition             |
| mod+arrow_key        |      focus to the window that the arrow points to      |
| mod+Shift+arrow_key  |              move window to the direction              |
| mod+d                |             open rofi (used to open apps)              |
| mod+number           |                move to workspace number                |
| mod+shift+number     |  move the current focused window to workspace number   |
| mod+q                |                  kill current program                  |
| mod+f                |        toggle program into and from fullscreen         |
| function keys        |             perform the standard function              |
| mod+r                |                   enter resize mode                    |
| mod+arrow            | In resize mode use arrow keys to resize current window |
| mod+esc or mod+enter |                    exit resize mode                    |

Try to play with the OS before you attempt to install it.

We recommend that you test out your daily routine and see if it is feasable.

Once you are happy with the result and choose to continue you can open the terminal and type

```bash
$ tos -iso -g
```

This will start the installation. Follow all the steps and you will have a working OS within 15-20 minutes.
After a base installation is finished (takes about 5 minutes) you will be asked if you want to install TOS or just plain Arch.
If you install plain arch you will only have a terminal (not a gui or any programs)
It is highly recommended to continue installing (takes about 10 more minutes)

Tos will also ask you if you want wayland or not.
Wayland is a piece of software that replaces X-server (the piece of software that allows drawing on the screen)
Since wayland is a lot newer than x-org it supports more recent technologies very well. But it doesn't supported as many applications as xorg
That is why our wayland install also includes xorg support so that those apps run as well.

> Note: wayland will also install sway but sway doesn't support nvidia cards. If you have an NVIDIA card you are stuck using x-org

### First boot

Now that TOS is installed you will notice that you don't boot into a GUI. But have to enter an encrypted password first.
This is the password you had to enter in the beginning of your install.

> Note: if your layout is azerty or anything other then qwerty this step will think your keyboard is qwerty. This is an open bug.

After the drive can be decoded you will get a login prompt enter your username + password
Now you will have a zsh shell. Simply type in startx or sway (x-org or wayland respectivly)
And now you are in a GUI. Use the keybinds you used in the live iso.

### Customization

> Note: this section assumes you are familiar with git and repo's

If you wish to customize how your environment looks and feels it can easily be done by forking my dotfiles repo
https://www.github.com/F0xedb/dotfiles
The files you should change are the following

- i3/config (to change i3 related stuff like keybindings and window management)
- sway (same as i3 but for wayland)
- dunst (to change notifing daemon)
- compton (extends i3/sway support)
- polybar (change the bar on the top of your screen)
- waybar (same as polybar but for wayland)
- rofi (change the behavior of the app launcher ctrl+d)

If you don't fully understand how to tweek these tools try to look up information on their websites.
At least until there are blogposts for these applications.

#### scripts and binary files

If you build custom script please put them inside the ~/bin folder. That folder houses all scripts that might come in handy later. If you wish to version control it simply fork this repo
https://www.github.com/F0xedb/helper-scripts

#### TOS update

Tos has a command line utility that aids in updating the entire os

```bash
$ tos -u
```

If you wish that your forks of ~/.config and ~/bin are also updated than please follow the next few lines.
If you go into a forked directory eg bin

```bash
$ cd ~/bin
```

and check the remotes you might see something like this

```bash
$ git remote --verbose
origin  git@github.com:F0xedb/helper-scripts.git (fetch)
origin  git@github.com:F0xedb/helper-scripts.git (push)
fork  git@github.com:forker/helper-scripts.git (fetch)
fork  git@github.com:forker/helper-scripts.git (push)
```

This means that the updates happen upstream (F0xedb repo)

You will have to delete my reference to origin and make that reference yours

```bash
$ git remote rm origin
$ git remote add origin git@github.com:forker/helper-scripts.git
```

Now origin is pointing to your fork and it is included in the updating mechanism.
Good luck with your tos journey
