---
layout: page
title: NAS migration to CephFS
description: Detail on app/data volumes migration
toc: true
---

NAS migration to CephFS
------------------------------------------------------------------------------------------------

Storage Team migrated Scintific NAS volumes used by SBN, SBND and ICARUS to CephFS.  
There are three main volumes that have been migrated:
- **app**: Storage Team took care of copying the app area content to the new area.
- **data**: Users are required to copy over their data areas by themselves.
- **daq**: (SBND only for test stand nodes) Users are required to copy over their data from the daq areas by themselves (SLAM Team could help).

📣 **⚠️ The app volumes will be unmounted on Dec 13th ⚠️**

> NOTE:
> - *Users are encouraged to migrate useful files from data volumes ASAP.*  
> - The old NAS data volumes will be available until the NAS is discontinued (before May 2024)  
> - The old NAS app volumes have been mounted in ReadOnly mode to prevent users to accidentally create/edit files there and possibly lose them once the NAS app volumes are discontinued.

- The new mount points for CephFS will get a "/exp" prefix:

NAS volume   | CephFS volume
:------------| :-----------------
/sbnd/app    |  /exp/sbnd/app
/sbnd/data   |  /exp/sbnd/data
/sbn/app     |  /exp/sbn/app
/sbn/data    |  /exp/sbn/data
/icarus/app  |  /exp/icarus/app
/icarus/data |  /exp/icarus/data


- Other than the different mount point, the CephFS file system will work the same as the NAS from the users’ perspective.  
  Some CephFS user documentation can be found in the [Ceph FIFE wiki page](https://fifewiki.fnal.gov/wiki/Ceph).

- Snapshots  
💡 Snapshots are available in the app areas only. They are created once a day and kept for 14 days.  
They are located within a hidden .snap directory within each Cephfs directory.  
You can see all the snapshots with: `ls app/<directory>/.snap`  
This can be done at any level of the directory tree. The .snap directories are special and will not appear in the containing directory listing.

- Directory usage  
💡 CephFS makes some additional information available via extended attributes. Users can view the total size used by a directory and all its subdirectories with: `getfattr -n ceph.dir.rbytes <directory>`.


MRB build area in the CephFS app volume
------------------------------------------------------------------------------------------------

After the migration the MRB build area in the new CephFS app volume is a copy of what was available in the NAS app volume.
This means that, in the CephFS app volume, the `setup` script in the `localProducts` folder will point to the development area in the old app volume.
The easier way to reuse an existing MRB development area that has been migrated to the CephFS app volume is to remove all but the `srcs` folder, this is the folder where the code users are working on is located.
The procedure to reuse an existing MRB development area would look like the following:
- remove the `build` folder,
- remove the `localProducts` folder,
- source the experiment setup script from CVMFS:  
  ICARUS: `source /cvmfs/icarus.opensciencegrid.org/products/icarus/setup_icarus.sh`  
  SBND: `source /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh`
- run `mrb newDev -f <options>` with usual options to prepare the MRB development area.  
A possible example, picking up a random code release and associated qualifier, would look like this:  
`mrb newDev -f -v v09_78_06 -q e20:prof`  
Here the option `-f` is needed to use a non-empty directory, as there will be a pre-existing `srcs` folder.

> ⚠️ Users can use the MRB development area from the old app volume only as is, app volumes are mounted RO. ⚠️  
> ⚠️ Code development can continue only on new CephFS app volumes. ⚠️


Python virtual env
------------------------------------------------------------------------------------------------

Also python virtual env (venv) area are affected by the NAS migration.
Users that were using python venv are required to reconfigure their venv area from scratch on the new CephFS app volume.
This because the venv are possibly is still pointing to the old NAS app area.
In case during the setup of the new venv area there could be issues with some python module, users can check the version of packages they have on the old venv area.
For this purpose, once the old venv area has been activated, `pip list -v` would provide all modules with their version and path.
Another useful command could be `pip freeze` to get a list of modules in a format that could be used in a requirements file.


Contact
------------------------------------------------------------------------------------------------

For any comment/concern feel free to reach out by email or on slack the SBND/ICARUS CS-Liaison: Vito Di Benedetto
