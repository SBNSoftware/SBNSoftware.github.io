---
lang: en
title: ReleaseNotes063200
---

  ----------- ------------ -- -- ------------------------------------------------------
  v06.32.00   06/05/2017         [Release Notes](ReleaseNotes063200.html)
  ----------- ------------ -- -- ------------------------------------------------------

{#sbndcode-v06_32_00-Release-Notes}

sbndcode v06\_32\_00 Release Notes(#sbndcode-v06_32_00-Release-Notes)
======================================================================================

-   **Table of contents**
-   [sbndcode v06\_32\_00 Release
    Notes](#sbndcode-v06_32_00-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v06\_32\_00](#sbndcode-v06_32_00)
    -   [sbndutil v01\_15\_00](#sbndutil-v01_15_00)

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v06\_32\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v06_32_00/sbndcode-v06_32_00.html){.external}

{#Purpose}

Purpose(#Purpose)
----------------------------------

First tagged release for LArSoft v06.

{#New-features}

New features(#New-features)
--------------------------------------------

-   New CRT simulations.
-   New geometry.
-   GCC 6 - Compatible with c++14
-   Adoption of ROOT 6
-   Update to art 2.6

{#Bug-fixes}

Bug fixes(#Bug-fixes)
--------------------------------------

{#Updated-dependencies}

Updated dependencies(#Updated-dependencies)
------------------------------------------------------------

-   [LArSoft
    v06.32.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes063200){.external}
-   [cetbuildtools
    v5.06.06](https://cdcvs.fnal.gov/redmine/projects/cetbuildtools/wiki/Release_Notes){.external}
-   [art
    v2\_06\_03](https://cdcvs.fnal.gov/redmine/projects/art/wiki/Release_Notes_20603){.external}
-   larbatch v01\_30\_00

{#Change-List}

Change List(#Change-List)
==========================================

{#sbndcode-v06_32_00}

sbndcode v06\_32\_00(#sbndcode-v06_32_00)
----------------------------------------------------------

-   2017-06-05 Thomas Brooks : Merge branch \'release/v06\_32\_00\'
-   2017-05-15 Gianluca Petrillo : Using full path for CRT services.
-   2017-04-19 Gianluca Petrillo : Merge branch
    \'feature/gp\_noCRTnameClashes\' into develop
-   2017-04-19 Gianluca Petrillo : Resolved name clashes with
    MicroBooNE\'s CRT code.
-   2017-04-19 Gianluca Petrillo : Removed BASENAME\_ONLY from CRT code,
    as per policy.
-   2017-04-17 Gianluca Petrillo : Merge branch
    \'feature/gp\_forLArSoftDevelop\' into develop
-   2017-04-14 Gianluca Petrillo : Forgot the auxdet for the future. Not
    that it helps\...
-   2017-04-14 Gianluca Petrillo : Geometry configuration to support
    \"future\" or default geometry.
-   2017-04-14 Gianluca Petrillo : Merge branch
    \'feature/gp\_forLArSoftDevelop\' into feature/gp\_NewGeometry
-   2017-04-14 Gianluca Petrillo : Merge remote-tracking branch
    \'origin/develop\' into feature/gp\_forLArSoftDevelop
-   2017-04-12 Gustavo Valdiviesso : version 00\_08 of geometry
-   2017-04-11 Andrew Mastbaum : Merge remote-tracking branch
    \'origin/feature/gp\_forLArSoftDevelop\' into
    feature/mastbaum\_crt-sim
-   2017-04-11 Thomas Brooks : Merge tag \'v05\_12\_01\_stable\' into
    develop
-   2017-04-06 Gianluca Petrillo : Geometry update.
-   2017-04-06 Gianluca Petrillo : Updated to LArSoft v06\_31\_00.
-   2017-04-05 Gianluca Petrillo : Renamed directory sbndcode/Geo into
    Geometry.
-   2017-04-05 Gianluca Petrillo : Added missing linking to cetlib.
-   2017-04-04 Gianluca Petrillo : Update to LArSoft v06\_30\_00.
-   2017-03-31 Andrew Mastbaum : Merge remote-tracking branch
    \'origin/feature/gp\_forLArSoftDevelop\' into
    feature/mastbaum\_crt-sim
-   2017-03-30 Gianluca Petrillo : Update to LArSoft v06\_29\_00. No big
    deal.
-   2017-03-17 Gianluca Petrillo : Merge remote-tracking branch
    \'origin/feature/gp\_forLArSoftDevelop\' into
    feature/gp\_forLArSoftDevelop
-   2017-03-17 Gianluca Petrillo : Update to LArSoft v06\_28\_00.
-   2017-03-17 Gianluca Petrillo : Merge remote-tracking branch
    \'origin/develop\' into feature/gp\_forLArSoftDevelop
-   2017-03-15 Andrzej Szelc : add .fcl file to generate marley
    supernova events. Check-in for Mohan Jones.
-   2017-03-08 Gianluca Petrillo : Updated for LArSoft 6.26.2.
-   2017-02-10 Andrew Mastbaum : restore module+channel crt channel id
-   2017-02-09 Andrew Mastbaum : crt cleanup, fix flipped plane
    detection
-   2017-02-09 Andrew Mastbaum : crt tidying, testing
    auxdetchannelmapalg
-   2017-02-09 Andrew Mastbaum : towards crt triggering and response
    improvements
-   2017-02-02 Andrew Mastbaum : Merge branch
    \'feature/gp\_forLArSoftDevelop\' into feature/mastbaum\_crt-sim
-   2017-02-02 Gianluca Petrillo : Update to LArSoft v06\_22\_00.
-   2017-01-16 Gianluca Petrillo : Update version to 6.20.0 (using the
    eponym LArSoft version)
-   2017-01-13 Gianluca Petrillo : Merge remote-tracking branch
    \'origin/develop\' into feature/gp\_forLArSoftDevelop
-   2016-12-30 Andrzej Szelc : small dependency and evd tweak
-   2016-12-28 Gianluca Petrillo : Merge remote-tracking branch
    \'origin/develop\' into feature/gp\_forLArSoftDevelop
-   2016-12-23 Gianluca Petrillo : Merge remote-tracking branch
    \'origin/develop\' into feature/gp\_forLArSoftDevelop
-   2016-12-23 Gianluca Petrillo : Introduced a shared ROOT output
    configuration
-   2016-12-23 Gianluca Petrillo : Set a more complete default for
    single particle production
-   2016-12-23 Gianluca Petrillo : Updated hit finder configuration for
    upstream changes
-   2016-12-23 Gianluca Petrillo : Updated Projection Matching Algorithm
    configuration to new version
-   2016-12-23 Gianluca Petrillo : Added dependency to sbnd\_data.
-   2016-12-23 Gianluca Petrillo : Fix for a ROOT 6
    backward-incompatibility
-   2016-12-23 Gianluca Petrillo : Code for loading detsim data from
    files has been modernised.
-   2016-12-23 Gianluca Petrillo : Updated libraries and include paths
    for LArSoft 6 for source from teh last merge
-   2016-12-21 Gianluca Petrillo : Merge remote-tracking branch
    \'origin/develop\' into feature/gp\_forLArSoftDevelop
-   2016-12-16 Gianluca Petrillo : Updated magnetic field configuration
-   2016-12-16 Gianluca Petrillo : Updated to LArSoft v06\_18\_00 .
-   2016-12-16 Gianluca Petrillo : Using standard channel mapping.
-   2016-12-16 Gianluca Petrillo : Renamed LArSeedService into
    NuRandomService
-   2016-12-16 Gianluca Petrillo : Updated AnalysisTree for interface
    change in sim::SimChannels
-   2016-12-10 Andrew Mastbaum : crt simulation tweaks
-   2016-12-08 Andrew Mastbaum : implemented basic crt timing and charge
    model
-   2016-12-02 Andrew Mastbaum : restore full crt geo
-   2016-12-02 Andrew Mastbaum : timing crt timing response sim \[wip\]
-   2016-12-02 Andrew Mastbaum : clean up gdml vis
-   2016-11-29 Andrew Mastbaum : new CRTData product, reorganize per
    kweirman
-   2016-11-29 Gianluca Petrillo : SBND geometry helper now throws
    exception on error
-   2016-11-28 Gianluca Petrillo : Applied code reorganisation for
    LArSoft 6.11
-   2016-11-28 Gianluca Petrillo : Updated the \"gaus\" expressions in
    ROOT formulas.
-   2016-11-28 Gianluca Petrillo : Processed GDML files to remove
    expressions.
-   2016-11-28 Gianluca Petrillo : Replaced some look-like-integer math
    with floating point one in GDML
-   2016-11-28 Gianluca Petrillo : GDML: replaced g/cc with g/cm3
-   2016-11-28 Gianluca Petrillo : Updated Boost unit tests.
-   2016-11-28 Gianluca Petrillo : Update to art/canvas split.
-   2016-11-28 Gianluca Petrillo : Starting update to LArSoft 6.15.01.
-   2016-11-28 Andrew Mastbaum : include deletions, short modules
-   2016-11-23 Andrew Mastbaum : work towards response simulation
-   2016-11-23 Andrew Mastbaum : reorganize gdml and add bottom tagger
-   2016-11-04 Andrew Mastbaum : crt geometry with modules (missing
    bottom tagger)
-   2016-11-03 Andrew Mastbaum : stub out crt simulation
-   2016-09-08 Gianluca Petrillo : Merge branch \'develop\' into
    feature/gp\_forLArSoftDevelop
-   2016-07-12 Gianluca Petrillo : Adding simulation services into event
    display configuration.
-   2016-07-12 Gianluca Petrillo : Update to LArSoft 5.14.01

{#sbndutil-v01_15_00}

sbndutil v01\_15\_00(#sbndutil-v01_15_00)
----------------------------------------------------------

-   2017-06-05 Thomas Brooks : Merge branch \'release/v01\_15\_00\'
-   2017-06-01 Dominic Brailsford : Increase stats-level to 1000000
-   2017-06-01 Dominic Brailsford : Tweak xml production script to look
    in sbndcode source directory. Add all MCC1.0 xml files. Number of
    events for each file still needs changing.
-   2017-04-17 Gianluca Petrillo : Merge branch
    \'feature/gp\_forLArSoftDevelop\' into develop
-   2017-04-14 Gianluca Petrillo : Updated for LArSoft/SBND code 6.32
    with GCC 6.3 (qualifier e14).
-   2017-04-14 Gianluca Petrillo : Merge remote-tracking branch
    \'origin/develop\' into feature/gp\_forLArSoftDevelop
-   2017-04-11 Thomas Brooks : Merge tag \'v01\_14\_00\_stable\' into
    develop
-   2017-04-05 Gianluca Petrillo : Updated for LArSoft v06\_30\_00
-   2017-03-17 Gianluca Petrillo : Updatefor sbndcode v06\_28\_00
-   2017-03-17 Gianluca Petrillo : Merge remote-tracking branch
    \'origin/develop\' into feature/gp\_forLArSoftDevelop
-   2017-02-02 Gianluca Petrillo : Update to LArSoft v06\_22\_00.
