---
title: "Using a cluster: Introduction"
teaching: 15
exercises: 10
questions:
- "What is a cluster?"
- "How does a cluster work?"
- "How do I log on to a cluster?"
objectives:
- "Connect to a cluster."
- "Understand the general cluster architecture."
keypoints:
- "A cluster is a set of networked machines."
- "Clusters typically provide a login node and a set of worker nodes."
- "Files saved on one node are available everywhere."
---

The words "cloud", "cluster", and "high-performance computing" get thrown around a lot.
So what do they mean exactly?
And more importantly, how do we use them for our work?

The "cloud" is a generic term commonly used to refer to remote computing resources.
Cloud can refer to webservers, remote storage, API endpoints, and as well as more traditional "raw compute" resources. 
A cluster on the other hand, is a term used to describe a network of compters.
Machines in a cluster typically share a common purpose, 
and are used to accomplish tasks that might otherwise be too substantial for any one machine. 

![The cloud is made of Linux](../files/linux-cloud.jpg)

## High performance computing

A high-performance computing cluster is a set of machines that have been 
designed to handle tasks that normal computers can't handle.
This doesn't always mean simply having super fast processors. 
High-performance computing covers a lot of use cases.
Here are a couple of use cases where high-performance computing becomes extremely useful:

* You need access to large numbers of CPUs.
* You need to run a large number of jobs.
* Your jobs are running out of memory.
* Perhaps you need to store tons and tons of data.
* You require an exceptionally high-bandwidth internet connection for data transfer.
* You need a safe archival site for your data.
* Your compute jobs require specialized GPU or FPGA hardware.
* Maybe your jobs just take a long time to run.

Chances are, you've run into one of these situations before.
Fortunately, high-performance computing installations exist to solve these types of problems.

With all of this in mind, let's connect to a cluster (if you haven't done so already!). 
For these examples, we will connect to Graham - a high-performance cluster located at the University of Waterloo.
Although it's unlikely that every system will be exactly like Graham, 
it's a very good example of what you can expect from a supercomputing installation.
To connect to our example computer, we will use SSH. 

## Logging onto the cluster

SSH allows us to connect to UNIX computers remotely, and use them as if they were our own.
The general syntax of the connection command follows the format `ssh yourUsername@some.computer.address`
Let's attempt to connect to the cluster now:
```
ssh yourUsername@graham.computecanada.ca
```
{: .bash}

```{.output}
The authenticity of host 'graham.computecanada.ca (199.241.166.2)' can't be established.
ECDSA key fingerprint is SHA256:JRj286Pkqh6aeO5zx1QUkS8un5fpcapmezusceSGhok.
ECDSA key fingerprint is MD5:99:59:db:b1:3f:18:d0:2c:49:4e:c2:74:86:ac:f7:c6.
Are you sure you want to continue connecting (yes/no)?  # type "yes"!
Warning: Permanently added the ECDSA host key for IP address '199.241.166.2' to the list of known hosts.
yourUsername@graham.computecanada.ca's password:  # no text appears as you enter your password
Last login: Wed Jun 28 16:16:20 2017 from s2.n59.queensu.ca

Welcome to the ComputeCanada/SHARCNET cluster Graham.
```

If you've connected successfully, you should see a prompt like the one below. 
This prompt is informative, and lets you grasp certain information at a glance:
in this case `[yourUsername@computerName workingDirectory]$`.

```{.output}
[yourUsername@gra-login1 ~]$
```

## Where are we? 

Very often, many users are tempted to think of a high-performance computing installation as one giant, magical machine.
Sometimes, people even assume that the machine they've logged onto is the entire computing cluster.
So what's really happening? What machine have we logged on to?
The name of the current computer we are logged onto can be checked with the `hostname` command.
(Clever users will notice that the current hostname is also part of our prompt!)

```
hostname
```
{: .bash}
```
gra-login3
```
{: .output}

