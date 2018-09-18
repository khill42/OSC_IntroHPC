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

You should be logged into OnDemand, we will open a terminal window from the Dashboard. Use the Clusters pulldown menu
and choose "Owens Shell Access".

## Where are we? 

Very often, many users are tempted to think of a high-performance computing installation as one giant, magical machine.
Sometimes, people even assume that the machine they've logged onto is the entire computing cluster.
So what's really happening? What machine have we logged on to?
The name of the current computer we are logged onto can be checked with the `hostname` command.


```
hostname
```
{: .bash}
```
owens-login04.hpc.osc.edu
```
{: .output}

Clusters have different types of machines customized for different types of tasks.
In this case, we are on a login node.
A login node serves as a gateway to the cluster and serves as a single point of access.
As a gateway, it is well suited for uploading and downloading files, setting up software, and running quick tests.
It should never be used for doing actual work.

The real work on a cluster gets done by the "worker" nodes.
Worker nodes come in many shapes and sizes, but generally are dedicated to doing all of the heavy lifting that needs doing. 
All interaction with the worker nodes is handled by a specialized piece of software called a scheduler. We use the Moab scheduler.
We can view all of the worker nodes with the `pbsnodes -a` command. But this would be overwhelming since we have over 800 compute nodes, so we'll abbreviate it instead.

```
pbsnodes -a | tail -n 50
```
{: .bash}
```
o0464
     state = job-exclusive
     power_state = Running
     np = 28
     properties = broadwell-ep,c6320,ib-i1l1s18,ib-i1,eth-owens-rack07h1,owens-rack07-c08,owens-rack07,owens,pfsdir,ime
     ntype = cluster
     jobs = 0-27/3816217.owens-batch.ten.osc.edu
     status = opsys=linux,uname=Linux o0464.ten.osc.edu 3.10.0-693.37.4.el7.x86_64 #1 SMP Fri Aug 10 12:34:55 EDT 2018 x86_64,sessions=2618 147256,nsessions=2,nusers=2,idletime=44307,totmem=182247896kb
,availmem=167945740kb,physmem=131916252kb,ncpus=28,loadave=23.14,gres=,netload=1368471174094,size=899955648kb:909207804kb,state=free,varattr= ,cpuclock=Fixed,macaddr=7c:d3:0a:b1:66:ea,version=6.1.2,rec
time=1537282339,jobs=3816217.owens-batch.ten.osc.edu
     mom_service_port = 15002
     mom_manager_port = 15003
     total_sockets = 2
     total_numa_nodes = 2
     total_cores = 28
     total_threads = 28
     dedicated_sockets = 0
     dedicated_numa_nodes = 0
     dedicated_cores = 0
     dedicated_threads = 28


```
{: .output}

There are also specialized machines used for managing disk storage, user authentication, 
and other infrastructure-related tasks. 
Although we do not interact with these directly, 
but these enable a number of key features like ensuring our user account and files are available throughout the cluster.
This is an important point to remember: 
files saved on one node (computer) are available everywhere on the cluster!

![Structure of Cluster](../files/cluster_login.png)
