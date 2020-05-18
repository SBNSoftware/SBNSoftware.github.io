---
lang: en
title: ReleaseNotes067400
---

  ----------- ------------ -- -- ------------------------------------------------------
  v06.74.00   04/17/2018         [Release Notes](ReleaseNotes067400.html)
  ----------- ------------ -- -- ------------------------------------------------------

{#sbndcode-v06_74_00-Release-Notes}

sbndcode v06\_74\_00 Release Notes(#sbndcode-v06_74_00-Release-Notes)
======================================================================================

-   **Table of contents**
-   [sbndcode v06\_74\_00 Release
    Notes](#sbndcode-v06_74_00-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v06\_74\_00](#sbndcode-v06_74_00)
    -   [sbndutil v01\_50\_00](#sbndutil-v01_50_00)

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v06\_74\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v06_74_00/sbndcode-v06_74_00.html){.external}

{#Purpose}

Purpose(#Purpose)
----------------------------------

-   Weekly release

{#New-features}

New features(#New-features)
--------------------------------------------

-   Clang build (c2) for OSX
-   Removal of OSX 10.11 binary distribution
-   Default version only works for linux builds at the moment
-   New C.I tests for gallery

{#Bug-fixes}

Bug fixes(#Bug-fixes)
--------------------------------------

{#Updated-dependencies}

Updated dependencies(#Updated-dependencies)
------------------------------------------------------------

-   [LArSoft
    v06.74.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes067400){.external}
-   larbatch v01.38.03

{#Change-List}

Change List(#Change-List)
==========================================

{#sbndcode-v06_74_00}

sbndcode v06\_74\_00(#sbndcode-v06_74_00)
----------------------------------------------------------

-   2018-04-17 Thomas Brooks : Merge branch \'release/v06\_74\_00\'
-   2018-04-17 Thomas Brooks : Update for larsoft v06\_74\_00
-   2018-04-16 Gianluca Petrillo : Added the gallery test suite to the
    default C.I. test suite
-   2018-04-12 Gianluca Petrillo : Update C.I. test configuration after
    resolution of issue
    [\#19096](/redmine/issues/19096 "Feature: Reference file paths expressed with variables are not fully supported by the C.I. system (Closed)"){.issue
    .tracker-2 .status-5 .priority-4 .priority-default .closed}
-   2018-04-13 Gianluca Petrillo : Update C.I. test configuration after
    resolution of issue
    [\#18270](/redmine/issues/18270 "Feature: Have test_runner find the test configuration file from the source directory (Closed)"){.issue
    .tracker-2 .status-5 .priority-4 .priority-default .closed}
-   2018-04-13 Gianluca Petrillo : Turned gallery unit test into an
    integration test
-   2018-04-11 Gianluca Petrillo : Eexplicit linking to messagefacility
    and FHiCL in gallleryAnalysis
-   2018-04-11 Gianluca Petrillo : Removed a debug debris.
-   2018-04-11 Gianluca Petrillo : Providing a UPS setup function when
    the standard one is not exported
-   2018-04-11 Gianluca Petrillo : sbnd\_gallery\_setup script should be
    more MRB-friendly now
-   2018-04-10 Gianluca Petrillo : Added unit test for gallery macro
    compilation.
-   2018-04-10 Thomas Brooks : Merge tag \'v06\_73\_00\' into develop

{#sbndutil-v01_50_00}

sbndutil v01\_50\_00(#sbndutil-v01_50_00)
----------------------------------------------------------

-   2018-04-17 Thomas Brooks : Merge branch \'release/v01\_50\_00\'
-   2018-04-17 Thomas Brooks : Update for larsoft v06\_74\_00
-   2018-04-10 Thomas Brooks : Merge tag \'v01\_49\_00\' into develop
