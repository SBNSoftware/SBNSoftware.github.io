---
lang: en
title: ReleaseNotes064300
---

  ----------- ------------ -- -- ------------------------------------------------------
  v06.43.00   07/13/2017         [Release Notes](ReleaseNotes064300.html){.wiki-page}
  ----------- ------------ -- -- ------------------------------------------------------

[]{#sbndcode-v06_43_00-Release-Notes}

sbndcode v06\_43\_00 Release Notes[¶](#sbndcode-v06_43_00-Release-Notes){.wiki-anchor}
======================================================================================

-   **Table of contents**
-   [sbndcode v06\_43\_00 Release
    Notes](#sbndcode-v06_43_00-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v06\_43\_00](#sbndcode-v06_43_00)
    -   [sbndutil v01\_19\_00](#sbndutil-v01_19_00)

[list of sbndcode
releases](List_of_SBND_code_releases.html){.wiki-page}\
Download instructions for [sbndcode
v06\_43\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v06_43_00/sbndcode-v06_43_00.html){.external}

[]{#Purpose}

Purpose[¶](#Purpose){.wiki-anchor}
----------------------------------

-   Weekly release

[]{#New-features}

New features[¶](#New-features){.wiki-anchor}
--------------------------------------------

-   larcorealg introduced to store geometry and utilities independent of
    the art framework
    -   This is a breaking change, for more information see
        [here](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/Breaking_Changes#Geometry-and-utility-code-moved-to-larcorealg){.external}

[]{#Bug-fixes}

Bug fixes[¶](#Bug-fixes){.wiki-anchor}
--------------------------------------

-   experiment\_utilities.py updated to fix project.py for larsoft 6

[]{#Updated-dependencies}

Updated dependencies[¶](#Updated-dependencies){.wiki-anchor}
------------------------------------------------------------

-   [LArSoft
    v06.43.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes064300){.external}
-   larbatch v01\_32\_03

[]{#Change-List}

Change List[¶](#Change-List){.wiki-anchor}
==========================================

[]{#sbndcode-v06_43_00}

sbndcode v06\_43\_00[¶](#sbndcode-v06_43_00){.wiki-anchor}
----------------------------------------------------------

-   2017-07-13 Thomas Brooks : Merge branch \'release/v06\_43\_00\'
-   2017-07-13 Thomas Brooks : Update for larsoft v06\_43\_00 (Move to
    larcorealg)
-   2017-07-05 Gianluca Petrillo : Ran update script for code move from
    larcore to larcorealg (issue
    [\#17099](/redmine/issues/17099 "Feature: Make standard geometry available in gallery environment (Closed)"){.issue
    .tracker-2 .status-5 .priority-4 .priority-default .closed})
-   2017-07-01 Thomas Brooks : Merge tag \'v06\_42\_00\' into develop

[]{#sbndutil-v01_19_00}

sbndutil v01\_19\_00[¶](#sbndutil-v01_19_00){.wiki-anchor}
----------------------------------------------------------

-   2017-07-13 Thomas Brooks : Merge branch \'release/v01\_19\_00\'
-   2017-07-13 Thomas Brooks : Update for larsoft v06\_43\_00 (trivial)
-   2017-07-10 Thomas Brooks : Fixes project.py for larsoft 6
-   2017-07-01 Thomas Brooks : Merge tag \'v01\_18\_00\' into develop
