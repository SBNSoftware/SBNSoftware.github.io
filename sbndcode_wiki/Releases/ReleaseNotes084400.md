---
layout: page
title: ReleaseNotes084400
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.44.00   03/02/2020         [Release Notes](ReleaseNotes084400.html)
  ----------- ------------ -- -- ------------------------------------------------------



sbndcode v08\_44\_00 Release Notes
======================================================================================

-   **Table of contents**
-   [sbndcode v08\_44\_00 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Bug fixes]
    -   [Updated dependencies]
-   [Change List]
    -   [sbndcode v08\_44\_00]
    -   [sbndutil v08\_44\_00]

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v08\_44\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_44_00/sbndcode-v08_44_00.html){.external}



Purpose
----------------------------------

-   Weekly release



New features
--------------------------------------------

-   sbndutil scripts now compatible with python 3.
-   Update to optical flash matching.
-   Pandora slice ID added to cosmic ID tools.
-   Changes to make geometry service thread safe.



Bug fixes
--------------------------------------



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v08.44.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes084400){.external}
-   larbatch v01.52.02



Change List
==========================================



sbndcode v08\_44\_00
----------------------------------------------------------

-   2020-03-02 Thomas Brooks : Merge branch \'release/v08\_44\_00\'
-   2020-03-02 Thomas Brooks : update for larsoft v08\_44\_00
-   2020-03-02 Thomas Brooks : Merge remote-tracking branch
    \'origin/feature/knoepfel\_threadsafe\_geometry\' into
    release/v08\_44\_00
-   2020-03-02 Iker de Icaza Astiz : Merge branch \'develop\' into
    feature/icaza\_flashmatching
-   2020-03-02 Iker de Icaza Astiz : Use argparse to handle script
    arguments. Now it\'s required to select either \--sbnd or \--icarus
    to select detector.
-   2020-03-02 Iker de Icaza Astiz : Use fcl argument \'detector\' to
    distinguish some detector specific parts
-   2020-02-26 Edward : Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into
    feature/etyley\_cosmicid
-   2020-02-26 Iker de Icaza Astiz : Change path of metrics file to the
    one on sbnd\_data
-   2020-02-26 Edward : Merge branch \'develop\' into
    feature/etyley\_cosmicid
-   2020-02-26 Edward : Fixed default behavior
-   2020-02-25 Iker de Icaza Astiz : Merge branch \'develop\' into
    feature/icaza\_flashmatching
-   2020-02-25 Iker de Icaza Astiz : Squash yet another binning bug
-   2020-02-25 Marco Del Tutto : Removing unused variable
-   2020-02-25 Iker de Icaza Astiz : Add fcl file to run flash matching
-   2020-02-25 Iker de Icaza Astiz : Tidying things up. Cleanup,
    rearrenging, authorship, etc.
-   2020-02-25 Iker de Icaza Astiz : Read drift distance as parameter on
    the fcl file, rename old tpc\_width.
-   2020-02-25 Iker de Icaza Astiz : Printing help doesn\'t work, might
    as well comment it.
-   2020-02-24 Iker de Icaza Astiz : Unhardcode. Use the fcl file to
    read params.
-   2020-02-24 Iker de Icaza Astiz : Read parameters from fcl file.
-   2020-02-24 Iker de Icaza Astiz : Remove ICARUS fcl file from
    sbndcode repo
-   2020-02-24 Iker de Icaza Astiz : Handle the lack of metrics file.
    Rename and rearrange.
-   2020-02-24 Iker de Icaza Astiz : Fix bug with tree filling. XXX/F
    for filling floats, XXX/D for filling doubles.
-   2020-02-24 Marco Del Tutto : Should now compile with clang
-   2020-02-23 Marco Del Tutto : Merge branch
    \'feature/mstancar\_hitdump\' into develop
-   2020-02-23 Marco Del Tutto : Merge branch \'develop\' into
    feature/mstancar\_hitdump
-   2020-02-23 Marco Del Tutto : Code clean up
-   2020-02-21 Iker de Icaza Astiz : Rename and reorder variables to
    have more consistency throughout
