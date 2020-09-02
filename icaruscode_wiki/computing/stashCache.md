StashCache area for ICARUS
===========================

The StashCache mechanism is explained in its own entry in the [FIFE wiki](https://cdcvs.fnal.gov/redmine/projects/fife/wiki/Introduction_to_FIFE_and_Component_Services#OASISCVMFS-process-for-handling-partially-reused-data-files-StashCache).

Suffice to say, ICARUS does have such a facility available, and the data can be accessed from the paths:
* `/cvmfs/icarus.osgstorage.org/pnfs/fnal.gov/usr/icarus/persistent/stash` (recommended?)
* `/pnfs/icarus/persistent/stash`

## Writing data into StashCache

Directory `/pnfs/icarus/persistent/stash` is owned by the collective user `icaruspro`.
For a user to be able to write in there, she can either:

* log in a dCache-aware node (e.g. an [ICARUS GPVM](../Computing_Resources.md#where-to-work-interactive-nodes-gpvm)) as `icaruspro` via
    
    ssh icaruspro@icarusgpvm.fnal.gov
    
  using Kerberos authentication; this works only if that user is authorized
  to present herself as `icaruspro` (which translates into her Kerberos principal
  `user@FNAL.GOV` being listed in `~icaruspro/.k5login` file)
* use IFDH (`ifdh cp`) to copy directly the data; this requires a
  [grid certificate proxy](../Get_a_certificate_proxy.md)
  **with role `Production`** (the usual role is `Analysis`), and again this
  role must have been explicitly granted to the user.

## Accessing StashCache

[ICARUS General Purpose Virtual Machines](../Computing_Resources.md#where-to-work-interactive-nodes-gpvm)
are already configured to access StashCache both via `/pnfs` and via `/cvmfs` paths (the former can be turned into a XRootD URL).

Other systems can access it via CVMFS using the path described above.
[Instructions are available](../Computing_Resources.md#cvmfs) to enable CVMFS on a machine.

