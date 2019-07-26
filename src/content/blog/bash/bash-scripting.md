---
title: "Bash scripting"
date: 2019-07-26T17:11:00+02:00
image: "images/blog/bash.png"
description: "Tie everything you have learned into one script"
author: "Tom Meyers"
type: "post"
---

We have arrived at one of the most powerful features of a shell. Naimly scripting. Scripting makes it possible for you to make different programs interact with eachother. So that you can master your operating system and make it do very powerfull things.

> Before reading this you should understand bash basics and bash extended. We will use a lot of different commands, globbing, piping, streams and more. If you don't understand that yet than please read the previous blogposts.

### What is scripting

Scripting is automating the execution of a task. In other words we make the computer do things instead of doing them manually. We have already seen some basic examples of making the computer. Here is a short example

```bash
$ mkdir text
$ mv *.txt text
```
Instead of manually moving all the txt files we make the computer figure out those files and then move them all.
Scripting works in much the same way. Bash scripting is nothing more than a series of commands executed after each other instead of typinh them out.

### Basics

To make a script you simple make a file with the extention .sh

```bash
$ touch script.sh
```

lets edit our first script with `nano`
Fill in the following.

```bash
echo "Hello from our script"
echo "This is a second command"
echo "Now I will list your directory"
ls
```
This script will execute 4 commands from top to bottom. It is exactly the same as typing it in manually.
Now lets execute this script.

```
$ bash script.sh
> Hello from our script
This is a second command
Now I will list your directory
script.sh
```

As you can see by simply typing `bash script.sh` we have executed 4 commands.

Now `bash script.sh` is one of many ways to execute a script. we for example can also execute the script by doing the following

```bash
$ cat script.sh | bash
```

You can even execute it with a different shell. Since bash isn't the only shell that exists.

```bash
$ sh script.sh
```

> Note sh is a bare bones shell. It has much fewer options than bash and some commands or options won't work in sh.

### Usefull commands

> Everything you do in this blogpost should be in a script. Later you should execute the file containing that script.

Before writing more complicated scripts we will cover a few simple commands that can come in handy.

#### echo
This command will simply print text to the screen. Usefull for debugging of giving information to the script user.

example:
```bash
$ echo "hello simple user"
> hello simple user
$ echo "Hello World"
> Hello World
```

#### read
Read asks for user input. This input can then be used to be processed later on.

example:
```bash
echo "Give a name for a directory and this script will create it"
read name
mkdir $name
```

> If you don't understand what name and $name are do not worry. Those are variables and they will be covered in a later section

To put it simply read will wait for a user to type something in and that value will be stored in a "box" called name later in the script we use the "box" name and look at the value. That value is used to make a directory

As you can see read just waits for user input. But we can also make it print something out

exampe:
```bash
read -p "Say something" something
echo "$something"
```

If you run this script you will see that the script always responds with the thing you type.

#### sleep

Sleep if much easier to understand than read. It simply waits the time in seconds that you tell it to

example:
```bash
sleep 1
echo "hello" # this is printed out after one second
```

#### clear

All that clear does is remove all output on your terminal.
To try it simply type in the following

```bash
echo "I will be erased"
sleep 1
clear
```

### Simple Examples

Now that you have seen how to write and execute a script and how to use it. Here are some basic examples to make them easier to understand.

example 1: great you based on your name

```bash
read -p "Tell me your name:" name
echo "hello $name"
```

example 2: remove a directory interactivly

```bash
echo "The following content is the current directory"
sleep 0.5
ls
sleep 0.5
read -p "What do you want me to remove?" dir
rm -rf $dir
ls
```

example 3: remove all files with a exstention

```bash
echo "This is the content of the current directory"
sleep 0.5
ls
sleep 0.5
read -p "Which filetype do I have to delete?" type
rm *."$type"
ls
```

Short explenation of what each script does.

example 1 will ask you to type your name in. It will then respond with hello followed with your name.

```bash
$ bash example1.sh
> Tell me your name:tom
> Hello tom
```

```bash
$ bash example1.sh
> Tell me your name:simba
> Hello simba
```
example 2 will remove a directory based on what you type.

```bash
$ bash example2.sh
>The following content is the current directory
> script.sh example.sh example2.sh example3.sh testdir testdir2
> What do you want me to remove? testdir
> script.sh example.sh example2.sh example3.sh testdir2
```

```bash
$ bash example2.sh
>The following content is the current directory
> script.sh example.sh example2.sh example3.sh testdir2
> What do you want me to remove? testdir2
> script.sh example.sh example2.sh example3.sh
```

example 3 will remove all files of a specific exstention eg .jpg .png .pdf or something other

```bash
$ bash example3.sh
> This is the content of the current directory
> script.sh example.sh example2.sh example3.sh a.jpg b.jpg c.jpg a.txt haha.txt example.txt test.txt2
> What filetype do I have to delete?jpg
> script.sh example.sh example2.sh example3.sh a.txt haha.txt example.txt test.txt2
```