-   2020-02-21 Thomas Brooks : Update gallery CI cpu usage again\...
-   2020-02-20 Iker de Icaza Astiz : Formatting with autopep8
-   2020-02-20 Iker de Icaza Astiz : Change floats to doubles
-   2020-02-20 Iker de Icaza Astiz : Rename hists and profs
-   2020-02-20 Iker de Icaza Astiz : Fix binning throughout.
-   2020-02-20 Iker de Icaza Astiz : Improve output of plots and
    warnings from zero spreads
-   2020-02-19 Iker de Icaza Astiz : Check if there are spread values
    close to zero
-   2020-02-19 Iker de Icaza Astiz : Rename some more variables
-   2020-02-19 Iker de Icaza Astiz : Take out inner loop, no point on
    repeating calculations.
-   2020-02-19 Iker de Icaza Astiz : Cleanup a bit
-   2020-02-19 Iker de Icaza Astiz : Include the other metrics. Dumb
    inefficient.
-   2020-02-19 Iker de Icaza Astiz : Fix error on generation templates
    were the spread would be zero. Some renaming.
-   2020-02-19 Kyle Knoepfel : Merge branch \'develop\' into
    feature/knoepfel\_threadsafe\_geometry
-   2020-02-19 Thomas Brooks : Update gallery CI test memory usage
-   2020-02-18 Iker de Icaza Astiz : Working-ish script to get metrics,
    plenty of things to do next but straightforward
-   2020-02-12 Iker de Icaza Astiz : Add not-yet-functional script to
    generate the training template histograms
-   2020-02-11 Iker de Icaza Astiz : Split flash match code to have a
    header file
-   2020-02-06 Iker de Icaza Astiz : Move FlashMatch to its own folder
-   2020-02-18 Iker de Icaza Astiz : Merge branch \'develop\' into HEAD
-   2020-02-14 Kyle Knoepfel : Change to by-value ownership of geometry
    collections.
-   2020-02-14 Kyle Knoepfel : Make (AuxDet)ExptGeoHelperInterface
    implementations thread-safe.
-   2020-02-14 Thomas Brooks : Merge remote branch
    \'origin/feature/mstancar\_cesim\' into develop
-   2020-02-14 Thomas Brooks : Merge tag \'v08\_43\_00\' into develop
-   2020-02-05 Michelle Stancari : adding baseline and pre-amp
    saturation
-   2020-02-05 Edward : Modularised code and added to CosmicIdTree
-   2020-01-28 Iker de Icaza Astiz : Merge branch \'develop\' into
    feature/icaza\_flashmatching
-   2020-01-24 Edward Tyley : Added PFP Nu Score to cosmicId Algs
-   2020-01-22 Marco Del Tutto : minor improvements, taggers to be saved
    are now settable
-   2020-01-15 Michelle Stancari : now the files are there
-   2020-01-15 Michelle Stancari : adding tree for online/nearline
    monitoring development
-   2019-12-19 Iker de Icaza Astiz : Increase the threshold to better
    suit a production environment
-   2019-12-19 Iker de Icaza Astiz : Encapsulate code in
    computeFlashMetrics() function.
-   2019-12-19 Iker de Icaza Astiz : Comment unused variable for now
-   2019-12-18 Iker de Icaza Astiz : Indent to adjust for the previous
    commit
-   2019-12-18 Iker de Icaza Astiz : Check if there\'s charge in the
    TPC, continue if there isn\'t
-   2019-12-18 Iker de Icaza Astiz : Simplify lambda functions and
    other, unrelated, aestetic changes
-   2019-12-18 Iker de Icaza Astiz : Check if there\'s light in the TPC
    and avoid making a score if there isn\'t
-   2019-12-18 Iker de Icaza Astiz : Overload isPDInCryoTPC() function
    to accept channel number.
-   2019-12-18 Iker de Icaza Astiz : Use copy\_if and remove\_if to
    construct a subset of OpHit that pass the time checks
-   2019-12-18 Iker de Icaza Astiz : Rename and change type to better
    suit the purpose of charge clusters
-   2019-12-17 Iker de Icaza Astiz : OCD Styleing
-   2019-12-17 Iker de Icaza Astiz : Use two std::abs to compute the
    score, to account for un-symmetric ICARUS geometry
-   2019-12-16 Iker de Icaza Astiz : In principle, can also detect tau
    neutrinos, via NC interaction\"
