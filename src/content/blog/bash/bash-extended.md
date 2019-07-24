---
title: "Bash extended"
date: 2019-07-17T19:09:00+02:00
image: "images/blog/bash.png"
description: "Extend upon the basics of bash by using powerfull features"
author: "Tom Meyers"
type: "post"
---

Today we will talk about more advanced functionality of the shell. In this blogpost we will cover streams, piping output, stream redirect, jobs, chaining command and more.

> Before starting this blogpost you must understand the post about bash basics. Otherwise this will be very difficult to follow.

### What are streams?

To understand what streams are we first have to think about the states all applications (or commands) can be in.
An application can be in normal mode (this is where the application is running as expected) In this mode all output is going to "stream 1"
Stream 1 (or somethimes called file descriptor 1) is commenly known as standard output(stdout). Here is a quick example

```bash
$ ls
> Desktop Pictures Music Documents file.txt
```

The output of ls is in this case beeing outputted in the first stream (1) because this is expected behaviour.
But as you might have guessed the application can also go into an error mode (because it received faulty information or something unexpected has happend)

In this example we will change directory in a file with cd but as you know cd only works with directories (not a file) so this is unexpected behaviour.

```bash
$ cd file.txt
> cd: not a directory: file.txt
```

The output of cd is happening in the second stream commenly known as standard error(stderr)

So bash and other shells use streams to handle different states that happen inside programs/commands. Bash can support up to 10 streams but mainly use stream 1 and 2.

### Stream redirect

Now what can we do with the streams stdout and stderr?
Well we can manipulate streams into doing certain things. This part of the blog will cover those manipulations.

First of all we can redirect a stream to a file.
This is done by using the **>** operator. The syntax looks like the following

```bash
$ ls 1> output.txt
```

The above code snippet puts the output of ls (stdout) into the file called output.txt
The number 1 indicates that we should redirect stream 1 to the file.
the > operator override all content that is currently present in the file. To append you can use the >> operator

```bash
$ echo "content appended" 1>> output.txt
```

As you can see in the file both outputs are inside the file

```bash
$ echo "content deleted" 1> output.txt
```

If you now look at the file you will see that the old content has been overriden.

Now by simply replacing the 1 to a 2 you are now redirecting only stderr(errors) so if an error occurs in a command that that will be placed inside the file but stdout stays just in the terminal (not in the file)

There are a few more usefull stream redirects you should know about

> &> Redirects both stdout and stderr instead of one or the other. A usefull example is firefox &> /dev/null. This redirects all output to a special file that is effectivly a trash dump. It doesn't store the data.

Now instead of moving a stream to a file you can also merge streams.

For instance you can merge stderr into stdout so that everything is treated as stdout.

Example:

```bash
$ ls > output_with_errors.txt 2>&1
```

Here we redirect stdout to `output_with_errors.txt` but stderr is also send to stdout so we see both stderr and stdout.

> There also exists a special file descriptor called stdin. This takes an input from the keyboard (or other programms) and threat it like a normal stream.

Here are some examples with stdin

```bash
$ cat < output.txt
```

The first example sends the content of the file output.txt to the program cat as input.

```bash
$ cat <<EOF
echo "hello"
echo "this is beeing treated like a file"
EOF
```

In the second example we don't use a file but rather fake a file by typing it in the terminal.
The stream is beeing treated like a fil. And as far as the program is concerned it is a file.
The syntax for this is <<delimiter content delimiter Where delimiter tells use when the input of our fake file is done
In this case it is EOF (stands for End Of File)
We can go even further by outputing stdout to a file. This way we can quickly write a file without going into a text editor

```bash
$ cat <<EOF > output.sh
echo "hello"
echo "This is written from the terminal and saved into a file"
EOF
```

### Piping

Now comes a section that is much easier that streams but makes heavy use of them.
Piping is effectivelly a way to make the output of commands the input of other commands.
For example we want to list out a file but filter certain parts of it. What we can do is print out the file (using cat) and then pipe it into another command that does the filtering.

Lets have a look at the file called /etc/passwd. It contains all the users in our system. But as you can see it also contains a lot of "junk" like home directories, groups and much more but we only want the username. How should we do this?

Here commes piping to the rescue. We have a command called cat which will output everything.

```bash
$ cat /etc/passwd
```

But now we just want the username. If you analyse 1 line for example
alpha:x:1000:985::/home/alpha:/bin/zsh
You see that the username is the first entry and that each entry is divided by a :
There exists a command called cut which "cuts" a line by its delimiter (in our case :) and you simply tell which parts to print
the cut commands looks like the following

```bash
$ cut -d: -f1 /etc/passwd
> alpha
$ cut -d: -f3 /etc/passwd
> 1000
```

The -d: tells cut to treat : as the delimiter and -f tells cut which entry to print /etc/passwd is the file to look into

Now we can rewrite cut to use piping (taking output from one command and putting that as input for another)
In this case we will print out the file and take that as the input for cut

```bash
$ cat /etc/passwd | cut -d: -f1
> alpha
```

This does the same thing as above but using piping.
Now you may ask why should we do this? Well we can keep piping output from cut for example into another program.

```bash
$ cat /etc/passwd | cut -d: -f1 # print the user
> /home/alpha
$ cat /etc/passwd | cut -d: -f1 | head -n2 # only print the first 2 entries of cut
> /root
> /home/alpha
```

