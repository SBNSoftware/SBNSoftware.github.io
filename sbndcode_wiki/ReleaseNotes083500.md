---
lang: en
title: ReleaseNotes083500
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.35.00   11/08/2019         [Release Notes](ReleaseNotes083500.html)
  ----------- ------------ -- -- ------------------------------------------------------



sbndcode v08\_35\_00 Release Notes(#sbndcode-v08_35_00-Release-Notes)
======================================================================================

-   **Table of contents**
-   [sbndcode v08\_35\_00 Release
    Notes](#sbndcode-v08_35_00-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v08\_35\_00](#sbndcode-v08_35_00)
    -   [sbndutil v08\_35\_00](#sbndutil-v08_35_00)

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v08\_35\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_35_00/sbndcode-v08_35_00.html){.external}



Purpose(#Purpose)
----------------------------------

-   Weekly release (reco broken)



New features(#New-features)
--------------------------------------------

-   MCP 2.0 branch merged
    -   Semi-analytic light simulation on by default
    -   Optical detector digitization in detsim
    -   Fixes to optical hit reconstruction
    -   GENIE v3 fully configured
    -   Flux files with correct beam center
    -   BNB bucket structure in interaction times
    -   Updated geometry
    -   Region of interest (ROI) finding for deconvoluted waveforms
    -   Trained BDTs for vertex selection in Pandora
    -   Module for flash matching added



Bug fixes(#Bug-fixes)
--------------------------------------



Updated dependencies(#Updated-dependencies)
------------------------------------------------------------

-   [LArSoft
    v08.35.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes083500){.external}
-   larbatch v01.51.10



Change List(#Change-List)
==========================================



sbndcode v08\_35\_00(#sbndcode-v08_35_00)
----------------------------------------------------------

-   2019-11-07 Thomas Brooks : Merge branch \'release/v08\_35\_00\'
-   2019-11-07 Thomas Brooks : Update for larsoft v08\_35\_00
-   2019-11-07 Thomas Brooks : Give error message but don\'t fail if
    optical detector simulation not possible
-   2019-11-07 Thomas Brooks : Don\'t run opHit reco if opDet waveforms
    not present
-   2019-11-06 Iker Loïc de Icaza Astiz : Merge branch \'develop\' into
    feature/icaza\_flashmatching
-   2019-11-06 Michelle Stancari : added a fcl parameter to the
    digitizer to chose which single pE response to use
-   2019-11-05 Michelle Stancari : now creating t0-pfp associations and
    putting them on event in the flash predict code (light-charge
    matching)
-   2019-11-04 Dominic Brailsford : Use install\_fw (coupled with
    product\_deps config allows pandora XML to go to build subdirectory
    as well as local products)
-   2019-11-04 Dominic Brailsford : Merge branch \'develop\' into
    feature/dbrailsf\_mcp2p0
-   2019-11-01 Michelle Stancari : code now produces t0s.
-   2019-11-01 Thomas Brooks : Merge tag \'v08\_34\_00\' into develop
-   2019-10-31 Michelle Stancari : fixed bug in score calculation moved
    root file to common location
-   2019-10-31 Edward Tyley : changing default reco to BDT and adding
    cut based fcl file
-   2019-10-31 Dominic Brailsford : Merge branch \'develop\' into
    feature/dbrailsf\_mcp2p0
-   2019-10-31 Dominic Brailsford : Merge branch
    \'feature/dbrailsf\_mcp2p0\_gputnam\' into feature/dbrailsf\_mcp2p0
-   2019-10-31 Iker Loïc de Icaza Astiz : Somehow this bracket came out
    on the last commit ~~\_~~
-   2019-10-31 Iker Loïc de Icaza Astiz : Use doubles in waveform vector
-   2019-10-30 gputnam : Increase readout window for 1-drift samples to
    enable baseline for optical hit finding.
-   2019-10-30 gputnam : Increase readout window for 1-drift samples to
    enable baseline for optical hit finding.
-   2019-10-30 Iker Loïc de Icaza Astiz : Fix \`double free or
    corruption\` error message related to clearing fwaveform
-   2019-10-28 Laura Paulucci Marinho : New single pe for PMT (from
    data)
-   2019-10-30 Michelle Stancari : added match score calculation to
    module
-   2019-10-29 Michelle Stancari : updates
-   2019-10-28 Dominic Brailsford : Merge branch \'develop\' into
    feature/dbrailsf\_mcp2p0
-   2019-10-25 Michelle Stancari : updated to look inside the beam spill
    to find the time with the most PEs from ophits at that time, and
    then look in the window -10, +90 ns around it for the light flash
-   2019-10-25 Dominic Brailsford : Modularise Gray\'s fcls for
    generating in-time cosmics
-   2019-10-25 Dominic Brailsford : include rns
-   2019-10-25 Dominic Brailsford : New g4-level fcls changing lifetime
    and enabling SCE
-   2019-10-25 Dominic Brailsford : MCP2.0 genie fcls
-   2019-10-25 Dominic Brailsford : Rename files
-   2019-10-24 Dominic Brailsford : Merge branch
    \'feature/dbrailsf\_mcp2p0\' into feature/dbrailsf\_mcp2p0\_gputnam
-   2019-10-24 Dominic Brailsford : Typos
-   2019-10-24 Dominic Brailsford : proton mode fcls
-   2019-10-24 gputnam : Set efficiency values correctly.
-   2019-10-24 gputnam : Turn on OpDet simulation and hit-finding.
-   2019-10-24 gputnam : Merge branch \'feature/gputnam-PTBemulator2\'
    into feature/dbrailsf\_mcp2p0\_gputnam
-   2019-10-24 Dominic Brailsford : config F overalys
-   2019-10-24 Dominic Brailsford : update sampling times for corsika
-   2019-10-24 Dominic Brailsford : new fcl for overlay 3drift
-   2019-10-24 Dominic Brailsford : rename
-   2019-10-24 Dominic Brailsford : Remove commented out stuff and
    rename
-   2019-10-24 Dominic Brailsford : Move tool param sets into its own
    fcl
-   2019-10-24 Dominic Brailsford : Rejig fcl slightly
-   2019-10-24 Dominic Brailsford : icarus -\> sbnd
-   2019-10-24 Dominic Brailsford : icarus -\> sbnd
-   2019-10-24 Dominic Brailsford : icarus -\> sbnd
-   2019-10-24 Dominic Brailsford : icarus -\> sbnd
-   2019-10-24 Dominic Brailsford : Stop the modules being executable
-   2019-10-24 Dominic Brailsford : Merge branch
    \'feature/dbrailsf\_mcp2p0\' into dbrailsf\_roi\_integration
-   2019-10-24 Dominic Brailsford : Disable shower rollup by default.
    Rejig the no rollup fcl to be a rollup fcl
-   2019-10-24 Andrew Scarff : Cleaning up print statements from
    TrackHit Eff tool
-   2019-10-23 Dominic Brailsford : Update FCLS to use the 3drift fcl
-   2019-10-23 Dominic Brailsford : Another redundant one
-   2019-10-23 Dominic Brailsford : Remove redundant fcl (light sim now
    run by default)
-   2019-10-23 Dominic Brailsford : Merge branch \'develop\' into
    feature/dbrailsf\_mcp2p0
-   2019-10-21 Andrew Scarff : Merge branch \'feature/dbrailsf\_mcp2p0\'
    into ascarff\_ROItest
-   2019-10-21 Andrew Scarff : Adding roi analysis tool
-   2019-10-21 Andrew Scarff : Adding some extra producer fcls
-   2019-10-14 Iker Loïc de Icaza Astiz : Picking up Michelle\'s work on
    Flash Matching, ported from uBoone
-   2019-10-18 Andrew Scarff : Adding implementation of ROI tools into
    CalWireSBND. These allow a smaller ROI to be saved in the reco
-   2019-10-14 gputnam : Merge branch \'feature/gputnam-PTBemulator2\'
    into feature/dbrailsf\_mcp2p0\_gputnam
-   2019-10-14 gputnam : Merge branch \'feature/gputnam-PTBemulator2\'
    into feature/dbrailsf\_mcp2p0\_gputnam
-   2019-10-13 gputnam : Merge branch \'feature/gputnam-PTBemulator2\'
    into feature/dbrailsf\_mcp2p0\_gputnam
-   2019-10-13 gputnam : Merge branch \'feature/gputnam-cosmic-sample\'
    into feature/dbrailsf\_mcp2p0\_gputnam
-   2019-10-13 gputnam : Don\'t override default save particle config.
-   2019-10-13 gputnam : Remove saving EMShowerDaughters from G4.
-   2019-10-11 Dominic Brailsford : Remove the printout
-   2019-10-11 Dominic Brailsford : Merge branch
    \'feature/dbrailsf\_mcp2p0\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into
    feature/dbrailsf\_mcp2p0
-   2019-10-11 Dominic Brailsford : Fix for application-based metadata
    being missing
-   2019-10-01 Edward Tyley : added fcls
-   2019-09-26 gputnam : Add in TPC fiducial cut to overlay generation.
-   2019-09-20 gputnam : Don\'t override default geometry in intime
    cosmic gen file.
-   2019-09-20 gputnam : Save delta rays in 3drift G4 config.
-   2019-09-20 gputnam : Merge branch \'develop\' into
    feature/gputnam-cosmic-sample
-   2019-09-20 gputnam : Remove light DAQ and reconstruction from MC
    chain.
-   2019-09-20 gputnam : Update regular G4 file to use 3drift fcl file.
-   2019-09-12 gputnam : Hacky fix to histogram-based Optical Hit
    finding.
-   2019-09-12 gputnam : Bubfix in triggering algorithm.
-   2019-09-12 gputnam : Set optical readout window for standard detsim.
-   2019-09-12 gputnam : Merge branch \'feature/gputnam-PTBemulator\'
    into feature/gputnam-cosmic-sample
-   2019-09-12 gputnam : Merge branch \'feature/gputnam-cosmic-sample\'
    of ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into
    feature/gputnam-cosmic-sample
-   2019-09-12 gputnam : increase OpDet readout windows for cosmic
    sample.
-   2019-09-12 gputnam : don\'t overwrite old trigger locations
-   2019-09-12 Andrew Scarff : Merge branch
    \'feature/gputnam-cosmic-sample\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into
    feature/gputnam-cosmic-sample
-   2019-09-12 Andrew Scarff : Adding g4 fcl for SCE and no optical.
-   2019-09-11 gputnam : bugfix
-   2019-09-10 gputnam : Merge branch \'feature/gputnam-cosmic-sample\'
    of ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into
    feature/gputnam-cosmic-sample
-   2019-09-10 gputnam : TEMPORARY HACK: decrease efficiency on PMT\'s
    untilthe pre scale is fixed upstream.
-   2019-09-10 gputnam : Update detsimand reco to include optical
    detector.
-   2019-09-10 gputnam : Merge branch \'develop\' into
    feature/gputnam-cosmic-sample
-   2019-09-10 gputnam : Merge branch \'develop\' into
    feature/gputnam-cosmic-sample
-   2019-09-05 gputnam : CRT timing works by default.
-   2019-09-03 Rhiannon Jones : Final GENIE tweak
-   2019-09-03 Rhiannon Jones : Fixed IDGH typo
-   2019-09-02 Rhiannon Jones : Fixed merge conflicts with
    v08\_30\_00/develop
-   2019-08-07 Dominic Brailsford : Update fcl to use the pre-defined
    largeant service block, rather than doing the overrides on its own
-   2019-08-07 Dominic Brailsford : Optional laegeantparams which does
    not use the optical sim
-   2019-08-07 Dominic Brailsford : Rename so its more like the other
    fcls
-   2019-08-07 Dominic Brailsford : Remove fast optical sim fcl. Add no
    op sim fcl.
-   2019-08-07 Dominic Brailsford : Use lite photons
-   2019-08-07 Dominic Brailsford : Enable fast optical simulation in
    the sbnd g4 services Enable the optical response services in the
    sbnd detsim services Disable the \'opticalsimulation\' services
    block as it is now redundant Update the two fcls which use the
    opticalsimulation services table to now use the full sbnd simulation
    services table
-   2019-08-06 Dominic Brailsford : Typo in comment
-   2019-08-05 Dominic Brailsford : Bump the geometry version
-   2019-08-02 Dominic Brailsford : fcl using rotated bucked
-   2019-08-02 Dominic Brailsford : Add tables to describe the bucket
    structure (thanks to A. C. Ezeribe for the implementation)
-   2019-08-02 Dominic Brailsford : Add bucket tables
-   2019-08-02 Dominic Brailsford : Intrinsic nue (single interaction)
    for config F
-   2019-08-02 Dominic Brailsford : Add requirement that POTPerSpill is
    0 for single interaction events (apparently nutools now requires
    this)
-   2019-08-02 Dominic Brailsford : Update flux file names for new
    configs
-   2019-08-02 Dominic Brailsford : Add the folders to cmake
-   2019-08-02 Dominic Brailsford : Config G fcl
-   2019-08-02 Dominic Brailsford : Forgot the CMAKE
-   2019-08-02 Dominic Brailsford : ConfigF fcl files
-   2019-08-02 Dominic Brailsford : Update the default flux to use
    configs F and G
-   2019-08-02 Dominic Brailsford : Include new flux configs
-   2019-09-01 gputnam : Merge commit
    \'f142173355089e6694243dae2e9d89e24edb5f83\' into
    feature/gputnam-cosmic-sample
-   2019-09-01 gputnam : Setup CRT timing for 3 drift windows. PMT
    timing is TBD.
-   2019-09-01 gputnam : Consolidate 3 drift window timings. Make naming
    of cosmic generator consistent.
-   2019-08-07 Dominic Brailsford : Update fcl to use the pre-defined
    largeant service block, rather than doing the overrides on its own
-   2019-08-07 Dominic Brailsford : Optional laegeantparams which does
    not use the optical sim
-   2019-08-07 Dominic Brailsford : Rename so its more like the other
    fcls
-   2019-08-07 Dominic Brailsford : Remove fast optical sim fcl. Add no
    op sim fcl.
-   2019-08-07 Dominic Brailsford : Use lite photons
-   2019-08-07 Dominic Brailsford : Enable fast optical simulation in
    the sbnd g4 services Enable the optical response services in the
    sbnd detsim services Disable the \'opticalsimulation\' services
    block as it is now redundant Update the two fcls which use the
    opticalsimulation services table to now use the full sbnd simulation
    services table
-   2019-08-06 Dominic Brailsford : Typo in comment
-   2019-08-05 Dominic Brailsford : Bump the geometry version
-   2019-08-02 gputnam : Merge branch \'develop\' into
    feature/gputnam-cosmic-ana
-   2019-08-02 Dominic Brailsford : fcl using rotated bucked
-   2019-08-02 Dominic Brailsford : Add tables to describe the bucket
    structure (thanks to A. C. Ezeribe for the implementation)
-   2019-08-02 Dominic Brailsford : Add bucket tables
-   2019-08-02 Dominic Brailsford : Intrinsic nue (single interaction)
    for config F
-   2019-08-02 Dominic Brailsford : Add requirement that POTPerSpill is
    0 for single interaction events (apparently nutools now requires
    this)
-   2019-08-02 Dominic Brailsford : Update flux file names for new
    configs
-   2019-08-02 Dominic Brailsford : Add the folders to cmake
-   2019-08-02 Dominic Brailsford : Config G fcl
-   2019-08-02 Dominic Brailsford : Forgot the CMAKE
-   2019-08-02 Dominic Brailsford : ConfigF fcl files
-   2019-08-02 Dominic Brailsford : Update the default flux to use
    configs F and G
-   2019-08-02 Dominic Brailsford : Include new flux configs
-   2019-07-30 gputnam : Add updated geometry to light simulation in
    Photon Time filter
-   2019-07-30 gputnam : Switch new overlay to also use proton mode. Set
    different random time offset value in neutrino generation
-   2019-07-30 gputnam : Clean up intime filtered fhicl file and add in
    final version of parameters
-   2019-07-29 gputnam : remove debug mode from g4 fhicl
-   2019-07-29 gputnam : Fhicl file to run intime Filters. Drops
    produced stuff on exit
-   2019-07-29 gputnam : New fhicl to run light simulation w/ 3 drift
    windows
-   2019-07-29 gputnam : Add in corsika fcl file using new flux file
-   2019-07-29 gputnam : remove filter from G4 stage
-   2019-07-08 gputnam : Merge branch \'feature/semi\_ugr\_mcr\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into
    feature/gputnam-cosmic-sample
-   2019-06-24 gputnam : Merge branch \'feature/semi\_ugr\_mcr\' into
    feature/gputnam-cosmic-sample
-   2019-06-20 gputnam : Update time window to what appears to be
    specified by corsika TimeOffset
-   2019-06-19 gputnam : first draft of fhicl for proton corsika mode, 3
    readout windows, filter out-of-time events



sbndutil v08\_35\_00(#sbndutil-v08_35_00)
----------------------------------------------------------

-   2019-11-07 Thomas Brooks : Merge branch \'release/v08\_35\_00\'
-   2019-11-07 Thomas Brooks : Update for larsoft v08\_35\_00
-   2019-11-05 Dominic Brailsford : Enable singularity
-   2019-11-05 Dominic Brailsford : Enable singularity
-   2019-11-01 Thomas Brooks : Merge tag \'v08\_34\_00\' into develop
