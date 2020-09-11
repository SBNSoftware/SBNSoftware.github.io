---
layout: page
title: ReleaseNotes067300
---

  ----------- ------------ -- -- ------------------------------------------------------
  v06.73.00   04/10/2018         [Release Notes](ReleaseNotes067300.html)
  ----------- ------------ -- -- ------------------------------------------------------



sbndcode v06\_73\_00 Release Notes
======================================================================================

-   **Table of contents**
-   [sbndcode v06\_73\_00 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List]
    -   [sbndcode v06\_73\_00]
    -   [sbndutil v01\_49\_00]

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v06\_73\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v06_73_00/sbndcode-v06_73_00.html){.external}



Purpose
----------------------------------

-   Weekly release



New features
--------------------------------------------

-   Support for clang builds
    -   please see the extensive notes about [changes needed for
        c2](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/Building_with_clang){.external}



Bug fixes
--------------------------------------

-   Contains multiple bug fixes to allow clang builds in the future



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v06.73.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes067300){.external}
-   larbatch v01.38.02



Change List
==========================================



sbndcode v06\_73\_00
----------------------------------------------------------

-   2018-04-10 Thomas Brooks : Merge branch \'release/v06\_73\_00\'
-   2018-04-10 Thomas Brooks : Update for larsoft v06\_73\_00
-   2018-04-05 Lynn Garren : for larsoft v06\_73\_00
-   2018-04-04 Lynn Garren : Merge branch \'feature/team\_for\_c2\' into
    release/v06\_73\_00
-   2018-04-04 Gianluca Petrillo : Cosmetic change.
-   2018-04-03 Gianluca Petrillo : Fixed typo in header guard (thanks
    Clang)
-   2018-04-03 Gianluca Petrillo : Removed unused data members.
-   2018-04-03 Gianluca Petrillo : Removing hideous, useless
    non-standard C headers
-   2018-04-03 Gianluca Petrillo : Fixed bug in CRTDetSim comparing two
    unsigned values
-   2018-04-03 Gianluca Petrillo : Made use of \"override\" keyword
    consistent.
-   2018-04-03 Gianluca Petrillo : Replaced std::mem\_fun\_ref(),
    removed from C++17, with std::mem\_fn()
-   2018-04-03 Lynn Garren : add c2
-   2018-03-31 Thomas Brooks : Merge tag \'v06\_72\_00\' into develop



sbndutil v01\_49\_00
----------------------------------------------------------

-   2018-04-10 Thomas Brooks : Merge branch \'release/v01\_49\_00\'
-   2018-04-10 Thomas Brooks : Update to larsoft v06\_73\_00
-   2018-04-04 Gianluca Petrillo : Update for c2
-   2018-03-31 Thomas Brooks : Merge tag \'v01\_48\_00\' into develop
