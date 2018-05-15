---
title: "Connect to the HPC"
teaching: 10
exercises: 5
questions:
- "How do I connect to an HPC system?"
objectives:
- "Be able to connect to a remote HPC system"

keypoints:
- "We connect to remote servers, like HPC's, using the Terminal"
- "SSH is a secure protocl for connecting to remote servers"
- "To connect to a server, you need it's address, an open port, and your user ID"
---

## Opening a Terminal

Connecting to an HPC system is most often done with a program known as "SSH" (**S**ecure **SH**ell) which is accessed through a Terminal. Linux and Mac users will find a Terminal program already installed on their computers.  Windows PC users will need to install a Terminal emulator, I suggest using PuTTY. If you haven't done so, please download the appropriate version for your [32bit](https://the.earth.li/~sgtatham/putty/latest/w32/putty.exe) or [64bit](https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe) OS.

> ## 32 bit or 64 bit OS?
> Visit this [website](https://support.wdc.com/knowledgebase/answer.aspx?ID=9405) for instructions on determining if your Windows 7,8 or 10 is 32 or 64 bit.
{: .callout}

## Connecting with SSH

The SSH program needs atleast one parameter to connect to a remote server:

* **Server Address** The web address of the server to connect to

Additional parameters may also be necessary:

* **Port Number** The specific port used to connect to the server
* **User ID** Your user ID on the HPC system  

<span style="color:white">blankline</span>
   
> ## What's my User Name?
> Your user name is your JC number.  Wherever you see \"jcXXYYYY\", be sure to replace it with your JC number.
{: .callout}

## Basic SSH Connection

Open your terminal, and input the following command.

~~~
ssh jcXXYYYY@zodiac.hpc.jcu.edu.au -p 8822
~~~
{: .bash}

If you've never connected to this particular server before you'll encounter a message similar to this:

~~~
The authenticity of host 'zodiac.hpc.jcu.edu.au (137.219.23.90)' can't be established.
RSA key fingerprint is 2a:b6:f6:8d:9d:c2:f8:2b:8c:c5:03:06:a0:f8:59:12.
Are you sure you want to continue connecting (yes/no)?
~~~
{: .bash}

This is your computer warning you that you're about to connect to another computer, type \"yes\" to proceed.  This will add the HPC to your \"known hosts\", and you shouldn't see the message again the future.

~~~
Warning: Permanently added 'zodiac.hpc.jcu.edu.au,137.219.23.90' (RSA) to the list of known hosts.
~~~~
{: .bash}

You should now be prompted to input the password which corresponds to your JC number.  Type it in carefully (no characters will appear on the screen), then press ENTER.

~~~
jcXXYYYY@zodiac.hpc.jcu.edu.au's password: 
~~~
{: .bash}

If you entered your password appropriately, congratulations, you're now connected to the HPC!  

<span style="color:white">blankline</span>

> ## The Command Prompt
> The command prompt is the symbol or series of characters which precedes each shell command, and lets the user know the shell is ready to receive commands.  For example, when you initially login to the HPC you command prompt should resemble `-bash-4.1`. If your command prompt changes to `>`, the shell is expecting further input. Use the key-binding CTRL+C to escape shell commands, returning your prompt from `>` to `-bash-4.1`.  
>
> Let's all change our command prompts to something more useful, input the command `PS1='\W\n $ '`. Our command prompt is now our current working directory followed by a \"$\".
{: .callout}

## Connecting with a "Key"

That was pretty awesome, but I really disdain having to type my password in all the time.  There exists an alternative method of authentication for remote servers known as "key-pairs".  Using this method, we can **securely** connect to other computers without explicitly providing our user ID and password every time.  Without going into a great deal of detail, key-pairs function much like a traditional lock & key.

### Generating a Key Pair

These commands should be run on your Terminal, not the HPC!  Let's start by using the `ssh-keygen` command to make our key pair.  But first, let's make sure we're in the right directory.

Now let's create our keys using the `ssh-keygen` command:

~~~
ssh-keygen -t rsa -b 1024 -f ~/.ssh/HPC
~~~
{: .bash}

You'll now be prompted to input a password for your key, leave it blank by pressing ENTER.

~~~
ssh-keygen -t rsa -b 1024 -f ~/.ssh/HPC
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase): 
~~~
{: .bash}

Confirm your password as blank by pressing ENTER again

~~~
ssh-keygen -t rsa -b 1024 -f ~/.ssh/HPC
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
~~~
{: .bash}

You've now created a pair of keys!  The private key will be called HPC, the public key will be called HPC.pub. They should be located in your .ssh directory.

~~~
ssh-keygen -t rsa -b 1024 -f ~/.ssh/HPC
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in HPC.
Your public key has been saved in HPC.pub.
The key fingerprint is:
SHA256:ZEhLX2vWQukEMaxFJCG+tygeBewru3vRnTZo5f3iN+4 jc152199@C02SY00TGTDX
The key's randomart image is:
+---[RSA 1024]----+
|    . ==*oo.     |
| . . + =o+oo     |
|  o . oo+o= .    |
| . . .oo o..     |
|  ..o=.oS        |
|  .o+o*..        |
|. +o.... .       |
| +.o    . +      |
|++.    ..=E.     |
+----[SHA256]-----+
~~~
{: .bash}

### Move Your Key to the HPC

In order to use your keys to connect to the HPC, you'll need to first place it in a special file in your HPC home account called \"authorized_keys\". The easiest way to do this is simply with copy and paste.  Locate the **public** key with your GUI finder, open it with a text editor, and copy the entire contents. Return now to your Terminal which is logged-in to the HPC and input the following command. 

~~~
echo "[Paste Contents of Key Here]" >> ~/.ssh/authorized_keys
~~~
{: .bash}

We've succesfully (and securely) moved our public key to the HPC, now let's add it to the 'authorized_keys' file.  

Once this is done, logout of the HPC.  Then in your computer's Terminal enter the following command:

~~~
ssh jcXXYYYY@zodiac.hpc.jcu.edu.au -i ~/.ssh/HPC
~~~
{: .bash}

The `-i` flag tells SSH to use our key to login, and no password is needed.

For an even smoother connecting experience, open a text editor, create a blank file called 'config' in your .ssh directory.  Once you've done this, type the following parameters into your config file:

~~~
Host hpc
	HostName zodiac.hpc.jcu.edu.au
	User jcXXYYYY
	Port 8822
	IdentityFile ~/.ssh/HPC
~~~
{: .bash}

Now you can connect to the HPC by simply opening your Terminal and typing the command:
~~~
ssh hpc
~~~
{: .bash}







