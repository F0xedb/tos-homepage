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
$ tos screen
```

All the suboptions starting with `screen` are screen related

| option                |                      effect                       |
| --------------------- | :-----------------------------------------------: |
| get                   |            Display screen information             |
| duplicate <in> <out>  |         duplication screen <in> to <out>          |
| toggle <in> <on\|off> |       turn the screen called <in> on or off       |
| reset <in>            |   reset the screen <in> to ist default settings   |
| resolution <in> <res> |    set the screen <in> to the resolution <res>    |
| refresh <in> <rate>   | change the frequentie of screen <in> to <rate> Hz |

#### volume

```bash
$ tos volume
```

All the suboptions starting with `volume` are volume related

| option        |                              effect                               |
| ------------- | :---------------------------------------------------------------: |
| get           |                Display current volume information                 |
| change <num>  | change the volume by the amount of <num> (can be negative values) |
| set <percent> |              Set the volume to <percent> percentage               |
| toggle        |            Toggle the current volume channel on or off            |

#### Bluetooth

```bash
$ tos bluetooth
```

All the suboptions starting with `-b` are bluetooth related

| option           |                       effect                       |
| ---------------- | :------------------------------------------------: |
| get              |           Display bluetooth information            |
| connect <dev>    |         connect to the device called <dev>         |
| disconnect <dev> |      disconnect from the device called <dev>       |
| list             |          list all known and found devices          |
| list scan        | do the same as above but also scan for new devices |
| full             |      go into an interactive bluetooth prompt       |

#### Themes

```bash
$ tos theme
```

All the suboptions starting with `theme` are theme related

| option             |                  effect                  |
| ------------------ | :--------------------------------------: |
| set <pic>          |        Change the theme to <pic>         |
| time <time>        | set the timeout for theme randomization  |
| add <pic>          |   add a picture to the theme database    |
| delete <pic>       | delete a picture from the theme database |
| list               |         List all known pictures          |
| random <on \| off> |    Turn theme randomization on or off    |

This one needs some explination. How can you change a theme based on a picture?
Well that is actually pretty easy. We scan the picture and generate a color pallet out of it. This color pallet will be applied to every application installed onto the system. This way we have uniform coloring across every component of the system.
Afterwards we set the desktop background to that image as well.

Now you know the basic implementation of our theme but what about randomization?

This one is pretty easy as well. First you must add pictures to a database by doing

```bash
$ tos theme add <pic>
```

After that you enable theme randomization

```bash
$ tos theme random on
```

Now every 1000 seconds you will get a random theme from the database.

This will change the theme every x seconds so that you don't get bored of the looks

Now how do you change the time?

```bash
$ tos theme time 3600 # change to 1 hour
$ tos t t 10 # change theme every 10 seconds
$ tos theme time 86400 # change every day
```

As you can see typing in large numbers can be a pain because you can only type in seconds but we have a solution. You can change the time in days, hours, minutes and seconds as well All you have to do is use this syntax

```bash
$ tos t time 1d-2h-3m-4s
```

As you can guess 1d is one day, 2h is 2 hours etc.
This effectively says that every 1 day and 2 hours 3minutes and 4 seconds the theme will change. But thats not all. You can also do this

```bash
$ tos theme time 0.5h
```

You can work with fractions of time 0.5 hours is effectively 30m

#### Network

```bash
$ tos network
```

All options starting with `network` are network related

| option                     |                   effect                    |
| -------------------------- | :-----------------------------------------: |
| connect <ssid>             |        connect to wifi by its <ssid>        |
| device                     |        Show all the network devices         |
| list                       |         list all network interfaces         |
| metric <interface> <value> | change the metric of <interface> to <value> |
| restart                    |           List all known pictures           |

#### MISC

```bash
$ tos -*
```

All the suboptions starting with `-\*` are misc options

| option              |                              effect                              |
| ------------------- | :--------------------------------------------------------------: |
| -iso -g             |                     Install TOS graphically                      |
| -h                  |                      print help information                      |
| -c                  |                       generate crypto keys                       |
| -c <user>@<ip>      |              copy your public key to that location               |
| -rs                 |                  Perform a basic system repair                   |
