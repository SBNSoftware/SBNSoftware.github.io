---
lang: en
title: ReleaseNotes071100
---

  ----------- ------------ -- -- ------------------------------------------------------
  v07.11.00   11/16/2018         [Release Notes](ReleaseNotes071100.html)
  ----------- ------------ -- -- ------------------------------------------------------



icaruscode v07\_11\_00 Release Notes
==========================================================================================

-   **Table of contents**
-   [icaruscode v07\_11\_00 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List (generated with the command \"git log \--date=short
    \--pretty=format:\"\* %ad - %an - %s\"
    v07\_08\_00\")]
    -   [icaruscode v07\_11\_00]
    -   [icarusutil v07\_11\_00]

[list of icaruscode
releases](List_of_ICARUS_code_releases.html)\
Download instructions for [icaruscode
v07\_11\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v07_11_00/icaruscode-v07_11_00.html){.external}



Purpose
----------------------------------

-   Catch up release to get all of the improvements into a tag
-   Intended to be release for MCC 1.1



New features
--------------------------------------------

-   Changes to the TPC signal simulation and processing parameters



Bug fixes
--------------------------------------



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v07.11.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes071100){.external}



Change List (generated with the command \"git log \--date=short \--pretty=format:\"\* %ad - %an - %s\" v07\_08\_00\")
================================================================================================================================================================================================================================



icaruscode v07\_11\_00
--------------------------------------------------------------

-   2018-11-16 - Usher, Tracy L - Reconcile the services definitions, in
    particular move them back to where they are mean to be.
-   2018-11-16 - Usher, Tracy L - Fix issue where redefinition of
    services is overwriting the overrides.
-   2018-11-15 - Usher, Tracy L - Scale the field response by a factor
    of 1.6 to get raw signals to about 10 x noise
-   2018-11-15 - Usher, Tracy L - remove the scaling by binwidth to
    preserve normalization
-   2018-11-15 - Usher, Tracy L - Remove another std::cout
-   2018-11-15 - Usher, Tracy L - Moving to larsoft v07\_11\_00
-   2018-11-15 - Usher, Tracy L - Primarily removing std::cout
    statements and cleaning up a comment
-   2018-11-15 - Usher, Tracy L - Trying to regularize the various
    normalizations to get consistent results
-   2018-11-15 - Usher, Tracy L - Remove hardwired cut and replace with
    fhicl variable
-   2018-11-15 - Usher, Tracy L - set new default values
-   2018-11-15 - Usher, Tracy L - Use default values, remove overrides
    for \"HitSelector\"
-   2018-11-13 - Usher, Tracy L - Alternate form of electronics response
    (shape closer to bessel from electronics paper) just for test
    purposes.
-   2018-11-13 - Usher, Tracy L - Switch to new hit efficiency module
-   2018-11-13 - Usher, Tracy L - Clean up
-   2018-11-13 - Usher, Tracy L - Formatting
-   2018-11-13 - Usher, Tracy L - Minor parameter changes
-   2018-11-13 - Usher, Tracy L - formatting
-   2018-11-13 - Usher, Tracy L - Change from recoWire to decon1droi -
    reco wire does ROI finding on raw waveform, decon1droi finds roi\'s
    after deconvolution
-   2018-11-13 - Usher, Tracy L - Pick the largest amplitude hit in case
    where there is more than one
-   2018-11-13 - Usher, Tracy L - Normalization only on \"deconNorm\"
    and only applied if deconNorm != 1
-   2018-11-13 - Usher, Tracy L - replace .at with \[\]
-   2018-11-13 - Usher, Tracy L - convert gain from e-/us to e-/tick
-   2018-11-13 - Usher, Tracy L - Introducing a newer hit efficiency
    module (planning to delete the old one and introduce a partner
    shower reconstruction module)
-   2018-11-09 - Usher, Tracy L - Removed unused member variables to
    enable compilation with clang compiler
-   2018-11-09 - Usher, Tracy L - Merge remote-tracking branch
    \'origin/feature/Hilgenberg\_CRTDetSim\' into develop



icarusutil v07\_11\_00
--------------------------------------------------------------

-   2018-11-16 - Usher, Tracy L - Preparing to tag v07\_11\_00
