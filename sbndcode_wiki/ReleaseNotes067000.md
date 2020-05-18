---
lang: en
title: ReleaseNotes067000
---

  ----------- ------------ -- -- ------------------------------------------------------
  v06.70.00   03/05/2018         [Release Notes](ReleaseNotes067000.html){.wiki-page}
  ----------- ------------ -- -- ------------------------------------------------------

[]{#sbndcode-v06_70_00-Release-Notes}

sbndcode v06\_70\_00 Release Notes[¶](#sbndcode-v06_70_00-Release-Notes){.wiki-anchor}
======================================================================================

-   **Table of contents**
-   [sbndcode v06\_70\_00 Release
    Notes](#sbndcode-v06_70_00-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Breaking changes](#Breaking-changes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v06\_70\_00](#sbndcode-v06_70_00)
    -   [sbndutil v01\_46\_00](#sbndutil-v01_46_00)

[list of sbndcode
releases](List_of_SBND_code_releases.html){.wiki-page}\
Download instructions for [sbndcode
v06\_70\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v06_70_00/sbndcode-v06_70_00.html){.external}

[]{#Purpose}

Purpose[¶](#Purpose){.wiki-anchor}
----------------------------------

-   Update for art v02\_10

[]{#New-features}

New features[¶](#New-features){.wiki-anchor}
--------------------------------------------

-   Change to project.py anatree output, it is now 1:1 with reco output.

[]{#Bug-fixes}

Bug fixes[¶](#Bug-fixes){.wiki-anchor}
--------------------------------------

[]{#Breaking-changes}

Breaking changes[¶](#Breaking-changes){.wiki-anchor}
----------------------------------------------------

-   [change to
    reconfigure](210_breaking_changes.html#Removal-of-modules-reconfigureParameterSet-const38-virtual-function){.wiki-page}
    -   The script no\_reconfigure\_override.sh is provided to remove
        the override.
-   [FirstAbsoluteOrLookupWithDotPolicy
    renamed](210_breaking_changes.html#Relocationrenaming-of-artFirstAbsoluteOrLookupWithDotPolicy){.wiki-page}
    -   there was only one instance of this
-   [SourceHelper cannot be
    copied](209_breaking_changes.html#SourceHelper-usage){.wiki-page}
    -   This change was made in art v2\_09\_06
    -   Further changes in SourceHelper.h force a compile time failure.
-   There is no longer a nu qualified build of root. Instead, the e15
    build contains all features that were in the nu qualified build.

[]{#Updated-dependencies}

Updated dependencies[¶](#Updated-dependencies){.wiki-anchor}
------------------------------------------------------------

-   [art
    v2.10.03](https://cdcvs.fnal.gov/redmine/projects/art/wiki/Series_210){.external}
-   [LArSoft
    v06.70.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes067000){.external}

[]{#Change-List}

Change List[¶](#Change-List){.wiki-anchor}
==========================================

[]{#sbndcode-v06_70_00}

sbndcode v06\_70\_00[¶](#sbndcode-v06_70_00){.wiki-anchor}
----------------------------------------------------------

-   2018-03-03 Thomas Brooks : Merge branch \'release/v06\_70\_00\'
-   2018-03-02 Thomas Brooks : Merge remote-tracking branch
    \'origin/feature/team\_for\_art\_2\_10\' into release/v06\_70\_00
-   2018-03-01 Lynn Garren : for larsoft v06\_70\_00
-   2018-03-01 Lynn Garren : remove override
-   2018-03-01 Thomas Brooks : Merge tag \'v06\_69\_01\' into develop

[]{#sbndutil-v01_46_00}

sbndutil v01\_46\_00[¶](#sbndutil-v01_46_00){.wiki-anchor}
----------------------------------------------------------

-   2018-03-03 Thomas Brooks : Merge branch \'release/v01\_46\_00\'
-   2018-03-03 Thomas Brooks : Update for larsoft v06\_70\_00
-   2018-03-02 Dominic Brailsford : Update the XML files to stop them
    trying to be clever with anatree file sizes. It breaks the 1:1 input
    file:output file map for reco-\>anatree.
-   2018-03-01 Thomas Brooks : Merge tag \'v01\_45\_01\' into develop
