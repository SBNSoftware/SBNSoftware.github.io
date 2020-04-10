---
lang: en
title: ReleaseNotes083501
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.35.01   11/13/2019         [Release Notes](ReleaseNotes083501.html){.wiki-page}
  ----------- ------------ -- -- ------------------------------------------------------

[]{#sbndcode-v08_35_01-Release-Notes}

sbndcode v08\_35\_01 Release Notes[¶](#sbndcode-v08_35_01-Release-Notes){.wiki-anchor}
======================================================================================

-   **Table of contents**
-   [sbndcode v08\_35\_01 Release
    Notes](#sbndcode-v08_35_01-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v08\_35\_01](#sbndcode-v08_35_01)
    -   [sbndutil v08\_35\_01](#sbndutil-v08_35_01)

[list of sbndcode
releases](List_of_SBND_code_releases.html){.wiki-page}\
Download instructions for [sbndcode
v08\_35\_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_35_01/sbndcode-v08_35_01.html){.external}

[]{#Purpose}

Purpose[¶](#Purpose){.wiki-anchor}
----------------------------------

-   Weekly release

[]{#New-features}

New features[¶](#New-features){.wiki-anchor}
--------------------------------------------

[]{#Bug-fixes}

Bug fixes[¶](#Bug-fixes){.wiki-anchor}
--------------------------------------

-   Random number generator seed now set by NuRandomService in opdetsim
-   Out of bounds access to vector in opdetsim

[]{#Updated-dependencies}

Updated dependencies[¶](#Updated-dependencies){.wiki-anchor}
------------------------------------------------------------

-   [LArSoft
    v08.35.01](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes083501){.external}

[]{#Change-List}

Change List[¶](#Change-List){.wiki-anchor}
==========================================

[]{#sbndcode-v08_35_01}

sbndcode v08\_35\_01[¶](#sbndcode-v08_35_01){.wiki-anchor}
----------------------------------------------------------

-   2019-11-13 Thomas Brooks : Merge branch \'release/v08\_35\_01\'
-   2019-11-13 Thomas Brooks : Update for larsoft v08\_35\_01
-   2019-11-13 Thomas Brooks : fix out of bounds vector access
-   2019-11-11 Lynn Garren : find eigen headers
-   2019-11-11 Thomas Brooks : Change TRandom3 -\> CLHEP engine for
    consistent CI behaviour
-   2019-11-10 Thomas Brooks : Fix track ID error in anatree and
    unsigned int comparison error in ophitfinder
-   2019-11-08 Varuna Meddage : filters mu plus & e plus
-   2019-11-08 Varuna Meddage : produced single mu plus
-   2019-11-08 Iker de Icaza Astiz : Remove use of mallocs in denoise()
    and instead use a new vector.
-   2019-11-08 Iker de Icaza Astiz : Clear and release the memory of
    fwaveform vector
-   2019-11-08 Thomas Brooks : Missed a rms-\>threshold and add check so
    can\'t access vector elements that don\'t exist
-   2019-11-08 Thomas Brooks : Use threshold instead of RMS in hit
    finding to avoid infinite loops
-   2019-11-07 Thomas Brooks : Comment out unused variables for c2
    compilation
-   2019-11-07 Thomas Brooks : Merge tag \'v08\_35\_00\' into develop

[]{#sbndutil-v08_35_01}

sbndutil v08\_35\_01[¶](#sbndutil-v08_35_01){.wiki-anchor}
----------------------------------------------------------

-   2019-11-13 Thomas Brooks : Merge branch \'release/v08\_35\_01\'
-   2019-11-13 Thomas Brooks : Update for larsoft v08\_35\_01
-   2019-11-07 Thomas Brooks : Merge tag \'v08\_35\_00\' into develop
