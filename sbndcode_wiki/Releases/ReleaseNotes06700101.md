---
layout: page
title: ReleaseNotes06700101
---

  -------------- ------------ -- -- --------------------------------------------------------
  v06.70.01.01   03/14/2018         [Release Notes](ReleaseNotes06700101.html)
  -------------- ------------ -- -- --------------------------------------------------------



sbndcode v06\_70\_01\_01 Release Notes
=============================================================================================

-   **Table of contents**
-   [sbndcode v06\_70\_01\_01 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List]
    -   [sbndcode v06\_70\_01\_01]

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v06\_70\_01\_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v06_70_01_01/sbndcode-v06_70_01_01.html)



Purpose
----------------------------------

-   Freeze for SBN workshop 03/18



New features
--------------------------------------------

-   BNB-like particle gun fcl files
-   Pandora PID and calorimetry in reco chain
-   SAM storage enabled
-   Add shower reconstruction
-   Fast optical simulation



Bug fixes
--------------------------------------



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v06.70.01.01](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes06700101)



Change List
==========================================



sbndcode v06\_70\_01\_01
-----------------------------------------------------------------

-   2018-03-14 Thomas Brooks : Freeze for SBN workshop 03/2018
-   2018-03-13 Dominic Brailsford : Merge branch
    \'feature/sbnd\_Workshop201803integration\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into
    feature/sbnd\_Workshop201803integration
-   2018-03-13 Dominic Brailsford : Give default values to the
    non-standard project.py metadata fcl params. Otherwise, we can\'t
    run project.py
-   2018-03-13 Gianluca Petrillo : Removed MCSTReco from standard Geant4
    job.
-   2018-03-13 Gianluca Petrillo : Introducing
    standard\_{g4,detsim}\_sbnd\_noopdet.fcl to skip optical detector.
-   2018-03-13 Gianluca Petrillo : Fixes to G4 job configuration
-   2018-03-13 Gianluca Petrillo : Integrated photon simulation into the
    standard production chain
-   2018-03-12 Gianluca Petrillo : Restored \"nowires\" version of
    geometry v1.1
-   2018-03-12 Gianluca Petrillo : Merge remote-tracking branch
    \'origin/feature/dgg\_fastop\_mcc\' into
    feature/sbnd\_Workshop201803integration
-   2018-03-11 Gianluca Petrillo : Updated megadumper configuration.
-   2018-03-11 Gianluca Petrillo : Merge remote-tracking branch
    \'origin/feature/DomBarkerSBNWorkshopShowerReco\' into
    feature/sbnd\_Workshop201803integration\* 2018-03-11 Gianluca
    Petrillo : Merge remote-tracking branch
    \'origin/feature/tb\_BNBPartGun\' into
    feature/sbnd\_Workshop201803integration
-   2018-03-11 Gianluca Petrillo : Adding new data products into the
    megadump job.
-   2018-03-11 Gianluca Petrillo : Merge remote-tracking branch
    \'origin/feature/Rhiannon\_PIDCaloPandora\' into
    feature/sbnd\_Workshop201803integration
-   2018-03-11 Gianluca Petrillo : Added job to dump the content of a
    standard SBND reconstruction job.
-   2018-03-11 Diego Gamez : removing mcreco
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
-   2018-03-09 Diego Gamez : modifications/additions to the fast optical
    mode
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
-   2018-03-08 Diego Gamez : adding and fixing small things for the
    opfast mode
-   2018-03-08 Thomas Brooks : Merge branch \'develop\' into
    feature/tb\_BNBPartGun
-   2018-03-08 Thomas Brooks : Added fcl files for generating bnblike
    single particles
-   2018-03-08 Thomas Brooks : Merge tag \'v06\_70\_01\' into develop
-   2018-03-06 Dominic Brailsford : Enable the metadata for this fcl
    file as the SingleGen production files depend on it
-   2018-03-06 Dominic Brailsford : Merge branch \'develop\' into
    feature/dbrailsf\_sam
-   2018-03-06 Dominic Brailsford : Move out of namespace
-   2018-03-06 Rhiannon Jones : Merge branch \'develop\' into
    feature/Rhiannon\_PIDCaloPandora
-   2018-03-06 Rhiannon Jones : Fixed calo pid order
-   2018-03-06 Dominic Barker : Changed reco fail to remove blured
    cluster
-   2018-03-05 Rhiannon Jones : Modified standard\_reco\_sbnd\_basic.fcl
    to include Calo and PID for pandora
-   2018-02-21 Dominic Brailsford : Add a metadata service for TFile
    files (stolen from DUNE which was stolen from MicroBooNE). The
    service creates a JSON file for declaring the root files to SAM.
    Work in progress.
-   2018-02-21 Dominic Brailsford : ub-\>sbnd and fclversion -\>
    fcl.version (same for name)

sbndutil v01\_46\_01\_01
------------------------

-   2018-03-14 Thomas Brooks : Freeze for SBN workshop 03/2018
