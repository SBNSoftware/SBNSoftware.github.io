---
layout: page
title: ReleaseNotes071000
---

  ----------- ------------ -- -- ------------------------------------------------------
  v07.10.00   11/12/2018         [Release Notes](ReleaseNotes071000.html)
  ----------- ------------ -- -- ------------------------------------------------------



sbndcode v07\_10\_00 Release Notes
======================================================================================

-   **Table of contents**
-   [sbndcode v07\_10\_00 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List]
    -   [sbndcode v07\_10\_00]
    -   [sbndutil v07\_10\_00]

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v07\_10\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v07_10_00/sbndcode-v07_10_00.html){.external}



Purpose
----------------------------------

-   Weekly release



New features
--------------------------------------------



Bug fixes
--------------------------------------



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v07.10.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes071000){.external}
-   larbatch v01.47.00



Change List
==========================================



sbndcode v07\_10\_00
----------------------------------------------------------

-   2018-11-08 Thomas Brooks : Merge branch \'release/v07\_10\_00\'
-   2018-11-08 Thomas Brooks : Update for larsoft v07\_10\_00
-   2018-11-01 Thomas Brooks : Merge tag \'v07\_09\_00\' into develop



sbndutil v07\_10\_00
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
