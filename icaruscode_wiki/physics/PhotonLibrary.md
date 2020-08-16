---
layout: page
title: Scintillation photon visibility map for ICARUS
subtitle: 
description: Scintillation photon visibility map for ICARUS
toc: true
toc_title: Contents
---


Scintillation photon visibility map for ICARUS
===============================================

The simulation of argon scintillation includes a step where scintillation photons are propagated
from where they are produced, with the goal of reaching one of the optical detectors.
This simulation includes effects like reflections, absorption, Rayleigh scattering,
and in general all photons undergo when in the "optical" regime.
The number of photons produced per megaelectronvolt of deposited energy is in the ballpark of 24000.
A typical BNB neutrino interaction would cause million of scintillation photons to be emitted,
and the figure for a real event including cosmic ray activity is at least one order of magnitude larger.
The simulation of that many individual photons is not affordable, and shortcuts are taken.

One standard solution is to precompute the efficiency of detecting a scintillation photon
from anywhere in the active part of the detector, to any of the optical detectors.
The resulting map is queried each time a group of photons needs to be propagated.

This page describes a procedure to generate such a map, commonly called "photon library", for ICARUS detector.


Content of the map
-------------------

The map is in the form of a lookup table. Each row of the table refers to a specific detector location
and a specific optical detector channel.
The location is represented as a voxel index: the full active volume of the detector is diced
into small boxes ("voxels") and each voxel is assigned an index for identification.
ICARUS map currently contains only one piece of information: the average visibility of photons 
scintillating from within the voxel to a optical detector channel.
The format of the table shows one entry per (voxel, optical detector) pair,
therefore there are potentially 180 entries per voxel.

The current map covers a single cryostat (in particular, the reference is for `C:0`).
All cryostats are considered identical, and software mapping is used
to cover the other cryostat with the same mapping.

Currently, the storage format is a ROOT `TTree` with as branches the voxel index, the channel number
and the visibility pertaining them. Entries with visibility `0` are omitted.

The visibility is defined as follows: _N_ scintillation photons are generated in one voxel _V_,
distributed uniformly in only the part of its volume which is occupied by liquid argon
(this distinction is relevant for regions at the border, which may contain a piece of cathode,
a portion of the PMT, part of the cryostat vessel etc.).
For each optical detector channel _C_, the number of those photons which reach _C_ is
divided by _N_, and that ratio is the visibility assigned to voxel _V_ for channel _C_.


Procedure for the creation of the visibility map
-------------------------------------------------

The procedure consists of the following parts:

1. collect the relevant information on the geometry of the detector and the precision of the map;
2. run the photon simulation in the grid, bookkeep, make sure the job completed;
   the stanard strategy is that each job is single-threaded, covers a certain contiguous range
   of voxels, and it is comprised of a single subjob (in `project.py` terms, `<njobs>1</njobs>`);
3. merge the output of all jobs into the single photon library ROOT file;
4. perform physics checks as needed.


### Set up

The most relevant part of the set up is to decide the exact volume to sample, and the voxel size.
For simplicity of use, we tend to utilise cubic voxels with a side length in round numbers (5 cm).
On top of that, it is important to decide how many photons to generate in each voxel.
This will determine the precision of the visibility information.

Other relevant parameters are related to the expected resource usage for the process.
The number of grid jobs (i.e. the number of voxels per job) and the memory and time limit
per job must be consistent and allow the full processing. For reference,
the time required to process 1'000'000 photons (in a single voxel) with `v08_62_00`
was a little above one minute, with memory usage safely below 2000 MB.
The smaller the jobs, the faster they may go (questionable),
the less costy is the failure of a job, and the more painful their bookkeeping is.
The values already encoded in the tools _might_ be proper already.
Also important, you have to identify where to store the output of the jobs
(and also of the helper scripts): a dCache area under your user is the recommended choice,
and it does not need to be `persistent` since job output is fragments that require
postprocessing, and after the postprocessing the fragments are not required any more.

