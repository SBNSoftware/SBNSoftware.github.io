---
lang: en
title: ReleaseNotes083002
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.30.02   09/16/2019         [Release Notes](ReleaseNotes083002.html)
  ----------- ------------ -- -- ------------------------------------------------------



sbndcode v08\_30\_02 Release Notes(#sbndcode-v08_30_02-Release-Notes)
======================================================================================

-   **Table of contents**
-   [sbndcode v08\_30\_02 Release
    Notes](#sbndcode-v08_30_02-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v08\_30\_02](#sbndcode-v08_30_02)
    -   [sbndutil v08\_30\_02](#sbndutil-v08_30_02)

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v08\_30\_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_30_02/sbndcode-v08_30_02.html){.external}



Purpose(#Purpose)
----------------------------------

-   Weekly release



New features(#New-features)
--------------------------------------------

-   Noise model update
-   Trigger emulator for making optical waveforms



Bug fixes(#Bug-fixes)
--------------------------------------



Updated dependencies(#Updated-dependencies)
------------------------------------------------------------

-   [LArSoft
    v08.30.02](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes083002){.external}



Change List(#Change-List)
==========================================



sbndcode v08\_30\_02(#sbndcode-v08_30_02)
----------------------------------------------------------

-   2019-09-16 Thomas Brooks : Merge branch \'release/v08\_30\_02\'
-   2019-09-16 Thomas Brooks : Update for larsoft v08\_30\_02
-   2019-09-12 gputnam : Merge branch \'feature/gputnam-PTBemulator\'
    into develop
-   2019-09-12 gputnam : don\'t overwrite old trigger locations
-   2019-09-11 gputnam : bugfix
-   2019-09-11 Lynn Garren : fix c2 build
-   2019-09-06 Andrew Scarff : Updating noise sim to match data from
    ICEBERG
-   2019-09-06 gputnam : Merge branch \'feature/gputnam-PTBemulator\'
    into develop
-   2019-09-06 gputnam : Fix compilation errors.
-   2019-09-06 gputnam : Integrate trigger algorithm with digitizer
    module.
-   2019-09-06 gputnam : Fhicl config for trigger algorithm.
-   2019-09-06 gputnam : Add in different thresholds for Arapuca/PMT
    channels. Setup masked channels correctly. Correct timing bugs for
    finding trigger times.
-   2019-09-06 gputnam : Add in option to query baseline from digitizer
    algorithms.
-   2019-09-06 Thomas Brooks : Merge tag \'v08\_30\_01\' into develop
-   2019-09-04 gputnam : First draft of trigger emulator for making
    Optical waveforms.
-   2019-09-04 gputnam : Make const functions in pdMap const.



sbndutil v08\_30\_02(#sbndutil-v08_30_02)
----------------------------------------------------------

-   2019-09-16 Thomas Brooks : Merge branch \'release/v08\_30\_02\'
-   2019-09-16 Thomas Brooks : Update for larsoft v08\_30\_02
-   2019-09-06 Thomas Brooks : Merge tag \'v08\_30\_01\' into develop
