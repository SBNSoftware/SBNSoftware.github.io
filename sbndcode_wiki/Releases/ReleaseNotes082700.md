---
layout: page
title: ReleaseNotes082700
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.27.00   07/25/2019         [Release Notes](ReleaseNotes082700.html)
  ----------- ------------ -- -- ------------------------------------------------------



sbndcode v08\_27\_00 Release Notes
======================================================================================

-   **Table of contents**
-   [sbndcode v08\_27\_00 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List]
    -   [sbndcode v08\_27\_00]
    -   [sbndutil v08\_27\_00]

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v08\_27\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_27_00/sbndcode-v08_27_00.html){.external}



Purpose
----------------------------------

-   Weekly release



New features
--------------------------------------------

-   BREAKING CHANGE: Geant 4 interfaces split out of nutools into
    [nug4](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/Breaking_Changes#nutools-v3_02_00){.external}.
-   Cosmic ID tools
    -   Suite of cosmic ID algorithms for use in analysis code.
    -   See [DocDB:
        13945](https://sbn-docdb.fnal.gov/cgi-bin/private/RetrieveFile?docid=13945&filename=CosmicRemoval.pdf&version=1){.external}
        for more information.



Bug fixes
--------------------------------------



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v08.27.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes082700){.external}
-   larbatch v01\_51\_05



Change List
==========================================



sbndcode v08\_27\_00
----------------------------------------------------------

-   2019-07-25 Thomas Brooks : Merge branch \'release/v08\_27\_00\'
-   2019-07-25 Thomas Brooks : Update for larsoft v08\_27\_00
-   2019-07-24 Lynn Garren : using nutools v3\_02\_00 and nug4
    v1\_00\_00
-   2019-07-23 Lynn Garren : make sure we find pandora headers
-   2019-07-23 Edward Tyley : Added photon-pi+ vertex fcl for MCP2.0
-   2019-07-22 Thomas Brooks : Remove unused variables
-   2019-07-22 Thomas Brooks : Add docdb notes to README files
-   2019-07-22 Thomas Brooks : Merge branch \'feature/tb\_CosmicID\'
    into develop
-   2019-07-22 Thomas Brooks : Merge tag \'v08\_26\_00\' into develop
-   2019-07-19 Thomas Brooks : Merge branch \'develop\' into
    feature/tb\_CosmicID
-   2019-07-19 Thomas Brooks : Add more comments
-   2019-07-17 Thomas Brooks : Clean up includes
-   2019-07-17 Thomas Brooks : Use TPCGeoAlg for fiducial volume
    functions
-   2019-07-10 Thomas Brooks : Added a cosmic ID tree module
-   2019-07-08 Thomas Brooks : Rename CosmicRemoval(Tag) -\> CosmicId
-   2019-07-08 Thomas Brooks : Change some configuration parameters, add
    pfparticle analysis
-   2019-07-08 Thomas Brooks : Merge branch \'develop\' into
    feature/tb\_CosmicID
-   2019-07-01 Thomas Brooks : Add Cosmic Removal analysis scripts
-   2019-06-10 Thomas Brooks : Update to new CRT reco
-   2019-05-30 Thomas Brooks : First commit (copy from
    tb\_CosmicRemoval)



sbndutil v08\_27\_00
----------------------------------------------------------

-   2019-07-25 Thomas Brooks : Merge branch \'release/v08\_27\_00\'
-   2019-07-25 Thomas Brooks : Update for larsoft v08\_27\_00
-   2019-07-22 Thomas Brooks : Merge tag \'v08\_26\_00\' into develop
