---
title: "About"
date: 2019-05-12T12:14:34+06:00
description: "About TOS"
author: "Tom Meyers"
authorImage: "images/about/author.jpg"
authorSignature: "images/about/signature.png"
---

TOS or Tom Linux is an arch based Distribution. Once you download the live iso you will be greeted by a nice user interface. This interface is I3.
It looks scarry at first but it actually has a few nice features.
The thing you need to understand about i3 is that it is a tiling window manager. This means that if you open a window it will ocupy the entire display.
If you open a second window it will split the size in half. Each part then takes 50% of the window. Here is a short table telling you how to use i3

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

As you can see mod+d opens a prompt asking you which app to open.

Play around with the os and see if you like it.
If you wish to install it then that can be done. Open a terminal (mod+enter)

type the followings

{{< highlight bash "linenos=table" >}}
\$ tos -iso -g
{{< / highlight >}}

This will start the installation. Follow all the instructions.

## Tos features

Tos has some features which make it better than stock arch

- Default LUKS (encryption) support
- Easy to install xorg or wayland (or both)
- Installs AMD, Intel or NVIDIA drivers automatically
- Setup graphical environment (i3 or way)
- Default shell is ZSH with oh-my-zsh
- Custom scripts to make your life easier
- Supports Worg and Wayland
- Live disk works as an installer or rescue cd
- Live disk ships with tos tool (helps with fixing and chrooting)
- More complete kernel (more patches)
- More power efficient
- Change themes easily
- Supports both EFI and MBR
- Much more

## TOS tool

See blog posts for more information

TOS also ships with a tool called tos. It helps you with basic system management.
Its features are

- Update system
- Package management
- Change themes / background
- Manage wifi
- Manage bluetooth
- Manage screens
- Manage installation
- Manage volume
- Manage ssh
- Much more

Things you can also do with tos.

- Install plain arch. (This makes arch installs much more quickly)
- Fix broken systems
- Quickly customize your system.
- Easy and fast installation.
- Helper tools for arch
