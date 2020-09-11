---
layout: page
title: ReleaseNotes082100
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.21.00   06/01/2019         [Release Notes](ReleaseNotes082100.html)
  ----------- ------------ -- -- ------------------------------------------------------



sbndcode v08\_21\_00 Release Notes
======================================================================================

-   **Table of contents**
-   [sbndcode v08\_21\_00 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List]
    -   [sbndcode v08\_21\_00]
    -   [sbndutil v08\_21\_00]

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v08\_21\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_21_00/sbndcode-v08_21_00.html){.external}



Purpose
----------------------------------

-   Weekly release



New features
--------------------------------------------

-   CRT sim/reco 2.0
    -   Apply microboone simulation tuning (ongoing)
    -   Improved backtracking
    -   Addition of simple CRT event display
    -   Wrapper class for CRT geometry
    -   Removed legacy CRT code
    -   Simplified track reconstruction algorithm
    -   Use ray-box algorithms to improve distance of closest approach
        measurements
    -   CRT-TPC track matching now shifts TPC tracks to CRT tracks
        rather than vice versa
    -   Added analysis modules for all stages



Bug fixes
--------------------------------------



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v08.20.01](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes082001){.external}



Change List
==========================================



sbndcode v08\_21\_00
----------------------------------------------------------

-   2019-06-01 Thomas Brooks : Merge branch \'release/v08\_21\_00\'
-   2019-06-01 Thomas Brooks : Update for larsoft v08\_21\_00
-   2019-06-01 Thomas Brooks : Merge remote-tracking branch
    \'origin/feature/herogers\_updateSCE\' into release/v08\_21\_00
-   2019-06-01 Thomas Brooks : Apply microboone CRT simulation tuning
    (needs further work)
-   2019-05-30 Thomas Brooks : Fix c2 compilation issues
-   2019-05-29 Thomas Brooks : Fix missed commit
-   2019-05-29 Thomas Brooks : Merge branch
    \'feature/tb\_CrtImprovements\' into develop
-   2019-05-29 Thomas Brooks : Match CRT-TPC tracks with DCA rather than
    angle
-   2019-05-29 Thomas Brooks : Merge branch \'develop\' into
    feature/tb\_CrtImprovements
-   2019-05-29 Thomas Brooks : Simplified and improved CRT track
    reconstruction
-   2019-05-28 Thomas Brooks : Applied microboone CRT detector sim
    tuning for Npe
-   2019-05-28 Hannah Rogers : Update space charge service
-   2019-05-28 Thomas Brooks : Changed crt ana module configuration
    structure
-   2019-05-24 Thomas Brooks : Merge tag \'v08\_20\_01\' into develop
-   2019-05-23 Thomas Brooks : Delete legacy code
-   2019-05-23 Thomas Brooks : Update CRT track matching and associated
    ana module
-   2019-05-20 Thomas Brooks : CRT hit matching improvements, account
    for stitched tracks
-   2019-05-17 Thomas Brooks : Update the track reconstruction analysis
-   2019-05-16 Thomas Brooks : Finish detsim analysis module
-   2019-05-14 Thomas Brooks : Improve the CRT backtracker
-   2019-05-14 Thomas Brooks : Added basic CRT event display
-   2019-05-13 Thomas Brooks : Added functions for distances relative to
    sipms
-   2019-05-10 Thomas Brooks : Removed track ID from CRT data product
-   2019-05-10 Thomas Brooks : Added CRT detsim analysis module
-   2019-05-09 Thomas Brooks : Moved geometry wrappers out of CRT
    directory



sbndutil v08\_21\_00
----------------------------------------------------------

-   2019-06-01 Thomas Brooks : Merge branch \'release/v08\_21\_00\'
-   2019-06-01 Thomas Brooks : Update for larsoft v08\_21\_00
-   2019-05-24 Thomas Brooks : Merge tag \'v08\_20\_01\' into develop
