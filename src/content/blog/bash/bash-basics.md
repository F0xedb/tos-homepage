---
title: "Bash basics"
date: 2019-07-13T13:20:00+02:00
image: "images/blog/bash.png"
description: "Talking about all the basics you must know before using bash"
author: "Tom Meyers"
type: "post"
---

Bash is the default shell in most linux systems. TOS also provides bash support but the user is normally put into a zsh environment when starting the terminal (mod+enter)
In this blogpost we will cover the basics of using bash. The reason we are going to talk about bash is because as a linux user you need to be familiar with the bash syntax (which also works in zsh) since pretty much every system ships with bash support.

### What is bash?

Bash is the Bourne Again Shell. It is a replacement for the Bourne Shell. A shell is an interpreter for commands. In other words it takes in commands executes them and asks you to give another command. Commands are executable programs that perform a task. In bash you can run commands but also script them. What I mean with scripting is that you can execute commands and based on there behaviour make other commands use them.

> If that sounds diffucult to understand don't be frightend. You will gradually learn how to use everything.

### Getting started

> If you wish to learn and follow this blog please execute the commands listed here.

First things first open a terminal (in tos this is mod+enter, in other linux environments search for terminal).
The screen you are seeing now is called the terminal. It is used to show you the shell (by default zsh in tos)

Before starting I would like to explain a few things. Everything that is show below is a command

```bash
$ ls
> Desktop Documents Pictures Music
$ cd Documents
Documents ~ $ ls
> test.txt test2.txt
```

Every line that starts with $ is the command you need to type in
every line that starts with > is the output of the command
If you see a line like Documents ~ $ That is also a line where you need to type a command on . All this extra info tells you that you are in the folder called Documents

Every section will end with a table showing you the commands you have learned. At the end I will show you a complete table of all commands you have seen in this blog post

### Basic file management commands

From this point on you must understand what a file is.
A file is a place to store data in. Think of it as a file on your desk it contains text.
You must also understand a directory.
Directories are a place where you can store multiple files.
Think of it like a map, you can put multiple files (or pieces of paper) in a map.
One other thing you must understand about directories is that you can also put a directory inside another directory.
So in other words you can put directories and files inside a directory

#### Your first few command

Lets learn how to make a file.

Execute the following command:

```bash
$ touch firstfile
```

This will create a file.
To see the effect run the following command:

```bash
$ ls
> firstfile
```

As you can see it shows **firstfile** This is the file you have created.
Now how do we delete a file? This one is very simple. Run the following command

```bash
$ rm firstfile
```

> You have already learned how to make a file and how to delete it. Good job

But we can do more with files. We can copy it, we can rename the file and ofcourse edit them.
Lets see how you do that. First we make a file, then copy it and ofcourse see if it is correct

```bash
$ touch secondfile # make a file called secondfile
$ ls # list the current directory
> secondfile
$ cp secondfile copy # make a copy of secondfile called copy
$ ls # Check if we made a copy
> secondfile copy
```

Now we have 2 files in our directory.
Lets rename the original file to another name.

```bash
$ mv secondfile original
$ ls
> original copy
```

As we can see **mv** renamed the file **secondfile** to **original** In reality we moved the file to another file.

The last thing to learn is how to edit the content of a file.
Run the next code snippet.

```bash
$ nano original
```

You will be put into a text editor.
Type something simple like **hello from within the file**

> To save the file and exit use these keybindings
> **CTRL+O** to save the content
> **CTRL+X** to exit nano

Great you have changed the content of the file!

To verify if you changed the file use this command

```bash
$ cat original # print out the content of original
> hello from within the file
```

> Good job you now know how to make files, delete them, list, copy, rename and edit them

| keybind             |                           effect                           |
| ------------------- | :--------------------------------------------------------: |
| touch <file>        |                 make a file called <file>                  |
| rm <file>           |               remove the file called <file>                |
| ls                  |              List all content of a directory               |
| cp <file1> <new>    |             copy file1 to the file called new              |
| mv <original> <new> |            move original to the file called new            |
| nano <file>         | Open the file called <file> in the text editor called nano |
| cat <file>          |      dump the content of the file into your terminal       |

Before going to the next section please get familiar with these command. You will use them a lot in the next few sections.

#### Directories

> If you have forgotten commands on how to make files please read the table in the previous section.

Now that you know how to make files the next step is to learn how to navigate around your directorie structure.
Lets begin by making a new folder

```bash
$ mkdir firstdir
$ ls
> original copy firstdir
```