-   2019-12-16 Iker de Icaza Astiz : Check cryostat id is ok and load it
    from the variable
-   2019-12-16 Iker de Icaza Astiz : Add SBND and ICARUS fcl files
-   2019-12-15 Michelle Stancari : added a ophit time histogram for the
    bare pmts
-   2019-12-15 Michelle Stancari : Merge branch
    \'feature/icaza\_flashmatching\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into
    feature/icaza\_flashmatching
-   2019-12-15 Michelle Stancari : bug fixes and protection against
    flashes with 0 pe
-   2019-12-13 Iker de Icaza Astiz : Flash\_y and Flash\_z can be
    negative, duh!
-   2019-12-13 Iker de Icaza Astiz : Add a fcl switch to use uncoated
    pmts on the match score
-   2019-12-13 Iker de Icaza Astiz : Prevent from adding unitialized
    terms to the score
-   2019-12-13 Michelle Stancari : removed 4th term from match score
    hopefully temporarily
-   2019-12-11 Michelle Stancari : Merge branch
    \'feature/icaza\_flashmatching\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into
    feature/icaza\_flashmatching
-   2019-12-11 Michelle Stancari : added PE scaling as a fcl
-   2019-12-11 Michelle Stancari : added PEscale as a fcl
-   2019-12-11 Michelle Stancari : Merge branch
    \'feature/icaza\_flashmatching\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into
    feature/icaza\_flashmatching
-   2019-12-11 Michelle Stancari : added PE scaling as a fcl
-   2019-12-11 Iker de Icaza Astiz : Should have also added this on last
    commit
-   2019-12-11 Iker de Icaza Astiz : Fix for bad check of SBND geometry
-   2019-12-09 Iker de Icaza Astiz : Rename vars, sanity check, todos,
    formating
-   2019-12-09 Iker de Icaza Astiz : *HACK*: Check if the charge comes
    from the current TPC, otherwise don\'t use it
-   2019-12-09 Iker de Icaza Astiz : Refactor function to check if pmt
    is in a TPC, works ok now
-   2019-12-09 Michelle Stancari : bug fix
-   2019-12-09 Michelle Stancari : multiply flash pe count by 1000 so it
    can be stored in an unsigned int
-   2019-12-03 Iker de Icaza Astiz : Mitigation: do not denoise arapuca
    signals at all
-   2019-11-26 Iker de Icaza Astiz : *Bugfix:* TV1D\_denoise
    segfaulting. Reason was the code was demoting double to float.
-   2019-12-04 Iker de Icaza Astiz : Add sanity check and op\_type
    variable
-   2019-12-04 Iker de Icaza Astiz : Explicitly write the name of the
    detector as a paramenter, add guard to the ifs
-   2019-12-05 Michelle Stancari : sanity check added to flash finding -
    exit if there are no optical hits in the beam spill window without
    doing any flash matching.
-   2019-12-04 Michelle Stancari : parallel development
-   2019-12-04 Michelle Stancari : put in safeguards in case bad
    histograms are read in for the match score
-   2019-11-25 Iker de Icaza Astiz : Merge branch \'develop\' into
    feature/icaza\_flashmatching
-   2019-11-22 Michelle Stancari : fixed bug added uncoated pmts to
    match score
-   2019-11-19 Iker de Icaza Astiz : Add some features to be able to run
    Icarus files, *shouldn\'t* break anything with SBND



sbndutil v08\_44\_00
----------------------------------------------------------

-   2020-03-02 Thomas Brooks : Merge branch \'release/v08\_44\_00\'
-   2020-03-02 Thomas Brooks : update for larsoft v08\_44\_00
-   2020-02-21 Sbnd : FTS metadata extractor python wrapper (thanks
    Marc!). The metadata extractor points to the usual SBNDPOMS metadata
    extractor
-   2020-02-17 Iker de Icaza Astiz : Updates of changes
-   2020-02-17 Iker de Icaza Astiz : Change indentation to 4 spaces,
    remove whitespace and format to make it autopep8 compliant
-   2020-02-12 Iker de Icaza Astiz : Modifications to scripts to make
    them Python3 compatible
-   2020-02-14 Thomas Brooks : Merge tag \'v08\_43\_00\' into develop
