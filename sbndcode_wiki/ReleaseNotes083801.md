---
lang: en
title: ReleaseNotes083801
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.38.01   12/23/2019         [Release Notes](ReleaseNotes083801.html)
  ----------- ------------ -- -- ------------------------------------------------------



sbndcode v08\_38\_01 Release Notes
======================================================================================

-   **Table of contents**
-   [sbndcode v08\_38\_01 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List]
    -   [sbndcode v08\_38\_01]
    -   [sbndutil v08\_38\_01]

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v08\_38\_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_38_01/sbndcode-v08_38_01.html){.external}



Purpose
----------------------------------

-   Weekly release



New features
--------------------------------------------



Bug fixes
--------------------------------------

-   [\#23722](/redmine/issues/23722 "Bug: Optical hit finder segfaults when processing SBND MC (Resolved)"){.issue
    .tracker-1 .status-3 .priority-6 .priority-high2 .assigned-to-me}



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v08.38.01](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes083801){.external}



Change List
==========================================



sbndcode v08\_38\_01
----------------------------------------------------------

-   2019-12-23 Thomas Brooks : Merge branch \'release/v08\_38\_01\'
-   2019-12-23 Thomas Brooks : Update for larsoft v08\_38\_01
-   2019-12-13 Iker de Icaza Astiz : Go back to the ideal PMT response
    values
-   2019-12-13 Iker de Icaza Astiz : Use the message facility for
    printing out
-   2019-12-13 Iker de Icaza Astiz : Test if the TV1D\_denoise has gone
    haywire, if so start again with another parameter
-   2019-12-13 Iker de Icaza Astiz : Merge branch \'develop\' into
    feature/icaza\_ophit
-   2019-12-13 Thomas Brooks : fix typo
-   2019-12-13 Thomas Brooks : Merge tag \'v08\_38\_00\' into develop
-   2019-11-26 Iker de Icaza Astiz : *Bugfix:* TV1D\_denoise
    segfaulting. Reason was the code was demoting double to float.
-   2019-11-26 Iker de Icaza Astiz : Merge branch \'develop\' into
    feature/lp\_opflash
-   2019-11-13 Thomas Brooks : fix out of bounds vector access
-   2019-11-12 Iker de Icaza Astiz : Indenting and whitespace removal
-   2019-11-12 Iker de Icaza Astiz : Merge branch \'develop\' into
    tmpmerge
-   2019-11-05 Laura Paulucci Marinho : adjusting time for
    wvfAna\_module
-   2019-11-01 Laura Paulucci Marinho : hitFinder with no histograms and
    small adjustments in code
-   2019-10-31 Iker Loïc de Icaza Astiz : Somehow this bracket came out
    on the last commit ~~\_~~
-   2019-10-31 Iker Loïc de Icaza Astiz : Use doubles in waveform vector
-   2019-10-30 Iker Loïc de Icaza Astiz : Fix \`double free or
    corruption\` error message related to clearing fwaveform
-   2019-10-28 Laura Paulucci Marinho : New single pe for PMT (from
    data)
-   2019-10-25 Laura Paulucci Marinho : Merge branch \'develop\' into
    feature/lp\_opflash
-   2019-09-13 Laura Paulucci Marinho : Initial opFlashFinder for SBND



sbndutil v08\_38\_01
----------------------------------------------------------

-   2019-12-23 Thomas Brooks : Merge branch \'release/v08\_38\_01\'
-   2019-12-23 Thomas Brooks : Update for larsoft v08\_38\_01
-   2019-12-13 Thomas Brooks : Merge tag \'v08\_38\_00\' into develop
