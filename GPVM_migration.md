---
layout: page
title: GPVM migration
description: GPVM and build nodes migration from SL7 to EL9
toc: true
---

GPVM migration
------------------------------------------------------------------------------------------------

SL7 is reaching EOF on June 30th.
Computing had many of its services already migrated to EL9 (AlmaLinux9),
migration for remaining services is underway.

The migration to EL9 will include migration of GPVMs and build nodes.
Computing set up test VMs and installed build nodes for users to get acquainted with EL9, those nodes are:

ICARUS:
- icarusbuild02.fnal.gov
- icarusgpvm-test-al9.fnal.gov

SBND:
- sbndbuild03.fnal.gov
- sbndgpvm-test-al9.fnal.gov

As part of the migration to EL9 build nodes that can't be upgraded to EL9 will be retired by June 30th.
This will affect sbndbuild01/02 and icarusbuild01.

SL7 development container
------------------------------------------------------------------------------------------------

Computing understands that there could be the need to be able to use
SL7 nodes during the migration and possibly also shortly after the migration.  
For this purpose we are preparing SL7 containers that can be used on
EL9 GPVMs and build nodes to run some SL7 task, as code development.
The contanier has development packages that allow to build SBN/SBND/ICARUS code stack.  
We would evaluate requests to install new packages during the test phase,
though we are also trying to minimize the number of packages installed in the SL7 container.
The rationale is that less packages we have, lower is the chance that some package would have
critical vulnerabilities that could require to remove packages from the container.
This would be a problem when SL7 repositories will be archived,
because at that point we wouldn't be able to rebuild the container to exclude packages.

To start the SL7 container users can run the following script:  
`sh /exp/$(id -ng)/data/users/vito/podman/start_Sl7dev.sh`  
this will give the prompt:  
`Apptainer>`

It could be needed to source the bashrc script from inside the SL7 container to get a look&feel more similar to usual SL7 VMs.  
`source ~/.bashrc`

Container features:
- it mounts the user home directory,
- it mounts /cvmfs to allow access to CVMFS repositories,
- it mounts /exp to allow access to app and data Ceph volumes,
- it mounts /pnfs to allow access to dCache (make sure to not overload the /pnfs mount point),
- the working directory is the user app area.

Grid job submission
------------------------------------------------------------------------------------------------

The SL7 development container doesn't allow the install of jobsub_lite. This means that users will need to submit jobs from the EL9 node.  
If users need to submit jobs using custom SL7 code build in the SL7 container, the code is accessible from the EL9 node,
where jobsub_lite can access the SL7 custom code to be used in grid jobs. Make sure to use the jobsub_submit option:  
`--singularity-image /cvmfs/singularity.opensciencegrid.org/fermilab/fnal-wn-sl7:latest`  
to make sure jobs on the grid run in a SL7 container.

Contact
------------------------------------------------------------------------------------------------

For any question/comment feel free to reach out by email or on slack the SBND/ICARUS CS-Liaison: Vito Di Benedetto
