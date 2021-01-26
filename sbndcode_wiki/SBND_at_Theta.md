---
layout: page
title: SBND at Theta
toc: true
---



# SBND at Theta

------------------------------------------------------------------------

------------------------------------------------------------------------

This wiki page documents how to run SBND production on Theta at ALCF.
This documentation is easily adaptable for any experiment code running
LArSoft.

------------------------------------------------------------------------



## Using sbndcode on Theta

This section details how to get the binaries for sbndcode with all of
its dependencies, and how run LArSoft using a singularity containers.

------------------------------------------------------------------------



### Getting sbndcode with pullProducts

In /lus/theta-fs0/projects/neutrinoADSP/pullProducts/ there is a script
called \"pullProducts\" from FNAL SCD. It takes a specification (product
name, version, qualifiers) and downloads it along with all of the ups
products that it depends on based on a \"manifest\" file for that
release. On the page <https://scisoft.fnal.gov> you can find a variety
of top level products that have manifest files. Once a manifest has been
copied to Theta, the script is run:

> ./pullProducts
> /lus/theta-fs0/projects/neutrinoADSP/SBN-2020A/sbndcode_v09_09_00_01/
> slf7 sbnd-09.09.00.01 e19 prof

Note that these binaries are compiled in FNAL SL7, and require the use
of a Singularity container with SL7 installed to run.

------------------------------------------------------------------------



### Running sbndcode using Singularity

An SL7 Singularity container can be found here:

> /lus/theta-fs0/projects/neutrinoADSP/containers/singularity_slf7-balsam.sif

LArSoft can then be run using the Singularity container with a simple
bash script by passing the commands using a heredoc, for example:

