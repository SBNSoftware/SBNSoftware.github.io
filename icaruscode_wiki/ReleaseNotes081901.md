---
lang: en
title: ReleaseNotes081901
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.19.01   05/13/2019         [Release Notes](ReleaseNotes081901.html)
  ----------- ------------ -- -- ------------------------------------------------------



icaruscode v08\_19\_01 Release Notes(#icaruscode-v08_19_01-Release-Notes)
==========================================================================================

-   **Table of contents**
-   [icaruscode v08\_19\_01 Release
    Notes](#icaruscode-v08_19_01-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List (generated with the command \"git log \--date=short
    \--pretty=format:\"\* %ad - %an - %s\"
    v08\_19\_01\")](#Change-List-generated-with-the-command-git-log-dateshort-prettyformat-ad-an-s-v08_19_01)
    -   [icaruscode v08\_19\_01](#icaruscode-v08_19_01)
    -   [icarusutil v08\_19\_01](#icarusutil-v08_19_01)

[list of icaruscode
releases](List_of_ICARUS_code_releases.html)\
Download instructions for [icaruscode
v08\_19\_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_19_01/icaruscode-v08_19_01.html){.external}



Purpose(#Purpose)
----------------------------------

-   Catch up release to stay current with LArSoft



New features(#New-features)
--------------------------------------------

-   No major new features



Bug fixes(#Bug-fixes)
--------------------------------------

-   (none?)



Updated dependencies(#Updated-dependencies)
------------------------------------------------------------

-   [LArSoft
    v08.19.01](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes081901){.external}



Change List (generated with the command \"git log \--date=short \--pretty=format:\"\* %ad - %an - %s\" v08\_19\_01\")(#Change-List-generated-with-the-command-git-log-dateshort-prettyformat-ad-an-s-v08_19_01)
================================================================================================================================================================================================================================



icaruscode v08\_19\_01(#icaruscode-v08_19_01)
--------------------------------------------------------------

-   2019-05-13 - Usher, Tracy L - Merge branch \'develop\'
-   2019-05-13 - Usher, Tracy L - The eternal LArSoft chase\... now
    v08\_19\_01
-   2019-05-10 - Usher, Tracy L - debugging\...
-   2019-05-10 - Usher, Tracy L - Fix bug where collection does not get
    filled
-   2019-05-10 - Usher, Tracy L - Merge commit
    \'c2e0efbfeec74b6d463e65684ff8b2f358d887f7\' into develop
-   2019-05-10 - Usher, Tracy L - LArsoft v08\_17\_00
-   2019-05-10 - Usher, Tracy L - Include multiple TPC workflow for
    \"raw\" path
-   2019-05-10 - Usher, Tracy L - Module for merging hits from multiple
    producers into a single collection for output
-   2019-05-08 - Usher, Tracy L - Fix compilation errors
-   2019-05-08 - Usher, Tracy L - Initial import of module capable of
    merging hits from different producers (e.g. from a pair of TPCs)
    into a single hit collection for output (e.g. for a Cryostat),
    including associations
-   2019-05-08 - Usher, Tracy L - Updating fhicl file to include \"raw\"
    reconstruction based on TPC/Cryostat
-   2019-05-03 - Christopher Hilgenberg - generated new geometry files
    with updates from Alessandro, CRT naming convention
-   2019-05-03 - Christopher Hilgenberg - change to latest script from
    Alessandro
-   2019-05-03 - Christopher Hilgenberg - change to correct naming
    convention
-   2019-05-03 - Usher, Tracy L - Implement the possibility to do
    simulation and reconstruction on a \"per TPC\" or \"per Cryostat\"
    basis. The intention of breaking up the running of the
    reconstruction is to improve the overall reconstruction time - both
    through reduced memory footprint of any individual module and
    reduced loop combinatorics, and to allow simple parallelization of
    tasks for whenever larsoft can make use of it.
-   2019-05-03 - Usher, Tracy L - Fix bug where it can happen that the
    seed is set to zero
-   2019-04-29 - Usher, Tracy L - Merge branch \'develop\'
-   2019-04-29 - Usher, Tracy L - Preparing to tag v08\_17\_00
-   2019-04-26 - Usher, Tracy L - Removing from this version
    (v08\_16\_00) forward the \"extra\" scripts and geometry files so as
    to cut back on confusion
-   2019-04-26 - Usher, Tracy L - Reconciling geometry gdml file naming
    scheme
-   2019-04-26 - Usher, Tracy L - Reconciling naming convention for gdml
    and scripting files for geometry
-   2019-04-26 - Usher, Tracy L - Update to v08\_16\_00
-   2019-04-26 - Usher, Tracy L - Updating to reflect new art\_root
    handling of reading histograms from input files\... intended to not
    delete the histo when input file is closed.
-   2019-04-21 - Usher, Tracy L - Merge branch \'develop\' into
    feature/team\_for\_art\_v3\_02
-   2019-04-19 - Gianluca Petrillo - Gallery C.I. test: set up cmake
    only if none is present.
-   2019-04-19 - Usher, Tracy L - Merge branch \'develop\'
-   2019-04-19 - Usher, Tracy L - Formatting and also fix tiny error in
    maximum number of channels in a TPC in the initialization loop.
-   2019-04-19 - Kyle Knoepfel - Upgrade to art 3.02.04
-   2019-04-18 - Usher, Tracy L - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2019-04-18 - Usher, Tracy L - Preparing to tag v08\_15\_01
-   2019-04-16 - Usher, Tracy L - Splitting the reco step into two
    sections, the first primarily does the gauss hit finding path (plus
    optical), the second the \"raw\" path (plus CRT)
-   2019-04-15 - Usher, Tracy L - Merge branch
    \'feature/gp\_PhotonVisTransformations\' into develop
-   2019-04-15 - Usher, Tracy L - Merge commit
    \'2c875661a03ea6ce52d8a0ab40252e1114e8fd25\' into develop
-   2019-04-15 - Gianluca Petrillo - Added comment on photon map
    coordinates
-   2019-04-15 - Usher, Tracy L - 19Nov2018 geometry with the overlaps
    found by Chris Hilgenberg fixed.
-   2019-04-12 - Gianluca Petrillo - Added documentation of timestamp of
    simulated optical waveforms.
-   2019-04-12 - Usher, Tracy L - Move product\_deps to v08\_15\_00
-   2019-04-12 - Filippo Varanini - default parameter for ICARUS event
    display
-   2019-04-11 - Gianluca Petrillo - Dumping of the photon library
    mapping made optional.
-   2019-04-08 - Gianluca Petrillo - LArSoft version dependency bump to
    v08\_14\_01
-   2019-04-04 - Gianluca Petrillo - Fixing commit
-   2019-04-04 - Gianluca Petrillo - Added ICARUS-specific photon
    library mapping tool.
-   2019-04-02 - Usher, Tracy L - Fixing compile issues
-   2019-03-31 - Usher, Tracy L - Massaging around larcv2 for now
-   2019-03-31 - Usher, Tracy L - comment out reference to larcv2
    temporarily
-   2019-03-31 - Laura Domine - Kazu\'s updates on MultiPartRain and
    MultiPartVertex
-   2019-03-30 - Usher, Tracy L - Moving to larsoft v08\_14\_00



icarusutil v08\_19\_01(#icarusutil-v08_19_01)
--------------------------------------------------------------

-   2019-05-13 - Usher, Tracy L - Chasing LArSoft v08\_19\_01
-   2019-05-10 - Usher, Tracy L - larsoft v08\_18\_00
-   2019-04-29 - Usher, Tracy L - Going to larsoft v08\_17\_00
-   2019-04-26 - Usher, Tracy L - Moving to v08\_16\_00
-   2019-04-19 - Kyle Knoepfel - Update to art 3.02.04
-   2019-04-18 - Usher, Tracy L - Preparing to tag v08\_15\_01
-   2019-04-12 - Usher, Tracy L - Moving to larsoft v08\_15\_00
-   2019-03-30 - Usher, Tracy L - Moving to larsoft v08\_14\_00
