---
lang: en
title: ReleaseNotes067002
---

  ----------- ------------ -- -- ------------------------------------------------------
  v06.70.02   03/19/2018         [Release Notes](ReleaseNotes067002.html)
  ----------- ------------ -- -- ------------------------------------------------------

{#sbndcode-v06_70_02-Release-Notes}

sbndcode v06\_70\_02 Release Notes(#sbndcode-v06_70_02-Release-Notes)
======================================================================================

-   **Table of contents**
-   [sbndcode v06\_70\_02 Release
    Notes](#sbndcode-v06_70_02-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v06\_70\_02](#sbndcode-v06_70_02)
    -   [sbndutil v01\_46\_02](#sbndutil-v01_46_02)

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v06\_70\_02](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v06_70_02/sbndcode-v06_70_02.html){.external}

{#Purpose}

Purpose(#Purpose)
----------------------------------

-   Weekly release

{#New-features}

New features(#New-features)
--------------------------------------------

-   Preparation for saving to SAM

{#Bug-fixes}

Bug fixes(#Bug-fixes)
--------------------------------------

{#Updated-dependencies}

Updated dependencies(#Updated-dependencies)
------------------------------------------------------------

-   [LArSoft
    v06.70.02](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes067002){.external}

{#Change-List}

Change List(#Change-List)
==========================================

{#sbndcode-v06_70_02}

sbndcode v06\_70\_02(#sbndcode-v06_70_02)
----------------------------------------------------------

-   2018-03-16 Thomas Brooks : Merge branch \'release/v06\_70\_02\'
-   2018-03-16 Thomas Brooks : Update for larsoft v06\_70\_02
-   2018-03-11 Gianluca Petrillo : Added job to dump the content of a
    standard SBND reconstruction job.
-   2018-03-09 Dominic Brailsford : I broke everything. I\'m fixing it.
-   2018-03-09 Dominic Brailsford : Use inherited TFilename.
-   2018-03-09 Dominic Brailsford : Indent
-   2018-03-09 Dominic Brailsford : Make anatree\'s TFile name use the
    normal output filename structure
-   2018-03-09 Dominic Brailsford : Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into develop
-   2018-03-09 Dominic Brailsford : Add a general TFile name to use
-   2018-03-09 Dominic Brailsford : Update location of flux files
-   2018-03-09 Dominic Brailsford : Merge branch \'develop\' into
    feature/dbrailsf\_sam
-   2018-03-09 Dominic Brailsford : Remove default values
-   2018-03-09 Dominic Brailsford : Change name of tfile metadata
    service
-   2018-03-09 Dominic Brailsford : Remove the default values for the
    production params
-   2018-03-09 Dominic Brailsford : Update sbnd\_file\_catalog\_extra to
    use the correct parameter names and add the new production ones
-   2018-03-09 Dominic Brailsford : Switch TFileMetadata json production
    off by default
-   2018-03-09 Dominic Brailsford : Attempt to make the json extract the
    name of the TFileService and fail to do so. What has been attempted
    is being committed as the FileRenamer and FileStats stuff may come
    in handy.
-   2018-03-08 Gianluca Petrillo : Tests now use a special single-file
    flux configuration centrally defined
-   2018-03-08 Gianluca Petrillo : Added missing parameter in GENIE flux
    file configurations
-   2018-03-08 Dominic Brailsford : Delete unused metadata. Default to
    not produce this json.
-   2018-03-08 Dominic Brailsford : Add the experiment specific
    parameters to the TFileMetaData.
-   2018-03-08 Dominic Brailsford : Remove FCLVersion Include
    ProjectSoftware Include ProductionName Include ProductionType Setup
    default values for production metadata along with comments saying
    not to use them if not running a production
-   2018-03-08 Dominic Brailsford : Merge branch \'develop\' into
    feature/dbrailsf\_sam
-   2018-03-08 Thomas Brooks : Merge tag \'v06\_70\_01\' into develop
-   2018-03-06 Dominic Brailsford : Enable the metadata for this fcl
    file as the SingleGen production files depend on it
-   2018-03-06 Dominic Brailsford : Merge branch \'develop\' into
    feature/dbrailsf\_sam
-   2018-03-06 Dominic Brailsford : Move out of namespace
-   2018-02-21 Dominic Brailsford : Add a metadata service for TFile
    files (stolen from DUNE which was stolen from MicroBooNE). The
    service creates a JSON file for declaring the root files to SAM.
    Work in progress.
-   2018-02-21 Dominic Brailsford : ub-\>sbnd and fclversion -\>
    fcl.version (same for name)

{#sbndutil-v01_46_02}

sbndutil v01\_46\_02(#sbndutil-v01_46_02)
----------------------------------------------------------

-   2018-03-16 Thomas Brooks : Merge branch \'release/v01\_46\_02\'
-   2018-03-16 Thomas Brooks : Update for larsoft v06\_70\_02
-   2018-03-08 Thomas Brooks : Merge tag \'v01\_46\_01\' into develop
