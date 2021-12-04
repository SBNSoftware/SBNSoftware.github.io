---
layout: page
title: Installation instructions
---



NEW INSTRUCTIONS
====================================================

Note that we have a new wiki, and updated instructions, at
<https://sbnsoftware.github.io/sbndaq_wiki/Installation>.

-   **Table of contents**
-   [NEW INSTRUCTIONS]
-   [(Old) Installation instructions]
    -   [Summary Install Script]
    -   [How to update your development area when a new release is
        available]
-   [Installation on a remote server]



(Old) Installation instructions
================================================================================

This will be filled out in more detail with time, but for the moment
this should get one started:

1\. Login to the desired machine using your own account.\

    ssh user@sbnd-daq00.fnal.gov, icarus-gateway01.fnal.gov or sbnd-gateway01.fnal.gov

2\. Setup the common artdaq products area. For the DAB teststand, this
is currently:\

    source /daq/software/products/setup
    source /daq/software/products_dev/setup

3\. Setup the version of sbndaq we are based. To see a list of the
different available versions, use\

    ups list -aK+ sbndaq 

\
It\'s recommended you use the latest available version with
e19:prof:py2:s94 as the option. Then, to set up, use:\

    setup sbndaq v#_##_## -qe19:prof:py2:s94

\
Note, if you must, you can use the \'icarus\' or \'sbnd\' qualifiers.

If you just want to run, that\'s it!

But, if you need to build/install, then continue with setting up an MRB
area:

4\. Setup necessary environment variable and create the mrb area in a
new directory of your choosing:\

    setup mrb
    mkdir <your_working_area>
    cd <your_working_area>
    export MRB_PROJECT=sbndaq
    export my_sbndaq_version=$(echo  $SETUP_SBNDAQ |cut -d " " -f 2)
    export my_sbndaq_quals=$(echo  $SETUP_SBNDAQ |cut -d " " -f 8)
    echo sbndaq version: $my_sbndaq_version
    echo sbndaq qualifiers: $my_sbndaq_quals
    mrb newDev  -q $my_sbndaq_quals -v $my_sbndaq_version
    source localProducts_*/setup

5\. Pull down and build the necessary repositories using mrb like so:\

    cd $MRB_SOURCE
    mrb g -d <repo_name_with_underscore> ssh://p-sbndaq@cdcvs.fnal.gov/cvs/projects/<repo-name-with-dashes>

\
**Note**: This will pull from the HEAD of the develop branch and any
changes that may have been pushed since the last tag (v\#\_\#\#\_\#\#)
was created. Alternatively, if you want to build the tagged, working
version that was set up in the previous steps, directly:\

    mrb g -t <desired tag version *e.g.* v0_05_01> -d <repo_name_with_underscore> ssh://p-sbndaq@cdcvs.fnal.gov/cvs/projects/<repo-name-with-dashes>.git

\
If you\'re not sure what tags are needed for the various repos you can
do a quick check:\

    ups active | grep <repo_name_with_underscore>

\
Repository names right now are:\

    sbndaq-artdaq-core
    sbndaq-artdaq
    sbndaq

\
To build, do\

    cd $MRB_BUILDDIR
    mrbsetenv
    mrb i -j8
    mrbslp

6\. To rebuild, you will often only need to do:\

    cd $MRB_BUILDDIR
    make -j8 install

But, if you add another repository to your srcs area, it\'s usually best
to rebuild everything:\

    cd $MRB_BUILDDIR
    mrb z
    mrbsetenv
    mrb i -j32
    mrbslp

7\. There\'s often a bug to put put things into the write-access
repository. In the appropriate srcs areas, you can do these:\

     
    git remote set-url origin ssh://p-sbndaq@cdcvs.fnal.gov/cvs/projects/sbndaq 
    git remote set-url origin ssh://p-sbndaq@cdcvs.fnal.gov/cvs/projects/sbndaq-artdaq 
    git remote set-url origin ssh://p-sbndaq@cdcvs.fnal.gov/cvs/projects/sbndaq-artdaq-core 



Summary Install Script
----------------------------------------------------------------

Put the commands that never change into your bash login script

    source /daq/software/products/setup
    setup mrb
    export MRB_PROJECT=sbndaq

To checkout and build **sbndaq** and **sbndaq-artdaq** (most common
situation) source the script below from your **work** directory


    setup sbndaq v0_06_00 -q e19:prof:py2:s94
    export my_sbndaq_version=$(echo  $SETUP_SBNDAQ |cut -d " " -f 2)
    export my_sbndaq_quals=$(echo  $SETUP_SBNDAQ |cut -d " " -f 8)
    echo sbndaq version: $my_sbndaq_version
    echo sbndaq qualifiers: $my_sbndaq_quals
    mrb newDev  -q $my_sbndaq_quals -v $my_sbndaq_version
    source localProducts_*/setup

    mrb g -d sbndaq ssh://p-sbndaq@cdcvs.fnal.gov/cvs/projects/sbndaq
    mrb g -d sbndaq_artdaq ssh://p-sbndaq@cdcvs.fnal.gov/cvs/projects/sbndaq-artdaq

    cd build*
    mrbsetenv
    mrb i -j8 |& tee make.log
    mrbslp



How to update your development area when a new release is available
----------------------------------------------------------------------------------------------------------------------------------------------------------

Set up the common products:\

    source /daq/software/products/setup
    source /daq/software/products_dev/setup

Set up the sbndaq version corresponding to the new release:\

    setup sbndaq {version} -q {qualifiers}

Create a new `localProducts` directory:\

    setup mrb
    export MRB_PROJECT=sbndaq
    mrb newDev -p

It is usually good to delete the outdated `localProducts` directory.

Update your git repositories with the latest release(s).

Then, make a clean build:\

    cd $MRB_BUILDDIR
    mrb z
    mrbsetenv
    mrb i -j8



Installation on a remote server
==================================================================================

In order to install sbndaq on a server which doesn\'t have `software`
directory (e.g. outside FNAL), one first needs to copy the software with
following commands:\

    rsync -arvtzl --del -e 'ssh -o "ProxyCommand ssh -A USERNAME@icarusgpvm01.fnal.gov -W %h:%p"' USERNAME@sbnd-daq32.fnal.gov:/software/products/ /software/products/.  --delete-excluded --exclude 'Xilinx*' --exclude 'Quartus'  --exclude="*.tar.bz2" --exclude "products/" 
    rsync -arvtzl --del -e 'ssh -o "ProxyCommand ssh -A USERNAME@icarusgpvm01.fnal.gov -W %h:%p"' USERNAME@sbnd-daq32.fnal.gov:/software/products_dev/ /software/products_dev/.  

\
Replace USERNAME with your FNAL login. SBND users may need to replace
icarusgpvm01 with another VM.\
As of Jul 2020 `/software` occupies 202 GB. The `--exclude` options help
to omit tens of GB of data which doesn\'t need to be synchronised (in
most cases).