```bash
$ bash example3.sh
> This is the content of the current directory
> script.sh example.sh example2.sh example3.sh a.jpg b.jpg c.jpg a.txt haha.txt example.txt test.txt2
> What filetype do I have to delete?txt
> script.sh example.sh example2.sh example3.sh test.txt2
```

> Do not type in sh in the last example or you will lose all the shell scripts you just wrote

> Don't continue with the rest of the blogpost until you understand the 3 examples above. Try to experiment with the examples given and try to come up with a unique script yourself. This way you will quickly learn how to deal with scripts.

### What are shebangs?

Shebangs might seen scary but they aren't. Up until now you have always had to type in `bash name.sh` where name is the name of your file. Shebangs are present at the first line of a file and tell the computer which program should run the file. if you add a shebang to your file you don't need to type `bash name.sh` anymore after that you can simply type in `./name.sh` bash will read the shebang and know which program should run the script

example

```bash
#!/bin/bash
echo "I can run from a shebang"
```

Now try to type in (if your file is called shebang.sh)

```bash
$ ./shebang.sh
> zsh: permission denied: ./shebang.sh
```

As you can see your script didn't run. Why is that?
Well if you want to use a shebang than you need to tell linux that the file is executable

simply run the following

```bash
$ chmod +x shebang.sh
$ ./shebang.sh
> I can run from a shebang
```

Now the file has executable permissions. Do know that you only need to do `chmod +x` once. This simply makes a file executable. After that you can `./shebang.sh` as much as you like.

### Variables

> From this point onward the blog will become more difficult to understand for people without programming backgrounds. It is of the utmost importance that you understand all of the above before starting here. If you don't fully understand something then read that section again or gather more information via google or wikipedia.

Variables are a way to store data. In the example above we have seen how a variable could work with the command `read` In this section we will cover it in more depth.
Lets see a simple example

```bash
#!/bin/bash

var="hello"
echo "$var"
echo "$var to you too"
```
Here we have a variable called `var` that holds the data `hello`. We can then use that variable in multiple places throughout our script.
Try to change the name of `var` to something else like `printable`. Don't forget to change to name in all places.

```bash
#!/bin/bash

printable="hello"
echo "$printable"
echo "$printable to you too"
```

Variables can be named as long as you would like but we recomend to use names that make sense. for example use the name `directory` when the variable holds a directory.

You can't give a variable all names possible. Here are the rescrictions.

* It must start with a letter.
* It can only contain letters (lower or uppercase) and numbers
* it can also contain special characters such as - _

You can generaly do 2 thing with a variable.
You can assign a value to it

```bash
var1="1" # now holds the value 1
var2="2" # a different variable holds the value of 2
```

Or you can read the value from it

```bash
echo "$var1" # read the value from var1
echo "$var2" # read the value from var2
var3="$var2" # read the value from var2 and put it in var3
```

When creating a variable you simply use the name followed by a `=` everything after that is the value that is inside the variable.
When reading the value from a variable you type in `$` followed by the name. That entire piece will then be replaced with the value.


### special variables

Your script can get parameters. Parameters are strings of text after your command eg `rm hello.txt` where `rm` is the command and `hello.txt` is the parameter.

your script can also work with parameters. Here is a simple example to make you understand them.

```bash
echo "Hello"
echo "First parameter $1"
echo "Second parameter $2"
echo "All parameters $@"
```

Lets name the above script test.sh

try to run this

```bash
$ ./script.sh
> Hello
> First parameter
> Second parameter
> All parameters
```

```bash
$ ./script.sh hi
> Hello
> First parameter hi
> Second parameter
> All parameters hi
```

```bash
$ ./script.sh hi how
> Hello
> First parameter hi
> Second parameter how
> All parameters hi how
```

```bash
$ ./script.sh hi how are you
> Hello
> First parameter hi
> Second parameter how
> All parameters hi how are you
```


```bash
$ ./script.sh "hi how are" you
> Hello
> First parameter hi how are
> Second parameter you
> All parameters hi how are you
```

As you can see each parameter is seperated by a space

the first parameter supplied to your script is `$1` the second `$2` the third `$3` etc. If you want a list of all parameters you can use the special `$@`. But what if one parameter contains a space. Well than you can surround that parameter by `""` This way bash knows to treat it as one parameter. Just as in the last example.



### environment variables

Bash also has environment variables. These are ultra special variables that exist outside of the scope of your script. In other words they exist in all script simultaniously. They are common.

bash has many environment variables. Here are a few.

`$HOME` : The directory of the currently logged in user

`$PWD` : The current working directory

`$SHELL` : The current shell executing commands

`$PPID` : The process id of the parent

`$LANG` : The current language

And many more. If you want to make an environement variable just do this

