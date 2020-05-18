---
lang: en
title: ReleaseNotes068200
---

  ----------- ------------ -- -- ------------------------------------------------------
  v06.82.00   07/31/2018         [Release Notes](ReleaseNotes068200.html){.wiki-page}
  ----------- ------------ -- -- ------------------------------------------------------

[]{#sbndcode-v06_82_00-Release-Notes}

sbndcode v06\_82\_00 Release Notes[¶](#sbndcode-v06_82_00-Release-Notes){.wiki-anchor}
======================================================================================

-   **Table of contents**
-   [sbndcode v06\_82\_00 Release
    Notes](#sbndcode-v06_82_00-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v06\_82\_00](#sbndcode-v06_82_00)
    -   [sbndutil v01\_58\_00](#sbndutil-v01_58_00)

[list of sbndcode
releases](List_of_SBND_code_releases.html){.wiki-page}\
Download instructions for [sbndcode
v06\_82\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v06_82_00/sbndcode-v06_82_00.html){.external}

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

[]{#Updated-dependencies}

Updated dependencies[¶](#Updated-dependencies){.wiki-anchor}
------------------------------------------------------------

-   [LArSoft
    v06.82.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes068200){.external}
-   larbatch v01.42.00

[]{#Change-List}

Change List[¶](#Change-List){.wiki-anchor}
==========================================

[]{#sbndcode-v06_82_00}

sbndcode v06\_82\_00[¶](#sbndcode-v06_82_00){.wiki-anchor}
----------------------------------------------------------

-   2018-06-27 Thomas Brooks : Merge branch \'release/v06\_82\_00\'
-   2018-06-27 Thomas Brooks : Update for larsoft v06\_82\_00
-   2018-06-26 Usher, Tracy L : Restore correct ups product\_deps file
-   2018-06-26 Usher, Tracy L : Modifying fhicl definitions to conform
    to the new gaushit finder fhicl definitions in larsoft.
-   2018-06-24 Usher, Tracy L : Modify definition of sbnd\_gaushitfinder
    to avoid issues updating scheme.
-   2018-06-20 Lynn Garren : ignore files ending in \~ and .bak
-   2018-06-15 Thomas Brooks : Merge tag \'v06\_80\_01\' into develop

[]{#sbndutil-v01_58_00}

sbndutil v01\_58\_00[¶](#sbndutil-v01_58_00){.wiki-anchor}
----------------------------------------------------------

-   2018-06-27 Thomas Brooks : Merge branch \'release/v01\_58\_00\'
-   2018-06-27 Thomas Brooks : Update for larsoft v06\_82\_00
-   2018-06-27 Dominic Brailsford : A script that appends file-related
    information to the tfile metadata json and prints the entire
    contents to stdout. This is to be used with metadata\_extractor in
    fife\_launch
-   2018-06-27 Dominic Brailsford : Create the TFile metadata fcl
    parameter stuff in the wrapper fcl. This is only done when the user
    specifies the name of the TFile metadata json using
    \--tfilemdjsonname
-   2018-06-22 Dominic Brailsford : Commit xml from the workshop
    production
-   2018-06-15 Thomas Brooks : Merge tag \'v01\_56\_01\' into develop
