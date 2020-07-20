---
lang: en
title: ReleaseNotes065400
---

  ----------- ------------ -- -- ------------------------------------------------------
  v06.54.00   10/20/2017         [Release Notes](ReleaseNotes065400.html)
  ----------- ------------ -- -- ------------------------------------------------------



sbndcode v06\_54\_00 Release Notes
======================================================================================

-   **Table of contents**
-   [sbndcode v06\_54\_00 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List]
    -   [sbndcode v06\_54\_00]
    -   [sbndutil v01\_30\_00]

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v06\_54\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v06_54_00/sbndcode-v06_54_00.html){.external}



Purpose
----------------------------------

-   Weekly release



New features
--------------------------------------------

-   Addition of XML files for SBN workshop



Bug fixes
--------------------------------------

-   Issue
    [\#17941](/redmine/issues/17941 "Bug: Project.py lar jobs fail to process on the grid due to 'lar' command missing (Closed)"){.issue
    .tracker-1 .status-5 .priority-7 .priority-highest .closed}



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v06.54.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes065400){.external}



Change List
==========================================



sbndcode v06\_54\_00
----------------------------------------------------------

-   2017-10-20 Thomas Brooks : Merge branch \'release/v06\_54\_00\'
-   2017-10-20 Thomas Brooks : Update for larsoft v06\_54\_00 (trivial)



sbndutil v01\_30\_00
----------------------------------------------------------

-   2017-10-20 Thomas Brooks : Merge branch \'release/v01\_30\_00\'
-   2017-10-20 Thomas Brooks : Update for larsoft v06\_54\_00 (trivial)
-   2017-10-18 Dominic Brailsford : Fix for issue
    [\#17941](/redmine/issues/17941 "Bug: Project.py lar jobs fail to process on the grid due to 'lar' command missing (Closed)"){.issue
    .tracker-1 .status-5 .priority-7 .priority-highest .closed} Source
    the strict (CVMFS) version of the sbnd setup script.
-   2017-10-18 Dominic Brailsford : Change some of the comments so they
    don\'t say mcc0.75 anymore
-   2017-10-18 Dominic Brailsford : Add XML files for the
    SBNWorkshop1017 production
-   2017-10-18 Dominic Brailsford : Add generic XML production script so
    that we don\'t have to make one for EVERY MCP production.
