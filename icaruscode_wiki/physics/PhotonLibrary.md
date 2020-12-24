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
   the standard strategy is that each job is single-threaded, covers a certain contiguous range
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
the time required to process 1'000'000 photons (in a single voxel) with `v09_00_00`
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
(e.g. `setup icaruscode v09_00_00 -q e19:prof`) and job submission software
(`setup jobsub_client`), and should have a current Kerberos5 ticket
and [grid certificate proxy](../Get_a_certificate_proxy.md).


### Running the jobs

After the setup stage described above, it's time to encode the chosen parameters
in the helper scripts and to run them.

The first helper script is called `neoSmazza.sh`. It lives in `icaruscode/PMT/scripts`
under the `icaruscode` repository, and in principle it should be installed with the release.
In practice, for example `icaruscode` `v09_00_00` has a derived script
`neoSmazza202008.sh` which is a legit `neoSmazza.sh` script but customised with
parameters proper for the photon library that was generated in August 2020.
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
and we'll call it `campaign.sh` in this text (the default campaign name is
`photonlibrary_builder_icarus`, so the default script name is
`photonlibrary_builder_icarus-submit.sh`).
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
will run a load of checks. Unfortunately it will not keep in separate lists
the jobs that need to be resubmitted or have failed or are otherwise unsuccessful.
The same script used to submit the jobs may also be used to check all of them,
running it with `--checkana` option (`campaign-submit.sh --checkana`).
(`campaign.sh` is a placeholder for the list produced and advertised by
`neoSmazza.sh`, with full path).
In the best case, the script will report no error (don't hold your breath).
Either way, after this we have a custom test script that will just collect
the jobs in practical XML file lists written in the same directory
as the input XML file list; these additional lists can be used
to address the failing jobs:
    
    CheckPhotonLibraryJobs.py campaign-xml.list
    
If a job has failed, the job **must** be resubmitted until successful, lest the library
be left with a hole. A convenient way to do that is to clean up first, and then submit:
    
    xargs -l project.py --clean --xml < campaign-badxml.list
    xargs -l project.py --submit --xml < campaign-badxml.list
    
`GOTO 1`. **But** first one has to investigate the failure.
If for example the job took too much time, or memory, the relevant configuration
parameters in the configuration XML file of the failing jobs must be changed
to reflect that.
The next time `CheckPhotonLibraryJobs.py` can be ran with the option `--skipgood`
which will make the check of the jobs that are already marked as good _slighty_
faster.

Once there is one ROOT output file per job, we are ready to the next step.
`CheckPhotonLibraryJobs.py` has also produced a file list with all output files in,
whose path is printed by the script itself at the end (we'll call it
`campaign-outputfile.list` here).


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
The script name is `MergePhotonLibrary.C`: it is a ROOT macro and it is documented
inline in Doxygen format. It is currently distributed with `icaruscode` as a "executable"
(`${ICARUSCODE_FQ_DIR}/bin/MergePhotonLibrary.C`).
Note that this can take *long*, and part of the processing is in ROOT's hands,
and ROOT does not provide progress feedback (a real life case tool 15 minutes
for that part alone). The script will report any missing voxel. A voxel is missing
if no PMT collected any one photon coming from that voxel. There are two main
possibilities:

1. the voxel is (almost) blind: all its liquid argon is shielded from the PMT;
2. a file was skipped.

The report of the script says something like:
    
     => 5982 voxels missing in 5982 blocks (0 blocks at least 10 voxel big)!
    
The `0 blocks at least 10 voxel big` suggests that there is no missing file,
in which case there would be large blocks missing (e.g. 1850 voxels in a row).
The 5982 missing voxels are isolated (in as many "blocks"), and it can then be
presumed that  of the "blind" type.
An additional recommended step is to have ROOT "recompress" the library,
which may gain 5-10% of disk space.
A ROOT script, `RecompressROOTtrees.C`, is distributed for that purpose.


### Command sequence

> The names and tags in these commands are the ones used for the August 2020 production.

1. set up a working area with the chosen `icaruscode` version and [get a grid certificate proxy](../Get_a_certificate_proxy.md):
       
       source /cvmfs/icarus.opensciencegrid.org/products/icarus/setup_icarus.sh
       setup icaruscode v09_00_00 -q e19:prof
       setup jobsub_client
       
2. modify (a copy of) `neoSmazza.sh` script with the proper parameter values;
3. run the copy of `neoSmazza.sh`; it should takes no more than a few minutes with a healthy dCache status;
4. execute the submission script (something like `photonlibrary_builder_icarus-submit.sh`)
5. check when all jobs have completed: `jobsub_q --user "$USER" | less`
6. check the success of the jobs:
       
       photonlibrary_builder_icarus-submit.sh --checkana
       CheckPhotonLibraryJobs.py /pnfs/icarus/scratch/users/${USER}/jobOutput/photonlibrary_builder_icarus/20200816/photonlibrary_builder_icarus-xml.list

7. clean the output of the jobs to be resubmitted:
       
       grep -v ^# /pnfs/icarus/scratch/users/petrillo/jobOutput/photonlibrary_builder_icarus/20200816/photonlibrary_builder_icarus-badxml.list | xargs -l project.py --clean --xml
       
8. after changing their configuration if needed, resubmit them:
       
       grep -v ^# /pnfs/icarus/scratch/users/petrillo/jobOutput/photonlibrary_builder_icarus/20200816/photonlibrary_builder_icarus-badxml.list | xargs -l project.py --submit --xml
       
9. check the success of the jobs (note: `checkana` only on the new ones, `CheckPhotonLibraryJobs.py` on all):
       
       grep -v ^# /pnfs/icarus/scratch/users/${USER}/jobOutput/photonlibrary_builder_icarus/20200816/photonlibrary_builder_icarus-badxml.list | xargs -l project.py --checkana --xml
       CheckPhotonLibraryJobs.py --skipgood /pnfs/icarus/scratch/users/${USER}/jobOutput/photonlibrary_builder_icarus/20200816/photonlibrary_builder_icarus-xml.list
       
   Back to point 7 if there are failures, otherwise move on.
10. once all job succeeded, merge the output files into the photon library:
        
        pnfsToXRootD < /pnfs/icarus/scratch/users/${USER}/jobOutput/photonlibrary_builder_icarus/20200816/photonlibrary_builder_icarus-outputfile.list > photonlibrary_builder_icarus-outputfile-xrootd.list
        root -l -q 'MergePhotonLibrary.C++(
          "PhotonLibrary-20200816-large.root",
          "photonlibrary_builder_icarus-outputfile-xrootd.list",
          "v09_00_00",
          "20200816",
          "PhotonLibraryData",
          "pmtresponse"
          )'
        
    To gain a bit in file size, it's worth asking ROOT to recreate the tree again; we have a script to do so, although there may be better ROOT ways to do the same:
        
        root -l -q 'RecompressROOTtrees.C("PhotonLibrary-20200816-large.root", "PhotonLib-20200816.root", 8, ROOT::kLZMA)'
        
    This procedure reduced the 20200925 library from 256 MB to 242 MB: quite small gain, but those few seconds less on each checkout, each run, each job, may be welcome bits.
    The ROOT scripts are distributed with `icaruscode` (`${ICARUSCODE_FQ_DIR}/bin`).
    
