---
layout: page
title: ReleaseNotes064800MCC
---

  --------------- ------------ -- -- ---------------------------------------------------------
  v06.48.00.MCC   09/04/2017         [Release Notes](ReleaseNotes064800MCC.html)
  --------------- ------------ -- -- ---------------------------------------------------------



sbndcode v06\_48\_00\_MCC Release Notes
===============================================================================================

-   **Table of contents**
-   [sbndcode v06\_48\_00\_MCC Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List]
    -   [sbndcode v06\_48\_00\_MCC]
    -   [sbndutil v01\_24\_00\_MCC]

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v06\_48\_00\_MCC](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v06_48_00_MCC/sbndcode-v06_48_00_MCC.html)



Purpose
----------------------------------

-   Freeze for MCC 1.0



New features
--------------------------------------------

-   FCL files and filters for the MCC release
-   New geometry
-   CRT code updated and tested with new geometry



Bug fixes
--------------------------------------



Updated dependencies
------------------------------------------------------------



Change List
==========================================



sbndcode v06\_48\_00\_MCC
-------------------------------------------------------------------

-   2017-09-04 Thomas Brooks : Merge branch \'release/v06\_48\_00\_MCC\'
-   2017-09-04 Thomas Brooks : Update product\_deps for MCC freeze
-   2017-09-04 Dominic Brailsford : Merge branch \'develop\' into
    feature/mastbaum\_crt-newgeo-testing
-   2017-09-04 Andrzej Szelc : Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into develop
-   2017-09-04 Andrzej Szelc : fixing Genie by removing Molybdenum
-   2017-09-04 Dominic Brailsford : Add genie\_xsec to the product\_dep
    list and update the EventGeneratorList
-   2017-09-03 Andrew Mastbaum : Merge remote branch \'origin/develop\'
    into feature/mastbaum\_crt-newgeo-testing
-   2017-09-03 Andrew Mastbaum : Merge branch \'develop\' into
    feature/mastbaum\_crt-newgeo-testing
-   2017-09-03 Andrew Mastbaum : add crt to standard detsim
-   2017-09-03 Andrzej Szelc : update geometry value for crt
-   2017-09-02 Gustavo Valdiviesso : Addition of APA and CPA frames and
    mesh.
-   2017-09-01 Dominic Brailsford : Merge branch \'develop\' into
    feature/mcc\_LArSoft6
-   2017-09-01 Dominic Brailsford : Move standard\_anatree\_sbnd.fcl to
    JobConfigurations
-   2017-08-31 Andrew Mastbaum : small modifications from testing CRTs
    in the new geometry
-   2017-08-31 Thomas Brooks : Merge tag \'v06\_48\_00\' into develop
-   2017-08-14 Dominic Brailsford : Merge branch \'develop\' into
    feature/mcc\_LArSoft6
-   2017-08-04 Dominic Brailsford : Fix library name
-   2017-08-04 Dominic Brailsford : Merge branch \'develop\' into
    feature/mcc\_LArSoft6
-   2017-07-06 Dominic Brailsford : Change : to a . Found by Rhiannon
    Jones.
-   2017-07-05 Dominic Brailsford : Merge branch
    \'feature/gp\_forLArSoftDevelop\' into feature/mcc\_LArSoft6
-   2017-06-01 Dominic Brailsford : Change hit finder thresholds to 10,
    pinned to gaus hit finder thresholds.
-   2017-06-01 Dominic Brailsford : Change the fast hit finder
    definition and declarations to use the raw digits, rather than
    calwire
-   2017-06-01 Dominic Brailsford : Add sbnd fast hit finder definition
    and use declaration. The fast hit finder should now automatically be
    run in the standard reco fcl files.
-   2017-06-01 Dominic Brailsford : Fix outdated lib def
-   2017-06-01 Dominic Brailsford : Merge branch
    \'feature/gp\_forLArSoftDevelop\' into feature/mcc\_LArSoft6
-   2017-06-01 Dominic Brailsford : Remove duplicate Utilities
-   2017-06-01 Dominic Brailsford : Merge branch \'develop\' into
    feature/mcc\_LArSoft6
-   2017-03-17 Dominic Brailsford : Add marley directory and
    complimentary fcl file
-   2017-03-17 Dominic Brailsford : Merge branch
    \'feature/gp\_forLArSoftDevelop\' into feature/mcc\_LArSoft6
-   2017-03-17 Dominic Brailsford : Swap the flux used in the dirt fcl
    file. It now uses the large flux window
-   2017-03-13 Dominic Brailsford : Add an MCC statement to use the
    g4-level filter that demands a particle travels 1 mm inside of the
    TPC. Disable making the usual processing path (don\'t use the normal
    G4 fcl file in this case)
-   2017-03-12 Dominic Brailsford : Add a g4-level fcl which requires
    that at least one particle in the event travels at least 1 mm inside
    of the TPC volume
-   2017-03-12 Dominic Brailsford : Add functionality to ignore what the
    pdg of a particle IF the user doesn\'t care what it is (specify pdg
    is 0 in the fcl file)
-   2017-03-12 Dominic Brailsford : Demand that the neutrino rays always
    start 18 m upstream of the TPC front face. This value is chosen
    because it is the distance an 8 GeV muon (\~1 GeV above the max flux
    sim. energy) can travel before stopping.
