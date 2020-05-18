---
lang: en
title: ReleaseNotes066900
---

  ----------- ------------ -- -- ------------------------------------------------------
  v06.69.00   02/23/2018         [Release Notes](ReleaseNotes066900.html){.wiki-page}
  ----------- ------------ -- -- ------------------------------------------------------

[]{#sbndcode-v06_69_00-Release-Notes}

sbndcode v06\_69\_00 Release Notes[¶](#sbndcode-v06_69_00-Release-Notes){.wiki-anchor}
======================================================================================

-   **Table of contents**
-   [sbndcode v06\_69\_00 Release
    Notes](#sbndcode-v06_69_00-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v06\_69\_00](#sbndcode-v06_69_00)
    -   [sbndutil v01\_45\_00](#sbndutil-v01_45_00)

[list of sbndcode
releases](List_of_SBND_code_releases.html){.wiki-page}\
Download instructions for [sbndcode
v06\_69\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v06_69_00/sbndcode-v06_69_00.html){.external}

[]{#Purpose}

Purpose[¶](#Purpose){.wiki-anchor}
----------------------------------

-   Weekly release

[]{#New-features}

New features[¶](#New-features){.wiki-anchor}
--------------------------------------------

-   New integration tests (runs an end to end job)
    -   Run before you push code\

            setup lar_ci; test_runner -s develop_test_sbndcode 

[]{#Bug-fixes}

Bug fixes[¶](#Bug-fixes){.wiki-anchor}
--------------------------------------

[]{#Updated-dependencies}

Updated dependencies[¶](#Updated-dependencies){.wiki-anchor}
------------------------------------------------------------

-   [LArSoft
    v06.69.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes066900){.external}
-   larbatch v06\_37\_00

[]{#Change-List}

Change List[¶](#Change-List){.wiki-anchor}
==========================================

[]{#sbndcode-v06_69_00}

sbndcode v06\_69\_00[¶](#sbndcode-v06_69_00){.wiki-anchor}
----------------------------------------------------------

-   2018-02-23 Thomas Brooks : Merge branch \'release/v06\_69\_00\'
-   2018-02-23 Thomas Brooks : Update for larsoft v06\_69\_00
-   2018-02-22 Gianluca Petrillo : Let\'s see if triggering the build
    also starts integration tests.
-   2018-02-22 Gianluca Petrillo : Merge branch \'feature/gp\_CItests\'
    into develop
-   2018-02-22 Gianluca Petrillo : Fixed C.I. configuration for
    reference files (V)
-   2018-02-21 Gianluca Petrillo : Fixed C.I. configuration for
    reference files (IV)
-   2018-02-21 Gianluca Petrillo : Fixed C.I. configuration for
    reference files (III)
-   2018-02-21 Gianluca Petrillo : Fixed C.I. configuration for
    reference files (II)
-   2018-02-21 Gianluca Petrillo : Fixed C.I. configuration for
    reference files (I)
-   2018-02-21 Gianluca Petrillo : Changed aestetics of SBND cmake
    output
-   2018-02-21 Gianluca Petrillo : Release candidate for integration
    tests.
-   2018-02-21 Gianluca Petrillo : Added canvas\_root\_io in the
    CMakeLists.txt of gallery example
-   2018-02-19 Gianluca Petrillo : Merge remote-tracking branch
    \'origin/develop\' into feature/gp\_CItests
-   2018-02-14 Thomas Brooks : Merge tag \'v06\_68\_00\' into develop
-   2018-02-02 Gianluca Petrillo : First attempt to automatic detection
    of GIT tag
-   2018-02-02 Gianluca Petrillo : Merge remote-tracking branch
    \'origin/develop\' into feature/gp\_CItests
-   2017-11-14 Gianluca Petrillo : Reorganised integration test data in
    dCache (again).
-   2017-11-13 Gianluca Petrillo : Reorganised input/reference files for
    integration tests.
-   2017-11-09 Gianluca Petrillo : Updated template test script with
    lar\_ci develop.
-   2017-10-19 Gianluca Petrillo : First draft of the integration tests
    for SBND.

[]{#sbndutil-v01_45_00}

sbndutil v01\_45\_00[¶](#sbndutil-v01_45_00){.wiki-anchor}
----------------------------------------------------------

-   2018-02-23 Thomas Brooks : Merge branch \'release/v01\_45\_00\'
-   2018-02-23 Thomas Brooks : Update for larsoft v06\_69\_00
-   2018-02-14 Thomas Brooks : Merge tag \'v01\_44\_00\' into develop