Photon library file `PhotonLibrary-20200816.root` is now ready for physics tests!


Past campaigns
---------------

| tag        | software     | included in               | primary output file          | motivation                                              |
| ---------- | ------------ | ------------------------- | ---------------------------- | ------------------------------------------------------- |
| `20200816` | `v08_62_01`* | `icarus_data` `v09_01_00` | `PhotonLibrary20200816.root` | updated refraction index and Rayleigh scattering length |
| `20200925` | `v09_04_01`* | `icarus_data` `v09_06_00` | `PhotonLibrary20200925.root` | TPC wires in geometry, and steel reflectivity           |
| `20201209` | `v09_10_01`  | `icarus_data` `v09_11_00` | `PhotonLibrary20201209.root` | opaque photodetectors                                   |

Campaigns with software versions marked with "*" had custom modifications.
This is not so uncommon, since issues arise on top of the releases.
Also not uncommon it is that the custom modifications are then added to the next release.

Unless otherwise noted, the changes from one campaign to the next are incremental.


### 20200816

The August 2020 campaign used a configuration with the default GEANT4+LArSoft settings from `icaruscode` `v08_62_01`,
which unfortunately do not include TPC wires.
This triggered the [September 2020](#20200816) campaign.

This campaign was set with 1'000'000 photons in each (5 cm)^3^ voxel, for 74 x 77 x 394 voxels.
Each job processed 1850 voxels, for a campaign including 1214 jobs.
Jobs mostly took 2 days or less, but some nodes managed not to fit into 3 days wall-clock,
which caused the change in the official configuration to request 96 wall clock hours.

Note that the interaction between `project.py` and dCache was affected by severe slowdown.


### 20200925

The September 2020 campaign used a configuration with the default GEANT4+LArSoft settings from `icaruscode` `v09_04_01`,
with modifications to incude steel reflectivity and to leave the TPC wires in the geometry.
In fact, usually TPC wires are removed when running the GEANT4 simulation
because they cause a dramatic slow down in the processing, for very limited physics effects.
When simulating the scintillation photon propagation, thought,
the wires occlude _at least_ 15% of the viewport of PMT
(up to 100% for extremely high incidence angles).
This effect can't be ignored.

This campaign was a rerunning of the [August 2020 campaign](#20200816),
set with the same 1'000'000 photons in each (5 cm)^3^ voxel, and 74 x 77 x 394 voxels.
Jobs mostly took 2.5 days, but some nodes managed not to fit into 4 days wall-clock,
which is a pretty hard limit in the current grid.
[Vito Di Benedetto](mailto:vito@fnal.gov) helped us with identifying the best-performing noded
in FermiGrid to submit the recovery jobs,
but for the future the number of voxels per job should be decreased (was 1850)
and the number of jobs increased accordingly (was 1214).
The settings used for this campaign have been integrated in `icaruscode` `v09_07_00`.

Note that the interaction between `project.py` and dCache was again affected by severe slowdown
and critical failures, which made bookkeeping harder.


### 20201209

The December 2020 campaign was a rerunning of the [September 2020 campaign](#20200925),
set with the same 1'000'000 photons in each (5 cm)^3^ voxel, and 74 x 77 x 394 voxels.
It thereby uses the same physics configuration as that previous campaign,
but the settings this time were already present in `icaruscode` `v09_10_01` release.
The amount of voxels per job was reduced with respect to the previosu campaign,
and a two-step strategy was attempted where a job would be scheduled for 2 days,
and if that fails automatically resubmitted with 3.5 days.
Due to the age of some of the working nodes, a handful of jobs managed to fail the 3.5 day limit,
but no job failed it twice (after manual resubmission).


Questions and answers
----------------------

### Why is not `project.py` enough?

The `project.py` tool facilitates the check and recovery of failed jobs.
Why is this load of custom check scripts even needed?
`project.py` is designed to deal with many subjobs sharing the same
configuration; each photon library job has instead a unique configuration
(pointing to a specific set of voxels), and is not split into subjobs.

