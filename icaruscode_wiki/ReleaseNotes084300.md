---
lang: en
title: ReleaseNotes084300
---

  ----------- ----------- -- -- ------------------------------------------------------
  v08.43.00   2/18/2020         [Release Notes](ReleaseNotes084300.html)
  ----------- ----------- -- -- ------------------------------------------------------



icaruscode v08\_43\_00 Release Notes
==========================================================================================

-   **Table of contents**
-   [icaruscode v08\_43\_00 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List]
    -   [icaruscode v08\_37\_00]
    -   [icarusutil v08\_36\_02]

[list of icaruscode
releases](List_of_ICARUS_code_releases.html)\
Download instructions for [icaruscode
v08\_43\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_43_00/icaruscode-v08_43_00.html){.external}



Purpose
----------------------------------

-   Stay current with LArSoft - latest versions of
    art/art\_root\_io/root/etc.
-   First step to multithreading



New features
--------------------------------------------

-   Integration update that picks ups various improvements
-   \- Default hit fitter in gaussian hit finding is now the Marquadt
    fitter
-   \- Updates from Gianluca Petrillo aiming at trigger studies



Bug fixes
--------------------------------------



Updated dependencies
------------------------------------------------------------

-   Now using sbndaq\_artdaq\_core v9\_04\_02\_f02



Change List
==========================================

(generated with the command \"git log \--date=short
\--pretty=format:\"\* %ad - %an - %s\" v08\_37\_00\")



icaruscode v08\_37\_00
--------------------------------------------------------------

-   2020-02-18 - Gianluca Petrillo - Merge remote-tracking branch
    \'origin/develop\' into feature/gp\_triggerData\_forDevelop
-   2020-02-18 - Tracy Usher - Preparing to tag v08\_43\_00
-   2020-02-18 - Tracy Usher - Merging in Giuseppe\'s switch to the
    marquadt fitter for gauss hit finding
-   2020-02-16 - Gianluca Petrillo - PMTsimulationAlg: optionally
    restored the slower noise random generator.
-   2020-02-16 - Gianluca Petrillo - PMTsimulationAlg: adopted a faster
    random generator for electronics noise.
-   2020-02-16 - Gianluca Petrillo - PMTsimulationAlg: replaced sets
    with vectors to track local triggers
-   2020-02-16 - Gianluca Petrillo - PMTsimulationAlg: optimised
    implementation for local triggers
-   2020-02-16 - Gianluca Petrillo - Added util::RandFastGaus to make
    Gaussian extraction a bit faster.
-   2020-02-15 - Gianluca Petrillo - Added \`util::SampledFunction\`,
    function with precomputed values.
-   2020-02-15 - Gianluca Petrillo - Added dependency on guideline\_sl
    (another GSL!)
-   2020-02-14 - Gianluca Petrillo - Completed random engine
    documentation
-   2020-02-14 - Gianluca Petrillo - Merge branch
    \'feature/gp\_PMRresponse\' into feature/gp\_triggerData
-   2020-02-14 - Gianluca Petrillo - Added parameters to set seeds of
    SimPMTIcarus random numbers.
-   2020-02-14 - Gianluca Petrillo - Added non-random random engine for
    benchmarking.
-   2020-02-14 - Ryan Howell - Added a condition for checking when to
    plot by requiring active volume AND neutrino interaction
-   2020-02-13 - Gianluca Petrillo - Converted energy variables into GeV
    type.
-   2020-02-13 - Gianluca Petrillo - Added output of interaction type in
    event info stream.
-   2020-02-13 - Gianluca Petrillo - Added generated information to
    event tree.
-   2020-02-12 - Gianluca Petrillo - Bound together the two values of
    PMT quantum efficiency in the code.
-   2020-02-12 - Gianluca Petrillo - TriggerEfficiencyPlots: added
    filtering for TPC active volume.
-   2020-02-13 - Ryan Howell - Fixed a bug with the non-trigger plots
    only acting on the last bin of primitives
-   2020-02-13 - Ryan Howell - Merge branch \'feature/gp\_triggerData\'
    of ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into
    feature/gp\_triggerData
-   2020-02-13 - Ryan Howell - Added a few histograms to start tracking
    information on events that aren\'t triggered.
-   2020-02-13 - Ryan Howell - Merge branch \'develop\' into
    feature/gp\_triggerData
-   2020-02-12 - Gianluca Petrillo - Merge remote-tracking branch
    \'origin/develop\' into feature/gp\_triggerData
-   2020-02-12 - Gianluca Petrillo - Added option to change random
    number engine in SimPMTIcarus.
-   2020-01-24 - Gianluca Petrillo - Fixed labels after directory
    renaming (cosmetic change).
-   2020-01-24 - Gianluca Petrillo - Consolidated namespaces (cosmetic
    change).
-   2020-01-24 - Gianluca Petrillo - Merge branch
    \'feature/gp\_triggerData\' into develop



icarusutil v08\_36\_02
--------------------------------------------------------------

-   unchanged
