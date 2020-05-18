---
lang: en
title: ReleaseNotes082500
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.25.00   07/15/2019         [Release Notes](ReleaseNotes082500.html)
  ----------- ------------ -- -- ------------------------------------------------------

{#sbndcode-v08_25_00-Release-Notes}

sbndcode v08\_25\_00 Release Notes(#sbndcode-v08_25_00-Release-Notes)
======================================================================================

-   **Table of contents**
-   [sbndcode v08\_25\_00 Release
    Notes](#sbndcode-v08_25_00-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v08\_25\_00](#sbndcode-v08_25_00)
    -   [sbndutil v08\_25\_00](#sbndutil-v08_25_00)

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v08\_25\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_25_00/sbndcode-v08_25_00.html){.external}

{#Purpose}

Purpose(#Purpose)
----------------------------------

-   Weekly release

{#New-features}

New features(#New-features)
--------------------------------------------

-   Modifications to optical digitization algorithms to provide an
    easier way to run the digitizer.
-   BREAKING: Fix the CRT clock speed (16 -\> 1000 MHz).
    -   To run sbndcode on files generated with previous versions you
        will need to change the clock speed in crtsimmodules\_sbnd.fcl

{#Bug-fixes}

Bug fixes(#Bug-fixes)
--------------------------------------

{#Updated-dependencies}

Updated dependencies(#Updated-dependencies)
------------------------------------------------------------

-   [LArSoft
    v08.25.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes082500){.external}

{#Change-List}

Change List(#Change-List)
==========================================

{#sbndcode-v08_25_00}

sbndcode v08\_25\_00(#sbndcode-v08_25_00)
----------------------------------------------------------

-   2019-07-15 Thomas Brooks : Merge branch \'release/v08\_25\_00\'
-   2019-07-15 Thomas Brooks : Update for larsoft v08\_25\_00
-   2019-07-09 Thomas Brooks : Also need to scale the coincidence
    windows when changing the tick values for the CRT
-   2019-07-09 Thomas Brooks : Change speed of CRT clock (16 -\> 1000
    MHz), no longer use DetectorClocks
-   2019-07-09 Thomas Brooks : Comment out unused variables for c2
    compilation
-   2019-07-04 Laura Paulucci Marinho : Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into feature/lp\_ophit
-   2019-07-01 Thomas Brooks : Merge tag \'v08\_24\_00\' into develop
-   2019-06-19 Laura Paulucci Marinho : ophit module and corrections to
    optical digitizer

{#sbndutil-v08_25_00}

sbndutil v08\_25\_00(#sbndutil-v08_25_00)
----------------------------------------------------------

-   2019-07-15 Thomas Brooks : Merge branch \'release/v08\_25\_00\'
-   2019-07-15 Thomas Brooks : Update for larsoft v08\_25\_00
-   2019-07-01 Thomas Brooks : Merge tag \'v08\_24\_00\' into develop
