---
lang: en
title: ReleaseNotes082900
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.29.00   08/22/2019         [Release Notes](ReleaseNotes082900.html)
  ----------- ------------ -- -- ------------------------------------------------------



sbndcode v08\_29\_00 Release Notes
======================================================================================

-   **Table of contents**
-   [sbndcode v08\_29\_00 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List]
    -   [sbndcode v08\_29\_00]
    -   [sbndutil v08\_29\_00]

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v08\_29\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_29_00/sbndcode-v08_29_00.html){.external}



Purpose
----------------------------------

-   Weekly release



New features
--------------------------------------------

-   Updated noise model from Andrew Scarff
    -   [DocDB
        presentation](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=14109){.external}



Bug fixes
--------------------------------------



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v08.29.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes082900){.external}
-   larbatch v01\_51\_07



Change List
==========================================



sbndcode v08\_29\_00
----------------------------------------------------------

-   2019-08-22 Thomas Brooks : Merge branch \'release/v08\_29\_00\'
-   2019-08-22 Thomas Brooks : Update for larsoft v08\_29\_00
-   2019-08-21 Andrew Scarff : Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into develop
-   2019-08-21 Andrew Scarff : Reverting prodsingle\_sbnd.fcl
-   2019-08-20 Lynn Garren : override virtual functions
-   2019-08-20 Andrew Scarff : Fixing CMake file
-   2019-08-20 Andrew Scarff : Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into develop
-   2019-08-20 Andrew Scarff : Updating some documentation
-   2019-08-15 Thomas Brooks : Merge tag \'v08\_28\_01\' into develop
-   2019-08-09 Andrew Scarff : merging with develop
-   2019-08-09 Andrew Scarff : Tidying up and refactoring some files
-   2019-08-07 Andrew Scarff : Changed to having individual services for
    each noise model. These have been implemented into
    simulationservices and can fcls for running them have been added to
    /fcl/detsim.
-   2019-07-24 Andrew Scarff : Adding jumper cable term
-   2019-07-16 Andrew Scarff : adding sbnd specific noise service
-   2019-07-16 Andrew Scarff : deleting some files
-   2019-07-16 Andrew Scarff : Tidied up code and included coherent
    noise
-   2019-05-17 Andrew Scarff : Deleting some files
-   2019-05-17 Andrew Scarff : New noise simulation from protodune has
    been implemented into sbndcode
-   2019-04-29 Andrew Scarff : Adding ProtoDUNE noise service files to
    sbndcode. Just files copied, no implementation yet.



sbndutil v08\_29\_00
----------------------------------------------------------

-   2019-08-22 Thomas Brooks : Merge branch \'release/v08\_29\_00\'
-   2019-08-22 Thomas Brooks : Update for larsoft v08\_29\_00
-   2019-08-15 Thomas Brooks : Merge tag \'v08\_28\_01\' into develop
