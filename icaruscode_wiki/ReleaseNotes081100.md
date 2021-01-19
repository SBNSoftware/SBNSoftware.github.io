---
layout: page
title: ReleaseNotes081100
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.11.00   02/28/2019         [Release Notes](ReleaseNotes081100.html)
  ----------- ------------ -- -- ------------------------------------------------------



icaruscode v08\_11\_00 Release Notes
==========================================================================================

-   **Table of contents**
-   [icaruscode v08\_11\_00 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List (generated with the command \"git log \--date=short
    \--pretty=format:\"\* %ad - %an - %s\"
    v08\_11\_00\")]
    -   [icaruscode v08\_11\_00]
    -   [icarusutil v08\_11\_00]

[list of icaruscode
releases](List_of_ICARUS_code_releases.html)\
Download instructions for [icaruscode
v08\_11\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_11_00/icaruscode-v08_11_00.html)



Purpose
----------------------------------

-   Catch up release to get all of the LArSoft improvements into a tag
-   Smashes a couple of small bugs in icaruscode
-   Code cleanup



New features
--------------------------------------------



Bug fixes
--------------------------------------

-   fixes a crash in the PMT detector simulation created when attempting
    to conform to art random engine recovery standards\...
-   fixes an issue in the raw hit finder where the interval could be out
    of bounds
-   fix a couple of \"bad\" fhicl parameters in the signal processing



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v08.11.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes081100)



Change List (generated with the command \"git log \--date=short \--pretty=format:\"\* %ad - %an - %s\" v08\_11\_00\")
================================================================================================================================================================================================================================



icaruscode v08\_11\_00
--------------------------------------------------------------

-   2019-02-28 - Usher, Tracy L - Updating fhicl for track/shower
    reconstruction. Note that the PMT and CRT reconstruction will still
    need to be merged into this\...
-   2019-02-28 - Usher, Tracy L - Restoring previous method for
    obtaining fhicl parameters
-   2019-02-28 - Filippo Varanini - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2019-02-28 - Filippo Varanini - correcting bug due to start/end of
    hit fitting interval out of bounds
-   2019-02-28 - Christopher Hilgenberg - fix initialization errors
-   2019-02-27 - Usher, Tracy L - fix the input of the fhicl parameters
    since it seems we don\'t need to supply a seed when recovering a
    random engine\... This runs on osx.
-   2019-02-26 - Christopher Hilgenberg - Merge remote-tracking branch
    \'origin/feature/chilgenberg\_CRTHitDataProductUpdate\' into develop
-   2019-02-26 - Christopher Hilgenberg - factor CRTHitReco algorithms
    out of producer module, updates to accomodate new data product
-   2019-02-25 - Gianluca Petrillo - Removing \`cet\_enable\_asserts()\`
    from non-test code of light simulation.
-   2019-02-25 - Gianluca Petrillo - Removed \`quantities\` libraries
    (moved to \`lardataalg\`)



icarusutil v08\_11\_00
--------------------------------------------------------------

-   2019-02-28 - Usher, Tracy L - Moving to larsoft v08\_11\_00
