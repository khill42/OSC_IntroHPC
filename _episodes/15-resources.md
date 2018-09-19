---
title: "Using a cluster: Using resources effectively"
teaching: 15
exercises: 30
questions:
- "How do we monitor our jobs?"
- "How can I get my jobs scheduled more easily?" 
objectives:
- "Understand how to look up job statistics and profile code."
- "Understand job size implications."
- "Be a good person and be nice to other users."
keypoints:
- "The smaller your job, the faster it will schedule."
- "Don't run stuff on the login node."
- "Again, don't run stuff on the login node."
- "Don't be a bad person and run stuff on the login node."
---

We now know virtually everything we need to know about getting stuff on a cluster.
We can log on, submit different types of jobs, use preinstalled software, 
and install and use software of our own.
What we need to do now is use the systems effectively.

## Estimating required resources using the scheduler

Although we covered requesting resources from the scheduler earlier,
how do we know how much and what type of resources we will need in the first place?

Answer: we don't. 
Not until we've tried it ourselves at least once.
We'll need to benchmark our job and experiment with it before
we know how much it needs in the way of resources.

The most effective way of figuring out how much resources a job needs is to submit a test job,
and then ask the scheduler how many resources it used.
A good rule of thumb is to ask the scheduler for more time and memory than your job can use.
This value is typically two to three times what you think your job will need.

> ## Benchmarking `bowtie2-build`
> Create a job that runs the following command 
> in the same directory as our *Drosophila* reference genome
> from earlier.
> 
> ```
> bowtie2-build Drosophila_melanogaster.BDGP6.dna.toplevel.fa dmel-index
> ```
> {: .bash}
> 
> The `bowtie2-build` command is provided by the `bowtie2` module.
> As a reference, this command could use several gigabytes of memory and up to an hour of compute time, 
> but only 1 cpu in any scenario.
> 
> You'll need to figure out a good amount of resources to ask for for this first "test run".
> You might also want to have the scheduler email you to tell you when the job is done.
{: .challenge}

Once the job completes, we can look at the logfile for a statement of resources used. It will look like this

```
-----------------------
Resources requested:
nodes=2:ppn=28
-----------------------
Resources used:
cput=125:18:32
walltime=02:14:32
mem=34.824GB
vmem=77.969GB
-----------------------
Resource units charged (estimate):
12.556 RUs
-----------------------
```
{: .bash}
```


* **Resources Requested** - What did you request?
* **cput** - What is the total CPU time used?
* **Walltime** - How long did the job take?
* **Memory** - Amount of RAM used.
* **Virtual Memory** - Amount of total temporary memory used.
* **Resource Units** - RUs charged against your project for this job.



## Playing nice in the sandbox

You now have everything you need to run jobs, transfer files, use/install software,
and monitor how many resources your jobs are using.

So here are a couple final words to live by:

* Don't run jobs on the login node, though quick tests are generally fine. 
  A "quick test" is generally anything that uses less than 10GB of memory, 4 CPUs, and 15 minutes of time.
  Remember, the login node is to be shared with other users.

* If someone is being inappropriate and using the login node to run all of their stuff, 
  message an administrator to kill their stuff.

* Compress files before transferring to save file transfer times with large datasets.

* Use a VCS system like git to keep track of your code. Though most systems have some form
  of backup/archival system, you shouldn't rely on it for something as key as your research code.
  The best backup system is one you manage yourself.

* Before submitting a run of jobs, submit one as a test first to make sure everything works.

* The less resources you ask for, the faster your jobs will find a slot in which to run.
  Lots of small jobs generally beat a couple big jobs.

* You can generally install software yourself, but if you want a shared installation of some kind,
  it might be a good idea to message an administrator.

* Always use the default compilers if possible. Newer compilers are great, but older stuff generally
  means that your software will still work, even if a newer compiler is loaded.