Here we only print the first 2 entries returned from cut instead of printing out all entries.
If you want a nice visualisation follow the following snippets

```bash
$ pacman -Syu fortune lolcat cowsay
$ fortune
$ fortune | cowsay
$ fortune | cowsay | lolcat
```

Here you will visually see what piping in effect does. Have fun playing with these 3 commands.

### Command chaining

echo hello && echo true || echo error

In the previous section you have seen piping. A very usefull tool. Because it can interact between commands. This opens a lot of oppertunities for you.
But imaging the following situation. You have a command like getting a file from the internet. Once it is downloaded you would like to open the file in a text editor to change some stuff. But you only what that when the file is downloaded. If an error occured during the download we shouldn't be in the text editor because the file doesn't exist. If that makes sense that I can show you that in code.

```bash
$ wget https://repo.pbfp.xyz -o index.html
```

The above script downloads the tos repo home page and saves it under the name index.html
If an error occurs (for instance no network connectivity) than we won't have a file index.html so we can't edit it.

This is the syntax `<command> && <command2>` if command doesn't contain an error than command2 will be ran.

example

```bash
$ wget https://repo.pbfp.xyz -o index.html && nano index.html
```

Here we only run `nano index.html` if the file is downloaded.

Test it out by using a wrong url to see if it opens index.html (don't forget to first delete index.html)

Now we can also do the same for errors. Lets jump right into the code

```bash
$ wget https://repo.pbfp.xyz -o index.html && nano index.html || echo "An error occured"
```

This is the syntax `<command>||<command2>` if command contains an error than command2 will be ran. In the above piece of code you can see both in action at the same time.

### Jobs

Jobs are very usefull for commands that take a very long time to complete.

Lets see a command that takes a long time

```bash
$ sleep 5 && echo "Faking a command that takes time"
```

This will take about 5 seconds. Run it to see it in action. Now lets make it take even longer.

```bash
$ sleep 60 && echo "Faking for even longer"
```

Now you don't want to wait for that command to complete before you have acces to your terminal. That can be annoying but there is a solution.
The solutions is called jobs (or background jobs) It basically send the command to the background so that you can keep using your terminal.
To make a command a background job simply use &

```bash
$ sleep 15 &
```

If you run the above a number will be printed (this is the pid or process id)
As you can see you still have access to your terminal. But the command is still running in the background.
To verify this you can run

```bash
$ jobs
```

This lists all processes running in the background
But as you may have noticed they keep there output in the terminal.
If you haven't noticed then run the following command

```bash
$ yes &
```

you can remove the output by using stream redirects

```bash
$ yes &> /dev/null &
```

This ignores all the output and makes the command run in the background eg

```bash
$ firefox &> /dev/null &
```

Now lets see how our program can run back as a normal process (as if we never typed &)

```bash
$ sleep 10 &
$ fg
```

This will put the latest process into the forground. (If you want to kill the process type in CTRL+C)

The last thing you must know is that ctrl+Z stops the current process and only resumes when typing in `fg`

### aliases

Aliases are very easy to grasp. They are basically a command existing of commands. That might seem confusing at first but I will show you by using examples

```bash
$ alias hello="echo hi"
$ hello
> hi
```

Here we made an alias called hello. And when we call hello it will execute `echo hi` thus printing hi

Ofcourse you can still use everything we have learned so far. For example

```bash
$ alias prt="echo"
$ prt hello
> hello
$ alias showuser="cut -d: -f1"
$ cat /etc/passwd | showuser
> alpha
```

If you are using certain commands often aliases can help you make then shorter and more easy to understand.

### Globbing

Bash also includes globbing which makes it easy for you to select multiple files or directories.

Lets say you see the following output of ls

```bash
$ ls
> a.txt b.txt c.txt d.txt e.txt aa.txt bb.txt abc.txt def.abc hahah.abc
```

imaging if you want a directory and put all the .txt files inside that directory. That would mean you have to follow these steps.

- make a directory
- move file a.txt to that directory
- move file b.txt to that directory
- move all the files manually in that directory.

You would have to do something like this.

```bash
$ mkdir text
$ mv a.txt text
$ mv d.txt text
$ mv c.txt text
$ mv d.txt text
$ mv e.txt text
$ mv aa.txt text
$ mv bb.txt text
$ mv abc.txt text
$ ls
> text def.abc hahah.abc
```

As you can see we just typed a lot of commands for a relativily simple task.
This is where globbing comes into play. bash by default has 2 special characters to help you select a group of files. The characters are `* and ?`

- \* will match any set of characters
- ? will match one place to any character.

I find it more easy to just show you

```bash
$ mv *.txt text # this will move anytinh that ends with .txt
> a.txt text d.txt c.txt d.txt e.txt aa.txt bb.txt abc.txt
$ mv ?.txt text  # this will move anything that only has one character before .txt
> a.txt text d.txt c.txt d.txt e.txt
$ mv ??.txt text # this will move anything that has exactly 2 characters before .txt
> aa.txt bb.txt
$ mv ???.* # this will move anything that has exactly 3 characters before the . and has something behind the .
> def.abc
```

> Good job. You can now manpulate programs to work with eachother, put commands in the background, select multiple files with globbing and overall simplify your life.