as you can see we now have the 2 files from the previous section (original and copy) but we see a third entry called firstdir.
This is called a directory.
lets open the directory

```bash
$ cd firstdir
firstdir ~ $ ls
>
```

As you can see our files are gone? Why is that? Well we have moved inside the directory called firstdir and there are no files in that directory.
Lets make some!

```bash
firstdir ~ $ touch a b c # make 3 files called a, b, c
firstdir ~ $ ls
> a b c
```

> You now created a folder called firstdir with the content a b and c

Lets make a new directory.

```bash
firstdir ~ $ mkdir secondfolder
firstdir ~ $ ls
> a b c secondfolder
```

Now how do we delete folders?

```bash
firstdir ~ $ rmdir secondfolder
firstdir ~ $ ls
> a b c
```

**rmdir** remove an empty folder
if you wish to remove a full folder use the following command

```bash
$ rm -rf <folder>
```

Where **\<folder\>** is the name of the folder to delete

> Nice! you can already make folders and remove folders. But as you can see you can quickly forget in which folder you are and where.

Lets start from an empty slate again.

```bash
firstdir ~ $ cd
$ ls
> original copy firstdir
$ rmdir firstdir # We cannot remove a directory that contains files
> firstdir is not an empty directory
$ rm -rf firstdir # this command force deletes a full directory
$ ls
> original copy
```

Try to understand what is happening in the code snippet above before continuing.

Now to keep track where we are we can issue the following command

```bash
$ pwd
> /home/alpha
```

What does this do?

**/home/alpha** it the current directory we are in.
home is the parent directory.
alpha is the directory we are in.
In other words the directory alpha is in the directory home.

Lets see an example of that in code

```bash
$ pwd
> /home/alpha
$ mkdir test # make a directory called test
$ cd test # go inside that directory
test ~ $ pwd
> /home/alpha/test
```

As you can see we moved in the directory test. (test is also inside a directory called alpha which is in the directory home)
So with cd we can go a directory deeper.
But cd can do even more . Like how do we go out of the directory called test? back to **/home/alpha**

```bash
test ~ $ pwd
> /home/alpha/test
test ~ $ cd ../ # move a directory back
$ pwd
> /home/alpha
$ cd test
test ~ $ pwd
> /home/alpha/test
test ~ $ cd ../
$ pwd
> /home/alpha
$ cd ../
$ pwd
> /home
$ cd ../
$ pwd
> /
cd home/alpha/test
test ~ $ pwd
> /home/aplha/test
```

The long code snippet above is showing you how to move up or down a directory, how to move multiple directories in one command and how to check the current location in your directory structure.

> Good job you have seen even more commands. If you master directories and files you can finally navigate your system in the terminal. Try to get good at this. You will need it!

| keybind     |                    effect                     |
| ----------- | :-------------------------------------------: |
| ls <dir>    |        List all content of a directory        |
| mkdir <dir> |          Make a directory called dir          |
| rmdir <dir> |         remove a directory called dir         |
| cd <dir>    |       go into the directory called dir        |
| pwd <dir>   | print the location where we are in the system |

### general commands

Lets see some command that you use to manage your system.

> Don't worry these are easier that the file/directory command

#### lsblk

lsblk stand for list block devices. It just shows you your hard drives

```bash
$ lsblk
>NAME     MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
sda        8:0    0  477G  0 disk
├─sda1     8:1    0    1G  0 part  /boot
├─sda2     8:3    0 15.9G  0 part  [SWAP]
└─sda3     8:4    0  460G  0 part
```

sda is the hard drive (477 Gigabytes)
this drive has 3 partitions.
sda1 is the boot partition
sda2 is the swap partition
sda3 is the filesystem

#### uname

uname prints system information

```bash
$ uname -a
> Linux core 5.2.0-TOS-1-tos #3 SMP PREEMPT Thu Jul 11 17:49:44 UTC 2019 x86_64 GNU/Linux
```

Linux is the kernel.
core is the name of the computer.
5.2.0-TOS-1-tos is the kernel version

#### ssh

ssh is secure shell. It is a way to connect to a remote machine.
You need credentials of the remote machine to make this work

```bash
$ ssh root@1.1.1.1
root@1.1.1.1 password:
root@1.1.1.1 $ cat welcome
> this file is printed from the computer with ip 1.1.1.1
```

#### free

Free gives you basic information about your ram usage.
The -h option makes free print out the sizes in human readable form.

```bash
$ free -h
>              total        used        free      shared  buff/cache   available
Mem:           15Gi       1.8Gi       1.5Gi       233Mi        12Gi        13Gi
Swap:          15Gi       0.0Ki        15Gi

```

