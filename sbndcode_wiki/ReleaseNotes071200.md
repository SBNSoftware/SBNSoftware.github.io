---
lang: en
title: ReleaseNotes071200
---

  ----------- ------------ -- -- ------------------------------------------------------
  v07.12.00   12/09/2018         [Release Notes](ReleaseNotes071200.html)
  ----------- ------------ -- -- ------------------------------------------------------



sbndcode v07\_12\_00 Release Notes(#sbndcode-v07_12_00-Release-Notes)
======================================================================================

-   **Table of contents**
-   [sbndcode v07\_12\_00 Release
    Notes](#sbndcode-v07_12_00-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v07\_12\_00](#sbndcode-v07_12_00)
    -   [sbndutil v07\_12\_00](#sbndutil-v07_12_00)

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v07\_12\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v07_12_00/sbndcode-v07_12_00.html){.external}



Purpose(#Purpose)
----------------------------------

-   Weekly release



New features(#New-features)
--------------------------------------------

-   CRT-TPC track matching tools
-   BREAKING CHANGE: Several recob::Track methods have changed or been
    removed, any feature branches which use recob::Track functions which
    return TVector3 objects will have to be updated.



Bug fixes(#Bug-fixes)
--------------------------------------



Updated dependencies(#Updated-dependencies)
------------------------------------------------------------

-   [LArSoft
    v07.12.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes071200){.external}
-   larbatch v01.47.01



Change List(#Change-List)
==========================================



sbndcode v07\_12\_00(#sbndcode-v07_12_00)
----------------------------------------------------------

-   2018-11-29 Thomas Brooks : Merge branch \'release/v07\_12\_00\'
-   2018-11-29 Thomas Brooks : Update for larsoft v07\_12\_00 Merge
    remote-tracking branch
    \'origin/feature/cerati\_double2float\_v2\_breaktrack\_deldepr\'
    into release/v07\_12\_00
-   2018-11-29 Lynn Garren : more recob::Track fixes
-   2018-11-26 Thomas Brooks : Change CRT fcl names to avoid conflicts
-   2018-11-21 Thomas Brooks : Merge branch \'feature/tb\_CRTTools\'
    into develop
-   2018-11-21 Thomas Brooks : fix some detector clocks
-   2018-11-21 Thomas Brooks : Merge branch \'develop\' into
    feature/tb\_CRTTools
-   2018-11-21 Thomas Brooks : Clean up code
-   2018-11-21 Thomas Brooks : Added CRT-TPC track matching tools
-   2018-11-19 Thomas Brooks : Add plane to CRT hit producer so tzero
    producer doesn\'t crash
-   2018-11-16 Thomas Brooks : Add CRT T0 matching tools
-   2018-11-16 Thomas Brooks : Merge tag \'v07\_11\_00\' into develop
-   2018-11-09 Giuseppe Cerati : remove comments
-   2018-11-09 Giuseppe Cerati : update recob::Track interface with
    templated functions for returning TVector3-like objects



sbndutil v07\_12\_00(#sbndutil-v07_12_00)
----------------------------------------------------------

-   2018-11-29 Thomas Brooks : Merge branch \'release/v07\_12\_00\'
-   2018-11-29 Thomas Brooks : Update for larsoft v07\_12\_00
-   2018-11-16 Thomas Brooks : Merge tag \'v07\_11\_00\' into develop
