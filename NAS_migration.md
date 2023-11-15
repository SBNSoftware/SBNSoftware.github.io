---
layout: page
title: NAS migration to CephFS
description: Detail on app/data volumes migration
toc: true
---

NAS migration to CephFS
------------------------------------------------------------------------------------------------

Storage Team scheduled *for Nov 15th 2023* the migration from NAS to CephFS of Scintific NAS volumes used by:
SBN, SBND and ICARUS

> *Users are encouraged to remove unused/unneeded files from app and data volumes to easy the migration.*

There are three main volumes that need to be migrated:
- **app**: Storage will take care of copying the app areas.
- **data**: Users are required copy over the data areas by themselves.
- **daq**: (SBND only for test stand nodes) Users are required to copy over their data from the daq areas by themselves (SLAM Team could help).

This migration requires downtime. The timeline would be the following:
- On 11/15/23 at 09:00 AM CT with a duration of 8 hours (possibly less), the downtime begins, Storage Team starts necessary steps for the migration.
During this time, the data in the app areas won’t be accessible.

> NOTE:
>  - this implies shared accounts, including production accounts icaruspro and sbndpro, that have their home directory in app volume, to not be able to login.
>  - the 8h downtime is probably overestimate, Storage Team want to make sure they have all the time they need for the app volume migration, possibly the downtime will be shorter.
>  - the following day (11/16/23), Storage Team will be available to make sure the migration was completed.
>  - the NAS app volume could stay mounted in ReadOnly mode untill Storage Team performs all check on the migration, the volume could be remounted in RW mode on the Nov 16th. 
>  - migration of content of users' data volume can start once the migration is complete.

The new mount points for CephFS will get a "/exp" prefix:

NAS volume   | CephFS volume
:------------| :-----------------
/sbnd/app    |  /exp/sbnd/app
/sbnd/data   |  /exp/sbnd/data
/sbn/app     |  /exp/sbn/app
/sbn/data    |  /exp/sbn/data
/icarus/app  |  /exp/icarus/app
/icarus/data |  /exp/icarus/data

The old NAS volumes will be available until they are discontinued (approx May 2024)
- Other than the different mount point, the CephFS file system will work the same as the NAS from the users’ perspective. Some CephFS ser documentation can be found in the [Ceph FIFE wiki page](https://fifewiki.fnal.gov/wiki/Ceph).

More details can be found in slides presented at Oct 31 SBN AI Meeting:
[Storage migration from NAS to CephFS](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=33502)


MRB build area in the CephFS app volume
------------------------------------------------------------------------------------------------

After the migration the MRB build area in the new CephFS app volume is a copy of what was available in the NAS app volume.
This means that, in the CephFS app volume, the `setup` script in the `localProducts` folder will point to the development area in the old app volume.
The easier way to reuse an existing MRB development area once it has been migrated to the CephFS volume is to remove all but the `srcs` folder with the code users are working on.
The procedure to reuse an existing MRB development area would look like the following:
- remove the `build` folder,
- remove the `localProducts` folder,
- source the experiment setup script from CVMFS
- run `mrb newDev -f <options>` with usual options to prepare the MRB development area.  
A possible example, picking up a random code release and associated qualifier, would look like this:  
`mrb newDev -f -v v09_78_06 -q e20:prof`  
Here the option `-f` is needed to use a non-empty directory, as there will be a pre-existing `srcs` folder.

> It is recommended to use the MRB development area from the old NAS app volume only to use what has been built there as it is,  
while continue with code development on the new CephFS app volume.


Contact
------------------------------------------------------------------------------------------------

For any comment/concern feel free to reach out by email or on slack the SBND/ICARUS CS-Liaison: [Vito Di Benedetto](mailto:vito@fnal.gov)