-   2017-03-12 Dominic Brailsford : Add a full beam spill GENIE file
    which uses the full world geometry. This fcl files is supposed to
    used the configC flux files (the one with the really really large
    window) but they are currently processing. So, it temporarily uses
    the configB fluxes.
-   2017-03-12 Dominic Brailsford : Just incase I ever need the print
    out statements
-   2017-03-11 Dominic Brailsford : The logic in the CRT particle
    filters broke down when an event contained more than one particle.
    This logic has now been fixed.
-   2017-03-11 Dominic Brailsford : Add a corsika gen fcl file which
    utilities the CRT filter which only saves events which contain
    generated muon which looks like it will pass through the front and
    back CRTs
-   2017-03-11 Dominic Brailsford : Add a production-level fcl using the
    largeant CRT filter which demands a muon propagates through the
    front and back CRTs
-   2017-03-11 Dominic Brailsford : Add a LArG4-level CRT filter which
    only passes particles which have propagated through a user requested
    set of CRTs. The filter should mostly be used with it\'s gen-level
    equivalent.
-   2017-03-09 Dominic Brailsford : Remove some headers that aren\'t
    needed.
-   2017-03-09 Dominic Brailsford : Add a generator-level ART filter
    which checks a particles trajectory path to see if it will pass
    through a set of CRTs that the user has specified. Will be useful
    for generating samples of horizontal cosmic muons.
-   2017-03-07 Dominic Brailsford : Merge branch
    \'feature/mastbaum\_crt-sim\' into feature/mcc\_LArSoft6
-   2017-02-23 Dominic Brailsford : Add MCCSTATEMENTS to produces
    samples with different electron lifetimes as well as without
    long/tran/any diffusion
-   2017-02-23 Dominic Brailsford : Bumbled the renaming
-   2017-02-23 Dominic Brailsford : Tweak the momentum to 3GeV and the
    gaus angle width to 20 degrees. These parameters are better for what
    the samples would be used for (e.g. purity analysis).
-   2017-02-23 Dominic Brailsford : Add MCCSTATEMENTS to make samples
    without trans/long/any diffusion
-   2017-02-23 Dominic Brailsford : Add g4-level fcl which switches off
    both long and tran diffusion
-   2017-02-23 Dominic Brailsford : Add g4-level fcl files which switch
    off longitudinal or transverse diffusion
-   2017-02-23 Dominic Brailsford : Add MCCSTATEMENTS to make
    alternative samples with different electron lifetimes
-   2017-02-23 Dominic Brailsford : Remove the 3ms g4 fcl file as that
    is actually the default lifetime.
-   2017-02-23 Dominic Brailsford : Add various g4-level fcl files which
    change the electron lifetime
-   2017-02-23 Dominic Brailsford : Add isotropic photon and electron
    samples with momentum range 0.2-1.5GeV. Fills a request from here:
    <https://cdcvs.fnal.gov/redmine/projects/sbndcode/wiki/Requests>
-   2017-02-23 Dominic Brailsford : A fcl that produces genie events
    with spill structure where all muon neutrinos are swapped out for
    electron neutrinos
-   2017-02-22 Dominic Brailsford : Add an overlay fcl directory with
    one fcl file that runs cosmics + bnb. Inherits from the overlay file
    in JobConfigurations but uses the updated gsimple flux files with
    110m baseline.
-   2017-02-22 Dominic Brailsford : Add an MCCSTATEMENT to make a
    separate sample which is passed through the Michel electron filter
-   2017-02-22 Dominic Brailsford : Add a corsika directory and add a
    corsika cmc fcl file. Right now the output should be identical to
    prodcosmics\_corsika\_sbnd.fcl. This fcl file does demand that the
    generator uses the cmc model just in case
    prodcosmics\_corsika\_sbnd.fcl gets changed in the future.
-   2017-02-22 Dominic Brailsford : Add a full spill structure genie fcl
    file
-   2017-02-22 Dominic Brailsford : Add fcl file for single interaction
    genie events which use the 110 m baseline gsimple files in the
    cryostat volume
-   2017-02-14 Dominic Brailsford : Forgot to include the data member
    vector for the start in TPC check
-   2017-02-14 Dominic Brailsford : Add in the start in TPC check
-   2017-02-14 Dominic Brailsford : Add in a \'Starts in TPC\' check
    which demands that the interesting particle\'s first trajectory
    point is in a TPC volume.
-   2017-02-14 Dominic Brailsford : Update fcl file with michel momentum
    values
-   2017-02-14 Dominic Brailsford : Overhaul the particle filter. -Now
    requires that ALL interesting particles are in an event -Functionise
    the code a bit more i.e. each check is its own function
-   2017-02-14 Dominic Brailsford : Change min/max energy to min/max
    momentum checks
-   2017-02-14 Dominic Brailsford : Change min/max energy to min/max
    momentum check
-   2017-02-14 Dominic Brailsford : Tweak fcl file so that it actually
    runs the filter. Also change the default values for the particle
    filter
-   2017-02-14 Dominic Brailsford : Add simulation-level interesting
    particle filter.



sbndutil v01\_24\_00\_MCC
-------------------------------------------------------------------

-   2017-09-04 Thomas Brooks : Merge branch \'release/v01\_24\_00\_MCC\'
-   2017-09-04 Thomas Brooks : Update product\_deps for MCC release
-   2017-08-31 Thomas Brooks : Merge tag \'v01\_24\_00\' into develop
