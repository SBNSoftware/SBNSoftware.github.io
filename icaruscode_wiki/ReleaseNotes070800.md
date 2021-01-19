---
layout: page
title: ReleaseNotes070800
---

  ----------- ------------ -- -- ------------------------------------------------------
  v07.08.00   10/28/2018         [Release Notes](ReleaseNotes070800.html)
  ----------- ------------ -- -- ------------------------------------------------------



icaruscode v07\_08\_00 Release Notes
==========================================================================================

-   **Table of contents**
-   [icaruscode v07\_08\_00 Release
    Notes]
    -   [Purpose]
    -   [New features]
    -   [Updated dependencies]
-   [Change List (generated with the command \"git log \--date=short
    \--pretty=format:\"\* %ad - %an - %s\"
    v07\_08\_00\")]
    -   [icaruscode v07\_08\_00]
    -   [icarusutil v07\_08\_00]

[list of icaruscode
releases](List_of_ICARUS_code_releases.html)\
Download instructions for [icaruscode
v07\_08\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v07_08_00/icaruscode-v07_08_00.html)



Purpose
----------------------------------

-   Catch up release to get all of the improvements into a tag
-   Expect to see performance improvements in the optical and TPC
    sim/recon code as some effort to profile has been done



New features
--------------------------------------------

-   CRT improvements

Bug fixes
---------

-   Bug fixes to all systems (optical waveforms,
    convolution/deconvolution, etc.)



Updated dependencies
------------------------------------------------------------

-   [LArSoft
    v07.08.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes070800)
-   larbatch v01.46.02



Change List (generated with the command \"git log \--date=short \--pretty=format:\"\* %ad - %an - %s\" v07\_08\_00\")
================================================================================================================================================================================================================================



icaruscode v07\_08\_00
--------------------------------------------------------------

-   2018-10-28 - Usher, Tracy L - Preparing to tag v07\_08\_00
-   2018-10-28 - Usher, Tracy L - Move to averaging instead of
    interpolation
-   2018-10-28 - Usher, Tracy L - replace \".at\" with \"\[\]\"
-   2018-10-28 - Usher, Tracy L - Small changes aimed at efficiency
-   2018-10-28 - Usher, Tracy L - Make lowest shaping time option 0.6 us
-   2018-10-28 - Usher, Tracy L - Add in the hits
-   2018-10-28 - Usher, Tracy L - Cosmetic change putting shaping time
    options in order
-   2018-10-26 - Usher, Tracy L - Incorrect calculation of truncated rms
    fixed
-   2018-10-26 - Gianluca Petrillo - Alternative solution for Clang 5:
    remove \`constexpr\`
-   2018-10-26 - Gianluca Petrillo - Revert \"Small change to enable
    compile on osx\"
-   2018-10-26 - Gianluca Petrillo - Revert \"Yes, a type can be very
    useful for the compiler though it C++ employed AI then it would
    simply know.\"
-   2018-10-26 - Gianluca Petrillo - Revert \"sigh\... what can I
    say\... its early\"
-   2018-10-26 - Gianluca Petrillo - Revert \"Ok, fix a similar but
    different compilation error\... (same header file but this time
    preserve the \"static constexpr\")\"
-   2018-10-26 - Gianluca Petrillo - Revert \"Random walk finally
    converges to something that builds\"
-   2018-10-26 - Usher, Tracy L - Random walk finally converges to
    something that builds
-   2018-10-26 - Usher, Tracy L - Ok, fix a similar but different
    compilation error\... (same header file but this time preserve the
    \"static constexpr\")
-   2018-10-26 - Usher, Tracy L - sigh\... what can I say\... its early
-   2018-10-26 - Usher, Tracy L - Yes, a type can be very useful for the
    compiler though it C++ employed AI then it would simply know.
-   2018-10-26 - Usher, Tracy L - Small change to enable compile on osx
-   2018-10-24 - Gianluca Petrillo - \... and removing the non-validated
    configuration from SimPMTIcarus module
-   2018-10-24 - Gianluca Petrillo - Introducing configuration
    validation in SimPMTIcarus module\...
-   2018-10-24 - Gianluca Petrillo - Added PMT simulation documentation.
-   2018-10-24 - Gianluca Petrillo - Configuration of PMT simulation
    algorithm detached from module\'s.
-   2018-10-24 - Gianluca Petrillo - Minor formal changes.
-   2018-10-24 - Gianluca Petrillo - Added explicit rise time-to-RMS
    conversion.
-   2018-10-24 - Gianluca Petrillo - Added stub for configuration
    validation in SimPMTIcarus
-   2018-10-24 - Gianluca Petrillo - Code style changes.
-   2018-10-24 - Gianluca Petrillo - Removed obsoleted code parts.
-   2018-10-23 - Gianluca Petrillo - Moved debug messages into debug
    stream.
-   2018-10-23 - Gianluca Petrillo - Added check on single photoelectron
    shape sampling.
-   2018-10-23 - Gianluca Petrillo - Moved template implementation in
    header files.
-   2018-10-23 - Gianluca Petrillo - Rearranged header inclusion in
    \`PMTsimulationAlg\` source.
-   2018-10-23 - Gianluca Petrillo - Fixed waveform sample size.
-   2018-10-23 - Gianluca Petrillo - Added printout of waveform settings
-   2018-10-23 - Gianluca Petrillo - Further factorisation, and
    restructuring the code for the template 1 p.e. waveform
-   2018-10-21 - Gianluca Petrillo - Separation of PMT simulation from
    the art module
-   2018-10-16 - Gianluca Petrillo - Separating random streams for PMT
    noises
-   2018-10-26 - Gianluca Petrillo - Fix to library names all over the
    repository. Oops.
-   2018-10-25 - Usher, Tracy L - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2018-10-25 - Usher, Tracy L - Some optimization, also make a flag
    for filling histograms
-   2018-10-25 - Gianluca Petrillo - Standardised the name of the ICARUS
    geometry library.
-   2018-10-24 - Usher, Tracy L - Change the lower limit on the allowed
    threshold rms
-   2018-10-24 - Usher, Tracy L - Further optimizations
-   2018-10-24 - Usher, Tracy L - Importing code from Kazu Terao which
    will simulate and reconstruction the effect of a point charge. Some
    naming changes may need to be made in the future\...
-   2018-10-24 - Usher, Tracy L - Primarily cosmetic changes, no real
    change to code
-   2018-10-24 - Filippo Varanini - added correct computation of local
    baseline
-   2018-10-23 - Gianluca Petrillo - Changed default \`TFileService\`
    output file name.
-   2018-10-23 - Gianluca Petrillo - Removed AVX instruction flag.
-   2018-10-23 - Gianluca Petrillo - Fixed a bug in the size of the
    single photoelectron template.
-   2018-10-22 - Gianluca Petrillo - Fix comparison between signed and
    unsigned.
-   2018-10-21 - Gianluca Petrillo - SimPMTIcarus bug fix: clear the
    waveform buffer before starting to use it.
-   2018-10-20 - Usher, Tracy L - Fix bug
-   2018-10-20 - Usher, Tracy L - One last set of optimizations to try
    to get smoothing time to reasonable values
-   2018-10-20 - Usher, Tracy L - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2018-10-20 - Usher, Tracy L - Significant amount of optimization
    resulting in significantly better run time on osx\... exporting to
    see if we see same on linux. Also now moving to the eigen fftw
    interface for FFT\'s to remove/reduce overhead of root interface
-   2018-10-15 - Gianluca Petrillo - Cosmetic documentation fix
-   2018-10-12 - Usher, Tracy L - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2018-10-12 - Usher, Tracy L - Turn on the printed summary at the end
    of the job (I like to look at it!)
-   2018-10-12 - Usher, Tracy L - uncomment the part that does the
    coherent noise
-   2018-10-12 - Usher, Tracy L - Add fhicl variable for sigma on hit
-   2018-10-10 - Usher, Tracy L - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2018-10-10 - Usher, Tracy L - Change method for removing correlated
    noise spikes from full spectrum
-   2018-10-10 - Usher, Tracy L - Output frequency hists in frequency
    units, not bins
-   2018-10-10 - Usher, Tracy L - \"Normalize\" the filter function so
    the peak value of the filter function equals 1.
-   2018-10-10 - Usher, Tracy L - Add comment
-   2018-10-10 - Usher, Tracy L - Add more features to the hit
    efficiency module
-   2018-10-03 - Gianluca Petrillo - Added detection of compiler in
    galleryAnalysis\'s \`CMakeLists.txt\`.
-   2018-10-03 - Gianluca Petrillo - Updated libraries in
    galleryAnalysis\'s CMakeLists.txt
-   2018-09-27 - Gianluca Petrillo - Improved detection of available C++
    features in gallery support library
-   2018-09-27 - Gianluca Petrillo - Fixed typo in c2:prof qualifiers
-   2018-09-25 - Usher, Tracy L - Better baselining since we are doing
    full waveform
-   2018-09-25 - Usher, Tracy L - Fixing clang compiler faux pas
-   2018-09-25 - Usher, Tracy L - Merge remote-tracking branch
    \'origin/feature/Hilgenberg\_CRTDetSim\' into develop
-   2018-09-25 - Usher, Tracy L - Get histograms correct
-   2018-09-25 - Christopher Hilgenberg - improvements for truth
    analysis
-   2018-09-25 - Usher, Tracy L - Merge remote-tracking branch
    \'origin/feature/Hilgenberg\_CRTDetSim\' into develop
-   2018-09-25 - Christopher Hilgenberg - copy standard and modify to
    run CRTDetSim only
-   2018-09-25 - Christopher Hilgenberg - copy standard reco files and
    modify to run CRT reco only
-   2018-09-25 - Usher, Tracy L - Add option to find ROI\'s using the
    dilation vector instead of difference, this should work better for
    unipolar pulses (e.g. post deconvolution)
-   2018-09-25 - Christopher Hilgenberg - add G4 trackID for truth
    matching
-   2018-09-25 - Christopher Hilgenberg - add G4 trackID for truth
    matching
-   2018-09-25 - Christopher Hilgenberg - make trackID a vector for each
    channel for future study of multiple coincident tracks
-   2018-09-25 - Christopher Hilgenberg - fixed bug causing failure of
    CRTData product generation for single particle gun; fixed bug
    responsible for failure of time stamp generation
-   2018-09-25 - Usher, Tracy L - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2018-09-25 - Usher, Tracy L - Add the full waveform deconvolution
    module
-   2018-09-25 - Usher, Tracy L - get reference to waveform instead of
    making a copy
-   2018-09-25 - Usher, Tracy L - Add a module which performs 1D
    deconvolution on the full wire and then will look for ROI\'s using
    the deconvolved waveform
-   2018-09-25 - Usher, Tracy L - Better histogram definition - allows
    to be dependent on number of planes
-   2018-09-25 - Christian Farnese - material for NUMI simulation
-   2018-09-25 - Christian Farnese - small correction on the names of
    the output files
-   2018-09-24 - Usher, Tracy L - Add some histograms to get
    event-by-event \"efficiency\"
-   2018-09-23 - Usher, Tracy L - Add more histograms and improve
    selection
-   2018-09-23 - Usher, Tracy L - Adding a first attempt at a \"hit
    efficiency\" analysis tool. Work in progress here\...



icarusutil v07\_08\_00
--------------------------------------------------------------

-   2018-10-28 - Usher, Tracy L - Preparing to tag v07\_08\_00
