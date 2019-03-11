---
title: "Using a cluster: Accessing software"
teaching: 20
exercises: 15
questions:
- "How do we load and unload software packages?"
objectives:
- "Understand how to load and use a software package."
keypoints:
- "Load software with `module load softwareName`"
- "The module system handles software versioning and package conflicts for you automatically."
- "You can edit your `.bashrc` file to automatically load a software package."
- "When using software on any HPC system, check the software documents for details on how to use it effectively."
---

On a high-performance computing system, no software is loaded by default.
If we want to use a software package, we will need to "load" it ourselves.

>When you want to use any software that is installed on OSC's clusters, first **_always_** check the software page
>at [osc.edu](https://www.osc.edu/resources/available_software)

Before we start using individual software packages, however, 
we should understand the reasoning behind this approach.
The two biggest factors are software incompatibilities and versioning.

Software incompatibility is a major headache for programmers.
Sometimes the presence (or absence) 
of a software package will break others that depend on it.
Two of the most famous examples are Python 2 and 3 and C compiler versions.
Python 3 famously provides a `python` command 
that conflicts with that provided by Python 2. 
Software compiled against a newer version of the C libraries 
and then used when they are not present will result in a nasty
`'GLIBCXX_3.4.20' not found` error, for instance. 

Software versioning is another common issue.
A team might depend on a certain package version for their research project - 
if the software version was to change (for instance, if a package was updated),
it might affect their results.
Having access to multiple software versions allow a set of researchers to take 
software version out of the equation if results are weird.

## Environment modules (Lmod)

Environment modules are the solution to these problems.
A module is a self-contained software package - 
it contains all of the files required to run a software packace 
and loads required dependencies.

To see available software modules, use `module avail`

```
module avail
```
{: .bash}
```
--------------------------- /usr/local/share/lmodfiles/MPI/intel/18.0/mvapich2/2.3 -----------------------------
   darshan/3.1.6    gromacs/2018.2    netcdf/4.6.1    omb/5.4.3         scalapack/2.0.2
   fftw3/3.3.8      hdf5/1.10.2       nwchem/6.8      parmetis/4.0.3    siesta-par/4.0.2
-------------------------------- /usr/local/share/lmodfiles/Compiler/intel/18.0 ---------------------------------
   R/3.5.0                   libjpeg-turbo/1.5.3    mvapich2/2.3b                netcdf-serial/4.3.3.1
   boost/1.67.0              metis/5.1.0            mvapich2/2.3rc1-gpu          netcdf-serial/4.6.1   (D)
   cxx17/7.3.0        (L)    mkl/2018.0.3           mvapich2/2.3rc1              openmpi/1.10.5
   hdf5-serial/1.8.17        mvapich2/2.2-debug     mvapich2/2.3rc2-gpu          openmpi/3.1.0-hpcx    (D)
   hdf5-serial/1.10.2 (D)    mvapich2/2.2-gpu       mvapich2/2.3rc2              siesta/4.0.2
   intelmpi/2018.0           mvapich2/2.2           mvapich2/2.3        (L,D)
   intelmpi/2018.3    (D)    mvapich2/2.3b-gpu      ncarg/6.5.0
---------------------------------------- /usr/local/share/lmodfiles/Core ----------------------------------------
   abaqus/6.14                   gnu/7.3.0                  (D)      qchem/5.1.1-openmp
   abaqus/2016                   gnuplot/5.2.2                       qchem/5.1.1             (D)
   abaqus/2017                   hadoop/3.0.0-alpha1                 qhull/2015.2
   abaqus/2018            (D)    hisat2/2.1.0                        relion2/2.0
   allinea/6.0.6                 homer/4.8                           remora/1.8.0
   allinea/7.0            (D)    hpctoolkit/5.3.2                    rna-seqc/1.1.8
   allinea/7.1                   htslib/1.6                          rstudio/1.0.136_server
   ansys/17.2                    hyperworks/13                       rstudio/1.1.380_server  (D)
   ansys/18.1                    hyperworks/2017.1          (D)      salmon/0.8.2
   ansys/19.1             (D)    ime/1.1                             salome/8.2.0
   arm-ddt/6.0.6                 intel/16.0.3                        sambamba/0.6.6
   arm-ddt/7.0                   intel/16.0.8                        samtools/1.3.1          (D)
   arm-ddt/7.1                   intel/17.0.2                        samtools/1.6
   arm-ddt/18.2.1         (D)    intel/17.0.5                        samtools/1.9
   arm-map/6.0.6                 intel/17.0.7                        schrodinger/15
   arm-map/7.0                   intel/18.0.0                        schrodinger/16
   arm-map/7.1                   intel/18.0.2                        schrodinger/2018.3      (D)
   arm-map/18.2.1         (D)    intel/18.0.3               (L,D)    singularity/current
   arm-pr/6.0.6                  java/1.7.0                          snpeff/4.2
   arm-pr/7.0                    java/1.8.0_131             (D)      spark/rdma-0.9.4

   D:        Default Module

Use "module spider" to find all possible modules.
Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".
```
{: .output}

## Loading and unloading software

To load a software module, use `module load`.
In this example we will use Python 3.

Intially, Python 3 is not loaded. 

```
which python3
```
{: .bash}
```
/usr/bin/which: no python3 in /usr/bin/which: no python3 in (/opt/mvapich2/intel/18.0/2.3/bin:/usr/local/gnu/7.3.0/bin:/opt/intel/itac/2018.3.022/bin:/opt/intel/advisor_2018/bin
64:/opt/intel/vtune_amplifier_2018/bin64:/opt/intel/inspector_2018/bin64:/opt/intel/compilers_and_libraries_2018.3.222/linux/bin/intel64:/opt/torque/bin:/usr/lib64/qt-3.3/bin:/opt/osc/bin:/opt/moab/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/opt/ibutils/bin:/opt/ddn/ime/bin:/opt/pup
petlabs/bin)
```
{: .output}

We can load the `python/3.5` command with `module load`.

```
module load python/3.5
which python3
```
{: .bash}
```
/usr/local/anaconda3/bin/python3
```
{: .output}

So what just happened?

To understand the output, first we need to understand the nature of the 
`$PATH` environment variable.
`$PATH` is a special ennvironment variable that controls where a UNIX system looks for software.
Specifically `$PATH` is a list of directories (separated by `:`)
that the OS searches through for a command before giving up and telling us it can't find it.
As with all environment variables we can print it out using `echo`.

```
echo $PATH
```
{: .bash}
```
/usr/local/anaconda3/bin:/opt/mvapich2/intel/18.0/2.3/bin:/usr/local/gnu/7.3.0/bin:/opt/intel/itac/2018.3.022/bin:/opt/intel/advisor_2018/bin64:/opt/intel/vtune_amplifier_2018/bin64:/opt/intel/inspector_2018/bin64:/opt/intel/compilers_and_libraries_2018.3.222/linux/bin/intel64:/opt/torque/bin:/usr/lib64/qt3.3/bin:/opt/osc/bin:/opt/moab/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/opt/ibutils/bin:/opt/ddn/ime/bin:/opt/puppetlab
s/bin
```
{: .output}

You'll notice a similarity to the output of the `which` command. 
In this case, there's only one difference:
the `/usr/local/anaconda3/bin` directory at the beginning.
When we ran `module load python/3.5.2`, 
it added this directory to the beginning of our `$PATH`.
Let's examine what's there:

```
ls /usr/local/anaconda3/bin
```
{: .bash}
```
2to3		  idle3    pip3.5    python3	       python3.5m-config  virtualenv
2to3-3.5	  idle3.5  pydoc3    python3.5	       python3-config	  wheel
easy_install	  pip	   pydoc3.5  python3.5-config  pyvenv
easy_install-3.5  pip3	   python    python3.5m        pyvenv-3.5
```
{: .output}

Taking this to it's conclusion, `module load` will add software to your `$PATH`.
It "loads" software.
A special note on this - 
depending on which version of the `module` program that is installed at your site,
`module load` will also load required software dependencies.
To demonstrate, let's use `module list`.
`module list` shows all loaded software modules.

```
module list
```
{: .bash}
```
Currently Loaded Modules:
  1) cxx17/7.3.0   2) intel/18.0.3   3) mvapich2/2.3   4) modules/au2018   5) python/3.5

  
```
{: .output}



```
module unload python/3.5
module list
```
{: .bash}
```
Currently Loaded Modules:
  1) cxx17/7.3.0   2) intel/18.0.3   3) mvapich2/2.3   4) modules/au2018
```
{: .output}

So using `module unload` "un-loads" a module along with it's dependencies.
If we wanted to unload everything at once, we could run `module purge` (unloads everything).


## Software versioning

So far, we've learned how to load and unload software packages.
This is very useful.
However, we have not yet addressed the issue of software versioning.
At some point or other, 
you will run into issues where only one particular version of some software will be suitable.
Perhaps a key bugfix only happened in a certain version, 
or version X broke compatibility with a file format you use.
In either of these example cases, 
it helps to be very specific about what software is loaded.

Let's examine the output of `module avail` more closely.

```
module avail
```
{: .bash}
```
---------------------------------------- /usr/local/share/lmodfiles/Core ----------------------------------------
   abaqus/6.14                   gnu/7.3.0                  (D)      qchem/5.1.1-openmp
   abaqus/2016                   gnuplot/5.2.2                       qchem/5.1.1             (D)
   abaqus/2017                   hadoop/3.0.0-alpha1                 qhull/2015.2
   abaqus/2018            (D)    hisat2/2.1.0                        relion2/2.0
   allinea/6.0.6                 homer/4.8                           remora/1.8.0
   allinea/7.0            (D)    hpctoolkit/5.3.2                    rna-seqc/1.1.8
   allinea/7.1                   htslib/1.6                          rstudio/1.0.136_server
   ansys/17.2                    hyperworks/13                       rstudio/1.1.380_server  (D)
   ansys/18.1                    hyperworks/2017.1          (D)      salmon/0.8.2
   ansys/19.1             (D)    ime/1.1                             salome/8.2.0
   arm-ddt/6.0.6                 intel/16.0.3                        sambamba/0.6.6
   arm-ddt/7.0                   intel/16.0.8                        samtools/1.3.1          (D)
   arm-ddt/7.1                   intel/17.0.2                        samtools/1.6
   arm-ddt/18.2.1         (D)    intel/17.0.5                        samtools/1.9
   arm-map/6.0.6                 intel/17.0.7                        schrodinger/15
   arm-map/7.0                   intel/18.0.0                        schrodinger/16
   arm-map/7.1                   intel/18.0.2                        schrodinger/2018.3      (D)
   arm-map/18.2.1         (D)    intel/18.0.3               (L,D)    singularity/current
   arm-pr/6.0.6                  java/1.7.0                          snpeff/4.2
   arm-pr/7.0                    java/1.8.0_131             (D)      spark/rdma-0.9.4
```
{: .output}

Software with multiple versions will be marked with a (D). The best way to be sure you understand how certain software is
used on our clusters is to look at the software page on our website. [https://www.osc.edu/resources/available_software](https://www.osc.edu/resources/available_software)

> ## Using software modules in scripts
>
> Create a job that is able to run `python3 --version`.
> Remember, no software is loaded by default!
> Running a job is just like logging on to the system 
> (you should not assume a module loaded on the login node is loaded on a compute node).
{: .challenge}

> ## Loading a module by default
> 
> Adding a set of `module load` commands to all of your scripts and
> having to manually load modules every time you log on can be tiresome.
> Fortunately, there is a way of specifying a set of "default modules"
> that always get loaded, regardless of whether or not you're logged on or running a job.
>
> Every user has two hidden files in their home directory: `.bashrc` and `.bash_profile`
> (you can see these files with `ls -la ~`).
> These scripts are run every time you log on or run a job.
> Adding a `module load` command to one of these shell scripts means that
> that module will always be loaded.
> Modify either your `.bashrc` or `.bash_profile` scripts to load a commonly used module like Python.
> Does your `python3 --version` job from before still need `module load` to run?
{: .challenge}

## Installing software of our own

>The following tutorial is from our HOWTO guide on our website. We have many more useful guides there, take 
>a look at [https://www.osc.edu/resources/getting_started/howto](https://www.osc.edu/resources/getting_started/howto)
>
{: .callout}

Most HPC clusters have a pretty large set of preinstalled software.
Nonetheless, it's unlikely that all of the software we'll need will be available.
Sooner or later, we'll need to install some software of our own. 

Though software installation differs from package to package,
the general process is the same:
download the software, read the installation instructions (important!),
install dependencies, compile, then start using our software.

### Getting Started
Before installing your software, you should first prepare a place for it to live. We recommend the following directory structure, which you should create in the top-level of your home directory:

```
    local
    |-- src
    |-- share
        `-- lmodfiles
```
{: .bash}

This structure is how OSC organizes the software we provide. Each directory serves a specific purpose:

| directory | description |
| --- | --- |
|local  |Gathers all the files related to your local installs into one directory, rather than cluttering your home directory. Applications will be installed into this directory with the format "appname/version". This allows you to easily store multiple versions of a particular software install if necessary.|
|local/src | Stores the installers -- generally source directories -- for your software. Also, stores the compressed archives ("tarballs") of your installers; useful if you want to reinstall later using different build options.|
|local/share/lmodfiles  |The standard place to store module files, which will allow you to dynamically add or remove locally installed applications from your environment.|

You can create this structure with one command.

NOTE: Ensure $HOME is the full path of your home directory. You can identify this from the command line with the command echo $HOME.

After navigating to where you want to create the directory structure, run:

```
    mkdir -p $HOME/local/src $HOME/local/share/lmodfiles
```
{: .bash}


### Installing Software
Now that you have your directory structure created, you can install your software. For demonstration purposes, we will install a local copy of Git.

First, we need to get the source code onto the HPC filesystem. The easiest thing to do is find a download link, copy it, and use the wget tool to download it on the HPC. We'll download this into $HOME/local/src:

```
    cd $HOME/local/src
    wget https://github.com/git/git/archive/v2.9.0.tar.gz
```
{: .bash}


Now extract the tar file:

```
    tar zxvf v2.9.0.tar.gz
```
{: .bash}

Next, we'll go into the source directory and build the program. Consult your application's documentation to determine how to install into `$HOME/local/"software_name"/"version"`. Replace "software_name" with the software's name and "version" with the version you are installing, as demonstrated below. In this case, we'll use the configure tool's --prefix option to specify the install location.

You'll also want to specify a few variables to help make your application more compatible with our systems. We recommend specifying that you wish to use the Intel compilers and that you want to link the Intel libraries statically. This will prevent you from having to have the Intel module loaded in order to use your program. To accomplish this, add `CC=icc CFLAGS=-static-intel` to the end of your invocation of configure. If your application does not use configure, you can generally still set these variables somewhere in its Makefile or build script.

Then, we can build Git using the following commands:

```
    cd git-2.9.0
    autoconf # this creates the configure file
    ./configure --prefix=$HOME/local/git/2.9.0 CC=icc CFLAGS=-static-intel
    make && make install
```
{: .bash}

We've successfully installed our first piece of software!

See the HOWTO for details on creating your own modules for locally installed software.
