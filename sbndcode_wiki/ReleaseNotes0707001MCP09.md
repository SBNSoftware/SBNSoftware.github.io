---
lang: en
title: ReleaseNotes0707001MCP09
---

  -------------------- ------------ -- -- ------------------------------------------------------------
  v07.07.00.1.MCP0.9   10/08/2018         [Release Notes](ReleaseNotes0707001MCP09.html)
  -------------------- ------------ -- -- ------------------------------------------------------------

{#sbndcode-v07_07_00_1_MCP0_9-Release-Notes}

sbndcode v07\_07\_00\_1\_MCP0\_9 Release Notes(#sbndcode-v07_07_00_1_MCP0_9-Release-Notes)
===========================================================================================================

-   **Table of contents**
-   [sbndcode v07\_07\_00\_1\_MCP0\_9 Release
    Notes](#sbndcode-v07_07_00_1_MCP0_9-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v07\_07\_00\_1\_MCP0\_9](#sbndcode-v07_07_00_1_MCP0_9)
    -   [sbndutil v07\_07\_00\_1\_MCP0\_9](#sbndutil-v07_07_00_1_MCP0_9)

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v07\_07\_00\_1\_MCP0\_9](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v07_07_00_1_MCP0_9/sbndcode-v07_07_00_1_MCP0_9.html){.external}

{#Purpose}

Purpose(#Purpose)
----------------------------------

-   Freeze for MCP 0.9

{#New-features}

New features(#New-features)
--------------------------------------------

-   Added bnb-like single particle gun fcl
-   Modification of CRT detector simulation
-   Increased g4 saved particle boundary to include CRTs
-   Addition of CRT hit reconstruction to the standard reco chain
-   Removal of blurred clustering
-   Addition of pandora calorimetry and PID to standard reco chain
-   Modification of Anatree for event selection studies

{#Bug-fixes}

Bug fixes(#Bug-fixes)
--------------------------------------

{#Updated-dependencies}

Updated dependencies(#Updated-dependencies)
------------------------------------------------------------

{#Change-List}

Change List(#Change-List)
==========================================

{#sbndcode-v07_07_00_1_MCP0_9}

sbndcode v07\_07\_00\_1\_MCP0\_9(#sbndcode-v07_07_00_1_MCP0_9)
-------------------------------------------------------------------------------

-   2018-10-08 Thomas Brooks : Merge branch
    \'release/v07\_07\_00\_1\_MCP0\_9\'
-   2018-10-08 Thomas Brooks : Freeze for MCP 0.9
-   2018-10-08 Thomas Brooks : Modify CPU usage for ref file generation
-   2018-10-08 Thomas Brooks : More memory updates
-   2018-10-08 Thomas Brooks : Update memory usage for generating ref
    files
-   2018-10-08 Rhiannon Jones : PID saved for all 3 planes
-   2018-10-08 Rhiannon Jones : Added in PID producer for pmalgtracks
    and updated anatree fcl to run over pmalg and pandora
-   2018-10-08 Rhiannon Jones : Removed unecessary repositories,
    ChargedPionFits and SlimAnalysisTree
-   2018-10-08 Rhiannon Jones : Merge branch \'develop\' into
    feature/Rhiannon\_AnalysisTreeModule
-   2018-10-08 Rhiannon Jones : Shower and shower hierarchy info added
    to AnaTree
-   2018-10-08 Thomas Brooks : Merge branch \'feature/tb\_CRTMCP0\_9\'
    into develop
-   2018-10-08 dombarker30 : Removing Blurreed Cluser
-   2018-10-05 Rhiannon Jones : Track hierarchical information added,
    showers to come - maybe
-   2018-10-05 Dominic Brailsford : Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into develop
-   2018-10-05 Dominic Brailsford : Add new overlay (genie+corsika) fcl
    files.
-   2018-10-05 Rhiannon Jones : Merged with v07\_07\_00
-   2018-10-05 Rhiannon Jones : Merge branch \'develop\' into
    feature/develop\_with\_pidcalotracks
-   2018-10-05 Dominic Brailsford : Use relative paths for the histogram
    file inputs
-   2018-10-05 Dominic Brailsford : pi -\> pi+
-   2018-03-06 Rhiannon Jones : Fixed calo pid order
-   2018-03-05 Rhiannon Jones : Modified standard\_reco\_sbnd\_basic.fcl
    to include Calo and PID for pandora
-   2018-10-05 Rhiannon Jones : Merge branch
    \'feature/Rhiannon\_AnalysisTreeModule\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into
    feature/Rhiannon\_AnalysisTreeModule
-   2018-10-05 Rhiannon Jones : Charged pion fits and modified analysis
    tree to add in vertex hierarchy info, track hierarchy info coming
    next
-   2018-10-05 Thomas Brooks : Added a bnb-like single pi+ fcl
-   2018-10-05 Thomas Brooks : Merge remote-tracking branch
    \'origin/feature/tb\_BNBPartGun\' into develop
-   2018-10-05 Thomas Brooks : Merge branch \'develop\' into
    feature/tb\_CRTMCP0\_9
-   2018-10-04 Thomas Brooks : Merge tag \'v07\_07\_00\' into develop
-   2018-10-04 Thomas Brooks : Modified CRT simulation and added CRT hit
    reconstruction for MCP 0.9
-   2018-10-01 Rhiannon Jones : Merge branch \'develop\' into
    feature/Rhiannon\_AnalysisTreeModule
-   2018-10-01 Rhiannon Jones : Most up-to-date analysis module code
-   2018-09-25 Rhiannon Jones : MCS Study variables added
-   2018-08-23 Rhiannon Jones : Slim analysis tree module added. Writes
    reco events to TTrees in the format needed to use the event
    selection tool (outside LArSoft)
-   2018-03-08 Thomas Brooks : Merge branch \'develop\' into
    feature/tb\_BNBPartGun
-   2018-03-08 Thomas Brooks : Added fcl files for generating bnblike
    single particles

{#sbndutil-v07_07_00_1_MCP0_9}

sbndutil v07\_07\_00\_1\_MCP0\_9(#sbndutil-v07_07_00_1_MCP0_9)
-------------------------------------------------------------------------------

-   2018-10-08 Thomas Brooks : Merge branch
    \'release/v07\_07\_00\_1\_MCP0\_9\'
-   2018-10-08 Thomas Brooks : Freeze for MCP 0.9
-   2018-10-08 Dominic Brailsford : Define \'default\' values for the
    software to use.
-   2018-10-08 Dominic Brailsford : Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndutil into develop
-   2018-10-08 Dominic Brailsford : Define unique output directory for
    test jobs
-   2018-10-04 Thomas Brooks : Merge tag \'v07\_07\_00\' into develop
