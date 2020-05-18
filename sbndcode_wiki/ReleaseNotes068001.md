---
lang: en
title: ReleaseNotes068001
---

  ----------- ------------ -- -- ------------------------------------------------------
  v06.80.01   06/15/2018         [Release Notes](ReleaseNotes068001.html)
  ----------- ------------ -- -- ------------------------------------------------------

{#sbndcode-v06_80_01-Release-Notes}

sbndcode v06\_80\_01 Release Notes(#sbndcode-v06_80_01-Release-Notes)
======================================================================================

-   **Table of contents**
-   [sbndcode v06\_80\_01 Release
    Notes](#sbndcode-v06_80_01-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v06\_80\_01](#sbndcode-v06_80_01)
    -   [sbndutil v01\_56\_01](#sbndutil-v01_56_01)

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v06\_80\_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v06_80_01/sbndcode-v06_80_01.html){.external}

{#Purpose}

Purpose(#Purpose)
----------------------------------

-   Weekly release

{#New-features}

New features(#New-features)
--------------------------------------------

-   Added configuration for POMS

{#Bug-fixes}

Bug fixes(#Bug-fixes)
--------------------------------------

-   Issue
    [\#20124](/redmine/issues/20124 "Bug: TFileMetadataSBND creates a parent object in the json when no parent exists (Resolved)"){.issue
    .tracker-1 .status-3 .priority-5 .priority-high3}
-   Issue
    [\#19631](/redmine/issues/19631 "Bug: Project.py cannot run sbndcode jobs due to partially committed metadata features used in the Marc... (Resolved)"){.issue
    .tracker-1 .status-3 .priority-4 .priority-default}

{#Updated-dependencies}

Updated dependencies(#Updated-dependencies)
------------------------------------------------------------

-   [LArSoft
    v06.80.01](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes068001){.external}
-   larbatch v01.40.01

{#Change-List}

Change List(#Change-List)
==========================================

{#sbndcode-v06_80_01}

sbndcode v06\_80\_01(#sbndcode-v06_80_01)
----------------------------------------------------------

-   2018-06-15 Thomas Brooks : Merge branch \'release/v06\_80\_01\'
-   2018-06-15 Thomas Brooks : Update for larsoft v06\_80\_01
-   2018-06-08 Dominic Brailsford : Only fill parent
    std::set\<std::string\> if the parent string contains any
    characters. Only create the parent object if the parent
    std::set\<std::string\> contains any strings. Fixes redmine issue
    [\#20124](/redmine/issues/20124 "Bug: TFileMetadataSBND creates a parent object in the json when no parent exists (Resolved)"){.issue
    .tracker-1 .status-3 .priority-5 .priority-high3}.
-   2018-06-05 Thomas Brooks : Give default values to non-standard
    project.py metadata fcl params
-   2018-06-01 Thomas Brooks : Merge tag \'v06\_80\_00\' into develop

{#sbndutil-v01_56_01}

sbndutil v01\_56\_01(#sbndutil-v01_56_01)
----------------------------------------------------------

-   2018-06-15 Thomas Brooks : Merge branch \'release/v01\_56\_01\'
-   2018-06-15 Thomas Brooks : Update for larsoft v06\_80\_01
-   2018-06-12 Dominic Brailsford : Successful g4 stage
-   2018-06-12 Dominic Brailsford : Add comma to end of last line after
    removing closing braces
-   2018-06-12 Dominic Brailsford : First, mostly complete, attempt at a
    workflow
-   2018-06-11 Dominic Brailsford : Commit the launch configuration used
    by fife\_launch. This is not complete but the thought of no version
    control after all of the changes I\'ve made is making me feel ill.
-   2018-06-11 Dominic Brailsford : Script to be used by the
    metadata\_extractor with ARTROOT files in fife\_launch/fife\_wrap.
    Script uses sam\_metadata\_dumper as its base and then reformats the
    json and adds additional information.
-   2018-06-11 Dominic Brailsford : Adds starting run and subrun
    numbering to a fcl file. For now, the subrun follows \$PROCESS+1
    (the condor env var.) until 100 subruns, where it resets. The run
    increments every 100 subruns.
-   2018-06-11 Dominic Brailsford : A script which adds metadata (both
    generic and experiment-specific) to a fcl file. This is to be used
    on the wrapper fcl created by sbndpoms\_wrapperfcl\_maker.sh
-   2018-06-11 Dominic Brailsford : A script which creates a wrapper fcl
    file to be used in POMS jobs. The created wrapper fcl\'s only line
    is \#include \"MYFCLTORUN\"
-   2018-06-11 Dominic Brailsford : Create directory for POMS scripts
-   2018-06-11 Dominic Brailsford : Move all project.py related scripts
    to projectpy directory
-   2018-06-11 Dominic Brailsford : Move old setup script to a
    deprecated directory. This can be deleted in a few releases.
-   2018-06-01 Thomas Brooks : Merge tag \'v01\_56\_00\' into develop
