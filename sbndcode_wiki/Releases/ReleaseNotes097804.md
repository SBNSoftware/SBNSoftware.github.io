---
layout: page
title: ReleaseNotes097804
toc: true
---

-----------------------------------------------------------------------------
| v09.78.04 | 21 Sep 2023 | [ReleaseNotes](ReleaseNotes097804.html) |
| --- | --- | --- |



sbndcode v09_78_04 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_78_04](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_78_04/sbndcode-v09_78_04.html)

Purpose
---------------------------------------------------
Weekly release

New features
---------------------------------------------------
* SBNSoftware/sbndcode#382
  * Added option to read MCParticle information in hitdumper tree
* SBNSoftware/sbndcode#384 & SBNSoftware/sbndcode#385
  * TPC Decoder module and Channel Map Service

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------
* sbncode v09_78_04
* larsoft v09_78_04

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2023-09-21  Fran Nicolas : Merge branch 'release/v09_78_04'
* 2023-09-21  Fran Nicolas : Update to larsoft v09_78_04
* 2023-09-21  Francisco Javier Nicolás-Arnaldos : Merge pull request #382 from SBNSoftware/feature/brindenc
* 2023-09-14  Francisco Javier Nicolás-Arnaldos : Merge pull request #385 from tomjunk/develop
* 2023-09-07  Thomas Junk : Merge branch 'develop' of https://github.com/tomjunk/sbndcode into develop
* 2023-09-07  Thomas Junk : fix off-by-one bug
* 2023-09-07  Thomas Junk : move TPC decoder defaults to a fcl with a PROLOG for inclusion in other fcls
* 2023-09-07  Francisco Javier Nicolás-Arnaldos : Merge pull request #384 from tomjunk/develop
* 2023-09-05  Thomas Junk : update sbncode version and add a warning setting gotten from sbndaq-artdaq-core
* 2023-09-05  Thomas Junk : remove initialization of unused variables
* 2023-09-05  Thomas Junk : remove unused variables to make clang happy
* 2023-09-04  Fran Nicolas : Merge tag 'v09_78_02' into develop
* 2023-09-01  Thomas Junk : change Decode directory name to Decoders to be consistent with PR383 and also change ChannelMap to ChannelMaps
* 2023-08-28  Thomas Junk : rename analysis class from HeaderData to TPCDecodeAna and throw an exception if database access for channel map is requested
* 2023-08-25  Thomas Junk : declare channel map service properly
* 2023-08-25  Thomas Junk : add a version to classes_def, and make RDTimeStamps and associations
* 2023-08-24  Thomas Junk : TPC decoder for sbndcode
* 2023-08-24  Thomas Junk : Configuration defaults for the TPC Channel Map Service
* 2023-08-24  Thomas Junk : TPC map service
* 2023-08-24  Bear Carlson : Update run_hitdumper.fcl to preserve defaults
* 2023-08-24  Brinden Carlson : Added ophit information
* 2023-08-22  Brinden Carlson : Fixed number of primaries reset vars
* 2023-08-22  Brinden Carlson : Added MCTrack/Shower info as well
* 2023-08-21  Brinden Carlson : corrected fcl name
* 2023-08-21  Brinden Carlson : Added option to read MCParticle information

sbndutil
---------------------------------------------------

* 2023-09-21  Fran Nicolas : Merge tag 'v09_78_04' into develop
* 2023-09-21  Fran Nicolas : Merge branch 'release/v09_78_04'
* 2023-09-21  Fran Nicolas : Update to larsoft v09_78_04
* 2023-09-04  Fran Nicolas : Merge tag 'v09_78_02' into develop
