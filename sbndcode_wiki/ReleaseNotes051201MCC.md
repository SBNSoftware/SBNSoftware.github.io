---
lang: en
title: ReleaseNotes051201MCC
---

  --------------- ------------ -- -- ---------------------------------------------------------
  v05.12.01.MCC   03/08/2017         [Release Notes](ReleaseNotes051201MCC.html){.wiki-page}
  --------------- ------------ -- -- ---------------------------------------------------------

[]{#sbndcode-v05_12_01_MCC-Release-Notes}

sbndcode v05\_12\_01\_MCC Release Notes[¶](#sbndcode-v05_12_01_MCC-Release-Notes){.wiki-anchor}
===============================================================================================

-   **Table of contents**
-   [sbndcode v05\_12\_01\_MCC Release
    Notes](#sbndcode-v05_12_01_MCC-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v05\_12\_01\_MCC](#sbndcode-v05_12_01_MCC)
    -   [sbndutil v01\_14\_00\_MCC](#sbndutil-v01_14_00_MCC)

[list of sbndcode releases](List_of_SBND_code_releases.html){.wiki-page}

[]{#Purpose}

Purpose[¶](#Purpose){.wiki-anchor}
----------------------------------

Frozen for MCC 0.5

[]{#New-features}

New features[¶](#New-features){.wiki-anchor}
--------------------------------------------

[]{#Bug-fixes}

Bug fixes[¶](#Bug-fixes){.wiki-anchor}
--------------------------------------

[]{#Updated-dependencies}

Updated dependencies[¶](#Updated-dependencies){.wiki-anchor}
------------------------------------------------------------

[]{#Change-List}

Change List[¶](#Change-List){.wiki-anchor}
==========================================

[]{#sbndcode-v05_12_01_MCC}

sbndcode v05\_12\_01\_MCC[¶](#sbndcode-v05_12_01_MCC){.wiki-anchor}
-------------------------------------------------------------------

-   2017-03-01 Thomas Brooks : Merge branch \'release/v05\_12\_01\_MCC\'
-   2017-03-01 Thomas Brooks : Version v05\_12\_01\_MCC
-   2017-01-13 Dominic Barker : Addition of +0.5 in line 354 in
    SimWireSBND\_module.cc to account for the discrepancy in the
    pedestal of the raw digit
-   2017-01-05 Dominic Brailsford : Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into develop
-   2017-01-05 Dominic Brailsford : correct typo (missing p from
    physics)
-   2016-12-27 Michelle Stancari : lingering T053 removed
-   2016-12-27 Michelle Stancari : update
-   2016-12-27 Michelle Stancari : update
-   2016-12-22 Dominic Brailsford : Generate one of 4 muons which start
    the front corners of the TPC and aim towards to corner opposite. The
    setup is such that when all 4 muons are considered together, every
    wire in the TPC should be hit. The muons are not all fired at the
    same time in the same event; one is chosen at random!
-   2016-11-25 Dominic Brailsford : Rename the fcl file so that it
    correctly says 5 GeV rather than 3 GeV
-   2016-11-24 Dominic Brailsford : Actually, that should be a 1 degree
    opening angle
-   2016-11-24 Dominic Brailsford : Add gen-level fcl file which makes
    muons fired from a common vertex with a 1.5 degree opening angle.
-   2016-11-22 Dominic Brailsford : Add gen-level fcl files for
    contained muons, pi+, electrons and photons (proton already
    committed)
-   2016-11-21 Dominic Brailsford : Add a genie fcl file which can be
    easily run interactively. Add a genie fcl directory for the mcc.
-   2016-11-21 Dominic Brailsford : Add a fcl file to produce contained
    protons Add a fcl file to run anatree such that the reco branches
    are filled
-   2016-11-21 Dominic Brailsford : Comment out the merge conflict lines
    (don\'t want to delete them in case they are there for a reason\...)
-   2016-11-21 Dominic Brailsford : Merge branch \'develop\' into
    feature/dbrailsf\_mcc1.0
-   2016-11-21 Dominic Brailsford : Include genie directory
-   2016-11-19 Michelle Stancari : set lifetime to 3 ms instead of 0.75
    ms (default)
-   2016-11-19 Michelle Stancari : one more file that has 2500 ticks
    hardcoded
-   2016-11-19 Michelle Stancari : lengthened readout window from 2500
    to 3000 ticks because tracks near the cathode were being chopped.
-   2016-11-18 Michelle Stancari : merge conflicts removed
-   2016-11-18 Michelle Stancari : New signal simulation implemented,
    downstream reco modules adjusted as necessary
-   2016-11-18 Michelle Stancari : Merge remote-tracking branch
    \'origin/feature/jyoti\_sim\' into feature/jyoti\_sim
-   2016-11-17 Michelle Stancari : calorimetry tuned area method only
-   2016-11-17 Michelle Stancari : calorimetry tuned; area method only
-   2016-11-17 Michelle Stancari : noise tuned
-   2016-11-10 Michelle Stancari : tune thresholds
-   2016-11-10 Michelle Stancari : fine tuning
-   2016-11-10 Michelle Stancari : bug fix
-   2016-11-10 Michelle Stancari : bug fix
-   2016-11-10 Michelle Stancari : turned noise on
-   2016-11-09 Michelle Stancari : updates
-   2016-11-09 Michelle Stancari : updates
-   2016-11-09 Michelle Stancari : updates
-   2016-10-27 Michelle Stancari : more tuning
-   2016-10-26 Michelle Stancari : tuned raw signal amplitudes
-   2016-10-25 Michelle Stancari : bug fixed
-   2016-10-25 Michelle Stancari : fix bug in collection plane filter
    params
-   2016-10-21 Andrzej Szelc : fix detsim collection problem - too wide,
    shifted. leaving some debuggin couts for now. calwire still no go
-   2016-10-17 Jyoti Joshi : Changing back the U-plane field response
-   2016-10-10 Jyoti Joshi : Updating field response for U-Plane
-   2016-10-07 Jyoti Joshi : Added some fhicl changes recommended by
    Michelle
-   2016-09-26 Jyoti Joshi : Updating ADCPerPCAtLowestASICGain parameter
-   2016-09-26 Jyoti Joshi : Modify simulation fhicl file
-   2016-09-26 Jyoti Joshi : Modify simulation fhicl file
-   2016-07-25 Jyoti Joshi : Modifying response implementaion
-   2016-07-25 Jyoti Joshi : Updates to CalWire
-   2016-07-21 Jyoti Joshi : CalWire updates
-   2016-07-21 Jyoti Joshi : Updating filter parameters
-   2016-07-21 Jyoti Joshi : Updating Response function implementation
-   2016-07-15 Jyoti Joshi : Fixing typos and debugging
-   2016-07-15 Jyoti Joshi : Updating noise model similar to random
    white noise
-   2016-07-08 Jyoti Joshi : Modifying code to read all three planes
-   2016-07-07 Jyoti Joshi : Modifications to SimWire code
-   2016-07-07 Jyoti Joshi : Upating and debugging code for compilation
-   2016-07-01 Jyoti Joshi : Adding Field Response function from
    histogram
-   2016-07-01 Jyoti Joshi : Updating SignalShaping
-   2016-07-01 Jyoti Joshi : Updating electronics response function
-   2016-07-01 Jyoti Joshi : Updating electronics response function
-   2016-11-17 Michelle Stancari : calorimetry tuned area method only
-   2016-11-17 Michelle Stancari : calorimetry tuned; area method only
-   2016-11-17 Michelle Stancari : noise tuned
-   2016-11-10 Dominic Brailsford : Add 5th MCC 1.0 fcl file -
    prodsingle\_electron\_50-300MeV\_fixposcentertpc1\_isotropicangle.fcl
-   2016-11-10 Dominic Brailsford : Add fourth MCC 1.0 fcl file -
    prodsingle\_gamma\_50-300MeV\_fixposcentertpc1\_isotropicangle.fcl
-   2016-11-10 Dominic Brailsford : Minor alteration to start positions.
    Centre of each TPC is not +-100 exactly. I guess because the cathode
    gets in the way\...
-   2016-11-10 Dominic Brailsford : Add third MCC 1.0 fcl file -
    prodsingle\_mu\_3GeV\_uniformupstream\_fixangleforwardgoing.fcl
-   2016-11-10 Dominic Brailsford : Add second fcl file for MCC -
    prodsingle\_mu\_1.5GeV\_fixposapacross\_gaus10degree.fcl
-   2016-11-10 Dominic Brailsford : Change name of first fcl file to
    better distinguish from other fcl files to come
-   2016-11-10 Dominic Brailsford : Add first MCC 1.0 fcl file (yay)
    -prodsingle\_mu\_1.5GeV\_fixpos\_gaus10degree.fcl
-   2016-11-10 Michelle Stancari : tune thresholds
-   2016-11-10 Michelle Stancari : fine tuning
-   2016-11-10 Michelle Stancari : bug fix
-   2016-11-10 Michelle Stancari : bug fix
-   2016-11-10 Michelle Stancari : turned noise on
-   2016-11-09 Michelle Stancari : updates
-   2016-11-09 Michelle Stancari : updates
-   2016-11-09 Michelle Stancari : updates
-   2016-10-27 Michelle Stancari : more tuning
-   2016-10-26 Michelle Stancari : tuned raw signal amplitudes
-   2016-10-25 Michelle Stancari : bug fixed
-   2016-10-25 Michelle Stancari : fix bug in collection plane filter
    params
-   2016-10-21 Andrzej Szelc : fix detsim collection problem - too wide,
    shifted. leaving some debuggin couts for now. calwire still no go
-   2016-10-17 Jyoti Joshi : Changing back the U-plane field response
-   2016-10-15 Michelle Stancari : Update Calo fcl parameters
-   2016-10-10 Jyoti Joshi : Updating field response for U-Plane
-   2016-10-07 Jyoti Joshi : Added some fhicl changes recommended by
    Michelle
-   2016-10-03 Dominic Brailsford : Add a fcl folder to sbndcode which
    gets copied to the source when installing. This will make it a lot
    easier for the mcc scripts to construct the xml files (e.g. find
    each fcl file in the gen fcl directory and make a project for each
    one)
-   2016-09-29 Gianluca Petrillo : Updated basic reconstruction
    configuration: tracking
-   2016-09-26 Jyoti Joshi : Updating ADCPerPCAtLowestASICGain parameter
-   2016-09-26 Jyoti Joshi : Modify simulation fhicl file
-   2016-09-26 Jyoti Joshi : Modify simulation fhicl file
-   2016-07-12 Gianluca Petrillo : Adding simulation services into event
    display configuration.
-   2016-08-18 Gianluca Petrillo : Added reference to cosmic ray
    documentation in wiki
-   2016-08-17 Gianluca Petrillo : Added CRY configuration by Roxanne
    Guenette.
-   2016-08-17 Gianluca Petrillo : Added Corsika configuration by
    Roxanne Guenette.
-   2016-07-25 Andrzej Szelc : fix grid submission for prodsingle
-   2016-07-25 Jyoti Joshi : Modifying response implementaion
-   2016-07-25 Jyoti Joshi : Updates to CalWire
-   2016-07-21 Gianluca Petrillo : Updated prodsingle\_sbnd\_proj.fcl
-   2016-07-21 Jyoti Joshi : CalWire updates
-   2016-07-21 Jyoti Joshi : Updating filter parameters
-   2016-07-21 Jyoti Joshi : Updating Response function implementation
-   2016-07-20 Gianluca Petrillo : AnalysisTree module can now use
    reconstructed tracks
-   2016-07-19 Gianluca Petrillo : Fixed job configuration for analysis
    tree
-   2016-07-15 Jyoti Joshi : Fixing typos and debugging
-   2016-07-15 Jyoti Joshi : Updating noise model similar to random
    white noise
-   2016-07-08 Jyoti Joshi : Modifying code to read all three planes
-   2016-07-08 Andrzej Szelc : Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into develop
-   2016-07-08 Andrzej Szelc : small tweak to grid launhcing job
-   2016-07-07 Gianluca Petrillo : Updated more job configuration files
-   2016-07-07 Jyoti Joshi : Modifications to SimWire code
-   2016-07-07 Jyoti Joshi : Upating and debugging code for compilation
-   2016-07-01 Jyoti Joshi : Adding Field Response function from
    histogram
-   2016-07-01 Jyoti Joshi : Updating SignalShaping
-   2016-07-01 Jyoti Joshi : Updating electronics response function
-   2016-07-01 Jyoti Joshi : Updating electronics response function
-   2016-07-01 Andrzej Szelc : add landed file conversion job script
-   2016-07-01 Andrzej Szelc : small edits to efield and evd setting to
    resolve bugs found by Michelle
-   2016-06-27 Gianluca Petrillo : Restored the correct name of CalWire
    module instance
-   2016-06-24 Corey Adams : Merge tag \'v05\_12\_01\' into develop

[]{#sbndutil-v01_14_00_MCC}

sbndutil v01\_14\_00\_MCC[¶](#sbndutil-v01_14_00_MCC){.wiki-anchor}
-------------------------------------------------------------------

-   2017-03-01 Thomas Brooks : Merge branch \'release/v01\_14\_00\_MCC\'
-   2017-03-01 Thomas Brooks : Version v01\_14\_00\_MCC
-   2017-03-01 Thomas Brooks : Initial commit
-   2017-02-23 Dominic Brailsford : Reset the project name to that of
    the default project for each iteration of an MCCSTATEMENT. This
    stops the new project append being appended to the previous
    MCCSTATEMENT project
-   2017-02-22 Dominic Brailsford : Also reset newxml to the default
    project when making the default project\'s xml
-   2017-02-22 Dominic Brailsford : Reset the newprj variable back to
    that of the default project when making the default project xml
-   2017-02-22 Dominic Brailsford : Change the structure of the xml
    quite a bit with hacks on top of hacks on top of hacks. There is now
    functionality between the fcl file and this xml generation script to
    create monte carlo samples which use a generator fcl file as usual
    but also uses non-standard downstream fcl files. Necessary to make
    similar MC samples with variation in noise, electron lifetime, to
    run filters etc.
-   2017-02-22 Dominic Brailsford : Make the XML printing bit into a
    function. Remove some stages such as reco2D and opsim.
-   2017-02-16 Dominic Brailsford : Store the request file for the 110m
    baseline gsimple files
-   2017-02-16 Dominic Brailsford : Store the beam flux generation xml
    file
-   2017-02-13 Dominic Brailsford : Add XML files used in MCC 0.5
-   2016-11-21 Dominic Brailsford : Reorder directories
-   2016-11-21 Dominic Brailsford : Fix a couple of directory mislabels
-   2016-11-21 Dominic Brailsford : Point the anatree stage towards the
    new mcc fcl file
-   2016-11-21 Dominic Brailsford : Update fcl names for reco and
    anatree
-   2016-11-15 Dominic Brailsford : Add a xml file for the pre-MCC
-   2016-10-26 absolution1 : Fix userdir userbase bug. Change all work
    dirs to be on dcache rather than bluarc
-   2016-10-26 absolution1 : change directory from scratch to persistent
-   2016-10-26 absolution1 : Change mcc6.0 to mcc1.0
-   2016-10-26 absolution1 : Add CLI switch to change the qualifier. The
    script now no longer assumes prof so one needs to specify (for
    example) -q e9:prof
-   2016-10-11 Dominic Brailsford : Point the script towards
    \$SBNDCODE\_DIR rather than \$UBOONECODE\_DIR and also change the
    hardwired qualifier (this really needs to be not-hardwired)
-   2016-06-16 Andrzej Szelc : Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndutil into develop
-   2016-06-16 Gianluca Petrillo : Renaming sbndutil UPS package
-   2016-06-16 Andrzej Szelc : rename lar1nd-\>sbnd
