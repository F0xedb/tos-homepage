---
title: "Package Build"
date: 2019-07-18T15:35:00+02:00
image: "images/blog/package.jpg"
description: "How to build/maintain packages"
author: "Tom Meyers"
type: "post"
---

Today we will cover how to build your own packages or applications and maintain them with pacman/yay/tos.
The reason you want to do that is that it is easy to maintain package upgrades/new versions.

In arch based systems you have the utility `makepkg` This utility reads out a `PKGBUILD` script and will install a package apropriotly.

If you want to version control your package then you will need to make a PKGBUILD and tell it what to do.

> Since PKGBUILD files are actually bash scripts you should understand bash scripting. If you don't please read the blogpost about bash scripting.

Consider this bash script as your app.

```bash
#!/bin/bash

if [[ "$1" == "-h" ]]; then
    echo "-h | help menu"
    echo "-p <text> | print out text"
    echo "-c file | print the content of a file"
elif [[ "$1" == "-p" ]]; then
    echo "$2"
elif [[ "$1" == "-c" ]]; then
    cat "$2"
fi
```

If you have read our blogpost about bash scripting then you should understand the code above.

This is the PKGBUILD of this simple application.

```bash
pkgname=blog_tool
pkgver=1
pkgrel=1
pkgdesc="A basic tool to show the PKGBUILD functionality"
arch=(any)
url="https://tos.pbfp.xyz"
license=('GPL')

source=("tool")
md5sums=(17c3d3f2053e5ad5da3d304d27b19cdb)

prepare() {
    chmod +x tool # Make sure our package is executable
    echo "Preparing the source files"
}

build() {
    echo "Compiling source"
}

check() {
    echo "Verifying if files are correct, eg unit testing, make check"
}

package() {
    echo "Packaging the compiled files"
    mkdir -p $pkgdir/usr/bin
    cp tool $pkgdir/usr/bin
}
```

Each PKGBUILD should at least contain these variables.

- pkgname | The name of the package (this will show up in pacman -Ss)
- pkgver | The current version of the package
- pkgdesc | extra description about said package (should not contain the pakage name)
- arch | supported architectures eg x86_64, i686, armv7h, aarch64 etc
- license | The license of the package.

Each package also should at least implement these functions

- build | all the commands necesarry to build/compile the package
- package | all the commands necesarry to move the executable to the right location of the filesystem eg /usr/bin.

### Variables

Lets quickly go over all available PKGBUILD variables and there functions.

`pkgname` This variable holds the name of the package. This will be found when looking through all the packages and it is what pacman will display.

`pkgdesc` This will contain a brief description about the package. It should not contain the package name. eg

> pkgdesc="a text editor for X11" not pkgdesc="nedit is a text editor for x11"

`source` This is an array containing all the source code needed to build the package. It can be locale files or URL's to the location of the source code.

`arch` This variable should contain a list of supported architectures. Eg x86_64 (for intel/amd chips), aarch64 for arm based chips etc. If all architectures are supported you could use "any"

`url` This variable should contain a url for this piece of software.

`license` The license under which this software falls. eg GPL (it can also be an array of different licenses)

`groups` If you wish to install multiple packages as a "group" than include all other packages in this array

`depends` This contains an array of all dependencies that this package uses to work correctly

`optdepends` Same as above. But these packages are not needed for the program to function

`makedepends` Include all packages needed here for compilation of your application. Eg make, ninja, cpython etc

`checkdepends` Include all the dependencies needed to perform checks on your software. eg unit testing software.

`md5sums` An array of md5 checksums (can be calculated with md5sum) in the sequence of the source array.

`validpgpkeys` This is an array of PGP fingerprints. If used makepkg will only accept signatures of the keys present in this array.

`replaces` This is an array that specify which packages will be replaced by this package. eg wireshard-qt replaces wireshark

`conflicts` An array of packages that conflict with this package. eg they share the same resources.

`provides` An array of additional packages that the software provides.

### Functions

`prepare` This function is used to prepare source files like patching extra code. This function is ran immidiatly after downloading the source files.

`pkgver` This function is ran right after prepare. It is used to update the pkgver variable in case an update happend upstream.

`build` In this function you should build/compile the source code so that an executable is present. Usually you should cd into the uncompressed tarball first and then compile

`check` Perform a package test tom make sure your package is working as intended. It makes sure that potential users are getting the right application.

`package` The final step to having a finished package. Here you will have to move your executable file and extras to the right location. eg if you want your file in the /usr/bin directory you should do cp file $pkgdir/usr/bin.
Since the compressed tarball will be held in a chrooted env and $pkgdir points to that environment.

### Verifying your package and installing it

Building and testing your PKGBUILD

```bash
$ makepkg # this will read our PKGBUILD and make a tarball out of it
```

> if the PKGBUILD was succesfull you should see a \*.pkg.tar.xz file

To verify your package build you can run `$ namcap PKGBUILD` and `$ namcap package.pkg.tar.xz`

If everything happend as expected than you can install your package. Either bu installing it from the tarball or by using makepkg

```bash
$ pacman -U *.pkg.tar.xz
```

or

```bash
$ makepkg -i
```

> Good luck building packages. All you now need to do is upload your package to the AUR.
