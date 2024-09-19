---
layout: page
title: ReleaseNotes09910202
toc: true
---

-----------------------------------------------------------------------------
| v09.91.02.02 | 19 Sep 2024 | [ReleaseNotes](ReleaseNotes09910202.html) |
| --- | --- | --- |



sbndcode v09_91_02_02 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_91_02_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_91_02_02/sbndcode-v09_91_02_02.html)

Purpose
---------------------------------------------------

New features
---------------------------------------------------

Bug fixes
---------------------------------------------------

Updated dependencies
---------------------------------------------------

Supported qualifiers
---------------------------------------------------

Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2024-09-19  Brinden Carlson : Merge branch 'release/v09_91_02_02'
* 2024-09-19  Brinden Carlson : SBN2024A production v09_91_02_02
* 2024-09-18  Bear Carlson : Merge pull request #517 from SBNSoftware/feature/lynnt_wirecell_data
* 2024-09-18  Bear Carlson : Merge branch 'develop' into feature/lynnt_wirecell_data
* 2024-09-18  Bear Carlson : Merge pull request #520 from SBNSoftware/trj_tpcdecode_bulletproof_rcp_sep16_2024
* 2024-09-18  Bear Carlson : Merge branch 'develop' into trj_tpcdecode_bulletproof_rcp_sep16_2024
* 2024-09-18  Bear Carlson : Merge pull request #521 from SBNSoftware/feature/bearc_message_supression
* 2024-09-17  Bear Carlson : Update messages_sbnd.fcl
* 2024-09-16  Thomas Junk : bulletproof the call to removeCachedProduct -- handle case if handle is not valid
* 2024-09-16  lynnt20 : attempt to fix things for c14 compiler
* 2024-09-16  Bear Carlson : Merge pull request #518 from SBNSoftware/coackley_CIFix_v09_91_02
* 2024-09-16  Bear Carlson : Merge branch 'develop' into coackley_CIFix_v09_91_02
* 2024-09-16  Bear Carlson : Merge pull request #514 from SBNSoftware/feature/abeever_update_lifetime
* 2024-09-16  Bear Carlson : Merge branch 'develop' into feature/abeever_update_lifetime
* 2024-09-14  Rachel Coackley : Removed commented out line so the CI now works on v09_91_00
* 2024-09-13  Bear Carlson : Merge pull request #475 from SBNSoftware/feature/bethanym_hit_dumper_pr
* 2024-09-13  Bear Carlson : Merge branch 'develop' into feature/bethanym_hit_dumper_pr
* 2024-09-13  lynnt20 : additional ch num fixes
* 2024-09-13  Bethany McCusker : Update reco1_comm_muontrack_crtreco.fcl
* 2024-09-12  lynnt20 : fix the total number of ch in main jsonnets
* 2024-09-12  lynnt20 : update chresp json file name, add more comments in base fcl config
* 2024-09-11  Rachel Coackley : Allow CI to run on v09_91_02
* 2024-09-10  lynnt20 : revert change to sim jsonnet
* 2024-09-10  lynnt20 : Merge tag 'v09_91_02_01' into feature/lynnt_wirecell_data
* 2024-09-09  Anna B : Changed etime from 10 ms to 100 ms in detector properties
* 2024-09-09  Brinden Carlson : Merge tag 'v09_91_02_01' into develop
* 2024-09-06  Henry Lay : Final changes
* 2024-09-06  Henry Lay : Typo - correction
* 2024-09-06  Henry Lay : And again...
* 2024-09-06  Henry Lay : Tidy up fcls
* 2024-09-06  Henry Lay : Return defaults to sensible state
* 2024-09-06  Henry Lay : Merge remote-tracking branch 'origin/develop' into feature/bethanym_hit_dumper_pr
* 2024-09-05  lynnt20 : update chresp file name
* 2024-08-23  Anna B : Changed lifetime from 10 ms to 100 ms
* 2024-08-07  lynnt20 : need to use 'null' instead of empty string for empty file name
* 2024-08-06  lynnt20 : Merge tag 'v09_91_02' into feature/lynnt_wirecell_data
* 2024-08-06  lynnt20 : add block for parametrized per channel electronics response for data in fcl and jsonnet
* 2024-08-06  lynnt20 : - allowing perchannel electronics response, removing changes to jsonnet for simulation, using NF field response from uboone instead of PD
* 2024-07-29  lynnt20 : temporarily add chresp file to mc sp-only jsonnet
* 2024-06-20  Henry Lay : Update run_muontrack_crtreco.fcl
* 2024-06-20  Henry Lay : Update sbndcode/Commissioning/fcls/run_muontrack_crtreco.fcl
* 2024-06-20  bethmccusker : another slight change
* 2024-06-20  bethmccusker : slight change
* 2024-06-20  bethmccusker : a few more pr changes
* 2024-06-19  bethmccusker : Slight change
* 2024-06-19  bethmccusker : Some more pr changes
* 2024-06-18  bethmccusker : changes requested from pr
* 2024-05-28  Henry Lay : Clean up for PR
* 2024-05-28  bethmccusker : changed crt track angle variables from radians to degrees
* 2024-05-14  Henry Lay : Add badly written fcl for current workflow
* 2024-05-14  Henry Lay : Change defaults for hitdumper
* 2024-05-14  Henry Lay : Add CRT reco2 producers to fcl
* 2024-05-14  Henry Lay : Ensure larger values for max filled trees
* 2024-05-14  Henry Lay : Update fcl for correct new names
* 2024-05-14  Henry Lay : Few cleanups
* 2024-05-13  bethmccusker : :)
* 2024-05-13  bethmccusker : CRT track variable now alll working
* 2024-05-13  bethmccusker : got CRT track varibles in trees
* 2024-05-10  Henry Lay : Add CRT SpacePoint & Cluster info
* 2024-05-10  Henry Lay : Implement CRT strip hits in HitDumper
* 2024-05-09  Henry Lay : Add Amy & Flavia's updates unrelated to CRT

sbndutil 
---------------------------------------------------

* 2024-09-19  Brinden Carlson : Merge tag 'v09_91_02_02' into develop
* 2024-09-19  Brinden Carlson : Merge branch 'release/v09_91_02_02'
* 2024-09-19  Brinden Carlson : SBN2024A production v09_91_02_02
* 2024-09-09  Brinden Carlson : Merge tag 'v09_91_02_01' into develop
