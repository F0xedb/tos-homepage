---
title: "TOS REPO"
date: 2019-07-13T17:43:00+02:00
image: "images/blog/pacman.png"
description: "TOS repo"
author: "Tom Meyers"
type: "post"
---

TOS also has a repo available for you to use.
In this blogpost we will be talking on how to setup our repository with your arch based distribution and what the good effects are.

> TOS repo brings AUR packages to the main repo and offer custom compilations as well.

Currently TOS repo (from now on called repo) brings only a handfull of packages to your system.

```bash
$ tos -Sl tos | wc -l
> 12
```

or if you are using arch

```bash
$ pacman -Sl tos | wc -l
> 12
```

There are as of writing only 12 packages maintained by the tos project namely these

```
ccat
i3lock-color
i3lock-next-git
linux-tos
linux-tos-docs
linux-tos-headers
nerd-fonts-complete
polybar-git
r8152-dkms
siji-git
ttf-symbola
visual-studio-code-insiders
```

Why do we manage these packages you may ask?

Well there are 2 simple reasons.

First we like to maintain the versions of these packages since they are used in the core version of our os and live iso.

Secondly we make these packages with custom patches and source code. This means that if you want our version and you didn't use this repo that you need to manually compile the project.
Here is an example: The linux-tos package provides the linux kernel. We add modules and patches to the kernel to ensure maximum support for x86_64 devices.

### Adding tos repo to your pacman list

This is actually very simple just open the file /etc/pacman.conf
go to the line containing

```
[core]
Include = /etc/pacman.d/mirrorlist
```

And add the following just above it

```
[tos]
SigLevel = Optional TrustAll
Server = https://repo.pbfp.xyz
```

Now save the file and pull in the repo database

```bash
$ tos -Syu
```

or if you are using arch

```bash
$ pacman -Syu
```

Now you have tos repo support. To see a list of all packages in the repo run this command

```bash
$ tos -Sl tos
```

And again if you are running arch

```bash
$ pacman -Sl tos
```