[larsoft_example.sh](#){#collapse-22a5fdec-show .collapsible
.collapsed}[larsoft_example.sh](#)

```bash
    #!/bin/bash

    # launch singularity container
    singularity run --no-home -B /lus:/lus -B /soft:/soft /lus/theta-fs0/projects/neutrinoADSP/containers/singularity_slf7-balsam.sif << EOF

      # setup sbndcode, pointing to directory installed on Theta with pullProducts
      source /lus/theta-fs0/projects/neutrinoADSP/sbndcode/setup
      setup sbndcode v08_36_01_3_MCP2_0 -q e17:prof

      # run larsoft commands in the normal way
      lar -c ...

    EOF
```

Things to bear in mind when using Singularity containers:

-   When setting/using environment variables these need to be prefaced
    with \"SINGULARITYENV\" to be visible within the heredoc e.g. export
    SINGULARITYENV_counter=0

------------------------------------------------------------------------



## Installing and setting up Balsam
This section details how to install a local version of Balsam and how to
create and set up a Balsam database.

Balsam documentation can be found here:
<https://balsam.readthedocs.io/en/latest/index.html>

------------------------------------------------------------------------



### Installing a local version of Balsam

Balsam is installed on Theta, and the default version can be loaded by:

    # to load most recent version
    module load balsam

    # to load specific version
    module load balsam/0.3.5.1

However, the default versions installed on Theta have various issues
that prevent efficient running at scale in serial-mode. These issues are
fixed in this branch:
<https://github.com/balsam-alcf/balsam/tree/serial-mode-zmq>. This can
be pulled from github in the standard way, then we install it using a
python virtual environment as follows:

```bash
# create and active virtual env
module load cray-python
python -m venv env --system-site-packages
source env/bin/activate

# install packages required for Balsam serial-mode-zmq
module load gcc/8.3.0
pip install --upgrade pip
pip install --upgrade setuptools
pip install --upgrade numpy
pip install wheel
pip install django-widget-tweaks
pip install setproctitle

# install serial-mode-zmq branch
pip install -e /lus/theta-fs0/projects/neutrinoADSP/path/to/balsam_version/balsam/

Note that when you log into Theta subsequently, you will have to load
the python virtual environment by doing:

# load virtual env
source env/bin/activate
```

------------------------------------------------------------------------



### Configuring Balsam

The Balsam configuration can be adjusted by modifying

> \~/.balsam/settings.json

These should be configured correctly for Theta by default. The settings
I use can be seen here:

[settings.json](#){#collapse-00ab3ced-show .collapsible
.collapsed}[settings.json](#)

```json
{
 "SCHEDULER_CLASS": "CobaltScheduler",
 "SCHEDULER_SUBMIT_EXE": "/usr/bin/qsub",
 "SCHEDULER_STATUS_EXE": "/usr/bin/qstat",
 "MPI_RUN_TEMPLATE": "THETAMPICommand",
 "WORKER_DETECTION_TYPE": "THETA",
 "DEFAULT_PROJECT": "datascience",
 "SERVICE_PERIOD": 1,

 "NUM_TRANSITION_THREADS": 10,
 "MAX_CONCURRENT_MPIRUNS": 2048,
 "SERIAL_CORES_PER_NODE": 64,
 "SERIAL_HYPERTHREAD_STRIDE": 1,

 "LOG_HANDLER_LEVEL": "ERROR",
 "LOG_BACKUP_COUNT": 5,
 "LOG_FILE_SIZE_LIMIT": 104857600,

 "QUEUE_POLICY": "theta_policy.ini",
 "JOB_TEMPLATE": "job-templates/theta.cobaltscheduler.tmpl"
}
```

Settings to note:

-   \"SERIAL_HYPERTHREAD_STRIDE\" must be set to 1 for our jobs. This
    controls the step size in the core/hyperthread index when assigning
    jobs to threads. The numbering system of KNL on Theta is as follows:
    \#0-63 is thread 1 of each of the 64 physical cores, \#64-127 is
    thread 2 on each core, and so on. We want to run 1 process per
    physical core, therefore we want to run on indexes 0-63 i.e. 64
    processes, with stride of 1.
-   \"LOG_HANDLER_LEVEL\" controls the level of logging done by Balsam
    and can be set to \"INFO\" or \"ERROR\". When running at large scale
    \"ERROR\" should be used to minimise the logging to reduce the
    stress on the file-system. When debugging, setting the logging to
    \"INFO\" provides additional information that can be useful.

------------------------------------------------------------------------



### Creating databases

Once Balsam has been installed, we want to create a Balsam database.
This database is what Balsam uses to schedule jobs and monitor their
state. A database can be created as follows:

```bash
# create a Balsam database called "balsamdb_sbnd"
balsam init /lus/theta-fs0/projects/neutrinoADSP/balsamdb_sbnd

# activate the database
source balsamactivate /lus/theta-fs0/projects/neutrinoADSP/balsamdb_sbnd

# adding additional users to the database if needed
balsam server --add-user <username here>

# setting permissions for other users to modify folders
find balsamdb_sbnd/ -type d -exec chmod g+rwx {} \;
find balsamdb_sbnd/ -type f -exec chmod  g+rw {}   \;
find balsamdb_sbnd/ -executable -type f -exec chmod g+x {} \;
chmod 700 balsamdb_sbnd/balsamdb/
umask g=rwx
```

Then when logging in subsequently the Balsam database can be activated
by doing:\

```bash
# activate the database
source balsamactivate /lus/theta-fs0/projects/neutrinoADSP/balsamdb_sbnd
```

Note that when using the serial-mode-zmq branch of Balsam, before
creating a database or when restarting after maintenance you will need
to load postgresql:\

```bash
module load postgresql
```

The striping of the output directory balsamdb_sbnd/data/ should be 1 (as
is the case by default). This is optimal when dealing with many small
files (order \~kB to \~few MB) and is faster for writing many files to
lustre during running.

------------------------------------------------------------------------



### Adding applications

Applications are the scripts that Balsam jobs will run on the Theta
compute nodes. For our purposes, these will typically be a bash script
that launches a Singularity container to run LArSoft commands. But they
could also be for example Python scripts doing additional processing of
the inputs or outputs from the LArSoft jobs. Balsam workflows can be
used to create complex dependencies between multiple applications.

An application can be created as follows:

```bash
# add application
balsam app --name <application name> --executable <path to executable>

# example: larsoft_example.sh script
balsam app --name larsoft_example --executable /lus/theta-fs0/projects/neutrinoADSP/path/to/script/larsoft_example.sh

You can see the application(s) added to the Balsam database as follows:

# list applications, verbose is optional
balsam ls apps [--verbose]
```

Note that application scripts need to be executable, chmod +x script.sh.

------------------------------------------------------------------------



## Managing workflows with Balsam

This section details how to set up a workflow with Balsam, populate a
database, and submission and management of jobs.

An introduction to Balsam workflows can be found here:
<https://www.alcf.anl.gov/files/Salim_Balsam_SDL-10-2019%20%28MC4xOTAyMDQwMA%29.pdf>

------------------------------------------------------------------------



### Creating a workflow and populating a database

The balsam database can be populated with a workflow using a python
script. An example script typical for SBND production is shown below,
this workflow:

-   creates sets of 50 jobs that run the larsoft_example application,
    generating 1 event per job
-   creates a merge job, that depends on the previous 50 jobs and once
    these are complete runs an application to merge the outputs into a
    single file

[add_workflow.py](#){#collapse-82c3782b-show .collapsible
.collapsed}[add_workflow.py](#)

```python
from balsam.launcher import dag
import os
import subprocess
import glob

# -----------------------------
# add_workflow.py
# -----------------------------

# number of jobs/node (leave this as it is)
node_pack_count=64

# number of files to generate and number of events per file
n_files = 1000
n_events = 50

tot_events = n_files*n_events

# This is the workflow name
workflow = "wf_larsoft_example"
workflow_merge  = "wf_larsoft_example_merge"

# loop over files, index used for run number in events so must count from 1
for ifile in range(1, n_files + 1):

# print the file
print("File: ", ifile)

merge_args  = f"{ifile}"

# this job will take all split event files which have been processed and merge them back into one file
merge_job = dag.add_job(
    name = f"mergefile_{ifile}",
    workflow = workflow_merge,
    description = "joining final output files",
    num_nodes = 1,
    ranks_per_node = 1,
    node_packing_count = node_pack_count,
    args = merge_args,
    wall_time_minutes = 5,
    application= "merge_files"
)

# loop over events for file, index used for event number so must count from 1
for ievent in range (1, n_events + 1):

    # offset run number by 1 million to avoid overlap with fermigrid production
    irun = ifile + 1000000

    script_args  = f"{ifile} {irun} {ievent}"

    larsoft_job = dag.add_job(
    name = f"cosmics_{ifile}_{ievent}",                # This will be the name of the job in the database
    workflow = workflow,
    description = "generating events",                 # A description of what this job is
    num_nodes = 1,                                     # Number of nodes each job needs
    ranks_per_node = 1,                                # The number of ranks per node
    node_packing_count = node_pack_count,              # This is set to 64
    args = script_args,                                # The arguments to the application (the bash script being run)
    wall_time_minutes = 30,                            # Wall time of job
    application= "larsoft_example"                     # The name of the application
    )

    # add_dependency(parent, child). This will tell balsam that before we run the merging application, we need to wait for all of its parents to process first.
    dag.add_dependency(larsoft_job, merge_job)

print("Total number of events to be generated: ", tot_events)
```


To see the jobs in the databases, you can do:\

```bash
# list details of jobs, can filter by workflow name, application name, etc.
balsam ls [--wf <wf_name>] [--app <app_name>]
```
To minimise load on file-system at run time it is useful to pre-process
the jobs before submitting. The pre-processing creates the directory
structure, etc. for the outputs of the jobs. This can be done on the
login node, using balsam service:\

```bash
# launch balsam service, on login node
balsam service
```

Note that you need to set \"submit-jobs = off\" in
\~/.balsam/theta_policy.ini to avoid it trying to automatically submit
jobs.

------------------------------------------------------------------------



### Submitting and monitoring jobs

Jobs can then be submitted as follows can then be submitted as follows:

    # debug queue, maximum scale: 8 nodes, 1hr
    balsam submit-launch -n 8 -t 60 -A neutrinoADSP -q debug-flat-quad --job-mode serial --wf-filter <wf_name>

    # default queue, minimum scale: 128 nodes
    balsam submit-launch -n 128 -t 60 -A neutrinoADSP -q default --job-mode serial --wf-filter <wf_name>

The status of queued jobs can be monitored here:
<https://status.alcf.anl.gov/theta/activity>. They can also be monitored
and controlled from the command line using scheduler commands directly,
e.g.:\

    # list users queued submissions
    qstat | grep <username>

    # kill queued submission by jobid
    qdel <jobid>

A summary of the status of individual jobs in the database can be listed
as follows:\

    # list summary of job states
    balsam ls --by-state --wf <wf_name>

The outputs from completed jobs will be located in the
\"balsam_database_name/data/workflow_name\" folder.

------------------------------------------------------------------------



### Tidying up failed jobs

Cleanup of jobs in the database can be done using the Python command
line:

```python
from balsam.launcher.dag import BalsamJob

# get jobs matching a specific workflow
jobs = BalsamJob.objects.filter(workflow="<workflow name>")

# or, get jobs matching a specific workflow and state
jobs = BalsamJob.objects.filter(workflow="<workflow name>", state="<state>")

# number of selected jobs
len(jobs)

# delete the jobs from the database
jobs.delete()
```

In a similar manner, you can also select jobs using any of the
properties in the database. You can also manipulate the properties and
status of jobs, for example manually changing \"FAILED\" jobs to
\"RESTART_READY\" to enabling them to re-run in the next submission:

    # update job state from "FAILED" to "RESTART_READY"
    for job in BalsamJob.objects.filter(workflow="<workflow name>", state="FAILED"):
       job.update_state("RESTART_READY")

------------------------------------------------------------------------



## Using node local SSDs

To achieve throughput with LArSoft is it critical to make use of the
local SSDs available for each node to prevent overloading of the shared
lustre file-system. File I/O is the main bottle-neck to running LArSoft
out-of-the-box at scale due to the large number of file reads/writes per
process. By making use of the local SSDs, the majority of the LArSoft
I/O can be done separately for each node then only the essential final
files be copied to lustre.

------------------------------------------------------------------------



### Accessing the local SSDs

Access to the local SSDs is not enabled by default, you first need to
request permissions by contacting support (<support@alcf.anl.gov>).
Access is given by user rather than enabled for the whole allocation, so
each new user will need to do this.

The local SSDs are visible from each compute node in the directory
/local/scratch/. Anything in these directories is only accessible by
that specific node and is deleted at the end of the job. Note that
/local/scratch/ is not visible from the service node (the \"mom\" node)
so won\'t be seen directly in an interactive job, instead you must use
aprun commands to access the compute nodes.

To enable singularity applications to access the SSDs you must bind
mount the /local/scratch/ directory as follows:

    singularity run --no-home -B /lus:/lus -B /soft:/soft -B /local/scratch:/local/scratch /path/to/container/singularity_slf7-balsam.sif

------------------------------------------------------------------------



### Creating a tarball of the job inputs

Loading of the LArSoft binaries was found to be a significant I/O
bottleneck. This can be resolved by giving each node a separate copy of
the binaries on the local SSDs. The most efficient way to do this is to
create a tarball of sbndcode that can then be copied and extracted by
each node. This takes time at the start of the job, but leads to much
faster run times even at small scales and prevents catastrophic
bottlenecks occurring at large scales.

The installation distributed via pullProducts by default includes a
large amount of detritus, e.g. source files, documentation, example
scripts etc. Removing these significantly reduces the number of total
files speeding up the extraction of the tarball. An easy way to do this
is to exclude certain file types and folder names when creating the
tarball. This can be done by passing an exclude list in the tar command
as follows:

    tar -zcvf <tarball_name>.tar.gz -X exclude.txt <sbndcode_directory>

An example exclude file that works for the MCP2.0 release of sbndcode
can be found here:

[exclude.txt](#){#collapse-bc3c00f3-show .collapsible
.collapsed}[exclude.txt](#)

:::
    *.cc
    *.c
    *.C
    *.cpp
    *.cxx
    *.f
    *.f90
    *.html
    *.png
    *.js
    *.xpm
    src
    source
    test
    tests
    doc
    docs
    example
    examples
    tutorial
    tutorials
    README
    Help
    help
    obsolete
    downloads
    cmake-*.*
    cmake
    mrb
    LibraryData
    Argoneut
    op_library_sbnd_v2.root
:::

Note that this is far from optimised, significantly more could probably
be removed. Make sure you test that LArSoft still works with the version
saved in the tarball - i.e. test extracting and running on the login
node.

I also found it beneficial to include in this tarball the singularity
container and any other files required jobs, e.g. Corsika databases, to
prevent bottlenecks from accessing these.

------------------------------------------------------------------------



### Copying the tarball using MPI-I/O

To efficiently copy the code tarball to every compute node we make use
of MPI-I/O. This allows the file to be collectively read then
efficiently distributed rather than copying it separately for every
node, scaling much more effectively. A script that performs this copy
can be found here:
/lus/theta-fs0/projects/neutrinoADSP/SBN-2020A/scripts/mpi_copy.py.

This script can then by called via an aprun command as follows. This
should be added to the job-template located in
\~/.balsam/job-templates/theta.cobaltscheduler.tmpl, before the balsam
launcher command.

```bash
# copy job tarball to each node
aprun -N 1 -n {{ nodes }} python /lus/theta-fs0/projects/neutrinoADSP/SBN-2020A/scripts/mpi_copy.py /lus/theta-fs0/projects/neutrinoADSP/path/to/job_tarball.tar.gz /local/scratch/job_tarball.tar.gz
sleep 2
# extract tarball on each node
aprun -N 1 -n {{ nodes }} tar -xzf /local/scratch/job_tarball.tar.gz -C /local/scratch/
sleep 2
```
------------------------------------------------------------------------



### Running LArSoft on node local SSDs

An example script for running LArSoft on the local SSDs is shown below.
This script:

-   gets the Balsam working directory on lustre, and creates a duplicate
    working directory on the local SSD to run LArSoft
-   runs LArSoft using a local copy of the binaries and a local copy of
    the Singularity container
-   copies the output art-root file if the job is successful or the log
    files if it fails, minimising the writing to lustre
-   provides an appropriate exit code for Balsam, forcing non-zero exit
    code puts job in failed state

This script assumes that the binaries and singularity container have
been copied to the local SSD and extracted from the tarball.

[larsoft_example_local_ssd.sh](#){#collapse-cfa93f31-show .collapsible
.collapsed}[larsoft_example_local_ssd.sh](#){#collapse-cfa93f31-hide
.collapsible}

```bash
#!/bin/bash

# get full balsam directory of job
# this is the initial directory that the job launches in
balsamDir=$(pwd)

# create working directory on ssd and cd to it
baseDir=${PWD##*/}
mkdir /local/scratch/$baseDir
cd /local/scratch/$baseDir

# launch singularity container
singularity run --no-home -B /lus:/lus -B /soft:/soft -B /local/scratch:/local/scratch /local/scratch/singularity_slf7-balsam.sif <<EOF

  # setup sbndcode, pointing to directory on the local ssd
  source /local/scratch/sbndcode_MCP2.0/setup
  setup sbndcode v08_36_01_3_MCP2_0 -q e17:prof

  # run larsoft commands in the normal way
  lar -c prodcorsika_cosmics_proton_theta.fcl -n 25 -e $1:1:$2 -o prodcorsica_$1_$2_Gen.root

EOF

# check whether job successful and set appropriate exit status
# existence of final file means job completed successfully
exit_status=$(ls | grep "prodcorsica_$1_$2_Gen.root")

# copy relevant files to lustre depending on exit status
# successful job: copy output art-root file or failed job: copy logs
if [[ -z "$exit_status" ]]; then
  echo "Job failed."
  cp *.log $balsamDir/
  cp *.err $balsamDir/
  exit 1
elif [[ -n "$exit_status" ]]; then
  echo "Job succeeded."
  cp prodcorsica_$1_$2_Gen.root $balsamDir/
  exit 0
else
  echo "Something's gone wrong"
  exit 2
fi
```

------------------------------------------------------------------------

------------------------------------------------------------------------



## Other considerations for running at scale

------------------------------------------------------------------------



### Singularity database caching

Singularity jobs on Theta require additional credential checking when
launched and at large scale the simultaneous checks can overwhelm the
database before the system is able to adequately cache the credentials.
This can easily be avoided by manually caching the credentials for each
node:

```bash
# singularity database caching
aprun -N 1 -n {{ nodes }} /soft/tools/prime-cache
sleep 10
```

This command needs to be added to the job template
\~/.balsam/job-templates/theta.cobaltscheduler.tmpl before any other
aprun commands / balsam launch. Note this has been tested up to scale of
1024 nodes, for larger scales it may be necessary to do the caching in
multiple steps of 1024 nodes as follows:

```bash
# large scale singularity database caching
aprun -N 1 -n 1024 /soft/tools/prime-cache
sleep 10
aprun -N 1 -n 2048 /soft/tools/prime-cache
sleep 10
aprun -N 1 -n 3072 /soft/tools/prime-cache
sleep 10
aprun -N 1 -n 4096 /soft/tools/prime-cache
sleep 10
```

------------------------------------------------------------------------



### Running with multiple Balsam master processes

As standard Balsam will launch with a single master process that handles
all the allocating of jobs to specific cores and updating the database.
This can lead to a bottleneck at large scales due to the extremely large
number of jobs that have to be managed when running in serial mode. To
avoid this we split the submission into multiple master processes, each
handling the jobs on 128 nodes as follows:

``` bash
# if default queue, split into separate 128 node jobs and launch as forked processes
# if in debug queue just run as single job
{% if queue == 'default' %}
    {% for n in range(nodes // 128) %}
        balsam launcher --job-mode={{ job_mode }} --limit-nodes=128 --offset-nodes={{ n*128 }} --{{ wf_filter }} --time-limit-minutes={{ time_minutes-2 }} {{ "&" }}
        sleep 2
    {% endfor %}
{% elif queue == 'debug-flat-quad' or queue == 'debug-cache-quad' %}
    balsam launcher --{{ wf_filter }} --job-mode={{ job_mode }} --time-limit-minutes={{ time_minutes-2 }}
{% endif %}

# wait for forked processes to complete
wait
```

This replaces the standard balsam launcher command in
\~/.balsam/job-templates/theta.cobaltscheduler.tmpl. The logic is
written in Jinja, see
<https://jinja.palletsprojects.com/en/2.11.x/templates/> for more detail
if editing, but the commands are bash. Be careful because some things
can behave slightly differently to standard bash.

Note each separate Balsam master process uses a node, so for each set of
128 nodes there are only 127 compute notes available to run job.
However, the benefit from running with this method, negating the
bottleneck, far outweighs the lost compute nodes.

Also note that this won\'t work properly if the number of nodes is not a
multiple of 128, some extra logic could be added to deal with this
properly. Or just run in multiples of 128!

------------------------------------------------------------------------



### Job scheduling and priority

In general larger scale jobs and jobs with shorter run times gain
priority more rapidly in the queue, therefore when designing production
workflows consider that for example

-   it can be quicker to run one 1024 node job instead of two 512 node
    jobs
-   it can be quicker to run at 1024 nodes for three hours rather than
    to run at 512 nodes for 6 hours

Details about the job scheduling policy can be found here:
<https://www.alcf.anl.gov/support-center/theta/job-scheduling-policy-theta>

The exception to this is sometimes smaller jobs are fit in around larger
scale jobs, especially to fill gaps when Theta is draining for a very
large scale job. Therefore sometimes short running 128 or 256 node jobs
can start very quickly.

Tentatively I believe the ideal approach is to run one large job that
generates the majority of the sample but without running out of events,
then use smaller jobs to finish up whatever is left over.

------------------------------------------------------------------------



## Useful commands

------------------------------------------------------------------------



### Setting directory striping

Files on the lustre file-system can be striped to enable simultaneous
reading of multiple parts of the file. This presentation provides a lot
of useful information for how to make best use of this:
<https://www.alcf.anl.gov/files/Zamora_Parallel_IO_Storage_Oct4_2018.pdf>

Theta has 56 lustre workers, so this is the maximum the striping can be
set to. Once a folder is striped, all files and sub-folders that are
written within that folder AFTER the striping has been set will inherit
it. The striping of folders can be managed as follows:

```bash
# set stripe count of a folder (in this case 48 stripes, with stripe size of 8mb)
lfs setstripe -S 8m -c 48 <folder name>

# check the stripe count
lfs getstripe <folder name>
```

Striping should be used for large shared files - e.g. a large tarball
that is copied to each node local SSD. When dealing with small files or
many files at stripe count of 1 should be used. Do not stripe the Balsam
output directory, this will substantially slow things down. For ideal
performance with large files, use \~8-48 stripes and \~8-32mb stripe
size. You should also avoid using all 56 stripes and avoid very small
stripe sizes (default 1mb is sub-optimal).

------------------------------------------------------------------------



### Running interactive jobs on Theta compute nodes

Jobs can also be run interactively on the compute nodes (rather than via
Balsam). This can be useful for debugging workflows e.g. testing working
with the node local SSDs. To queue an interactive job,

```bash
# launch interactive job on 1 node, using debug queue
qsub -I -n 1 -t 60 -q debug-flat-quad -A neutrinoADSP

Then once the job has started you can run commands using aprun directly,

# run command on 1 core of 1 node, $ARGS is command to run
aprun -n 1 -N 1 -cc none $ARGS
```

Note that the job will launch on the MOM node, you will not have access
directly to the compute nodes other than via aprun commands.

------------------------------------------------------------------------



## Handling production outputs

------------------------------------------------------------------------



### Transferring data to and from Theta with Globus

Using Globus transfer allows us to achieve significantly faster copying
compared with SCP. To transfer files from Theta to Fermilab we require
both FNAL and ANL certificates. This can be set up on a gpvm as follows:

```bash
kinit
kx509
voms-proxy-init -noregen -voms fermilab:/fermilab/sbnd/Role=Analysis

export MYFNALCRED=/tmp/x509up_u$(id -u)
export X509_CERT_DIR=/sbnd/app/users/pgreen/globus_copy_theta/ALCF_CA/
myproxy-logon -s myproxy.alcf.anl.gov --out /tmp/pgreen_ANLcred
```

The folder ALCF_CA contains copies of the required certificates for both
FNAL and ANL:

```bash
# FNAL certificates copied from:
/etc/grid-security/certificates/*

# ANL certificate can be found here:
/sbnd/app/users/pgreen/globus_copy_theta/ANL_certificate/
```

The Globus copy command then points to each of these certificates as
follows:

```bash
globus-url-copy -vb -p -cd -g2 -nodcau -dst-cred $MYFNALCRED -src-cred /tmp/pgreen_ANLcred gsiftp://thetadtn.alcf.anl.gov/projects/neutrinoADSP/path/to/file/<file> gsiftp://fndca1.fnal.gov:2811/pnfs/fnal.gov/usr/sbnd/scratch/users/pgreen/path/to/outputdir/
```

An example script that automates copying a set of data given an input
file is shown below:

[globus_copy.sh](#){#collapse-75a3cf55-show .collapsible
.collapsed}[globus_copy.sh](#)

```bash
#!/bin/bash
# ----------------------------------------------------------------------------------
# This bash script will take an input file list pointing to some files in
# theta and copy the files to a directory in scratch
# The filelist must have the full theta path not just the filename

# Usage: source transfer_from_theta.sh <your input list>

# Configurable parameters are listed below so edit as needed
# ----------------------------------------------------------------------------------

# The copy path on scratch, make sure there is a / at the end
fnal_copy_path=globus_copy_test/

# Terminate after this many copies, set this to a large number e.g 1000000000 if wanting to run over all files
copy_number=100000

# ----------------------------------------------------------------------------------

echo "Copying the data to: /pnfs/sbnd/scratch/users/pgreen/$fnal_copy_path"

# Check if the scratch directory exists, otherwise create it
if [ ! -d /pnfs/sbnd/scratch/users/pgreen/$fnal_copy_path ]
then
    echo
    echo Scratch folder does not exist... creating
    mkdir -p /pnfs/sbnd/scratch/users/pgreen/$fnal_copy_path

fi

# start time
start_time=`date +%s`

counter=0
copy_counter=0

# The file list for successful transfers
infile=$1
touch copied_$infile
echo "The infile list is : $infile"

if [ -z "$infile" ]
then
    echo "Error no filelist has been input, exiting..."
    echo "Usage is source transfer_to_theta.sh <your input list>"
    return
fi

# Now copy the files to Theta
for file in `cat $infile`
do
    # Clear the checking variable
    unset copied

    # First check the copied files to see if the file has already been transfered
    filebasename=`basename $file`
    copied=`cat copied_$infile | grep $filebasename`

    # Check if the file has already been copied, if not then copy otherwise skip
    if [ -z "$copied" ]
    then
        start_time_1file=`date +%s`
        echo
        echo "On Entry: $counter"

        # Execute the globus copy command
        run "globus-url-copy -vb -p -cd -g2 -rst-retries 1 -nodcau -restart -stall-timeout 14400 -dst-cred $MYFNALCRED -src-cred /tmp/pgreen_ANLcred gsiftp://thetadtn.alcf.anl.gov$file gsiftp://fndca1.fnal.gov:2811/pnfs/fnal.gov/usr/sbnd/scratch/users/pgreen/$fnal_copy_path && echo `basename $file` >> copied_$infile"

        echo Copy time for file was:  $(expr `date +%s` - $start_time_1file) s

        copy_counter=$[$copy_counter+1]

    else
        echo "$copied has already been copied so skipping... "
        echo
        copy_counter=$[$copy_counter+1]
        continue;
    fi

    counter=$[$counter+1]

    # Skip after n files for testing
    if [ $counter -eq $copy_number ]; then
        break
    fi

done

echo "Total files copied: $copy_counter"
unset copy_counter

echo run time is $(expr `date +%s` - $start_time) s
```

Globus copying appears most efficient for larger files. When testing
with files \~12Gb I saw speeds of 200-400 MB/sec. This does not appear
to be the maximum bandwidth however, because running multiple instances
of the script simultaneously saw similar speeds for each instance - e.g.
testing running five scripts each transferring different \~12Gb files
saw speeds of up to \~1200 MB/sec. Splitting data into subsets to be
transferred in parallel appears to be important to achieve fastest
copying, but I have not tested optimal/maximum number of subsets to use.

If copying a large number of smaller files, e.g. histogram files, SCP is
typically faster as additional per-file overheads of Globus approach
dominate over copying time.

------------------------------------------------------------------------



### Modifying Theta processed file metadata for SAM declaration



### Automating FNAL file handling using FTS

File transfer service (FTS) can be used to automate extracting the
metadata, declaring the file to SAM and copying to tape-backed storage.

The status of the FTS processing can be seen here:
<http://sbndsamgpvm02.fnal.gov:8787/fts/status>. Note: requires FNAL VPN
to access. This page also shows any errors that occur and allows
processing to be retried.

Other diagnostics can also be viewed at:
<https://fifemon.fnal.gov/monitor/d/000000032/fts?orgId=1&from=now-24h&to=now&var-experiment=sbnd&refresh=5m>.

It is also useful to monitor the dCache lifetime to ensure files are not
lost to scratch. This can be seen here: <http://fndca2b.fnal.gov/> (also
required VPN).



### Creating SAM definition

Once the files have been declared to SAM by the FTS a definition
containing the complete data-set can be created.

The properties of the data-set can be used to list the files, e.g.:

```bash
samweb -e sbnd list-files "sbnd_project.name prodcorsika_cosmics_proton_3drift_window_sce_theta"
samweb -e sbnd count-files "sbnd_project.name prodcorsika_cosmics_proton_3drift_window_sce_theta"
```

Once the desired set of files has been identified, a definition
containing them can be created as follows:

```bash
samweb create-definition official_theta_MCP2020A_prodcorsika_proton_reco2_sbnd "sbnd_project.name prodcorsika_cosmics_proton_3drift_window_sce_theta"
```
