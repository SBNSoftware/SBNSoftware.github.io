---
lang: en
title: How to launch grid jobs
---



How to launch grid jobs
==================================================================

SBND now has its
[VO](Computing_resources.html#Submitting-jobs-Virtual-Organisation)
which is a part of the Fermilab VOMS and allows us to run on the
[FermiGrid and Open Science
Grid](Computing_resources.html#Submitting-jobs-grid-resources).

Launching jobs is done using the `jobsub_client` package:\
<https://cdcvs.fnal.gov/redmine/projects/jobsub/wiki/Using_the_Client>

but a quick way to launch your job is the following:

1.  make sure you create your user directory on the
    [dCache](Computing_resources.html#World-visible-storage-dCache)
    disk space mounted at:\

        mkdir -p "/pnfs/sbnd/scratch/users/${USER}" 
        chmod g+w -R "/pnfs/sbnd/scratch/users/${USER}"

    \
    This will be the directory with which your jobs will be able to
    communicate, as it is visible from the OSG. Hence, all your input
    files and executables (unless they are UPS products already
    available in CVMFS) should be there and copied over to the worker
    nodes.

2.  To run a job, then you need to set `jobsub_client` up (no version is
    required since there is a \"current\" one):\

        source /grid/fermiapp/products/common/etc/setup # already included in setup_sbnd.sh
        setup jobsub_client

3.  then, you need a wrapper script. For now you can use the one
    attached here: copy it over to your working directory (e.g. the
    `/sbnd/app/users/${USER}` above) and edit the following lines
    (starting from l. 55):\

        ####################################
        ###### setup your needed products here, e.g. geant4 etc...
        ####################################

        # source /grid/fermiapp/products/larsoft/setup
        # setup geant4 v4_9_6_p03e -q debug:e6 
        # setup geant4 v4_9_6_p03e -q e6:prof    #no debug information, faster. 

        ####################################
        #### This is where you copy all of your executable/necessary files to the worker node 
        #### ( If applicable )
        ####################################

        ###### this is where you copy your executable - I have a simple hello.out code here.
         ifdh cp /pnfs/sbnd/scratch/users/andrzejs/hello.out .

        ####### 
        ####### ifdh cp does not preserve permissions, so need to add executable. #########
        #######
         chmod u+x hello.out

        #######
        ####### launch executable
        #######

         ./hello.out

        #######
        ####### Copy results back 
        #######

        ifdh mkdir ${SCRATCH_DIR}/${GRID_USER}/output_${CLUSTER}.${PROCESS}

        ifdh cp test_hello.txt ${SCRATCH_DIR}/${GRID_USER}/output_${CLUSTER}.${PROCESS}/

4.  this is how you would launch the job from your working directory
    (e.g. [BlueArc
    space](Computing_resources.html#Local-storage-BlueArc-disks)
    like `/sbnd/app/users/`):\

        jobsub_submit -G sbnd --role=Analysis -N 3 -M --resource-provides="usage_model=DEDICATED,OPPORTUNISTIC" --OS="SL6" "file://$(pwd)/run_job.sh"

    \
    Note

    -   `-N` specifying the number of jobs you want
    -   `-M`, which will send you an email every time a subprocess
        finishes
    -   `usage_model=OPPORTUNISTIC` tells the script to use any
        available slots, while `DEDICATED,OPPORTUNISTIC` sets the first
        priority to our dedicated slots
    -   `--OS` specifies the Scientific Linux version, if you need to
        care about that

The results of your job will end up in\

    /pnfs/sbnd/scratch/users/${USER}/output_${CLUSTER}.${PROCESS}



Some other useful commands:
=========================================================================

For more details go to the [jobsub (client)
documentation](Using_the_Client.html).



See how your jobs are doing
--------------------------------------------------------------------------

    jobsub_q -G sbnd --user="$USER"



Remove a job
--------------------------------------------

    jobsub_rm -G sbnd --jobid=<number of job, can get e.g. from previous question>



Fetch the log files
----------------------------------------------------------

    jobsub_fetchlog -G sbnd --jobid <job id specified at runtime, e.g. 77457.0@fifebatch2.fnal.gov>



Launching LArSoft jobs (also in large numbers)
==============================================================================================================

To be written. Sorry.



Using `project.py` to launch LArSoft jobs (especially in large numbers)
=============================================================================================================================================================

`project.py` is a wrapper script that takes a lot of the tedious setup
of grid etc out of the hand of the user, instead using an XML
configuration file.\
The general instructions for `project.py` are in `larbatch`\'s [user
guide](User_guide.html).

To use this package with SBND we need to set up `sbndcode` and
`sbndutil` UPS products. An example shell session could look like this:\

    source /grid/fermiapp/products/sbnd/setup_sbnd.sh
    setup sbndcode v05_12_01 -q e9:prof
    setup sbndutil v05_12_01 -q e9:prof

\
now you should be able to run `project.py` to actually run grid jobs you
need two things:

1.  an xml file that will configure your job, present locally, and
2.  a FHiCL configuration file that will be used by the LArSoft
    instance, **which needs to be present in your `FHICL_FILE_PATH`
    path**.



xml file preparation
------------------------------------------------------------

Example xml files can be found in the lar1ndutil repository, which you
can download by doing:

    mrb g lar1ndutil

in your srcs directory. the xml files, are e.g. in lar1ndutil/xml/test/
.\
These are currently untested. The instructions on xml file format can be
found in:\
<https://cdcvs.fnal.gov/redmine/projects/larbatch/wiki/User_guide>

but the relevant part for lar1ndcode is:\

    <!ENTITY release "v00_05_00">

i.e. the release number should be the number of the lar1ndcode version
you are using. So it has to be present in\
/grid/fermiapp/products/lar1nd or in your localProducts directory (in
that case you need to use the tarball option in the file. You can make
the tarball using the: /lar1ndutil/scripts/make\_tar\_lar1nd.sh ).



.fcl file preparation
-------------------------------------------------------------

The .fcl files need to be in your FHICL\_FILE\_PATH, so again, they need
to be either present in a tagged release or in your localProducts
directory.\
This also means that after each modification of the .fcl file you need
to make install for project.py to pick it up.

An example .fcl file is in:\
lar1ndcode/lar1ndcode/JobConfigurations/prod\_eminus\_0.1\_0.9\_lar1nd.fcl



Running
----------------------------------

Once you have these elements you can run:\

    project.py --xml <path to your xml file> --stage <your defined stage > --submit

and look for results.