The execution environment under a ICARUS GPVM should be interruptible (running inside a
[terminal multiplexer](https://github.com/tmux/tmux/wiki) is _strongly_ recommended),
it should be set up with the `icaruscode` version of choice
(e.g. `setup icaruscode v08_62_00 -q e19:prof`), and should have a current Kerberos5 ticket
and [grid certificate proxy](../Get_a_certificate_proxy.md).


### Running the jobs

After the setup stage described above, it's time to encode the chosen parameters
in the helper scripts and to run them.

The first helper script is called `neoSmazza.sh`. It lives in `icaruscode/PMT/scripts`
under the `icaruscode` repository, and in principle it should be installed with the release.
In practice, for example `icaruscode` `v08_62_00` has a derived script
`neoSmazza202008.sh` which is a legit `neoSmazza.sh` script but customised with
parameters proper for the photon library that was generated in August 2020.
Also, by mistake in _that_ release this script (and others) was not installed.
The `neoSmazza.sh` script generates the job configuration files (FHiCL and XML)
that `project.py` can use to drive the jobs, a XML file list which comes handy
when some action is required on _all_ the jobs (`xargs` is your friend there),
and also a "submission" script that can run a `project.py` command on all the jobs
at once.

So, the first step is to edit this file (best to make a custom copy of it)
and change the relevant parameters.
The ones you are going to most likely change are at the top of the script.
When the changes are done, the script can be run and it will create its things
as described above: make sure you record somewhere the path of the XML file list
and the submission script, which will both come handy soon.

> It is **strongly recommended** that a complete test run be executed before
> the final submission. A shortcut for this is to set the evironment variable
> `THISISATEST` to `1` to run the `neoSmazza.sh` script. This will just reduce
> the number of photons simulated per voxel, and time requested for the jobs.
> A wholly test photon library can, and should, be generated with this option
> to verify that all the technical steps are understood and working.

The next step will consist in running the submission script.
The path of that script was written by `neoSmazza.sh` on screen,
and it should have a name like `photonlibrary_builder_icarus-submit.sh`.
This goes through the list of XML job configuration files one by one,
submitting one job for each configuration file. It is slow enough that while I
have written all this documentation up to now, it has barely submitted 
25% of the jobs (my estimation is it will take about 3 hours...).
If you don't have to write this documentation, you can instead use a bit of that time
to open a new shell, set up the job submission client:
    
    source /cvmfs/fermilab.opensciencegrid.org/products/larsoft/setup
    setup jobsub_client
    
and check how the jobs are being queued with the standard commands
(hint: `jobsub_q --user "$USER" | less`).

Once no jobs is in queue any more, the standard and non-standard checks may be ran.
Running the submission script with the `project'py` option `--checkana`
will run a load of checks, and it will fail them all because either the current
version of `project.py` does not support this type of jobs (no input file
_and_ not _art_ ROOT output file) or I have not figured out how to explain them to it.
After this, we have a custom test script that will just check that the exit code
of the job was good.
If a job has failed, the job **must** be resubmitted until successful, lest the library
be left with a hole.
Once there is one ROOT output file per job, we are ready to the next step.


### Merging job output

Merging is done with another script, which picks the files from a file list,
does a few consistency checks, extracts metadata and the visibility information
out of them and put everything into a single ROOT file, which is the final product
of the procedure.
The script should also be able to warn of the lack of big (and small) chunks of voxels.
It may happen that some isolated voxels are "blind" and because of that they will not
appear in the photon library, but a large block of missing voxels are an alarm
likely indicating a missing input file (job failure or just an omission
in the input file list).
The script takes as input a pattern or a file list; it is recommended that the latter
is used, since the patterns that ROOT `TChain::Add()` supports are not very flexible
(like in, not flexible enough to comprise all the input files from our jobs).
The input file can be expressed in XRootD paths (which I believe is recommended)
or as UNIX paths. Additional information is requested, like a tag for the photon
library version and the software version used to process it.


### Command sequence

1. set up a working area with the chosen `icaruscode` version and [get a grid certificate proxy](../Get_a_certificate_proxy.md):
    
    source /cvmfs/icarus.opensciencegrid.org/products/icarus/setup_icarus.sh
    setup icaruscode v08_62_00 -q e19:prof
    
2. modify (a copy of) `neoSmazza.sh` script with the proper parameter values;
3. run the copy of `neoSmazza.sh`; it should takes no more than a few minutes with a healthy dCache status;
4. execute the submission script (something like `photonlibrary_builder_icarus-submit.sh`)

_to be completed_


