---
lang: en
title: ReleaseNotes070700
---

  ----------- ------------ -- -- ------------------------------------------------------
  v07.07.00   10/05/2018         [Release Notes](ReleaseNotes070700.html)
  ----------- ------------ -- -- ------------------------------------------------------



sbndcode v07\_07\_00 Release Notes
======================================================================================

-   **Table of contents**
-   [sbndcode v07\_07\_00 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List]
    -   [sbndcode v07\_07\_00]
    -   [sbndutil v07\_07\_00]

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v07\_07\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v07_07_00/sbndcode-v07_07_00.html){.external}



Purpose
----------------------------------

-   Weekly release



New features
--------------------------------------------

-   Addition of some fcl configurations for MCP 0.9



Bug fixes
--------------------------------------



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v07.07.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes070700){.external}
-   larbatch v01.45.00



Change List
==========================================



sbndcode v07\_07\_00
----------------------------------------------------------

-   2018-10-04 Thomas Brooks : Merge branch \'release/v07\_07\_00\'
-   2018-10-04 Thomas Brooks : Update for larsoft v07\_07\_00
-   2018-10-04 Dominic Brailsford : Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into develop
-   2018-10-04 Dominic Brailsford : Add a g4 fcl file with space charge
    enabled
-   2018-10-03 dombarker30 : Updating shower energy config
-   2018-10-03 Dominic Brailsford : Add a fcl file for single
    interactions in the TPC volumes (this defines a \'fiducial\' volume
    which is exposed to genie, the rest of the geometry is ignored
    during x-sec calculations) Add a fcl file for nu-electron elastic
    scatters in the TPC volumes (uses the single nu interaction TPC
    volume fcl file as a starting point)
-   2018-10-02 Dominic Brailsford : Fix for issue
    [\#20994](/redmine/issues/20994 "Bug: prodsingle_mu_bnblike.fcl (and possibly other fcls) use an outdated hack to ensure the correct th... (Closed)"){.issue
    .tracker-1 .status-5 .priority-5 .priority-high3 .closed}
-   2018-10-01 Lynn Garren : add missing override



sbndutil v07\_07\_00
----------------------------------------------------------

-   2018-10-04 Thomas Brooks : Merge branch \'release/v07\_07\_00\'
-   2018-10-04 Thomas Brooks : Update for larsoft v07\_07\_00
-   2018-10-04 Dominic Brailsford : tp0.4
-   2018-10-04 Dominic Brailsford : Fix critical typo ruining everything
-   2018-10-03 Dominic Brailsford : tp0.3
-   2018-10-03 Dominic Brailsford : G4 onsite only for now. This needs
    fixing..
-   2018-10-03 Dominic Brailsford : Update FTS path
-   2018-10-03 Dominic Brailsford : Process every event in a file by
    default (without override)
-   2018-10-02 Dominic Brailsford : Add cfg for test production 0.2
-   2018-10-02 Dominic Brailsford : Run the extractors as prescripts to
    check output
-   2018-09-28 Thomas Brooks : Merge tag \'v07\_06\_02\' into develop