Swap is actually your hard drive/solid state drive and not your ram. It is used when your ram is full.
Each column should speak for itself.

### zip/unzip

Zip is like tar in that it compresses and puts all files into on file. But it is also supported by windows

```bash
$ ls
> file
$ zip file file.zip
$ ls
> file file.zip
$ rm file
> unzip file.zip
$ ls
> file file.zip
```

### top/glances

Show system info per process.
Howmuch cpu and memory a process uses and more

```bash
$ top
$ glances
```

These 2 command simply show you information about the system

### ps

List all the processes with there information

```bash
$ ps -aux
> ... output ommited due to being to large ...
```

I am not going to show the output since it is to large to display
If you want to find a single process use the next snippet

```bash
$ ps -aux | grep tos
>alpha      1505  0.0  0.0   7364  3580 ?        S    Jul12   0:00 /bin/bash /home/alpha/bin/tos --theme-daemon
alpha      4686  0.0  0.0   6264  2276 pts/2    S+   14:34   0:00 grep --color=auto --exclude-dir=.bzr --exclude-dir=CVS --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn tos
```

As you can see we get 2 results one with **tos --theme-daemon** and one with **grep**
The second process is the one we just launched.
The first one is the process we care about.
Each process gets assigned a number. The first one has a number 1505. This is the process id (PID). If you want to run command on that process you must use its PID. Each process get a unique id.

### kill

Kill a process based on its unique id called a pid (process id)

```bash
$ kill 1505
```

We just killed the **tos --theme-daemon** process
lets verify

```bash
$ ps -aux | grep tos
>alpha      4686  0.0  0.0   6264  2276 pts/2    S+   14:34   0:00 grep --color=auto --exclude-dir=.bzr --exclude-dir=CVS --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn tos
```

We don't get the pid 1505 back because we killed it (stopped it)

### ping

Check if a network/ip is alive by sending it ping packets

```bash
$ ping 1.1.1.1
> PING 1.1.1.1 (1.1.1.1) 56(84) bytes of data.
64 bytes from 1.1.1.1: icmp_seq=1 ttl=57 time=14.8 ms
64 bytes from 1.1.1.1: icmp_seq=2 ttl=57 time=15.5 ms
--- 1.1.1.1 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 2ms
rtt min/avg/max/mdev = 14.836/15.158/15.480/0.322 ms

```

Ping will never stop. If you want it to stop anyway simple use ctrl+c to kill the process that is currently active

### man

man is used if you forgot how a command works. This command gives all information about how to used said command

```bash
$ man cd
```

The above snippet get a detailed list on how to use cd.

| keybind         |                effect                 |
| --------------- | :-----------------------------------: |
| lsblk           |         List your hard drives         |
| uname           |      List info about your kernel      |
| ssh <user>@<ip> |  Get shell acces to a remote machine  |
| free            |   Get information about your memory   |
| zip/unzip       |          zip and unzip files          |
| top/glances     |    get a nice view for system info    |
| ps              |       show a list of processes        |
| kill <pid>      |    kill a process based on its pid    |
| ping <ip>       |   check if a connection is working    |
| man <command>   | get a manual page for a given command |
| CTRL+C          |   Kill the current process/command    |

### Complete command list

| keybind             |                           effect                           |
| ------------------- | :--------------------------------------------------------: |
| touch <file>        |                 make a file called <file>                  |
| rm <file>           |               remove the file called <file>                |
| ls                  |              List all content of a directory               |
| cp <file1> <new>    |             copy file1 to the file called new              |
| mv <original> <new> |            move original to the file called new            |
| nano <file>         | Open the file called <file> in the text editor called nano |
| cat <file>          |      dump the content of the file into your terminal       |
| mkdir <dir>         |                Make a directory called dir                 |
| rmdir <dir>         |               remove a directory called dir                |
| cd <dir>            |              go into the directory called dir              |
| pwd <dir>           |       print the location where we are in the system        |
| lsblk               |                   List your hard drives                    |
| uname               |                List info about your kernel                 |
| ssh <user>@<ip>     |            Get shell acces to a remote machine             |
| free                |             Get information about your memory              |
| zip/unzip           |                    zip and unzip files                     |
| top/glances         |              get a nice view for system info               |
| ps                  |                  show a list of processes                  |
| kill <pid>          |              kill a process based on its pid               |
| ping <ip>           |              check if a connection is working              |
| man <command>       |           get a manual page for a given command            |
| CTRL+C              |              Kill the current process/command              |
