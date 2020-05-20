---
lang: en
title: ReleaseNotes081302
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.13.02   03/22/2019         [Release Notes](ReleaseNotes081302.html)
  ----------- ------------ -- -- ------------------------------------------------------



icaruscode v08\_13\_02 Release Notes(#icaruscode-v08_13_02-Release-Notes)
==========================================================================================

-   **Table of contents**
-   [icaruscode v08\_13\_02 Release
    Notes](#icaruscode-v08_13_02-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List (generated with the command \"git log \--date=short
    \--pretty=format:\"\* %ad - %an - %s\"
    v08\_13\_02\")](#Change-List-generated-with-the-command-git-log-dateshort-prettyformat-ad-an-s-v08_13_02)
    -   [icaruscode v08\_13\_02](#icaruscode-v08_13_02)
    -   [icarusutil v08\_13\_02](#icarusutil-v08_13_02)

[list of icaruscode
releases](List_of_ICARUS_code_releases.html)\
Download instructions for [icaruscode
v08\_13\_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_13_02/icaruscode-v08_13_02.html){.external}



Purpose(#Purpose)
----------------------------------

-   The release for SBN workshop



New features(#New-features)
--------------------------------------------

-   Includes extended photon library
-   TrajCluster turned off again due to lengthy reconstruction time



Bug fixes(#Bug-fixes)
--------------------------------------

-   (none?)



Updated dependencies(#Updated-dependencies)
------------------------------------------------------------

-   [LArSoft
    v08.13.02](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes081302){.external}



Change List (generated with the command \"git log \--date=short \--pretty=format:\"\* %ad - %an - %s\" v08\_13\_02\")(#Change-List-generated-with-the-command-git-log-dateshort-prettyformat-ad-an-s-v08_13_02)
================================================================================================================================================================================================================================



icaruscode v08\_13\_02(#icaruscode-v08_13_02)
--------------------------------------------------------------

-   2019-03-25 - Usher, Tracy L - Merge branch \'develop\'
-   2019-03-25 - Usher, Tracy L - Fix typo (\"seequencer\" to
    \"sequencer\")
-   2019-03-22 - Usher, Tracy L - Merge branch \'develop\'
-   2019-03-22 - Usher, Tracy L - Get the right version of icarus\_data
-   2019-03-22 - Usher, Tracy L - Revert \"Ok, get the right version of
    icarus\_data\"
-   2019-03-22 - Usher, Tracy L - Ok, get the right version of
    icarus\_data
-   2019-03-22 - Usher, Tracy L - Also need to update to the latest
    version of icarus\_data!
-   2019-03-22 - Usher, Tracy L - Preparing to tag v08\_13\_02
-   2019-03-22 - Usher, Tracy L - Analysis tool to look at the hit
    finding parameters
-   2019-03-22 - Usher, Tracy L - Modifications to use existing photon
    library with the \"new\" geometry and then to allow switching to the
    \"new\" extended photon library.
-   2019-03-20 - Usher, Tracy L - Make sure the optical reconstruction
    actually runs!
-   2019-03-19 - Usher, Tracy L - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2019-03-19 - Usher, Tracy L - Moving to 8\_13\_00
-   2019-03-19 - Christian Farnese - new fhicls for the production of
    neutrinos for the workshop
-   2019-03-19 - Usher, Tracy L - Turning off the trajcluster path
    (again)
-   2019-03-19 - Usher, Tracy L - Add the new fhicl variables to the
    largeant parameters list
-   2019-03-13 - Gianluca Petrillo - GIT please ignore compiled python
    code too.
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



icarusutil v08\_13\_02(#icarusutil-v08_13_02)
--------------------------------------------------------------

-   2019-03-22 - Usher, Tracy L - Preparing to tag v08\_13\_02
-   2019-03-19 - Usher, Tracy L - moving 8\_13\_00
