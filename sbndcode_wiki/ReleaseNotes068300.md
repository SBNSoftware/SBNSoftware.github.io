---
lang: en
title: ReleaseNotes068300
---

{#sbndcode-v06_83_00-Release-Notes}

sbndcode v06\_83\_00 Release Notes(#sbndcode-v06_83_00-Release-Notes)
======================================================================================

-   **Table of contents**
-   [sbndcode v06\_83\_00 Release
    Notes](#sbndcode-v06_83_00-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v06\_83\_00](#sbndcode-v06_83_00)
    -   [sbndutil v01\_59\_00](#sbndutil-v01_59_00)

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v06\_83\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v06_83_00/sbndcode-v06_83_00.html){.external}

{#Purpose}

Purpose(#Purpose)
----------------------------------

-   Weekly release

{#New-features}

New features(#New-features)
--------------------------------------------

-   Add configuration and tools for POMS to sbndutil

{#Bug-fixes}

Bug fixes(#Bug-fixes)
--------------------------------------

{#Updated-dependencies}

Updated dependencies(#Updated-dependencies)
------------------------------------------------------------

-   [LArSoft
    v06.83.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes068300){.external}
-   larbatch v01.42.01

{#Change-List}

Change List(#Change-List)
==========================================

{#sbndcode-v06_83_00}

sbndcode v06\_83\_00(#sbndcode-v06_83_00)
----------------------------------------------------------

-   2018-07-31 Thomas Brooks : Merge branch \'release/v06\_83\_00\'
-   2018-07-31 Thomas Brooks : Update for larsoft v06\_83\_00
-   2018-06-27 Thomas Brooks : Merge tag \'v06\_82\_00\' into develop

{#sbndutil-v01_59_00}

sbndutil v01\_59\_00(#sbndutil-v01_59_00)
----------------------------------------------------------

-   2018-07-31 Thomas Brooks : Merge branch \'release/v01\_59\_00\'
-   2018-07-31 Thomas Brooks : Update for larsoft v06\_83\_00
-   2018-07-19 Dominic Brailsford : Use xrootd for streaming datasets
    rather than copying.
-   2018-07-19 Dominic Brailsford : Comment out some not-needed stuff
-   2018-07-19 Dominic Brailsford : Disable the sam\_dataset parameter
    as POMS dependent jobs use %(dataset)s which is magically set for
    downstream stages of a campaign
-   2018-07-19 Dominic Brailsford : Script for creating recursive
    directory structure (mkdir -p) with ifdh. Needed to make the output
    directory of the jobs.
-   2018-07-19 Dominic Brailsford : Setup the anatree stage of the cfg
    file. This currently requires a bit of a hackjob to get the
    TFileMetadata working as we shouldn\'t use the hist\_STAGENAME.root
    naming scheme for anatree. There are still a few bits to the config
    file that need tweaking, namely not using prescripts stored on
    dcache. These can be changed after sbndutil has been frozen.
-   2018-07-18 Dominic Brailsford : Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndutil into develop
-   2018-07-18 Dominic Brailsford : Update job\_output\_1 for all
    downstream stages
-   2018-07-18 Dominic Brailsford : Remove the test comment
-   2018-07-18 Dominic Brailsford : A test commit
-   2018-07-16 Dominic Brailsford : Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndutil into develop
-   2018-07-16 Dominic Brailsford : Fix for tfile metadata. The fix is a
    bit of a hacky work around and requires a certain naming format of
    the hist json which is hist\_STAGE.root.json.
-   2018-06-27 Thomas Brooks : Merge tag \'v01\_58\_00\' into develop
