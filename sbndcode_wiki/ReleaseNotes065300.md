---
lang: en
title: ReleaseNotes065300
---

  ----------- ------------ -- -- ------------------------------------------------------
  v06.53.00   10/17/2017         [Release Notes](ReleaseNotes065300.html)
  ----------- ------------ -- -- ------------------------------------------------------

{#sbndcode-v06_53_00-Release-Notes}

sbndcode v06\_53\_00 Release Notes(#sbndcode-v06_53_00-Release-Notes)
======================================================================================

-   **Table of contents**
-   [sbndcode v06\_53\_00 Release
    Notes](#sbndcode-v06_53_00-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v06\_53\_00](#sbndcode-v06_53_00)
    -   [sbndutil v01\_29\_00](#sbndutil-v01_29_00)

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v06\_53\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v06_53_00/sbndcode-v06_53_00.html){.external}

{#Purpose}

Purpose(#Purpose)
----------------------------------

-   Weekly release

{#New-features}

New features(#New-features)
--------------------------------------------

-   Addition of RecoUtils library with truth matching functions and TPC
    containment function
-   Changes to anatree
-   Features and changes for upcoming SBN workshop (GENIE offset and
    neutron killer)

{#Bug-fixes}

Bug fixes(#Bug-fixes)
--------------------------------------

-   Issue
    [\#17917](/redmine/issues/17917 "Necessary Maintenance: Anatree needs updating to store information for multiple neutrinos per event/entry (Closed)"){.issue
    .tracker-9 .status-5 .priority-6 .priority-high2 .closed}

{#Updated-dependencies}

Updated dependencies(#Updated-dependencies)
------------------------------------------------------------

-   [LArSoft
    v06.53.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes065300){.external}

{#Change-List}

Change List(#Change-List)
==========================================

{#sbndcode-v06_53_00}

sbndcode v06\_53\_00(#sbndcode-v06_53_00)
----------------------------------------------------------

-   2017-10-17 Thomas Brooks : Merge branch \'release/v06\_53\_00\'
-   2017-10-17 Thomas Brooks : Update to larsoft v06\_53\_00 (trivial)
-   2017-10-17 Dominic Brailsford : Second part of fix for issue
    [\#17917](/redmine/issues/17917 "Necessary Maintenance: Anatree needs updating to store information for multiple neutrinos per event/entry (Closed)"){.issue
    .tracker-9 .status-5 .priority-6 .priority-high2 .closed}. Store
    multiple MCFlux items per tree entry.
-   2017-10-16 Dominic Brailsford : Fix for part of 17917. The
    MCNeutrino variables to be saved have been turned into vectors and
    the tree leafs into arrays. The code keeps track of the number of
    neutrinos to be stored on the fly (you can\'t just use the size of
    the MCTruth vector due to cosmics also being an MCTruth object)
-   2017-10-12 Gianluca Petrillo : Adding PROLOG markins where they are
    due.
-   2017-10-09 Dominic Brailsford : Add comments to the header
-   2017-10-09 Dominic Brailsford : Remove the Abs because EM
    secondaries take negative track IDs
-   2017-10-09 Dominic Brailsford : Fix typo so that the
    ElectronClusterSize change has an effect
-   2017-10-09 Dominic Brailsford : Enable the custom physics list and
    disable the neutron killer from it
-   2017-10-09 Dominic Brailsford : Change the genie time offset from
    1.6ms to 0ms. Simulation currently only reads out one drift frame so
    having a 1.6ms offset (one drift frame) means almost all events get
    placed outside the readout window. We COULD make the readout window
    2 or 3 drift frames long but we also have a disk space problem (we
    don\'t have any free). The temporary solution is to remove the genie
    offset and keep one frame readout.
-   2017-10-09 Dominic Brailsford : Add the three truth matching
    rountine outputs to anatree
-   2017-10-09 Dominic Brailsford : include header
-   2017-10-09 Dominic Brailsford : Set default values to be very far
    away from likely values
-   2017-10-09 Dominic Brailsford : Add another truth matching function
    which matches a true track to a set of reco hits based on which true
    particle contributes the most total true energy to the hit vector
-   2017-10-09 Dominic Brailsford : Add a new truth matching function
    which matches a set of reco hits to the true track which primarily
    contributes to the most hits in the hit vector. The original truth
    matching function matches a set of reco hits to the true track which
    contributes to the highest total (summed) hit charge in the hit
    vector.
-   2017-10-09 Dominic Brailsford : Add RecoUtils library which contains
    a set of functions. Currently it contains a truth matching function
    and a function for checking if a point is inside a TPC. Both need
    some tweaks before use
-   2017-10-09 Thomas Brooks : Merge tag \'v06\_52\_00\' into develop

{#sbndutil-v01_29_00}

sbndutil v01\_29\_00(#sbndutil-v01_29_00)
----------------------------------------------------------

-   2017-10-17 Thomas Brooks : Merge branch \'release/v01\_29\_00\'
-   2017-10-17 Thomas Brooks : Update to larsoft v06\_53\_00 (trivial)
-   2017-10-09 Thomas Brooks : Merge tag \'v01\_28\_00\' into develop
