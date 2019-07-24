---
title: "Package manager"
date: 2019-07-13T19:36:00+02:00
image: "images/blog/package.jpg"
description: "TOS package manager"
author: "Tom Meyers"
type: "post"
---

Every distribution has a package manager, today we will look at pacman/tos.

TOS comes preinstalled with pacman, yay and tos. These three package managers all use pacman as a base manager.
A package manager takes care of all the components in a system. Think of it like this.
You have a few different pieces of software installed. eg firefox, vscode, file browser etc. Instead of downloading these pieces of sofware and manually installing them you use a package manager. They will install software for you and keep them up to date. This ensures that you don't forget too ever update a single package. The package managers also keep your operating system up to date.

Now you know the basics of a package manager and know that TOS uses pacman under the hood.
But we must cover a few more components before jumping in on how to use a package manager.

Repo's or repositories are a set of program's combined and maintained by an entity. An entity can be the os maintainer, a company or an individual. TOS ships with a set of repo's giving you access to about 60 000 different packages (aka programs). All you have to do to install a program is to tell tos to install these.
A repository is always served on a server. That server has a files that describes all the software that you can install and also contains that piece of software.
Tos ships with 5 repo's

- TOS - Extra needed packages that are custom to the TOS echosystem
- Core - All packages that are needed to run an OS (things like the kernel)
- Extra - Packages that are usefull but not necessary to run an OS
- Community - Packages that are contributed by the community but are maintained by the arch linux maintainers
- AUR - Packages contributed by the community and maintained by the community.

> If you are choosing to install packages via pacman know that the AUR isn't supported and you need to do extra steps to install that software, If you use yay or tos then the AUR is supported.

Today we won't cover everything you can do with a package manager because they are very complicated and can do a lot of stuff. But we will cover most of the things to get you started.

> Before beginning you can use all flags with all package managers. They all support the same style. Just substitute tos with either tos, pacman or yay and it will work

### Updating software

Before installing the software you must know what packages exist do this by downloading the database file.

```bash
$ tos -Syu
```

This simply checks if everything is up to date otherwise start updating out of date packages.

### Installing software

> Only install software if the database is downloaded on your computer otherwise you can have broken packages

Installing can be done by issueing this command

```bash
$ tos -S <Package>
```

> It is recommended to install and update at the same time. Just for safety

```bash
$ tos -Syu <Package>
```

### Searching a package

Now before installing you would like to know the name of a package. This can easily be done be executing this command

```bash
$ tos -Ss <search query>
```

For example we want to find the linux kernel for tos than you would type the following

```bash
$ tos -Ss linux tos
>aur/appimage-git r1587.ce61b83-1 (+30 0.00%)
    Package desktop applications as AppImages that run on common Linux-based operating systems, such as RHEL, CentOS, Ubuntu, Fedora, debian and derivatives.
tos/linux-tos-headers 5.2.arch2-1 (17.6 MiB 119.2 MiB) (Installed)
    Header files and scripts for building modules for Linux-tos kernel
tos/linux-tos-docs 5.2.arch2-1 (16.8 MiB 101.3 MiB)
    Kernel hackers manual - HTML documentation that comes with the Linux-tos kernel
tos/linux-tos 5.2.arch2-1 (72.6 MiB 81.4 MiB) (Installed)
    The Linux-tos kernel and modules
```

As we can see linux-tos is the linux kernel for tos. That is also what we want.

So now we can install that package

```bash
$ tos -Syu linux-tos
```

### Removing a package

Removing a package is a must know. Because sometimes we simply install the wrong packages.

```bash
$ tos -R <package>
```

> Simply removing a package is not recommended since the dependencies (other packages that this package requires to work) won't be uninstalled if no other package uses it

Removing a package + dependencies

```bash
$ tos -Rns <package>
```

### Querying local package database

Sometimes you want to clean up all software you aren't using but how do you know what is installed?

```bash
$ tos -Q
```

This will print out all installed packages (explicitly installed + dependencies)

But we only want to see the packages you explicitly installed. That can be done as well

```bash
$ tos -Qe
```

### Misc

Remove all packages that aren't installed by the user and are not needed anymore

```bash
$ tos -Rns $(tos -Qdtq)
```

Removing packages from the cache (This will clear up storage)

```bash
$ tos -Sc
```

Now you know how to keep your system up to date and manage your packages. Best of luck!
