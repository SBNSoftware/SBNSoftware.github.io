---
lang: en
title: ReleaseNotes067001
---

  ----------- ------------ -- -- ------------------------------------------------------
  v06.70.01   03/08/2018         [Release Notes](ReleaseNotes067001.html)
  ----------- ------------ -- -- ------------------------------------------------------



sbndcode v06\_70\_01 Release Notes(#sbndcode-v06_70_01-Release-Notes)
======================================================================================

-   **Table of contents**
-   [sbndcode v06\_70\_01 Release
    Notes](#sbndcode-v06_70_01-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v06\_70\_01](#sbndcode-v06_70_01)
    -   [sbndutil v01\_46\_01](#sbndutil-v01_46_01)

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v06\_70\_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v06_70_01/sbndcode-v06_70_01.html){.external}



Purpose(#Purpose)
----------------------------------

-   Weekly release



New features(#New-features)
--------------------------------------------

-   LArG4ParticleFilter moved to larevt.
-   New continuous integration tests for Genie.
-   New BNB flux files are now being used.
-   New version of sbnd\_data with histograms for producing BNB-like
    particles.



Bug fixes(#Bug-fixes)
--------------------------------------



Updated dependencies(#Updated-dependencies)
------------------------------------------------------------

-   [LArSoft
    v06.70.01](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes067001){.external}
-   larbatch v01.37.02
-   sbnd\_data v01.02.00



Change List(#Change-List)
==========================================



sbndcode v06\_70\_01(#sbndcode-v06_70_01)
----------------------------------------------------------

-   2018-03-08 Thomas Brooks : Merge branch \'release/v06\_70\_01\'
-   2018-03-08 Thomas Brooks : Update for larsoft v06\_70\_01
-   2018-03-07 Dominic Brailsford : Merge branch \'develop\' into
    feature/dbrailsf\_removelarg4filter
-   2018-03-07 Dominic Brailsford : Remove the filters ready for them to
    be moved to larevt
-   2018-03-07 Gianluca Petrillo : Another resource usage limit tuning
    for C.I. tests.
-   2018-03-07 Dominic Brailsford : Remove double declaration
-   2018-03-07 Dominic Brailsford : Use flux table
-   2018-03-07 Dominic Brailsford : Use flux table
-   2018-03-07 Dominic Brailsford : Add configurations for D and E
    Update the default config to D
-   2018-03-07 Dominic Brailsford : Use ConfigC flux table. Also update
    the flux table to actually point towards the flux files.
-   2018-03-07 Dominic Brailsford : Update the fcl to use the flux table
-   2018-03-07 Dominic Brailsford : Remove the genie\_services block as
    it is no longer needed
-   2018-03-07 Dominic Brailsford : Merge branch \'develop\' into
    feature/dbrailsf\_newflux
-   2018-03-06 Gianluca Petrillo : Retuned memory limit for one of the
    integration tests
-   2018-03-06 Dominic Brailsford : Add another new flux configuration
    (confige). Used for generator dirt-induced interactions with the
    fixed flux by Zarko.
-   2018-03-06 Dominic Brailsford : Add a genie services table which
    includes the IFDH service. This is to fix the breaking change from
    LArSoft v06\_69\_00.
-   2018-03-06 Dominic Brailsford : Organise the genie interaction files
    into flux configuration folders. Create a new flux configuration for
    the new flux files Zarko produced (configd)
-   2018-03-06 Dominic Brailsford : Merge branch \'develop\' into
    feature/dbrailsf\_newflux
-   2018-03-05 Gianluca Petrillo : Merge remote-tracking branch
    \'origin/develop\' into feature/gp\_CItests
-   2018-03-05 Gianluca Petrillo : Final revamping of integration tests.
-   2018-03-05 Gianluca Petrillo : Restore direct access to BNB flux
    files (XRootD not supported yet)
-   2018-03-03 Thomas Brooks : Merge tag \'v06\_70\_00\' into develop
-   2018-03-02 Gianluca Petrillo : Added IFDH service to some GENIEGen
    job configurations.
-   2018-03-02 Gianluca Petrillo : Merge remote-tracking branch
    \'origin/develop\' into feature/gp\_CItests
-   2018-03-02 Gianluca Petrillo : Restructured GENIEGen configurations
    for SBND, fixed the flux file path
-   2018-02-28 Gianluca Petrillo : Refurbishing the C.I. tests
-   2018-02-24 Gianluca Petrillo : Added a GENIE integration test.
-   2018-02-12 Dominic Brailsford : Revert \"Use new dirt flux files
    produced by Zarko\"
-   2018-02-12 Dominic Brailsford : Use new dirt flux files produced by
    Zarko



sbndutil v01\_46\_01(#sbndutil-v01_46_01)
----------------------------------------------------------

-   2018-03-08 Thomas Brooks : Merge branch \'release/v01\_46\_01\'
-   2018-03-08 Thomas Brooks : Update for larsoft v06\_70\_01
-   2018-03-03 Thomas Brooks : Merge tag \'v01\_46\_00\' into develop
