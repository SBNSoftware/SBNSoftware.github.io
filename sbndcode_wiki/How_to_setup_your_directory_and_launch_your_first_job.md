---
layout: page
title: How to setup your directory and launch your first job
toc: true
---



How to setup your directory and launch your first job
==========================================================

In order to run you first LArSoft SBND job, you will need to execute the
following steps. Some explanation is included, but is not yet at the
level to be a definitive guide.

You have here two main options:

1.  you want just to run existing software: this is a [production setup]
2.  you want to change existing code or add your own, and run it: this
    is a [development setup]

Both start with a [preliminary set up], and then diverge.



Set up the general SBND environment 
------------------------------------------------------------------------------------------

The most important task this step performs is to tell UPS where to find
the programs you need (like UPS itself, git, MRB, ROOT, and LArSoft!).

Two options:

1.  using [CVMFS](Computing_resources.html#CVMFS)

        source /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh

2.  using a local UPS database `/path/to/products` filled with
    [pullProducts](Using_LArSoft_on_a_local_machine.html#Downloading-a-binary-distribution-with-pullProducts):

        source /path/to/products/setup
        export MRB_PROJECT=larsoft
        setup mrb

In doubt, go for CVMFS, as it is the one that works more widely and
therefore a good habit(TM).



Set up for running existing code (*production* like) 
------------------------------------------------------------------------------------------------------------------------

After the [general setup above], you just need
to set up the version of SBND code you need.

There are different versions of LArSoft that you can set up against, and
we have [a list of them](Releases/List_of_SBND_code_releases.html).  
Once you pick your version and qualifiers, you set up both with a single
command:

    setup sbndcode v06_53_00 -q e14:prof

If this list is not up to date or you want to know what qualifiers there
are run:

    ups list -aK+ sbndcode 

The qualifiers are a list of strings that are separated by colons, and
can be in any order. We have:

optimisation level *(mandatory)*

`prof`

optimisations turned all the way on, with stack pointers left to
facilitate a bit of debugging

`debug`

optimisations turned off, `NDEBUG` not set, assertions are active: much
slower, but cooperates well with debuggers

compiler *(mandatory)*

`e10`, `e14` etc.

which compiler was used; we usually have no choice

> Don\'t know/care which to pick? as a special case, you can run e.g.
> `setup sbndcode v06_68_00`, without qualifiers (this will pick the
> most optimised build available, with the recommended compiler;
> supported since `v06_63_00`).



Set up for changing or adding code (*development* like) 
------------------------------------------------------------------------------------------------------------------------------

When you need to change existing code or writing new one, you need to
have a development area and an environment (that is, an interactive
shell) with a [development environment].  
While the development environment allows running of code on almost all
the cases, there are some corner cases where that might fail. For that
reason, or to keep the development environment clean from additional
setup required when running, setting up a [run-only environment] in a separate interactive
shell is a good idea (as it is to learn to [use a terminal multiplexer](Interactive_GPVM_sessions_with_terminal_multiplexers.html),
especially when developing on a remote server).

If you will be developing code and intent to add it to the repo, you
need to be listed as a developer here on the Redmine page. Look at the
**Overview** tab above and see if your name is listed under *Developer*.
If you\'re not there, ask someone under *Manager* to add you.



### Development setup 

First you need to go through the [general setup above].  
Then, the first three steps create your working area for the first time.
To reuse that area later on (that is, after you log out and in again),
only the *per-login setup* part is needed.  
We assume you work in a [SBND GPVM](Computing_resources.html#GPVM), which is painfully
slow but safe: `ssh ${USER}@sbndgpvm01.fnal.gov`.

1.  first time only (or, new working area) setup:
    1.  choose the latest [SBND code release](Releases/List_of_SBND_code_releases.html)

    2.  go to your user directory in
        [CephFS](Computing_resources.html#Local-storage-cephfs-disks),
        `/exp/sbnd/app` - don\'t have one? feel free to create it! And
        create a directory for your new LArSoft release.

            cd /exp/sbnd/app/users/${USER}
            mkdir larsoft_VERSION # or whatever path you like
            cd larsoft_VERSION

    3.  create a new larsoft development area:

            mrb newDev -v VERSION -q QUAL

        
        The qualifiers are the same described in the [previous
        section](The_SBND_Guide_to_using_LArSoft.html#Set-up-for-running-existing-code-production-like)

2.  this step belongs to the **per-login setup**: tell MRB that you will
    be running from this directory (the output of `mrb newDev` tells you
    exactly the command to run):

        source localProducts_larsoft_VERSION_QUAL/setup

    
    (note that this `QUAL` is with underscores in stead of colons: e.g.,
    `e14_prof`)

3.  go to the `srcs` directory and pull down your own copy of the
    `sbndcode` repository:

        cd "$MRB_SOURCE" 
        mrb gitCheckout sbndcode

    
    See the important note below!! Particularly check to see if you
    haven been granted write access.

4.  build the code in your area:

        mrbsetenv
        mrb install -j4

5.  you are now ready to run your first job. Do that in a data area
    (create your directory as above). This will generate your first 10
    muons and simulate the detector response to them:

        mkdir -p "/exp/sbnd/data/users/${USER}/larsoft_VERSION" 
        cd "/exp/sbnd/data/users/${USER}/larsoft_VERSION" 
        lar -c prodsingle_sbnd.fcl -n 10

> **Important note**: `mrb gitCheckout` (`mrb g` in short) prepares
> **the development version** of every repository, regardless of which
> version of LArSoft you have setup! 
> This can cause nasty version dependency problems, so if you want to
> pull other LArSoft packages (like `larsim`, `larreco` etc... ), it is
> prudent to add a `-t LARSOFT_SUITE-VERSION` to your `mrb g` command,
> where VERSION is the LArSoft version `sbndcode` current development
> branch (`develop`) builds against (i.e. mrb g -t v06_34_00 larsim ).
> You can find dependancy for the LArsoft version in the [LArSoft
> release list](LArSoft_release_list.html) page.  
> Or you can do that immediately after, going into the repository
> directory and running `git checkout LARSOFT_SUITE-VERSION`.

> **Write access to the repo note**: go to the repository directory and
> type `git remote -v` if the url doesn\'t start with `ssh:` you won\'t
> be able to push your code. Check if you\'re listed as developer, and
> change the remote with
> `git remote set-url origin  ssh://p-sbncode@cdcvs.fnal.gov/cvs/projects/sbncode`

While this set of instructions will bring you to the muons, it\'s a good
idea to design a strategy before you run your second job:

-   where do you keep the code?
-   where do you run?
-   how do you set up the area for developing? (write your own setup
    script)
-   how do you set up the area for running your code? (write your own
    setup script)
-   do you use the same shell for compiling and for running? (it\'s in
    fact a good idea to have two separate shells and two separate
    directories)

There is a big jump from \"making it work\" to \"making it work well\".

A better explanation than this was given in the *art*/LArSoft course:
it\'s a good idea to go through [that material](Instructions_for_Each_Session.html#Friday) (but
keep in mind that names of packages, setup scripts and versions may need
to be replaced by SBND specific ones).



### Run-only setup 

While the development environment set up above is good for almost
everything, there are quirks that may be hard to understand.  
A setup exclusively for running *with the code you are developing* is as
follows:

1.  setup the general SBND environment [in whatever way you did
    before]:

        source /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh

2.  tell UPS to pick and prefer the data products from your development
    area in `/exp/sbnd/app/users`:

        source /exp/sbnd/app/users/${USER}/larsoft_VERSION/localProducts_larsoft_VERSION_QUAL/setup

3.  set up SBND code (and all the highest level UPS products you need in
    order to run):

        setup sbndcode v06_53_00 -q e14:prof

You are now ready to run your job. You can move to your run directory
and run jobs.

> To make sure the setup is correct, run `ups active` and verify that
> the repositories from your development area have actually been picked
> up, e.g.:
>
>     ups active | grep localProducts_larsoft
