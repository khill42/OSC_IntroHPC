---
title: "Introduction to HPC"
teaching: 10
exercises: 0
questions:
- "What is High Performance Computing?"
- "Why should I be using High Performance Computing for my research?"
- "Don't I need to know how to program to use High Performance Computing?"
objectives:
- "Understand what an HPC is."
- "Understand how HPC can improve your research efficiency."
- "Understand the 'barrier to entry' is lower than you'd think."
keypoints:
- "High Performance Computing (HPC) typically involves connecting remotely to a **cluster** of computers."
- "HPCs can be used to do work that would either be impossible or much slower in a Desktop environment."
- "Typical HPC workflows involve submitting \"jobs\" to a scheduler which queues/priortises the \"jobs\" of all users."
- "The standard method of interacting with HPC's is via a Linux-based Command Line Interface called \"The Shell\"."
---

### What is a High Performance Computation?

High Performance Computing, known commonly as HPC or HPRC, is the name given to the use of computers with capabilities beyond the scope of standard desktop computers. The computers that qualify as HPC systems are typically seen as being more powerful than other systems; 
usually because they have more central processing units (CPUs), CPUs that operate at higher speeds, more memory, more storage, and faster connections with other computer systems. HPC systems are used when the resources of more standard computers, such as most dektops and laptops, are not enough to provide results in a timely fashion, if at all.  

> ## A Cluster of Computers?
>
> Most frequently, HPC systems are an interconnected network or **cluster** or many CPU's.  Each CPU can perform many tasks simultaneously.  By distributing \"jobs\" across many CPU's, hundreds or thousands of tasks can be performed in parallel.
{: .callout}

### How do we interact with HPC's?

Working with HPC systems involves the use of a \"UNIX shell\" through a **command line interface** (CLI). A UNIX shell is a program which passes user instructions to other programs and returns results to the user or other programs. The user can pass the shell instructions interactively via typing them, or programatically by executing scripts. The most popular UNIX shell is **Bash**, the **B**ourne **A**gain **Sh**ell, which we will be using to interact with the HPC. As HPC users we need an understanding of basic UNIX commands, which will be the initial focus of this lesson.

Although users can work interactively with HPC systems, it is more common (and better practice) to perform most tasks via submitting \"jobs\". A job consists of commands which request HPC resources and specify a task to be completed. Jobs are prioritised and placed in a queue by a \"job scheduler\" before being executed.

### Why use an HPC?

HPC systems are designed specifically to assist researchers with analytically demanding tasks. Users can perform many small tasks simultaneously, such as projecting a single model onto datasets from different years. This is an example of "serial programming", where each task is entirely independent from the others. Alternatively, with the assistance of Message Passing Interfaces (**MPI's**), users can combine multiple CPU resources to perform a single task more efficiently. This is an example of "parallel programming", where each CPU is working on a portion of single task, before results are assembled in the correct order by an MPI. The benefits of using HPC systems for research often far outweigh the cost of learning to use a Shell and include:

* **Speed** Hundreds of high performance CPU's can perform many small jobs at once, or accelerate individually demanding tasks.
* **Volume** HPC's are typically backed by very large pools of shared storage, oftentimes at PetaByte scale.
* **Cost** Why pay for high performance analytical environment when one is already available to you for free?
* **Convenience** Keep your Desktop free to check e-mail, surf the web, and run Excel without crashing :-)


