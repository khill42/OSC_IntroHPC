---
title: "Basic UNIX Commands"
teaching: 0
exercises: 0
questions:
- "What is the syntax of UNIX commands?"
- "How do I navigate the file system?"
- "How do I transfer files to HPC?"
- "How do I interact with files on the HPC?"
objectives:
- "Be able to construct basic UNIX commands."
- "Be able to move files to and from the remote system."
- "Be able to traverse the HPC file system."
- "Be able to interact with your files."
keypoints:
- "`scp` (The Secure Copy Program) is a standard way to securely transfer data to remote HPC systems."
- "File ownership is an important component of a shared computing space and can be controlled with `chgrp` and `chown`."
- "Scripts are *mostly* just lists of commands from the command line in the order they are to be performed."
---

Since we interact the UNIX shell via typing commands, there a few key shortcuts we can use to save the amount of typing we must do (and therefore minimise errors associated with human input of commands). 
In particular, the use of "~" ".." are useful when changing directories or accessing files. 
Additionally, the use of 'tab completion' can help us ensure we are typing commands, directory paths and file paths appropriately. 

> ## Common Shortcuts  
> **Home Directory** -- the tilda symbol "~" represents your home directory, e.g. /homeN/XX/jcXXYYY  
> **Current Directory** -- a single full-stop "." represents your current working directory, e.g. same directory returned by `pwd`  
> **Parent Directory** -- a double full-stop ".." represents the *parent* of your current working directory  
> **Root Directory** -- on it's own, a single forwardslash "/" represents the root directory, e.g. the bottom of the directory *tree*  
> **New Directory** -- between two words, a forwardslash "/" represents a new directory, e.g. in this situation "/homeN/XX/" the directory "XX" is contained within the directory "homeN"  
> **Up & Down Arrows** -- use these keys to navigate through your command history  
> **Tab Key** -- performs *autocompletion* of commands, directory paths & file paths  
> **Escape Character** -- a single backslash "\" is used to 'escape' special characters, such as spaces, ampersands & apostrophes  
> **Environment Variables** -- when you open your shell, a number of pre-saved variables, so called 'environment' variables are set for you. You can view them all by executing the command `printenv`, and access individual variables by prefacing their name with a "$", e.g. $USER or $HOSTNAME.  
> **Wildcards** -- the asterisk symbol "*" can be used to represent a string of characters of non-zero length; most commonly you can integrate an '\*' into other commands to create search patterns.  For example, `ls *zip` will display all files and directories that end with "zip", regardless of the leading characters.   
{: .callout}

Insert directory image here and annotate to explain 'dir' shortcuts.

## Basic UNIX Syntax

Here use 'cd' and 'mkdir' as explainers to demonstrate the use of up/down, tab and escape
Explain what 'zero exit' status is

Type the command `whoami`,
then press the ENTER key to send the command to the shell.
The command's output is the ID of the current user,
i.e.,
it shows us who the shell thinks we are:

~~~
$ cd
~~~
{: .bash}

~~~
jcXXYYYY
~~~
{: .output}

More specifically, when we type `whoami` the shell:

1.  finds a program called `whoami`,
2.  runs that program,
3.  displays that program's output, then
4.  displays a new prompt to tell us that it's ready for more commands.


> ## Unknown commands
> bash: cd: TEST: No such file or directory  
> bash: mycommand: command not found  
> bash: pwd: -Y: invalid option  
{: .callout}

Next,
let's find out where we are by running a command called `pwd`
(which stands for "print working directory").
At any moment,
our **current working directory**
is our current default directory,
i.e.,
the directory that the computer assumes we want to run commands in
unless we explicitly specify something else.
Here,
the computer's response is `/Users/nelle`,
which is Nelle's **home directory**:

~~~
$ pwd
~~~
{: .bash}

~~~
/Users/nelle
~~~
{: .output}

## Telling the Difference between the Local Terminal and the Remote Terminal

`echo $HOME`  
`echo $HOSTNAME`
## Navigating the Remote System

Using `ls`
and using `cd`

# Using help/man to find all available options.

`ls` has lots of other options. To find out what they are, we can type:

~~~
[remote]$ ls --help
~~~
{: .bash}

~~~
Usage: ls [OPTION]... [FILE]...
List information about the FILEs (the current directory by default).
Sort entries alphabetically if none of -cftuvSUX nor --sort is specified.

