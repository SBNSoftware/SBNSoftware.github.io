---
lang: en
title: ReleaseNotes083101
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.31.01   10/01/2019         [Release Notes](ReleaseNotes083101.html)
  ----------- ------------ -- -- ------------------------------------------------------



icaruscode v08\_31\_01 Release Notes
==========================================================================================

-   **Table of contents**
-   [icaruscode v08\_31\_01 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List]
    -   [icaruscode v08\_31\_01]
    -   [icarusutil v08\_31\_01]

[list of icaruscode
releases](List_of_ICARUS_code_releases.html)\
Download instructions for [icaruscode
v08\_31\_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_19_01/icaruscode-v08_31_01.html){.external}



Purpose
----------------------------------

-   NOTE these are the first release notes in some time (sadly), there
    are intervening releases with no notes and so catching up here
-   Catch up release to stay current with LArSoft
-   Include new noise response histograms from Filippo
-   Various icaruscode software updates (see below)



New features
--------------------------------------------

-   New option for TPC electronics noise



Bug fixes
--------------------------------------

-   (none?)



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v08.31.01](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes083101){.external}



Change List
==========================================

(generated with the command \"git log \--date=short
\--pretty=format:\"\* %ad - %an - %s\" v08\_31\_01\")



icaruscode v08\_31\_01
--------------------------------------------------------------

-   2019-09-26 - Usher, Tracy L - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2019-09-26 - Usher, Tracy L - LArSoft v08\_31\_01
-   2019-09-26 - Usher, Tracy L - Merge remote-tracking branch
    \'origin/feature/varanini\_sbnnoise\' into develop
-   2019-09-26 - Usher, Tracy L - Small code cleanup
-   2019-09-25 - Filippo Varanini - fixed cmakelists for sbnnoise model
-   2019-09-25 - Usher, Tracy L - Formatting and remove std::cout
    statements
-   2019-09-25 - Usher, Tracy L - Make sure the default is still the
    \"old\" noise model
-   2019-09-25 - Usher, Tracy L - Simplify with a single definition for
    the SBN noise model and overrides provided at end.
-   2019-09-25 - Usher, Tracy L - Add new default event display fcl for
    the multi-TPC reconstruction and including the PMT display in the 3D
    viewer
-   2019-09-25 - Filippo Varanini - setting SuppressNoSignal to true
-   2019-09-24 - Filippo Varanini - set old(correlated) noise model as
    default. added SBNNoise subdirectory with override
-   2019-09-24 - Usher, Tracy L - Merge commit
    \'9a83c53534ea687953478344e480f4c2074e3c47\' into develop
-   2019-09-24 - Usher, Tracy L - Chasing LArSoft
-   2019-09-23 - Filippo Varanini - plane-dependent SBN noise.
    Improvement to noise analysis module
-   2019-09-16 - Usher, Tracy L - Chasing larsoft
-   2019-09-10 - Gianluca Petrillo - Updated PMT dark current rate to
    measured value from CERN test stand.
-   2019-09-06 - Usher, Tracy L - formatting
-   2019-09-06 - Usher, Tracy L - Merge commit
    \'602047be21fee094c3ae618c78e6ce431c0559d6\' into develop
-   2019-09-06 - Usher, Tracy L - Update for next LArSoft release
-   2019-09-06 - Yun-Tse Tsai - configure the right labels
-   2019-09-06 - Yun-Tse Tsai - remove a bunch of settings which do not
    work
-   2019-09-06 - Usher, Tracy L - squash some bugs and some output,
    another day at the office
-   2019-09-05 - Usher, Tracy L - More output to the tuple
-   2019-09-05 - Usher, Tracy L - Temporarily disable running the shower
    reconstruction until the inputs are sorted out
-   2019-09-05 - Usher, Tracy L - aha! \"standard\_tracs\_shower\"!
    Physics by feeling around in the dark. That\'s how its done.
-   2019-09-05 - Usher, Tracy L - Strip out the pieces that cannot be
    resolved, change \"sbnshower\" to \"shower\". Now initializes\...
-   2019-09-04 - Usher, Tracy L - Fix compile issues
-   2019-09-04 - Usher, Tracy L - Include \"SBN-style\" shower
    reconstruction in the reco work flow for gaus hits (if it works we
    can expand to raw hits)
-   2019-09-04 - Usher, Tracy L - Add definitions for doing shower
    reconstruction
-   2019-09-04 - Usher, Tracy L - Merge remote-tracking branch
    \'origin/feature/gp\_PMTgainFluctuation\' into develop
-   2019-09-04 - Usher, Tracy L - continuing development with more
    output
-   2019-08-30 - Usher, Tracy L - LArSoft v08\_30\_00
-   2019-08-30 - Usher, Tracy L - Add tool to handle studies of
    SpacePoints
-   2019-08-30 - Usher, Tracy L - Don\'t forget to include the new
    folders
-   2019-08-30 - Usher, Tracy L - Moving fhicl files into subfolders for
    aesthetic appeal
-   2019-08-30 - Gianluca Petrillo - Workaround: temporary replacement
    of elements in detector materials.
-   2019-08-29 - Gianluca Petrillo - Install job configuration to dump
    channels
-   2019-08-29 - Gianluca Petrillo - Updated NuMI POT in GENIE
    configuration.
-   2019-08-29 - Gianluca Petrillo - Implemented PMT gain fluctuations.
-   2019-08-29 - Gianluca Petrillo - Install job configuration to dump
    channels
-   2019-08-27 - Usher, Tracy L - Removing the unnecessary histogram
    output from Cluster3D
-   2019-08-27 - Usher, Tracy L - The eternal chase of LArSoft
-   2019-08-26 - Usher, Tracy L - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2019-08-26 - Usher, Tracy L - Adding tool to do MC based analysis of
    SpacePoints
-   2019-08-20 - Gianluca Petrillo - Introduced beam structure in
    simulation.
-   2019-08-16 - Usher, Tracy L - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2019-08-16 - Usher, Tracy L - Release v08\_28\_01
-   2019-08-16 - Usher, Tracy L - Add parameter to prevent crash
-   2019-08-16 - Usher, Tracy L - Building against updates in LArSoft
-   2019-08-15 - Christopher Hilgenberg - upgrade to larsoft v08\_28\_01
-   2019-08-15 - Christopher Hilgenberg - Merge remote-tracking branch
    \'origin/feature/knoepfel\_rm\_unused\_headers\' into
    feature/chilgenb\_updatedCRTGeom
-   2019-08-15 - Christopher Hilgenberg - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into
    feature/chilgenb\_updatedCRTGeom
-   2019-08-15 - Christopher Hilgenberg - added structural support
    I-beams for top CRT modules
-   2019-08-15 - Usher, Tracy L - LarSoft v08\_28\_00
-   2019-08-15 - Usher, Tracy L - Fix small faux pas and get running on
    OSX
-   2019-08-15 - Usher, Tracy L - Clean up leftover stuff
-   2019-08-14 - Usher, Tracy L - Merge commit
    \'1ef04c963870fa63d62e7df219257ba18acb4290\' into develop
-   2019-08-12 - Gianluca Petrillo - Enabled the mapped photon library
    by default also for cosmic ray generation.
-   2019-08-08 - Christopher Hilgenberg - changes to read feb map from
    icarus\_data
-   2019-08-08 - Christopher Hilgenberg - fixed merge conflict (added
    CRTTrack reco)
-   2019-08-08 - Kyle Knoepfel - Accommodate header-dependency changes.
-   2019-08-01 - Usher, Tracy L - Fix some compile time issues
-   2019-08-01 - Usher, Tracy L - Merge remote-tracking branch
    \'origin/feature/chilgenb\_updatedCRTGeom\' into develop
-   2019-08-01 - Usher, Tracy L - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2019-08-01 - Usher, Tracy L - Improvements to the coherent noise
    correction
-   2019-08-01 - Usher, Tracy L - Pointing to the new tag of
    icarus\_data
-   2019-08-01 - Usher, Tracy L - Updating with feature branches from
    Chris for CRT and Filippo for the noise model
-   2019-08-01 - Usher, Tracy L - Merge remote-tracking branch
    \'origin/feature/chilgenb\_CRTTrack\' into develop
-   2019-08-01 - Usher, Tracy L - Merge remote-tracking branch
    \'origin/varanini\_coherentnoise\' into develop
-   2019-08-01 - Christopher Hilgenberg - merge develop into
    feature/chilgenb\_CRTTrack
-   2019-08-01 - Christopher Hilgenberg - change detsim arrays to
    vectors
-   2019-08-01 - Christopher Hilgenberg - changes for compatibility with
    new CRT geometry
-   2019-07-31 - Christopher Hilgenberg - factored out light generation,
    attenuation models from produce method, added some comments, fixed
    bug where non-valid events with incomplete data were being pushed to
    event
-   2019-07-30 - Usher, Tracy L - Moving on up to LArSoft v08\_27\_00
-   2019-07-29 - Filippo Varanini - new noise model including
    coherent/incoherent noise from SBN tests
-   2019-07-29 - Christopher Hilgenberg - disable verbose message output
-   2019-07-28 - Christopher Hilgenberg - switch truth level analysis
    vars from arrays to vectors to save on memory use, make drawing from
    analysis tree easier
-   2019-07-28 - Christopher Hilgenberg - change path of module id to
    feb id map file from local to Geometry/gdml
-   2019-07-27 - Christopher Hilgenberg - changes required to work with
    new CRT geometry
-   2019-07-27 - Christopher Hilgenberg - regenerate geometry files to
    include crt volumes east/west rim module name swap fix
-   2019-07-27 - Christopher Hilgenberg - for now, store csv file with
    map from CRT module ID to FEB ID in gdml dir
-   2019-07-27 - Christopher Hilgenberg - fixed module name swap between
    ease/west rim taggers; added functionality to crt frag generator to
    print out map form module IDs to front-end board IDs, channel sets
    to csv file
-   2019-07-26 - Gianluca Petrillo - Fixed a mistake affecting debug
    version only.
-   2019-07-25 - Christopher Hilgenberg - first attempt at adding
    reflectivites, not necessarily needed but would surpress warnings
    given at G4 stage. was not successful. commented out additions to be
    used for starting point in the future.
-   2019-07-25 - Christopher Hilgenberg - regenerate geometry files with
    validation error fixes
-   2019-07-25 - Christopher Hilgenberg - fix ID value not unique errors
    for side CRT tagger solids
-   2019-07-25 - Christopher Hilgenberg - fix no character data is
    allowed by content model error. removed seemingly extraneous \*
-   2019-07-25 - Gianluca Petrillo - Update for LArSoft v08\_27\_00
-   2019-07-25 - Christopher Hilgenberg - fix ID value not unique error
    posPMTPlane
-   2019-07-25 - Christopher Hilgenberg - fix no character data is
    allowed by content model error. removed seemingly extraneous \*
-   2019-07-25 - Christopher Hilgenberg - fix no character data is
    allowed by content model error. \# syntax not recognized while
    writing to file. switch to xml comment syntax
-   2019-07-25 - Christopher Hilgenberg - regenerate geometry files to
    include labeling fix
-   2019-07-16 - Gianluca Petrillo - Added some helper code for trigger
    simulation.
-   2019-06-27 - Gianluca Petrillo - Added some utilities to
    transparently handle waveform polarity.
-   2019-07-25 - Christopher Hilgenberg - fix east/west lables backwards
-   2019-07-25 - Christopher Hilgenberg - removed extra parenthesis
-   2019-07-25 - Christopher Hilgenberg - changes for compatibility with
    new CRT geometry
-   2019-07-25 - Christopher Hilgenberg - regenerate geometry files with
    fixed CRT volume name format
-   2019-07-25 - Christopher Hilgenberg - fixed volume name formatting
    problem
-   2019-07-24 - Christopher Hilgenberg - generate new geometry files
-   2019-07-24 - Christopher Hilgenberg - added offset parameters for
    positioning CRT shell relative to warm vessel
-   2019-07-24 - Christopher Hilgenberg - updates to reflect plan for
    final configuration including cut side CRT modules, vertical instead
    of sloped top CRT modules, sparse coverage on side CRT, north wall
    due to interference from proximity cryo, offset of CRT top plan
    w.r.t warm vessel
-   2019-07-01 - Gianluca Petrillo - Code update with new quantity
    features.
-   2019-07-23 - Gianluca Petrillo - Configuration for generator of
    argon 39 decays.
-   2019-07-22 - Gianluca Petrillo - Merge branch
    \'feature/gp\_PhotonVisTransformations\' into develop
-   2019-07-22 - Gianluca Petrillo - Mapped photon library made default.
-   2019-07-22 - Gianluca Petrillo - Added scripts and a unit test to
    validate ICARUS configuration files.
-   2019-07-18 - Lynn Garren - use path to avoid confusion
-   2019-07-17 - Lynn Garren - make sure we can find
    nurandom\_RandomUtils\_NuRandomService\_service
-   2019-07-08 - Gianluca Petrillo - Merge remote-tracking branch
    \'origin/feature/gp\_PhotonVisTransformations\' into
    feature/gp\_PhotonVisTransformations
-   2019-07-08 - Gianluca Petrillo - Merge remote-tracking branch
    \'origin\' into feature/gp\_PhotonVisTransformations
-   2019-07-08 - Gianluca Petrillo - Added full job configurations to
    test photon library mapping.
-   2019-06-17 - Gianluca Petrillo - Added
    \`dump\_opdetwaveforms\_icarus.fcl\` to dump optical waveforms with
    ICARUS simulation settings.
-   2019-06-17 - Gianluca Petrillo - Added configuration
    \`icarus\_photonvisibilityservice\_mapped\` for
    PhotonVisibilityService
-   2019-06-17 - Gianluca Petrillo - Bug fix to the photon visibility
    service mapping.
-   2019-06-29 - Usher, Tracy L - Merge remote-tracking branch
    \'origin/feature/knoepfel\_rm\_bezier\' into develop
-   2019-06-29 - Usher, Tracy L - Movin\' on up to a deluxe larsoft in
    the sky\... (v08\_24\_00)
-   2019-06-24 - Gianluca Petrillo - Added general documentation of
    provided Python modules.
-   2019-06-24 - Gianluca Petrillo - \`galleryUtils.eventLoop\` now
    accepts python lists as input files.
-   2019-06-24 - Gianluca Petrillo - Added check of interpretation of
    ROOT command in Python module.
-   2019-06-24 - Gianluca Petrillo - Cosmetic changes to Python modules.
-   2019-06-24 - Gianluca Petrillo - Bug fixes to python modules
    (missing code and missed update).
-   2019-06-24 - Gianluca Petrillo - Loading ROOT (via \`ROOTutils\`)
    does not mess command line arguments any more.
-   2019-06-21 - Gianluca Petrillo - Added printing functions to
    geometry objects for Python.
-   2019-06-21 - Gianluca Petrillo - Added geometry service
    configuration for split wire geometry.
-   2019-06-17 - Gianluca Petrillo - Added
    \`dump\_opdetwaveforms\_icarus.fcl\` to dump optical waveforms with
    ICARUS simulation settings.
-   2019-06-17 - Gianluca Petrillo - Added configuration
    \`icarus\_photonvisibilityservice\_mapped\` for
    PhotonVisibilityService
-   2019-06-17 - Gianluca Petrillo - Bug fix to the photon visibility
    service mapping.



icarusutil v08\_31\_01
--------------------------------------------------------------

-   2019-10-01 - Usher, Tracy L - Chasing LArSoft
-   2019-09-24 - Usher, Tracy L - Chasing LArSoft
-   2019-08-30 - Usher, Tracy L - LArSoft v08\_30\_00
-   2019-08-27 - Usher, Tracy L - Chasing LArSoft
-   2019-08-16 - Usher, Tracy L - Getting read for v08\_28\_01 release
-   2019-08-15 - Usher, Tracy L - LArSoft v08\_28\_00
-   2019-08-01 - Usher, Tracy L - Keeping up with LArSoft v08\_27\_00
-   2019-06-29 - Usher, Tracy L - Larsoft v08\_24\_00
