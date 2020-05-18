---
lang: en
title: ReleaseNotes083202
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.32.02   10/22/2019         [Release Notes](ReleaseNotes083202.html){.wiki-page}
  ----------- ------------ -- -- ------------------------------------------------------

[]{#sbndcode-v08_32_02-Release-Notes}

sbndcode v08\_32\_02 Release Notes[¶](#sbndcode-v08_32_02-Release-Notes){.wiki-anchor}
======================================================================================

-   **Table of contents**
-   [sbndcode v08\_32\_02 Release
    Notes](#sbndcode-v08_32_02-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v08\_32\_02](#sbndcode-v08_32_02)
    -   [sbndutil v08\_32\_02](#sbndutil-v08_32_02)

[list of sbndcode
releases](List_of_SBND_code_releases.html){.wiki-page}\
Download instructions for [sbndcode
v08\_32\_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_32_02/sbndcode-v08_32_02.html){.external}

[]{#Purpose}

Purpose[¶](#Purpose){.wiki-anchor}
----------------------------------

[]{#New-features}

New features[¶](#New-features){.wiki-anchor}
--------------------------------------------

-   Update CRT API for compatibility with sbncode.
-   Fix slow light simulation by switching off Cherenkov light in fcl.
-   Bug fixes to optical digitization.

[]{#Bug-fixes}

Bug fixes[¶](#Bug-fixes){.wiki-anchor}
--------------------------------------

[]{#Updated-dependencies}

Updated dependencies[¶](#Updated-dependencies){.wiki-anchor}
------------------------------------------------------------

-   [LArSoft
    v08.32.02](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes083202){.external}

[]{#Change-List}

Change List[¶](#Change-List){.wiki-anchor}
==========================================

[]{#sbndcode-v08_32_02}

sbndcode v08\_32\_02[¶](#sbndcode-v08_32_02){.wiki-anchor}
----------------------------------------------------------

-   2019-10-17 Thomas Brooks : Merge branch \'release/v08\_32\_02\'
-   2019-10-17 Thomas Brooks : Update for larsoft v08\_32\_02
-   2019-10-16 Thomas Brooks : Fix c2 build
-   2019-10-15 gputnam : Merge branch \'feature/gputnam-PTBemulator2\'
    into feature/gputnam-test-merge
-   2019-10-15 gputnam : Change sampling units to be consistent with
    start time units us/MHz
-   2019-10-14 gputnam : Merge branch \'feature/gputnam-PTBemulator2\'
    into feature/gputnam-test-merge
-   2019-10-14 gputnam : don\'t print channel in op hit finder.
-   2019-10-14 gputnam : Merge branch \'feature/gputnam-PTBemulator2\'
    into feature/gputnam-test-merge
-   2019-10-14 gputnam : fix compilation bug
-   2019-10-14 gputnam : Merge branch \'feature/gputnam-PTBemulator2\'
    into feature/gputnam-test-merge
-   2019-10-14 gputnam : Correct units of hit-finding frequency.
-   2019-10-14 gputnam : Merge branch \'feature/gputnam-PTBemulator2\'
    into feature/gputnam-test-merge
-   2019-10-14 gputnam : Revert change to readout window of optical
    detectors.
-   2019-10-14 gputnam : Merge branch \'feature/gputnam-PTBemulator2\'
    into feature/gputnam-test-merge
-   2019-10-14 gputnam : Merge branch \'feature/gputnam-CRT-API-Update\'
    into feature/gputnam-test-merge
-   2019-10-14 gputnam : Merge branch \'feature/gputnam-PTBemulator2\'
    of ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into
    feature/gputnam-PTBemulator2
-   2019-10-14 gputnam : Add transit time back into PMT digitization.
-   2019-10-14 Diego Gamez : reorganizing light simulation information
-   2019-10-10 Thomas Brooks : Merge tag \'v08\_32\_01\' into develop
-   2019-10-01 gputnam : Bugfix in trigger primitive merging algorithm.
-   2019-09-26 Iker Loïc de Icaza Astiz : Add hist id to the waveforms
    to make sure th1 names are not repeated
-   2019-09-25 gputnam : Initialize per-channel trigger locations list
    even when none exist.
-   2019-09-24 gputnam : Change in configuration for trigger from
    previous commit.
-   2019-09-24 gputnam : Change digitizer: keep generated waveforms
    around in memory to avoid making twice. Call clear function in
    trigger algoritm. Add in option of whether to apply triggers to
    waveforms.
-   2019-09-24 gputnam : Update trigger module to also not require
    hard-coded fixing.
-   2019-09-24 gputnam : Remove old configuration settings from fhicl.
-   2019-09-20 gputnam : Update trigger algorithm to account for ranges
    where triggers are high.
-   2019-09-20 gputnam : Fix compile bug in new digitizer interface.
-   2019-09-19 gputnam : Add in option to specify time range to CRT Hit
    matching.
-   2019-09-18 gputnam : Update digitizer interface so that trigger
    emulator controls necessart configuration like readout windows.
-   2019-09-18 gputnam : Fix optical clock value in configuration and
    remove hard-coded fixing.
-   2019-09-17 gputnam : Fix timing in optical hit finder with change in
    waveforms.
-   2019-09-12 gputnam : Hacky fix to histogram-based Optical Hit
    finding.
-   2019-09-12 gputnam : Bubfix in triggering algorithm.
-   2019-09-12 gputnam : Set optical readout window for standard detsim.
-   2019-09-12 gputnam : Add in API to provide services anddata products
    directly to algorithms. Remove dependency on TPCGeo class and add in
    helper functions to new TPCGeoUtil file.
-   2019-09-12 gputnam : further removal of unnecsary header files.
-   2019-09-10 gputnam : Remove unecessary header files more.
-   2019-09-10 gputnam : Remove unecessary header files.

[]{#sbndutil-v08_32_02}

sbndutil v08\_32\_02[¶](#sbndutil-v08_32_02){.wiki-anchor}
----------------------------------------------------------

-   2019-10-17 Thomas Brooks : Merge branch \'release/v08\_32\_02\'
-   2019-10-17 Thomas Brooks : Update for larsoft v08\_32\_02
-   2019-10-11 Dominic Brailsford : Add comments
-   2019-10-11 Dominic Brailsford : bump again
-   2019-10-11 Dominic Brailsford : Bump sbndcode version
-   2019-10-11 Dominic Brailsford : Use the sbndutil metadata extractor
    again
-   2019-10-10 Thomas Brooks : Merge tag \'v08\_32\_01\' into develop