Mandatory arguments to long options are mandatory for short options too.
  -a, --all                  do not ignore entries starting with .
  -A, --almost-all           do not list implied . and ..
      --author               with -l, print the author of each file
  -b, --escape               print C-style escapes for nongraphic characters
      --block-size=SIZE      scale sizes by SIZE before printing them; e.g.,
                               '--block-size=M' prints sizes in units of
                               1,048,576 bytes; see SIZE format below
  -B, --ignore-backups       do not list implied entries ending with ~
  -c                         with -lt: sort by, and show, ctime (time of last
                               modification of file status information);
                               with -l: show ctime and sort by name;
                               otherwise: sort by ctime, newest first
  -C                         list entries by columns
      --color[=WHEN]         colorize the output; WHEN can be 'always' (default
                               if omitted), 'auto', or 'never'; more info below
  -d, --directory            list directories themselves, not their contents
  -D, --dired                generate output designed for Emacs' dired mode
  -f                         do not sort, enable -aU, disable -ls --color
  -F, --classify             append indicator (one of */=>@|) to entries
      --file-type            likewise, except do not append '*'
      --format=WORD          across -x, commas -m, horizontal -x, long -l,
                               single-column -1, verbose -l, vertical -C
      --full-time            like -l --time-style=full-iso
  -g                         like -l, but do not list owner
      --group-directories-first
                             group directories before files;
                               can be augmented with a --sort option, but any
                               use of --sort=none (-U) disables grouping
  -G, --no-group             in a long listing, don't print group names
  -h, --human-readable       with -l and/or -s, print human readable sizes
                               (e.g., 1K 234M 2G)
      --si                   likewise, but use powers of 1000 not 1024
  -H, --dereference-command-line
                             follow symbolic links listed on the command line
      --dereference-command-line-symlink-to-dir
                             follow each command line symbolic link
                               that points to a directory
      --hide=PATTERN         do not list implied entries matching shell PATTERN
                               (overridden by -a or -A)
      --indicator-style=WORD  append indicator with style WORD to entry names:
                               none (default), slash (-p),
                               file-type (--file-type), classify (-F)
  -i, --inode                print the index number of each file
  -I, --ignore=PATTERN       do not list implied entries matching shell PATTERN
  -k, --kibibytes            default to 1024-byte blocks for disk usage
  -l                         use a long listing format

....

The SIZE argument is an integer and optional unit (example: 10K is 10*1024).
Units are K,M,G,T,P,E,Z,Y (powers of 1024) or KB,MB,... (powers of 1000).

Using color to distinguish file types is disabled both by default and
with --color=never.  With --color=auto, ls emits color codes only when
standard output is connected to a terminal.  The LS_COLORS environment
variable can change the settings.  Use the dircolors command to set it.

Exit status:
 0  if OK,
 1  if minor problems (e.g., cannot access subdirectory),
 2  if serious trouble (e.g., cannot access command-line argument).

GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
Full documentation at: <http://www.gnu.org/software/coreutils/ls>
or available locally via: info '(coreutils) ls invocation'
~~~
{: .output}

Many bash commands, and programs that people have written that can be
run from within bash, support a `--help` flag to display more
information on how to use the commands or programs.

