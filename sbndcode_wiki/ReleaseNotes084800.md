---
lang: en
title: ReleaseNotes084800
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.48.00   03/26/2020         [Release Notes](ReleaseNotes084800.html)
  ----------- ------------ -- -- ------------------------------------------------------



sbndcode v08\_48\_00 Release Notes(#sbndcode-v08_48_00-Release-Notes)
======================================================================================

-   **Table of contents**
-   [sbndcode v08\_48\_00 Release
    Notes](#sbndcode-v08_48_00-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v08\_48\_00](#sbndcode-v08_48_00)
    -   [sbndutil v08\_48\_00](#sbndutil-v08_48_00)

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v08\_48\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_48_00/sbndcode-v08_48_00.html){.external}



Purpose(#Purpose)
----------------------------------

-   Weekly release



New features(#New-features)
--------------------------------------------



Bug fixes(#Bug-fixes)
--------------------------------------

-   Fix to [Bug
    \#24211](https://cdcvs.fnal.gov/redmine/issues/24211#change-76323){.external}



Updated dependencies(#Updated-dependencies)
------------------------------------------------------------

-   [LArSoft
    v08.48.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes084800){.external}



Change List(#Change-List)
==========================================



sbndcode v08\_48\_00(#sbndcode-v08_48_00)
----------------------------------------------------------

-   2020-03-26 Andrew Scarff : Merge branch \'release/v08\_48\_00\'
-   2020-03-26 Andrew Scarff : Update to larsoft v08\_48\_00
-   2020-03-26 Andrew Scarff : Merge branch
    \'feature/knoepfel\_shared\_services\' into release/v08\_48\_00
-   2020-03-26 Iker de Icaza Astiz : Merge branch
    \'bugfix/icaza\_digitizers\' into develop
-   2020-03-26 Iker de Icaza Astiz : Move the check to allow
    digitization time spread to populate the readout window
-   2020-03-26 Andrew Scarff : Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into develop
-   2020-03-26 Andrew Scarff : Updates to speed up the new noise model.
-   2020-03-24 Iker de Icaza Astiz : Handle the casts from doubles to
    integers, avoid computing waveforms from times before the
    acquisition window.
-   2020-03-24 Iker de Icaza Astiz : Rename auxmap to
    directPhotonsOnPMTS everywhere
-   2020-03-24 Iker de Icaza Astiz : Remove odd vector declaration and
    reserve the size of the main waveform early on
-   2020-03-24 Iker de Icaza Astiz : Added missing changes to stop using
    randFlat for every photon.
-   2020-03-23 Iker de Icaza Astiz : Mitigation to bug
    [\#24211](/redmine/issues/24211 "Bug: Undefined cast to size_t on AddSPE() function both on DigiArapucaSBNDAlg and DigiPMTSBNDAlg (Feedback)"){.issue
    .tracker-1 .status-4 .priority-5 .priority-high3 .created-by-me
    .assigned-to-me}
-   2020-03-23 Kyle Knoepfel : Accommodate breaking changes.
-   2020-03-22 Iker de Icaza Astiz : Merge branch
    \'feature/icaza\_digitizers\' into develop
-   2020-03-22 Iker de Icaza Astiz : Merge branch
    \'feature/icaza\_pdsmaprenaming\' into develop
-   2020-03-22 Iker de Icaza Astiz : Rename files to keep with C++
    convention
-   2020-03-22 Iker de Icaza Astiz : Update authorship
-   2020-03-22 Iker de Icaza Astiz : Finally for Arapucas: avoid calling
    RandFlat by simply looping the corresponding fraction of the photons
-   2020-03-22 Iker de Icaza Astiz : Move loops inside
    SinglePDWaveformCreatorLite()
-   2020-03-22 Iker de Icaza Astiz : Check first for XArapucas as those
    are more common
-   2020-03-21 Iker de Icaza Astiz : Rename all instances of Type 1 and
    Type 2 Arapucas, for the explicit VUV and VIS
-   2020-03-21 Iker de Icaza Astiz : Define new fcl parameter
    DecayTXArapucaVIS
-   2020-03-21 Iker de Icaza Astiz : Create
    SinglePDWaveformCreatorLite() to avoid repetition.
-   2020-03-21 Iker de Icaza Astiz : WIP on working with specific
    subsets of handles
-   2020-03-21 Iker de Icaza Astiz : Define variable startTime
-   2020-03-21 Iker de Icaza Astiz : Rename variable to reflect its
    contents
-   2020-03-21 Iker de Icaza Astiz : Define pdtype to avoid excesive
    calls to pdsMap, use nChannels.
-   2020-03-20 Thomas Brooks : Add function to calculate direction
    average from track points
-   2020-03-20 Iker de Icaza Astiz : Rename and change type of fcl
    switch to \`UseSimPhotonsLite\`. Split long lines for improved
    readability.
-   2020-03-20 Iker de Icaza Astiz : WIP to improve performance of
    RandGaussQ computation
-   2020-03-20 Iker de Icaza Astiz : Cleaning up, add exception message
-   2020-03-19 Iker de Icaza Astiz : Small changes to Arapuca
    AddDarkNoise()
-   2020-03-19 Iker de Icaza Astiz : Equivalent changes for saturation
    in Arapuca digitizer
-   2020-03-19 Iker de Icaza Astiz : Use RandGaussQ, massive performance
    improvement
-   2020-03-19 Iker de Icaza Astiz : Do the equivalent changes on
    Arapuca Pulse1PE.
-   2020-03-19 Iker de Icaza Astiz : Use std::transform on Arapuca
    AddLineNoise()
-   2020-03-19 Iker de Icaza Astiz : Use std::transform and lambda
    function on AddSPE, test before calling the function.
-   2020-03-19 Iker de Icaza Astiz : Use if else for faster evaluation
    and avoid generating RandFlats
-   2020-03-19 Iker de Icaza Astiz : Change variable name to keep
    consistency
-   2020-03-19 Iker de Icaza Astiz : Compute saturation once
-   2020-03-19 Iker de Icaza Astiz : Move functions around to match
    those as in the PMT digitizer
-   2020-03-19 Iker de Icaza Astiz : Move functions around
-   2020-03-19 Iker de Icaza Astiz : Cleaning, putting TODOs, removing
    guards
-   2020-03-19 Iker de Icaza Astiz : Minor changes to AddDarkNoise(),
    try to void cast and floating point issues
-   2020-03-19 Iker de Icaza Astiz : Use std::replace\_if in
    CreateSaturation()
-   2020-03-19 Iker de Icaza Astiz : Refactor FindMinimumLite to use
    std::algorithms despite not using it
-   2020-03-19 Iker de Icaza Astiz : Change RandGauss to RandGaussQ,
    there\'s an insignificant loss in accuracy but is faster.
-   2020-03-19 Iker de Icaza Astiz : Handle whole vector with Pulse1PE,
    refactor to avoid duplicating computations
-   2020-03-19 Thomas Brooks : Add DCA to anab::T0 product for CRT hit -
    TPC track matching
-   2020-03-19 Andrew Scarff : Merge tag \'v08\_47\_00\' into develop
-   2020-03-18 Iker de Icaza Astiz : Use std::transform on
    AddLineNoise()
-   2020-03-18 Iker de Icaza Astiz : Use std::transform on AddSPE, test
    before calling the function.
-   2020-03-18 Iker de Icaza Astiz : Rearrange and rename code; avoid
    creating single use objects
-   2020-03-18 Iker de Icaza Astiz : Avoid calling RandFlat by simply
    looping the corresponding fraction of the photons
-   2020-03-18 Iker de Icaza Astiz : Specifically check for the optype
-   2020-03-18 Iker de Icaza Astiz : Compute once commonly used
    expressions
-   2020-03-16 Iker de Icaza Astiz : Swap to std::unordered\_map which
    is faster in this case
-   2020-03-16 Iker de Icaza Astiz : Use find to get iterator of map and
    access it\'s value
-   2020-03-16 Iker de Icaza Astiz : Pass map by reference not by value.
    Split functions into lines.
-   2020-03-16 Iker de Icaza Astiz : Yet one more renaming mistake fix.
    Also fix issue with bool comparison
-   2020-03-16 Iker de Icaza Astiz : Read the pmt and arapucas data from
    a root file. Somewhat hindering performance.



sbndutil v08\_48\_00(#sbndutil-v08_48_00)
----------------------------------------------------------

-   2020-03-26 Andrew Scarff : Merge branch \'release/v08\_48\_00\'
-   2020-03-26 Andrew Scarff : Update to larsoft v08\_48\_00
-   2020-03-19 Andrew Scarff : Merge tag \'v08\_47\_00\' into develop