```bash
export ENVVAR="hello"
```

The variabel `ENVVAR` is now accesable everywhere on your system.

> Environment variables are usually all in capital letters. It is also recommended to follow this guidline to know if a variable is local or global.

### Conditional logic

Conditional logic is a way to make your program take descisions.

For example only execute something when the user is older than 18.
Or execute something based on gender.

Here is an example.

```bash
#!/bin/bash

age="19"

if [[ "$age" -gt "18" ]]; then
    echo "older than 18"
fi
```

```bash
#!/bin/bash

age="17"

if [[ "$age" -gt "18" ]]; then
    echo "older than 18"
fi
```

run both programs.
As you can see in the first example the `echo "older than 18"` is printed. This is because the program performs a check. The check is `[[ "$age" -gt "18" ]]` which you can read as `is age greater than 18?` if it is run everything between `then` and `fi`

The `-gt` stands for greater than. This makes comparisions between numbers much easier.

there also exists these comparisions

* -lt : less than
* -ge : greater than or equal
* -le : less than or equal
* == : equal
* != : not equal

Try to play with the above example and change the comparisions to one of the list above.

> Note in the control structure you must use all spaces you see. If you forget on the code won't work properly.

Lets elaborate on the above a bit more

```bash
#!/bin/bash

age="17"

if [[ "$age" -ge "18" ]]; then
    echo "You are older than 18"
else
    echo "You are younger than 18"
fi
```

Everytinh behind `else` will be executed if the condition is not met.

Usefull example

```bash
#!/bin/bash

read -p "What file do you want to delete" file

if [[ -f "$file" ]]; then
    rm "$file"
else
    echo "That is not a file"
fi
```

```bash
#!/bin/bash

read -p "What file do you want to delete" file

if [[ -f "$file" ]]; then
    read -p "are you sure? (y/N)" answer
    if [[ "$answer" == "y" ]]; then
        rm "$file"
    fi
else
    echo "That is not a file"
fi
```

> There exists more conditional logic. Than what is shown above but this post is to get you started with scripting not by making you a professional. If you wish to get more info look up bash coditional logic, bash switch or bash elif

### Loops

Loops work in much the same way that conditional logic but itterate over something.

```bash
#!/bin/bash

a=(1 2 3)

for num in $a; do
    echo "Looping"
    echo "$num"
    sleep 0.5
done
```

If you run this you will get

```bash
$ ./loop.sh
>Looping
1
Looping
2
Looping
3
```

As you can see the body between `do` and `done` are executed for each entry in `$a`. Each entry is then assigned to the value `$num` which you specified in the for loop.
You could for instance make a file for every entry

```bash
#!/bin/bash

a=("a.txt" "b.txt" "c.txt")

ls

for num in $a; do
    echo "making file $num"
    touch $num
done

echo "Done making files"
echo "Showing you the file structure"
sleep 0.5
ls
```

This will loop through `$a` and make a file for each entry.

> For more information or more type of loops look up bash loops, bash while, bash do while.

### functions

The last part that we will cover in this blog is functions. Think of them like scripts in scripts.
A function is basically a small script you can call that executes a series of commands.

Here is a very basic example of functions that serves no other purpose than to display the syntax.

```bash
#!/bin/bash

function show_hello {
    echo "hello"
}

show_hello
sleep 0.5
show_hello
```

If your run the script above then you will see that it would act the same as this.

```bash
echo "hello"
sleep 0.5
echo "hello"
```

But functions can do more. Here is an example of running multiple commands in a function

```bash
#!/bin/bash

logfile="functions.log"
function DisplayAndLog_Hello {
    text="hello"
    echo "$text"
    echo "$text" >> "$logfile"
}

displayandlog_hello
```

If you run the above then you will see the function printed out hello and also added it to the `functions.log` file.
by running the command `DisplayAndLog_Hello` executed the body of the function.

Now functions can do some more cool stuff. Lets display and log arbitrary data instead of always the string hello

```bash
#!/bin/bash

logfile="functions.log"
function DisplayAndLog {
    echo "$1"
    echo "$1" >> "$logfile"
}

DisplayAndLog "Data supplied to a function"
DisplayAndLog "Even more data"
DisplayAndLog "Now the data is different"
DisplayAndLog "Now even more different"
```

As you can see we called the function 4 times but each time with different content. In the function body we used `$1` but from the section special variables we know that those are parameters supplied to the bash script. Well functions can also have parameters and inside those functions the variables `$1 $2 $@` change depending on the supplied values.

> Great if you understand all blog posts covering bash you already know quite a few things. You should be proficient enough to controll your linux install. If you still wish to learn more consider the following topics

### Must know
* absolute and relative directory paths
* package managers
* git
* systemctl

### Extra's
* display/window manager
* linux kernel
* completion functions
* NetworkManager

### Usefull commands to master
* grep
* find
* sed
* awk
* cut
* tr




