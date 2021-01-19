---
layout: page
title: ReleaseNotes081200
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.12.00   03/09/2019         [Release Notes](ReleaseNotes081200.html)
  ----------- ------------ -- -- ------------------------------------------------------



icaruscode v08\_12\_00 Release Notes
==========================================================================================

-   **Table of contents**
-   [icaruscode v08\_12\_00 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List (generated with the command \"git log \--date=short
    \--pretty=format:\"\* %ad - %an - %s\"
    v08\_12\_00\")]
    -   [icaruscode v08\_11\_00]
    -   [icarusutil v08\_12\_00]

[list of icaruscode
releases](List_of_ICARUS_code_releases.html)\
Download instructions for [icaruscode
v08\_12\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_12_00/icaruscode-v08_12_00.html)



Purpose
----------------------------------

-   First attempt at release for SBN workshop
-   Includes update geometry with z shift
-   Includes Flash reconstruction from Kazu
-   Includes updates to CRT
-   Reconstruction fhicl includes cluster3D and trajcluster



New features
--------------------------------------------



Bug fixes
--------------------------------------

-   (none?)



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v08.12.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes081200)



Change List (generated with the command \"git log \--date=short \--pretty=format:\"\* %ad - %an - %s\" v08\_12\_00\")
================================================================================================================================================================================================================================



icaruscode v08\_11\_00
--------------------------------------------------------------

-   2019-03-09 - Usher, Tracy L - Give pointers initial (null)
    definitions to get around prof compiler issue
-   2019-03-08 - Usher, Tracy L - Fix a few problems, now running
-   2019-03-08 - Usher, Tracy L - Setting up to run full TPC and PMT
    reconstruction chains, this will use the hit colllection output from
    cluster3d to do noise hit removal.
-   2019-03-08 - Usher, Tracy L - Removing specific fcl from top level
    folder, these can be reproduced with a single fhicl file to run
    specific code
-   2019-03-08 - Usher, Tracy L - Update to the latest geometry, not
    including split horizontal wires but including pieces important to
    the optical sim/recon.
-   2019-03-08 - Usher, Tracy L - Including the optical reconstruction
    into the standard reconstruction chain
-   2019-03-08 - Usher, Tracy L - Preparing for larsoft v08\_12\_00
    update
-   2019-03-08 - Usher, Tracy L - need to comment out the class
    definitions to enable build on OSX, my understanding is the
    definition in the xml file is what is important\... not sure why
    this seems to build on linux?
-   2019-03-07 - Usher, Tracy L - Merge remote-tracking branch
    \'origin/feature/kterao\_opreco\' into develop
-   2019-03-07 - drinkingkazu - Removed unnecessary lines
-   2019-03-07 - drinkingkazu - sorry: i add db file here..
-   2019-03-07 - drinkingkazu - include OpReco
-   2019-03-07 - drinkingkazu - store absolute electronics time stamp
    instead of relative to trigger
-   2019-03-07 - drinkingkazu - some bug fixes on MCOphit and MCOpFlash
    reco
-   2019-03-07 - Usher, Tracy L - Add trajcluster back into the
    processing
-   2019-03-07 - Christopher Hilgenberg - fix bug preventing data push
    when only one AuxDetChannelIDE present (affects mostly single
    particle samples)
-   2019-03-04 - Filippo Varanini - correction of out-of-bounds bug n
    findLongPeakParameters too
-   2019-03-04 - Christian Farnese - add fhicl for purity measurement
    online first version still on work
-   2019-03-04 - Christian Farnese - add module for purity measurement
    online first version still on work
-   2019-03-03 - drinkingkazu - opreco branch



icarusutil v08\_12\_00
--------------------------------------------------------------

-   2019-03-08 - Usher, Tracy L - larsoft v108\_12\_00
