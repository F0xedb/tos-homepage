---
title: "TOS TOOL"
date: 2019-07-11T17:33:00+02:00
image: "images/blog/tos-tool.jpg"
description: "The tool that manages tos"
author: "Tom Meyers"
type: "post"
---

TOS tool is for when you want to manage your system but keep forgetting all the different tools and commands.

It support a bunch of different things you generally need when managing a system.
Tools like

- Screen support
- Bluetooth connections
- Wifi connections
- Volume changing
- SSH management
- Package management
- Theme management

And more.

TOS solves this by combining most of these tools into one package.

This blog post will cover how to use TOS Tool and how to install it.

> Note: tos tool only works for arch based distributions

Installation is pretty straight forward.

Run these commands and you have TOS tool installed

```bash
$ pacman -Syu python-pywal git curl xrandr bluez bluez-utils networkmanager
$ curl https://raw.githubusercontent.com/F0xedb/helper-scripts/master/tos > /usr/bin/tos

$ tos -h
```

Now you have installed tos together with all its dependencies.

If you ran

```bash
$ tos -h
```

You will see its help page.
TOS divides its arguments in a few subcategories

#### Screen

```bash
$ tos -s*
```

All the suboptions starting with **-s** are screen related

| option             |                      effect                       |
| ------------------ | :-----------------------------------------------: |
| -s                 |            Display screen information             |
| -sd <in> <out>     |         duplication screen <in> to <out>          |
| -st <in> <on\|off> |       turn the screen called <in> on or off       |
| -sr <in>           |   reset the screen <in> to ist default settings   |
| -sres <in> <res>   |    set the screen <in> to the resolution <res>    |
| -srate <in> <rate> | change the frequentie of screen <in> to <rate> Hz |

#### volume

```bash
$ tos -v*
```

All the suboptions starting with **-v** are volume related

| option        |                              effect                               |
| ------------- | :---------------------------------------------------------------: |
| -v            |                Display current volume information                 |
| -vc <num>     | change the volume by the amount of <num> (can be negative values) |
| -vs <percent> |              Set the volume to <percent> percentage               |
| -vt           |            Toggle the current volume channel on or off            |

#### Bluetooth

```bash
$ tos -b*
```

All the suboptions starting with **-b** are bluetooth related

| option    |                       effect                       |
| --------- | :------------------------------------------------: |
| -b        |           Display bluetooth information            |
| -bc <dev> |         connect to the device called <dev>         |
| -bd <dev> |      disconnect from the device called <dev>       |
| -bl       |          list all known and found devices          |
| -bl scan  | do the same as above but also scan for new devices |
| -bf       |      go into an interactive bluetooth prompt       |

#### Themes

```bash
$ tos -t*
```

All the suboptions starting with **-t** are theme related

| option          |                  effect                  |
| --------------- | :--------------------------------------: |
| -t <pic>        |        Change the theme to <pic>         |
| -tt <time>      | set the timeout for theme randomization  |
| -ta <pic>       |   add a picture to the theme database    |
| -td <pic>       | delete a picture from the theme database |
| -tl             |         List all known pictures          |
| -tr <on \| off> |    Turn theme randomization on or off    |

This one needs some explination. How can you change a theme based on a picture?
Well that is actually pretty easy. We scan the picture and generate a color pallet out of it. This color pallet will be applied to every application installed onto the system. This way we have uniform coloring across every component of the system.
Afterwards we set the desktop background to that image as well.

Now you know the basic implementation of our theme but what about randomization?

This one is pretty easy as well. First you must add pictures to a database by doing

```bash
$ tos -ta <pic>
```

After that you enable theme randomization

```bash
$ tos -tr on
```

Now every 1000 seconds you will get a random theme from the database.

This will change the theme every x seconds so that you don't get bored of the looks

Now how do you change the time?

```bash
$ tos -tt 3600 # change to 1 hour
$ tos -tt 10 # change theme every 10 seconds
$ tos -tt 86400 # change every day
```

As you can see typing in large numbers can be a pain because you can only type in seconds but we have a solution. You can change the time in days, hours, minutes and seconds as well All you have to do is use this syntax

```bash
$ tos -tt 1d-2h-3m-4s
```

As you can guess 1d is one day, 2h is 2 hours etc.
This effectively says that every 1 day and 2 hours 3minutes and 4 seconds the theme will change. But thats not all. You can also do this

```bash
$ tos -tt 0.5h
```

You can work with fractions of time 0.5 hours is effectively 30m

#### MISC

```bash
$ tos -*
```

All the suboptions starting with **-\*** are misc options

| option              |                              effect                              |
| ------------------- | :--------------------------------------------------------------: |
| -iso -g             |                     Install TOS graphically                      |
| -h                  |                      print help information                      |
| -m <device> <value> | Change the metric of a network device called <device> to <value> |
| -c                  |                       generate crypto keys                       |
| -c <user>@<ip>      |              copy your public key to that location               |
| -cw <ssid>          |                  login to wifi with ssid <ssid>                  |
| -lw                 |                      list all wifi devices                       |
| -dl                 |                     list all network devices                     |
| -r                  |                       Restart your network                       |
| -rs                 |                  Perform a basic system repair                   |