> ## Parameters vs. Arguments
>
> According to [Wikipedia](https://en.wikipedia.org/wiki/Parameter_(computer_programming)#Parameters_and_arguments),
> the terms **argument** and **parameter**
> mean slightly different things.
> In practice,
> however,
> most people use them interchangeably
> to refer to the input term(s) given to a command.
> Consider the example below:
> ```
> [remote]$ ls -lh /plots
> ```
> {: .bash}
> `ls` is the command, `-lh` are the flags (also called options),
> and `Documents` is the argument.
{: .callout}


> ## Other Hidden Files
>
> In addition to the hidden directories `..` and `.`, you may also see a file
> called `.bash_profile`. This file usually contains shell configuration
> settings. You may also see other files and directories beginning
> with `.`. These are usually files and directories that are used to configure
> different programs on your computer. The prefix `.` is used to prevent these
> configuration files from cluttering the terminal when a standard `ls` command
> is used.
{: .callout}

> ## Orthogonality
>
> The special names `.` and `..` don't belong to `cd`;
> they are interpreted the same way by every program.
> For example,
> if we are in `/Users/nelle/data`,
> the command `ls ..` will give us a listing of `/Users/nelle`.
> When the meanings of the parts are the same no matter how they're combined,
> programmers say they are **orthogonal**:
> Orthogonal systems tend to be easier for people to learn
> because there are fewer special cases and exceptions to keep track of.
{: .callout}

These then, are the basic commands for navigating the filesystem on your computer:
`pwd`, `ls` and `cd`.  Let's explore some variations on those commands.  What happens
if you type `cd` on its own, without giving
a directory?  

~~~
[remote]$ cd
~~~
{: .bash}

How can you check what happened?  `pwd` gives us the answer!  

~~~
[remote]$ pwd
~~~
{: .bash}

~~~
/Users/nelle
~~~
{: .output}

It turns out that `cd` without an argument will return you to your home directory,
which is great if you've gotten lost in your own filesystem.  

Let's try returning to the `data` directory from before.  Last time, we used
three commands, but we can actually string together the list of directories
to move to `data` in one step:

~~~
[remote]$ cd Desktop/data-shell/data
~~~
{: .bash}

Check that we've moved to the right place by running `pwd` and `ls -F`  

If we want to move up one level from the data directory, we could use `cd ..`.  But
there is another way to move to any directory, regardless of your
current location.  

So far, when specifying directory names, or even a directory path (as above),
we have been using **relative paths**.  When you use a relative path with a command
like `ls` or `cd`, it tries to find that location  from where we are,
rather than from the root of the file system.  

However, it is possible to specify the **absolute path** to a directory by
including its entire path from the root directory, which is indicated by a
leading slash.  The leading `/` tells the computer to follow the path from
the root of the file system, so it always refers to exactly one directory,
no matter where we are when we run the command.

This allows us to move to our `data-shell` directory from anywhere on
the filesystem (including from inside `data`).  To find the absolute path
we're looking for, we can use `pwd` and then extract the piece we need
to move to `data-shell`.  

~~~
[remote]$ pwd
~~~
{: .bash}

~~~
/Users/nelle/Desktop/data-shell/data
~~~
{: .output}

~~~
[remote]$ cd /Users/nelle/Desktop/data-shell
~~~
{: .bash}

Run `pwd` and `ls -F` to ensure that we're in the directory we expect.  

### Nelle's Pipeline: Organizing Files

Knowing just this much about files and directories,
Nelle is ready to organize the files that the protein assay machine will create.
First,
she creates a directory called `north-pacific-gyre`
(to remind herself where the data came from).
Inside that,
she creates a directory called `2012-07-03`,
which is the date she started processing the samples.
She used to use names like `conference-paper` and `revised-results`,
but she found them hard to understand after a couple of years.
(The final straw was when she found herself creating
a directory called `revised-revised-results-3`.)


> ## Absolute vs Relative Paths
>
> Starting from `/Users/amanda/data/`,
> which of the following commands could Amanda use to navigate to her home directory,
> which is `/Users/amanda`?
>
> 1. `cd .`
> 2. `cd /`
> 3. `cd /home/amanda`
> 4. `cd ../..`
> 5. `cd ~`
> 6. `cd home`
> 7. `cd ~/data/..`
> 8. `cd`
> 9. `cd ..`
>
> > ## Solution
> > 1. No: `.` stands for the current directory.
> > 2. No: `/` stands for the root directory.
> > 3. No: Amanda's home directory is `/Users/amanda`.
> > 4. No: this goes up two levels, i.e. ends in `/Users`.
> > 5. Yes: `~` stands for the user's home directory, in this case `/Users/amanda`.
> > 6. No: this would navigate into a directory `home` in the current directory if it exists.
> > 7. Yes: unnecessarily complicated, but correct.
> > 8. Yes: shortcut to go back to the user's home directory.
> > 9. Yes: goes up one level.
> {: .solution}
{: .challenge}

> ## Relative Path Resolution
>
> Using the filesystem diagram below, if `pwd` displays `/Users/thing`,
> what will `ls -F ../backup` display?
>
> 1.  `../backup: No such file or directory`
> 2.  `2012-12-01 2013-01-08 2013-01-27`
> 3.  `2012-12-01/ 2013-01-08/ 2013-01-27/`
> 4.  `original/ pnas_final/ pnas_sub/`
>
> ![File System for Challenge Questions](../fig/filesystem-challenge.svg)
>
> > ## Solution
> > 1. No: there *is* a directory `backup` in `/Users`.
> > 2. No: this is the content of `Users/thing/backup`,
> >    but with `..` we asked for one level further up.
> > 3. No: see previous explanation.
> > 4. Yes: `../backup/` refers to `/Users/backup/`.
> {: .solution}
{: .challenge}

> ## `ls` Reading Comprehension
>
> Assuming a directory structure as in the above Figure
> (File System for Challenge Questions), if `pwd` displays `/Users/backup`,
> and `-r` tells `ls` to display things in reverse order,
> what command will display:
>
> ~~~
> pnas_sub/ pnas_final/ original/
> ~~~
> {: .output}
>
> 1.  `ls pwd`
> 2.  `ls -r -F`
> 3.  `ls -r -F /Users/backup`
> 4.  Either #2 or #3 above, but not #1.
>
> > ## Solution
> >  1. No: `pwd` is not the name of a directory.
> >  2. Yes: `ls` without directory argument lists files and directories
> >     in the current directory.
> >  3. Yes: uses the absolute path explicitly.
> >  4. Correct: see explanations above.
> {: .solution}
{: .challenge}

> ## Exploring More `ls` Arguments
>
> What does the command `ls` do when used with the `-l` and `-h` arguments?
>
> Some of its output is about properties that we do not cover in this lesson (such
> as file permissions and ownership), but the rest should be useful
> nevertheless.
>
> > ## Solution
> > The `-l` arguments makes `ls` use a **l**ong listing format, showing not only
> > the file/directory names but also additional information such as the file size
> > and the time of its last modification. The `-h` argument makes the file size
> > "**h**uman readable", i.e. display something like `5.3K` instead of `5369`.
> {: .solution}
{: .challenge}

> ## Listing Recursively and By Time
>
> The command `ls -R` lists the contents of directories recursively, i.e., lists
> their sub-directories, sub-sub-directories, and so on in alphabetical order
> at each level. The command `ls -t` lists things by time of last change, with
> most recently changed files or directories first.
> In what order does `ls -R -t` display things? Hint: `ls -l` uses a long listing
> format to view timestamps.
>
> > ## Solution
> > The directories are listed alphabetical at each level, the files/directories
> > in each directory are sorted by time of last change.
> {: .solution}
{: .challenge}



### touch, cp, mv, rm, rmdir, scp

## Moving files to and from the remote system from and to your local computer

It is often necessary to move data from your local computer to the remote system and vice versa.  There are many ways to do this and we will look at two here: `scp` and `sftp`.

### `scp` from your local computer to the remote system
The most basic command line tool for moving files around is secure copy or `scp`.

`scp` behaves similarily to `ssh` but with one additional input, the name of the file to be copied.  If we were in the shell on our local computer, the file we wanted to move was in our current directory, named "globus.tgz", and Nelle wanted to move it to her home directory on cedar.computecanada.ca then the command would be
	
~~~
[local]$ scp fileToMove nelle@cedar.computecanada.ca:
~~~
{: .bash}
	
It should be expected that a password will be asked for and you should be prepared to provide it.

Once the transfer is complete you should be able to use `ssh` to login to the remote system and see your file in your home directory.

~~~
[remote]$ ls
~~~
{: .bash}

~~~
...
fileToMove
...
~~~
{: .output}



## Grabbing files from the internet

To download files from the internet, 
the absolute best tool is `wget`.
The syntax is relatively straightforwards: `wget https://some/link/to/a/file.tar.gz`

> ## Downloading the Drosophila genome
> The *Drosophila melanogaster* reference genome is located at the following website:
> [http://metazoa.ensembl.org/Drosophila_melanogaster/Info/Index](http://metazoa.ensembl.org/Drosophila_melanogaster/Info/Index).
> Download it to the cluster with `wget`.
>
> Some additional details:
>
> * You want to go get the genome through the "Download DNA Sequence" link
> * We are interested in the `Drosophila_melanogaster.BDGP6.dna.toplevel.fa.gz` file.
{: .challenge}

> ## Working with compressed files, using unzip and gunzip
> 
> The file we just downloaded is gzipped (has the `.gz` 
> extension).
>You can uncompress it with `gunzip filename.gz`.
>
>File decompression reference:
>
>* **.tar.gz** - `tar -xzvf archive-name.tar.gz`
>* **.tar.bz2** - `tar -xjvf archive-name.tar.bz2`
>* **.zip** - `unzip archive-name.zip`
>* **.rar** - `unrar archive-name.rar`
>* **.7z** - `7z x archive-name.7z`
>
>However, sometimes we will want to compress files 
>ourselves to make file transfers easier.
>The larger the file, the longer it will take to 
>transfer. 
>Moreover, we can compress a whole bunch of little 
>files into one big file to make it easier
>on us (no one likes transferring 70000) little files!
>
>The two compression commands we'll probably want to 
>remember are the following:
>
>* Compress a single file with Gzip - `gzip filename`
>* Compress a lot of files/folders with Gzip - `tar -czvf archive-name.tar.gz folder1 file2 folder3 etc`
> 
{: .callout}




