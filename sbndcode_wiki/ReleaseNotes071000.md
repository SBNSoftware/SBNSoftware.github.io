---
lang: en
title: ReleaseNotes071000
---

  ----------- ------------ -- -- ------------------------------------------------------
  v07.10.00   11/12/2018         [Release Notes](ReleaseNotes071000.html){.wiki-page}
  ----------- ------------ -- -- ------------------------------------------------------

[]{#sbndcode-v07_10_00-Release-Notes}

sbndcode v07\_10\_00 Release Notes[¶](#sbndcode-v07_10_00-Release-Notes){.wiki-anchor}
======================================================================================

-   **Table of contents**
-   [sbndcode v07\_10\_00 Release
    Notes](#sbndcode-v07_10_00-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v07\_10\_00](#sbndcode-v07_10_00)
    -   [sbndutil v07\_10\_00](#sbndutil-v07_10_00)

[list of sbndcode
releases](List_of_SBND_code_releases.html){.wiki-page}\
Download instructions for [sbndcode
v07\_10\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v07_10_00/sbndcode-v07_10_00.html){.external}

[]{#Purpose}

Purpose[¶](#Purpose){.wiki-anchor}
----------------------------------

-   Weekly release

[]{#New-features}

New features[¶](#New-features){.wiki-anchor}
--------------------------------------------

[]{#Bug-fixes}

Bug fixes[¶](#Bug-fixes){.wiki-anchor}
--------------------------------------

[]{#Updated-dependencies}

Updated dependencies[¶](#Updated-dependencies){.wiki-anchor}
------------------------------------------------------------

-   [LArSoft
    v07.10.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes071000){.external}
-   larbatch v01.47.00

[]{#Change-List}

Change List[¶](#Change-List){.wiki-anchor}
==========================================

[]{#sbndcode-v07_10_00}

sbndcode v07\_10\_00[¶](#sbndcode-v07_10_00){.wiki-anchor}
----------------------------------------------------------

-   2018-11-08 Thomas Brooks : Merge branch \'release/v07\_10\_00\'
-   2018-11-08 Thomas Brooks : Update for larsoft v07\_10\_00
-   2018-11-01 Thomas Brooks : Merge tag \'v07\_09\_00\' into develop

[]{#sbndutil-v07_10_00}

sbndutil v07\_10\_00[¶](#sbndutil-v07_10_00){.wiki-anchor}
----------------------------------------------------------

-   2018-11-08 Thomas Brooks : Merge branch \'release/v07\_10\_00\'
-   2018-11-08 Thomas Brooks : Update for larsoft v07\_10\_00
-   2018-11-06 Dominic Brailsford : Add an extra underscore to the
    jobsub name
-   2018-11-06 Dominic Brailsford : Fix the incantation for calculating
    how many jobs to submit
-   2018-11-06 Dominic Brailsford : Re-enable jobname and N calculation
    after bug fix. Also increasing the underscore spacing in the jobsub
    name
-   2018-11-06 Dominic Brailsford : Fix missing s
-   2018-11-06 Dominic Brailsford : tp0.5 config file. This tries to do
    two new things: 1) override the name of the jobsub job name
    (required fife\_utils 3\_2\_4) and tries to automagically calculate
    how many jobs to submit for a dependent stage by counting how many
    files are in a dataset
-   2018-11-01 Thomas Brooks : Merge tag \'v07\_09\_00\' into develop
