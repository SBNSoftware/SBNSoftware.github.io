---
layout: page
title: ReleaseNotes080300
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.03.00   01/15/2019         [Release Notes](ReleaseNotes080300.html)
  ----------- ------------ -- -- ------------------------------------------------------



icaruscode v08\_03\_00 Release Notes
==========================================================================================

-   **Table of contents**
-   [icaruscode v08\_03\_00 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Updated dependencies]
-   [Change List (generated with the command \"git log \--date=short
    \--pretty=format:\"\* %ad - %an - %s\"
    v08\_03\_00\")]
    -   [icaruscode v08\_03\_00]
    -   [icarusutil v08\_03\_00]

[list of icaruscode
releases](List_of_ICARUS_code_releases.html)\
Download instructions for [icaruscode
v08\_03\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_03_00/icaruscode-v08_03_00.html)



Purpose
----------------------------------

-   Catch up release to get all of the LArSoft improvements into a tag
-   Disable AVX instructions so can run on more machines
-   Updates to the icarus raw hit finder
-   Remove references to the famous Field Response \"fudge factor\"
-   Code cleanup



New features
--------------------------------------------

-   CRT improvements

Bug fixes
---------

-   Bug fixes to all systems (optical waveforms,
    convolution/deconvolution, etc.)



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v08.03.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes080300)
-   larbatch v01.46.02



Change List (generated with the command \"git log \--date=short \--pretty=format:\"\* %ad - %an - %s\" v08\_03\_00\")
================================================================================================================================================================================================================================



icaruscode v08\_03\_00
--------------------------------------------------------------

-   2019-01-15 - Usher, Tracy L - Larsoft keep up, getting ready to tag
    v08\_03\_00
-   2019-01-15 - Usher, Tracy L - Remove references to the Field
    Response Amplitude scaling factor (was off in detsim anyway)
-   2019-01-14 - Filippo Varanini - updating ICARUSHitfinder to avoid
    variable-not-used warning
-   2019-01-14 - Gianluca Petrillo - Fix for Clang.
-   2018-11-05 - Gianluca Petrillo - PMTsimulationAlg: added a check on
    parameters (polarity is effectively redundant\...)
-   2018-11-05 - Gianluca Petrillo - Cleansing of PMTsimulationAlg:
    removed dead code and comments.
-   2018-11-03 - Gianluca Petrillo - Using quantities with units in
    \`PMTsimulationAlg\`.
-   2018-11-03 - Gianluca Petrillo - Added quantities needed during PMT
    simulation.
-   2018-11-02 - Gianluca Petrillo - New intrastructure for quantities
    with units.
-   2019-01-14 - Filippo Varanini - improvements in hit finding -
    inserted fitting and integrating ranges as fcl variables
-   2019-01-07 - Gianluca Petrillo - Disabled AVX also for the light
    simulation algorithms.
-   2018-12-21 - Usher, Tracy L - Updating parameters to make sure we
    are current with the updates to the noise model and the
    deconvolution
-   2018-12-21 - Usher, Tracy L - Give correct name to the \"incoherent
    noise fraction\"



icarusutil v08\_03\_00
--------------------------------------------------------------

-   2019-01-15 - Usher, Tracy L - LArSoft keepup, tagging v08\_03\_00
