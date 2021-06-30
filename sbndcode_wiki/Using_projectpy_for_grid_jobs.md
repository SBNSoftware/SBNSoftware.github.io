---
layout: page
title: Using project.py for grid jobs
---



# Using `project.py` for Grid Jobs

Explanation courtesy of Dom Brailsford. Firstly to use the grid use
[project.py](https://cdcvs.fnal.gov/redmine/projects/larbatch/repository/revisions/develop/entry/scripts/project.py).

A useful explanation of project.py can be found in the [LAr Batch Tools
Redmine
site](https://cdcvs.fnal.gov/redmine/projects/larbatch/wiki/User_guide).
This gives more detail on the specific elements.



## Before Starting Grid Life


Here is a useful process to follow when you submit jobs to the gird.

1. Copy a file locally to do some initial testing. These might be files
   you have made or production files. To access production files have a
   look at [How to create and use a SAM
   definition](\_How_to_create_and_use_a_SAM_definition).
   Make sure your larsoft command runs on the GPVM first.
2. Write a `project.py` script (see below).
3. Run a test sample: rather than running over all events reduce your
   event number and job number to 1-10\\% of the sample. In `project.py`
   can request specific memory, lifetimes and space needed. To be a
   good citizen you should change these e.g. in the stage you need (see below):
```xml
<disk>20GB</disk>
<memory>1500</memory>
<jobsub>--expected-lifetime=3h [...]</jobsub>

```
   for 20GB of space required on the node, 1.5 GB of memory and
   expecting the job to finish within 3 hours. If you go above these
   then you job will be held. Roughly calculate what you need from
   output of the larsoft command and the size of the files. For the
   test job relax the parameters so they will all pass. You you are
   unsure what these should be set to ask.

4. Once you test job has come back successful then you alter your
   requirements so that you set appropriate constraints on your
   requirements. Don't be too harsh otherwise your jobs will be held.

5. If your test job fails. You can look to see why either by
   graphana/kibana: [Checking your Grid
   Status](Checking_your_Grid_Status.html), looking at the
   log files in the output directory/work directory or by getting the
   log file **jobsub\_fetchlog \--jobid=myid**. If you are not used to
   jobs have a read
   [here](https://cdcvs.fnal.gov/redmine/projects/jobsub/wiki/Using_the_Client).



## How the write a `project.py` XML file

`project.py` handles job submissions to the grid so that you don't have
to worry about managing all the jobs you send to the grid yourself.
`project.py` runs from an XML file which defines some parameters i.e. how
many jobs you want to run. So lets look at an example XML file which
generates particles.

So firstly is the header section.

```xml
<?xml version="1.0"?>

<!DOCTYPE project [
<!ENTITY release "v09_19_00">
<!ENTITY releasetag "e19:prof">
<!ENTITY my_version "v5">
<!ENTITY my_run "1">
<!ENTITY name "mdeltutt_prism_enuelastic">
<!ENTITY file_type "data">
<!ENTITY run_type "physics">
]>
```

- The first line is the version of XML you wish to use.
- The other 5-10 are for book keeping. Changing these might change
  your output folder structure.

Next is the project element.

```xml
<project name="&name;">

  <!-- Group -->
  <group>sbnd</group>

  <!-- Project size -->
  <numevents>1000</numevents>

  <!-- Batch resources -->
  <resource>DEDICATED,OPPORTUNISTIC,OFFSITE</resource>

  <!-- Larsoft information -->
  <larsoft>
    <tag>&release;</tag>
    <qual>&releasetag;</qual>
    <local>/pnfs/sbnd/resilient/users/mdeltutt/Tarballs/sbndcode_v09_19_00_01_prism__&my_version;.tgz</local>
  </larsoft>
```

- `name` declares the name of the project.
- `numevents` is the total number of events you want to produce in the
    sample and **NOT** the number of events per job.
- `resource` specify the job resources and how the jobs are queued. Default is "DEDICATED,OPPORTUNISTIC".
-   Line 22 defines how the jobs are queued.

The Larsoft sub element:

- The `larsoft` tag defines the LArsoft version you would like to run. 
  If you are running off a tagged release available as UPS product,
  you need to just keep the `tag` and `qual` tags.
  But if you want to run your own version you need to make your own tar file
  (create a tar file using `make\_tar\_sbnd.sh /pnfs/sbnd/resilient/users/${USER}/mytar.tar`)
  and place it the `local` tag as shown in the example above. Make sure the tar file is in dCache
  `resilient` area.

Next are the stage sub-elements. This defines the generator-level job
that you want to run.

```xml
  <!-- Project stages -->
  <stage name="gen_g4_detsim">
    <fcl>prodsingle_mu_bnblike.fcl </fcl>
    <fcl>standard_g4_sbnd.fcl</fcl>
    <fcl>standard_detsim_sbnd.fcl</fcl>
    <outdir>/pnfs/sbnd/scratch/users/mdeltutt/&release;/output_&my_version;_&my_run;</outdir>
    <workdir>/pnfs/sbnd/resilient/users/mdeltutt/grid_workdir_sbnd/prism_ana_enuelastic</workdir>
    <numjobs>100</numjobs>
    <datatier>generated</datatier>
    <defname>&name;_&tag;_gen</defname>
    <!-- <maxfilesperjob>1</maxfilesperjob> -->
    <memory>2000</memory>
    <jobsub> --expected-lifetime=2h --generate-email-summary -l +SingularityImage=\"/cvmfs/singularity.opensciencegrid.org/fermilab/fnal-wn-sl7:latest\" --append_condor_requirements='(TARGET.HAS_SINGULARITY=?=true)' </jobsub>
    <disk>10GB</disk>
  </stage>
```

The above block defines a stage called `gen_g4_detsim`. You can define multiple blocks
like this with different name.

- `fcl` is where the fcl file is defined. You need to pecify just the filename,
  not the full path.
- `outdir` defines where the output file should go. Make sure it's a
  [SBND dCache storage](SBND_dCache_storage) (pnfs) location.
- `workdir` defines the work directory where some initial
  processing occurs. Make sure its a dCache area.
- `numjobs` defines how many jobs you wish to split the stage into.
- `datatier` and `defname` are definitions you need when you declare your output
  to SAM.
- `memory` defines the amount of memeory that will be allocated for each of the jobs.
- In the `jobsub` tag you can specify what is the lifetime of the jobs (here 2h) and
  to use a Singularity container on the grid nodes (this is needed).
- `disk` defines the amount of disk space that will be allocated for each of the jobs.

End with:

```xml
 <!-- file type -->
  <filetype>&file_type;</filetype>

  <!-- run type -->
  <runtype>&run_type;</runtype>

</project>
```



## Job Submission

Once you have written your XML script it you just need to pass a few
command line arguments which define the XML and the stage name you want
to use.

Assuming we called the file above `config.xml`,i f you want to submit
the `gen_g4_detsim` stage we defined above,
you would, for example, do the following command:

```bash
project.py --xml config.xml --stage gen --submit
```

It's useful to check (use `checkana` for anatree files) the output once a
stage is finished. Do this by:

```bash
project.py --xml config.xml --stage gen --check
```

This tell you what jobs have failed and succeeded.

If you need to delete the output to submit again, run:

```bash
project.py --xml config.xml --stage gen --clean
```

If you want to check you status with cool graphs sign in
[Grafana](https://fifemon.fnal.gov/monitor/dashboard/db/experiment-overview?var-experiment=sbnd&orgId=1&from=1508165371912&to=1508252205933&refresh=10s)
