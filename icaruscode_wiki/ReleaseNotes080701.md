---
lang: en
title: ReleaseNotes080701
---

  ----------- ----------- -- -- ------------------------------------------------------
  v08.07.01   02/6/2019         [Release Notes](ReleaseNotes080701.html){.wiki-page}
  ----------- ----------- -- -- ------------------------------------------------------

[]{#icaruscode-v08_07_01-Release-Notes}

icaruscode v08\_07\_01 Release Notes[¶](#icaruscode-v08_07_01-Release-Notes){.wiki-anchor}
==========================================================================================

-   **Table of contents**
-   [icaruscode v08\_07\_01 Release
    Notes](#icaruscode-v08_07_01-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List (generated with the command \"git log \--date=short
    \--pretty=format:\"\* %ad - %an - %s\"
    v08\_07\_01\")](#Change-List-generated-with-the-command-git-log-dateshort-prettyformat-ad-an-s-v08_07_01)
    -   [icaruscode v08\_07\_01](#icaruscode-v08_07_01)
    -   [icarusutil v08\_07\_01](#icarusutil-v08_07_01)

[list of icaruscode
releases](List_of_ICARUS_code_releases.html){.wiki-page}\
Download instructions for [icaruscode
v08\_07\_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_07_01/icaruscode-v08_07_01.html){.external}

[]{#Purpose}

Purpose[¶](#Purpose){.wiki-anchor}
----------------------------------

-   Catch up release to get all of the LArSoft improvements into a tag
-   This moves to art 3.01.01 which fixes issues with running on some
    grid nodes
-   Brings in updates in larreco to address issues with gauss hit
    finding efficiency
-   Code cleanup

[]{#New-features}

New features[¶](#New-features){.wiki-anchor}
--------------------------------------------

Bug fixes
---------

-   General fix of the issue with poor charge resolution in the gauss
    hit finding

[]{#Updated-dependencies}

Updated dependencies[¶](#Updated-dependencies){.wiki-anchor}
------------------------------------------------------------

-   [LArSoft
    v08.07.01](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes080701){.external}
-   larbatch v01.46.03

[]{#Change-List-generated-with-the-command-git-log-dateshort-prettyformat-ad-an-s-v08_07_01}

Change List (generated with the command \"git log \--date=short \--pretty=format:\"\* %ad - %an - %s\" v08\_07\_01\")[¶](#Change-List-generated-with-the-command-git-log-dateshort-prettyformat-ad-an-s-v08_07_01){.wiki-anchor}
================================================================================================================================================================================================================================

[]{#icaruscode-v08_07_01}

icaruscode v08\_07\_01[¶](#icaruscode-v08_07_01){.wiki-anchor}
--------------------------------------------------------------

-   2019-02-05 - Usher, Tracy L - Getting ready to tag v08\_07\_01
-   2019-02-05 - Usher, Tracy L - Revert \"change MF\_LOG\_DEBUG to
    LOG\_DEBUG and MF\_LOG\_TRACE to LOG\_TRACE\"
-   2019-02-05 - Usher, Tracy L - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2019-02-05 - Usher, Tracy L - Update ROI finding parameters
-   2019-02-04 - Christopher Hilgenberg - change MF\_LOG\_DEBUG to
    LOG\_DEBUG and MF\_LOG\_TRACE to LOG\_TRACE
-   2019-02-01 - Usher, Tracy L - Setting filter parameters - remove low
    frequency component on collection plane, set high frequency
    \"sigma\" at 100kHz
-   2019-02-01 - Usher, Tracy L - Cleanup
-   2019-02-01 - Usher, Tracy L - Set \"correct\" labels
-   2019-02-01 - Usher, Tracy L - OCD - formatting
-   2019-02-01 - Usher, Tracy L - .at() \--\> \[\]
-   2019-02-01 - Usher, Tracy L - Use default parameters, reduce
    overrides here if possible
-   2019-01-29 - Usher, Tracy L - calculate baseline based on ROI to
    avoid \"droop\" from deconvolution
-   2019-01-29 - Usher, Tracy L - formatting
-   2019-01-29 - Usher, Tracy L - fix faux pas where nTrunc was not
    returned
-   2019-01-29 - Usher, Tracy L - Convert to using the common waveform
    tool for returning mean and rms
-   2019-01-29 - Usher, Tracy L - Adopting random number definitions as
    advised in larsoft coordination meeting (which hopefully will make
    next step in this process more straightforward)
-   2019-01-29 - Usher, Tracy L - Move header file into module
    definition
-   2019-01-28 - Usher, Tracy L - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2019-01-28 - Usher, Tracy L - Turn off the \"float baseline\" option
    in the hit finding
-   2019-01-28 - Usher, Tracy L - Formatting
-   2019-01-28 - Usher, Tracy L - Consolidate the tuple output to a
    single output file to avoid having to hadd after the fact
-   2019-01-28 - Usher, Tracy L - Update the calculation of the
    truncated mean\... it seems this method is slightly biasing the
    deconvolved waveform baselines to be ever so slightly negative,
    these changes \"fix\" that
-   2019-01-28 - Usher, Tracy L - Tuning the coherent to incoherent
    noise fraction as per Filippo to match previous observations
-   2019-01-28 - Gianluca Petrillo - Added markers to delimit
    \`icaruscode\` CMake configuration output
-   2019-01-28 - Gianluca Petrillo - Added python libraries for use with
    \`gallery\`.
-   2019-01-24 - Usher, Tracy L - Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/icaruscode into develop
-   2019-01-24 - Usher, Tracy L - Fixes to get code to compile
-   2019-01-22 - Filippo Varanini - commenting out useless cout

[]{#icarusutil-v08_07_01}

icarusutil v08\_07\_01[¶](#icarusutil-v08_07_01){.wiki-anchor}
--------------------------------------------------------------

-   2019-02-05 - Usher, Tracy L - Tagging v08\_07\_01
