---
layout: page
title: ReleaseNotes0822 00
---

  ----------- ------------ -- -- -----------------------------------------------------------
  v08.22.00   06/15/2019         [Release Notes](ReleaseNotes082200.html){.wiki-page .new}
  ----------- ------------ -- -- -----------------------------------------------------------



icaruscode v08\_22\_00 Release Notes
==========================================================================================

-   **Table of contents**
-   [icaruscode v08\_22\_00 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List]
    -   [icaruscode v08\_22\_00]
    -   [icarusutil v08\_22\_00]

[list of icaruscode
releases](List_of_ICARUS_code_releases.html)\
Download instructions for [icaruscode
v08\_22\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_19_01/icaruscode-v08_19_01.html)



Purpose
----------------------------------

-   Catch up release to stay current with LArSoft



New features
--------------------------------------------

-   No major new features



Bug fixes
--------------------------------------

-   (none?)



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v08.22.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes082200)



Change List
==========================================

(generated with the command \"git log \--date=short
\--pretty=format:\"\* %ad - %an - %s\" v08\_22\_00\")



icaruscode v08\_22\_00
--------------------------------------------------------------

-   2019-06-14 - Usher, Tracy L - Merge branch \'develop\'
-   2019-06-14 - Usher, Tracy L - Fix compile error
-   2019-06-13 - Usher, Tracy L - Merge branch \'develop\'
-   2019-06-13 - Usher, Tracy L - Fix so will build (at least on osx)
-   2019-06-11 - Usher, Tracy L - Fixing a few typos in the change from
    nutools to nurandom
-   2019-06-11 - Usher, Tracy L - Changing from nutools to nurandom in
    all the right places
-   2019-06-08 - Usher, Tracy L - Comment out the std::couts which need
    to be replaced with debug messages so output can be controlled via
    fhicl
-   2019-06-08 - Usher, Tracy L - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2019-06-08 - Usher, Tracy L - Adding in the call to create
    SimEnergyDeposit objects with number of electrons filled
-   2019-06-07 - Filippo Varanini - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2019-06-07 - Filippo Varanini - temporarily commented out mcs
    modules
-   2019-06-07 - Christian Farnese - correction for neutrino production
    to be checked (before there was a spelling error)
-   2019-06-07 - Christian Farnese - correction for neutrino production
    to be checked
-   2019-06-07 - Christian Farnese - add fhicls for the productions for
    purity studies
-   2019-06-07 - Christian Farnese - add fhicl for the productions for
    purity studies and new fhicl for purity measurements
-   2019-06-06 - Filippo Varanini - fixed hit merging in raw hitfinder.
    Speeds up complex events
-   2019-06-04 - Usher, Tracy L - Fix an interesting memory leak where
    the allocator for RawDigits chunks out 8 kB per instantiation but
    this gets lost. For CR events this causes eventual exhaustion of
    memory\...
-   2019-06-03 - Usher, Tracy L - Merge branch
    \'feature/usher\_reorganization\'
-   2019-05-31 - Usher, Tracy L - Add test geometry with the split
    horizontal wires for testing purposes.
-   2019-05-31 - Usher, Tracy L - Moving to larsoft v08\_21\_00
-   2019-05-31 - Filippo Varanini - Merge branch
    \'feature/usher\_reorganization\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into
    feature/usher\_reorganization
-   2019-05-31 - Filippo Varanini - cleaned up commeented/unused methods
-   2019-05-31 - Filippo Varanini - restored correct logic for
    low-energy MCS likelihood
-   2019-05-30 - Usher, Tracy L - Merge branch
    \'feature/usher\_reorganization\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into
    feature/usher\_reorganization
-   2019-05-30 - Usher, Tracy L - Updating the analysis modules to
    handle the multiple TPC format
-   2019-05-30 - Filippo Varanini - added standard MCS module
-   2019-05-29 - Usher, Tracy L - put a try/catch clause in to keep from
    crashing (until fixed)
-   2019-05-29 - Usher, Tracy L - Include the MCS code from Filippo in
    the reconstruction workflow
-   2019-05-28 - Usher, Tracy L - Fixing various issues to get the build
    to run
-   2019-05-28 - Usher, Tracy L - Reorganize the folder system for
    icaruscode to try to make it more straightforward where to find the
    main pieces\... Also include Filippo\'s MCS code in this
    reorganizaiton, as well Gianluca\'s no baseline directive
-   2019-05-27 - Usher, Tracy L - Merge remote-tracking branch
    \'origin/feature/gp\_noBASENAME\_ONLY\' into develop
-   2019-05-27 - Usher, Tracy L - Moving to LArSoft v08\_20\_01
-   2019-05-25 - Usher, Tracy L - Fix definition of raw multi tpc
    definition
-   2019-05-25 - Usher, Tracy L - Change to extended photon library
-   2019-05-25 - Usher, Tracy L - Pick up the extended photon library
-   2019-05-25 - Usher, Tracy L - only save non-empty wire data
-   2019-05-25 - Usher, Tracy L - Revert \"Pick up the extended photon
    library\"
-   2019-05-25 - Usher, Tracy L - Pick up the extended photon library
-   2019-05-17 - Gianluca Petrillo - Added python module to load ICARUS
    services in python/gallery scripts.
-   2019-05-14 - Christian Farnese - commit requested by Andrea Falcone
    for the photons time description



icarusutil v08\_22\_00
--------------------------------------------------------------

-   2019-06-11 - Usher, Tracy L - catch up to larsoft v08\_22\_00
-   2019-06-03 - Marianette Wospakrik - adding new folder containing
    POMS config files and scripts
-   2019-05-31 - Usher, Tracy L - Moving to larsoft v08\_21\_00
-   2019-05-28 - Usher, Tracy L - Moving to v08\_20\_01
