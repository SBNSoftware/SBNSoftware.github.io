---
layout: page
title: NAS migration to CephFS
description: Detail on app/data volimes migration
toc: true
---




NAS migration to CephFS
==================================================

Storage Team scheduled for Nov 15th 2023 the migration from NAS to CephFS for Scintific NAS volumes used by:
SBN, SBND and ICARUS

> *Users are encouraged to remove unused/unneeded files from app and data volumes to easy the migration.*

There are three main volumes that need to be migrated:
- **app**: Storage will take care of copying the app areas.
- **data**: Users are required copy over the data areas by themselves.
- **daq**: (SBND only for test stand nodes) Users are required to copy over their data from the daq areas by themselves.

This migration requires downtime. The timeline would be the following:
- On 11/15/23 at 09:00 am with a duration of 8 hours (possibly less), the downtime begins, Storage Team starts necessary steps for the migration.
During this time, the data in the app areas won’t be accessible.

> NOTE:
>  - this implies shared accounts, including production accounts icaruspro and sbndpro, that have the home directory in app volume to not be able to login.
>  - the 8h downtime is probably overestimate, Storage Team want to make sure they have all the time they need for the app volume migration, possibly the downtime will be shorter.
>  - The following day (11/16/23), Storage Team will be available to make sure the migration was completed.

The new mount points for CephFS will get a "/exp" prefix:

NAS volume   | CephFS volume
-------------| ------------------
/sbnd/app    |  /exp/sbnd/app
/sbnd/data   |  /exp/sbnd/data
/sbn/app     |  /exp/sbn/app
/sbn/data    |  /exp/sbn/data
/icarus/app  |  /exp/icarus/app
/icarus/data |  /exp/icarus/data

The old NAS volumes will be available until they are discontinued (approx May 2024)
- Other than that, the CephFS file system will work the same as the NAS from the users’ perspective. You can find user documentation in the [Ceph FIFE wiki page](https://fifewiki.fnal.gov/wiki/Ceph).

More details can be found in slides presented at Oct 31 SBN AI Meeting:
[Storage migration from NAS to CephFS](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=33502)

For any comment/concern feel free to reach out by email or on slack SBND/ICARUS CS-Liaison: [Vito Di Benedetto](mailto:vito@fnal.gov)
