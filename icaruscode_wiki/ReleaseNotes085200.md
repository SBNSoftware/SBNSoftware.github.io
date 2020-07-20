---
lang: en
title: ReleaseNotes085200
---

  ----------- ----------- -- -- -----------------------------------------------------------
  v08.52.00   5/17/2020         [Release Notes](ReleaseNotes052300.html){.wiki-page .new}
  ----------- ----------- -- -- -----------------------------------------------------------



icaruscode v08\_52\_00 Release Notes
==========================================================================================

-   **Table of contents**
-   [icaruscode v08\_52\_00 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List]
    -   [icaruscode v08\_37\_00]
    -   [icarusutil v08\_51\_00]

[list of icaruscode
releases](List_of_ICARUS_code_releases.html)\
Download instructions for [icaruscode
v08\_52\_00](http://scisoft.fnal.gov/scisoft/bundles/icaruscode/v08_52_00/icaruscode-v08_52_00.html){.external}



Purpose
----------------------------------

-   Stay current with LArSoft - latest versions of
    art/art\_root\_io/root/etc.
-   First step to multithreading



New features
--------------------------------------------

-   Integration update that picks ups various improvements
-   \- Default hit fitter in gaussian hit finding is now the Marquadt
    fitter
-   \- Updates from Gianluca Petrillo aiming at trigger studies



Bug fixes
--------------------------------------

-   Continuing to ferret out issues surrounding default geometry change



Updated dependencies
------------------------------------------------------------

-   None



Change List
==========================================

(generated with the command \"git log \--date=short
\--pretty=format:\"\* %ad - %an - %s\" v08\_52\_00\")



icaruscode v08\_37\_00
--------------------------------------------------------------

-   2020-05-17 - Tracy Usher - Moving to LArSoft v08\_52\_00
-   2020-05-17 - Tracy Usher - Adjust for changes to the interface
    header file
-   2020-05-17 - Tracy Usher - Merge remote-tracking branch
    \'origin/feature/chilgenb\_CRTHitAlgUpdate\' into develop
-   2020-05-17 - Tracy Usher - Merge remote-tracking branch
    \'origin/develop\' into develop
-   2020-05-17 - Tracy Usher - Include the overlay
-   2020-05-17 - Tracy Usher - Diagnostic output dealing with channel
    mapping
-   2020-05-17 - Tracy Usher - Rethinking strategy on handling
    pedestals - particularly given exceptions thrown for non physical
    channels
-   2020-05-17 - Tracy Usher - First attempt at a module to overlay
    simulated signals on data
-   2020-05-17 - Tracy Usher - Introduce simulated pulse module which is
    driven by wire/channel number instead of position
-   2020-05-17 - Tracy Usher - Fixing histogram binning for comparison
    purposes
-   2020-05-17 - Tracy Usher - Fixing the histogram binning for matching
    to other responses
-   2020-05-17 - Christopher Hilgenberg - improve 0 CRTData case
    handling
-   2020-05-17 - Christopher Hilgenberg - fixed bug causing needless
    expcetion throw when no CRT energy deposits occur (e.g. in a GENIE
    event)
-   2020-05-17 - Christopher Hilgenberg - some improvements, added some
    efficiency histograms
-   2020-05-17 - Christopher Hilgenberg - add configurable message
    output for developement
-   2020-05-17 - Christopher Hilgenberg - add configurable message
    output for developement
-   2020-05-17 - Christopher Hilgenberg - added a few lines/comments to
    includes for clarity/completeness
-   2020-05-17 - Christopher Hilgenberg - upate sim hit label
-   2020-05-17 - Christopher Hilgenberg - fix bug causing incorrect
    indexing used to find hits; added more warning/error handling
-   2020-05-17 - Christopher Hilgenberg - add configurable minimum
    deposited energy threshold
-   2020-05-17 - Christopher Hilgenberg - fix bug with time stamps
    associated with data product upgrade; increase global time offset to
    account for negative times in cosmogenic samples (time stamps are
    now UINT64)
-   2020-05-17 - Christopher Hilgenberg - make time stamps UINT64
    instead of UINT32 to be compatible with DAQ
-   2020-05-14 - Christopher Hilgenberg - factor reco algs for each
    subsystem out of main method called from producer; updates for
    simplified data product with less information available for reco; we
    don\'t know which channel produced the trigger or which strip or FEB
    pair provided the coincidence
-   2020-05-14 - Christopher Hilgenberg - move CRTHitReco in crt
    namespace
-   2020-05-14 - Christopher Hilgenberg - updates to handle new CRTData
    product
-   2020-05-14 - Christopher Hilgenberg - redefine CRTData product; some
    cleanup
-   2020-05-14 - Wesley - test commit for ci/github integration, just
    adding a comment
-   2020-05-13 - Gianluca Petrillo - Added drop-in configuration to
    enable only energy deposition in GEANT4.
-   2020-05-12 - Christopher Hilgenberg - update CRTData product to
    match output from DAQ; cleanup unneccessary files
-   2020-05-12 - Christopher Hilgenberg - Merge branch \'master\' into
    feature/chilgenb\_CRTHitAlgUpdate
-   2020-05-12 - Christopher Hilgenberg - incorporate CRTTrueHits into
    TruthMatchAnalysis module and CRTBackTracker



icarusutil v08\_51\_00
--------------------------------------------------------------

-   unchanged
