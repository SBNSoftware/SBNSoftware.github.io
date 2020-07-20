---
lang: en
title: ReleaseNotes083200
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.32.00   10/08/2019         [Release Notes](ReleaseNotes083200.html)
  ----------- ------------ -- -- ------------------------------------------------------



icaruscode v08\_32\_00 Release Notes
==========================================================================================

-   **Table of contents**
-   [icaruscode v08\_32\_00 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List]
    -   [icaruscode v08\_32\_00]
    -   [icarusutil v08\_31\_01]

[list of icaruscode
releases](List_of_ICARUS_code_releases.html)\
Download instructions for [icaruscode
v08\_32\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_19_01/icaruscode-v08_32_00.html){.external}



Purpose
----------------------------------

-   Catch up release to stay current with LArSoft



New features
--------------------------------------------

-   (none?)



Bug fixes
--------------------------------------

-   (none?)



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v08.32.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes083200){.external}



Change List
==========================================

(generated with the command \"git log \--date=short
\--pretty=format:\"\* %ad - %an - %s\" v08\_32\_00\")



icaruscode v08\_32\_00
--------------------------------------------------------------

-   2019-10-08 - drinkingkazu - merge conflict resolved
-   2019-10-08 - drinkingkazu - opflash, ophit, fakeflash, fakephotos
    debugged
-   2019-10-08 - Francois Drielsma - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2019-10-08 - Francois Drielsma - Replaced set by sorted vector
    ICARUSMCOpHit to allow for duplicate times
-   2019-10-04 - Usher, Tracy L - Fix in one more place
-   2019-10-04 - Usher, Tracy L - Move to LArSoft v08\_32\_00
-   2019-10-04 - Usher, Tracy L - Fix compile issue
-   2019-10-04 - Usher, Tracy L - Merge branch
    \'feature/usher\_candhitfinderinterfacemods\' into develop
-   2019-10-04 - Francois Drielsma - Time-sorted photons in
    MCOpHit\_module to fix merging
-   2019-10-04 - drinkingkazu - for flash debugging
-   2019-10-03 - Usher, Tracy L - Infinitesimal cleanup of code
-   2019-10-02 - drinkingkazu - remove cout
-   2019-10-02 - drinkingkazu - avoid gain fluctuation in ophit reco
    performance study (dark noise does not have truth to match)
-   2019-10-02 - drinkingkazu - fake photons commented, still not real
-   2019-10-02 - drinkingkazu - MCOpHit working now, also OpHit should
    not be garbage any more, not tuned yet though
-   2019-10-01 - Temigo - Update from Kazu
-   2019-10-01 - Usher, Tracy L - These use the candidate hit finder
    interface in larreco which has been modified.
-   2019-09-26 - Usher, Tracy L - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop



icarusutil v08\_31\_01
--------------------------------------------------------------

-   2019-10-04 - Usher, Tracy L - Moving to LArSoft v08\_32\_00