Clusters have different types of machines customized for different types of tasks.
In this case, we are on a login node.
A login node serves as a gateway to the cluster and serves as a single point of access.
As a gateway, it is well suited for uploading and downloading files, setting up software, and running quick tests.
It should never be used for doing actual work.

The real work on a cluster gets done by the "worker" nodes.
Worker nodes come in many shapes and sizes, but generally are dedicated to doing all of the heavy lifting that needs doing. 
All interaction with the worker nodes is handled by a specialized piece of software called a scheduler. For Awoonga (the QRIS HPC) you can find that information [HERE](https://www.qriscloud.org.au/support/qriscloud-documentation/92-awoonga-user-guide#technical_overview) or we can find this out directly by viewing the worker nodes.
We can view all of the worker nodes with the `pbsnodes -a` command.

```
pbsnodes -a
```
{: .bash}
```
aw133
     Mom = aw133.local
     ntype = PBS
     state = free
     pcpus = 24
     jobs = 25224.awongmgmr1/0, 25224.awongmgmr1/1, 25224.awongmgmr1/2, 25224.awongmgmr1/3, 25224.awongmgmr1/4, 25224.awongmgmr1/5, 25224.awongmgmr1/6, 25224.awongmgmr1/7, 25224.awongmgmr1/8, 25224.awongmgmr1/9, 25224.awongmgmr1/10, 25224.awongmgmr1/11, 25224.awongmgmr1/12, 25224.awongmgmr1/13, 25224.awongmgmr1/14, 25224.awongmgmr1/15, 25224.awongmgmr1/16, 25224.awongmgmr1/17, 25224.awongmgmr1/18, 25224.awongmgmr1/19
     resources_available.arch = linux
     resources_available.host = aw133
     resources_available.intel = True
     resources_available.mem = 264568300kb
     resources_available.ncpus = 24
     resources_available.vnode = aw133
     resources_assigned.accelerator_memory = 0kb
     resources_assigned.mem = 115343360kb
     resources_assigned.naccelerators = 0
     resources_assigned.ncpus = 20
     resources_assigned.vmem = 0kb
     comment = Eplg: 25216.awongmgmr1 Exit_status=1 at 20180110 04:56"
     resv_enable = True
     sharing = default_shared
     license = l

aw134
     Mom = aw134.local
     ntype = PBS
     state = job-busy,busy
     pcpus = 24
     jobs = 25235.awongmgmr1/0, 25235.awongmgmr1/1, 25235.awongmgmr1/2, 25235.awongmgmr1/3, 25235.awongmgmr1/4, 25235.awongmgmr1/5, 25235.awongmgmr1/6, 25235.awongmgmr1/7, 25236.awongmgmr1/8, 25236.awongmgmr1/9, 25236.awongmgmr1/10, 25236.awongmgmr1/11, 25236.awongmgmr1/12, 25236.awongmgmr1/13, 25236.awongmgmr1/14, 25236.awongmgmr1/15, 25237.awongmgmr1/16, 25237.awongmgmr1/17, 25237.awongmgmr1/18, 25237.awongmgmr1/19, 25237.awongmgmr1/20, 25237.awongmgmr1/21, 25237.awongmgmr1/22, 25237.awongmgmr1/23
     resources_available.arch = linux
     resources_available.host = aw134
     resources_available.intel = True
     resources_available.mem = 264568300kb
     resources_available.ncpus = 24
     resources_available.vnode = aw134
     resources_assigned.accelerator_memory = 0kb
     resources_assigned.mem = 25165824kb
     resources_assigned.naccelerators = 0
     resources_assigned.ncpus = 24
     resources_assigned.vmem = 0kb
     comment = Eplg: 25204.awongmgmr1 Exit_status=1 at 20180110 03:02"
     resv_enable = True
     sharing = default_shared
     license = l

```
{: .output}

There are also specialized machines used for managing disk storage, user authentication, 
and other infrastructure-related tasks. 
Although we do not interact with these directly, 
but these enable a number of key features like ensuring our user account and files are available throughout the cluster.
This is an important point to remember: 
files saved on one node (computer) are available everywhere on the cluster!
