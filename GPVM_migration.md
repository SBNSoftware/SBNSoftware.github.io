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

The migration to EL9 will include migration of GPVMs and builds node.
Computing set up test VMs for users to get acquainted with EL9, those nodes are:  
- icarusgpvm-test-al9.fnal.gov
- sbndgpvm-test-al9.fnal.gov
  
rispectively for ICARUS and SBND.

As part of the migration to EL9 build nodes will be upgraded.
SBND is getting the new build node sbndbuild03 installed with EL9.  
Current build nodes sbndbuild01/02 cannot be upgraded to EL9, they
will be retired by June 30.

ICARUS build node icarusbuild02 is scheduled to be upgraded to EL9 on March 4th.  
The build node icarusbuild01 cannot be upgraded to EL9, it will be retired by June 30.

SL7 development container
------------------------------------------------------------------------------------------------

Computing understands that there could be the need to be able to use
SL7 nodes during the migration and possibly also shortly after the migration.  
For this purpose we are preparing SL7 containers that can be used on
EL9 GPVMs and build nodes to run some SL7 task, as code development.

To start the SL7 container users can run the following script:  
`sh /exp/$(id -ng)/data/users/vito/podman/start_Sl7dev.sh`  
this will give the prompt:  
`Apptainer>`

The contanier has development packages that allow to build SBN/SBND/ICARUS code stack.

It mounts:
- the user home directory,
- /cvmfs to allow access to CVMFS repositories,
- /exp to allow access to app and data Ceph volumes,
- /pnfs to allow access to dCache (make sure to not overload the /pnfs mount point),
- the working directory is the user app area.


Contact
------------------------------------------------------------------------------------------------

For any question/comment feel free to reach out by email or on slack the SBND/ICARUS CS-Liaison: Vito Di Benedetto
