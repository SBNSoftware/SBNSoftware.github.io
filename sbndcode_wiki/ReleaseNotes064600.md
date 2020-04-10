---
lang: en
title: ReleaseNotes064600
---

  ----------- ------------ -- -- ------------------------------------------------------
  v06.46.00   08/12/2017         [Release Notes](ReleaseNotes064600.html){.wiki-page}
  ----------- ------------ -- -- ------------------------------------------------------

[]{#sbndcode-v06_46_00-Release-Notes}

sbndcode v06\_46\_00 Release Notes[¶](#sbndcode-v06_46_00-Release-Notes){.wiki-anchor}
======================================================================================

-   **Table of contents**
-   [sbndcode v06\_46\_00 Release
    Notes](#sbndcode-v06_46_00-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v06\_46\_00](#sbndcode-v06_46_00)
    -   [sbndutil v01\_22\_00](#sbndutil-v01_22_00)

[list of sbndcode
releases](List_of_SBND_code_releases.html){.wiki-page}\
Download instructions for [sbndcode
v06\_46\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v06_46_00/sbndcode-v06_46_00.html){.external}

[]{#Purpose}

Purpose[¶](#Purpose){.wiki-anchor}
----------------------------------

-   Weekly release

[]{#New-features}

New features[¶](#New-features){.wiki-anchor}
--------------------------------------------

-   New version of geometry: v01\_00

[]{#Bug-fixes}

Bug fixes[¶](#Bug-fixes){.wiki-anchor}
--------------------------------------

[]{#Updated-dependencies}

Updated dependencies[¶](#Updated-dependencies){.wiki-anchor}
------------------------------------------------------------

-   [LArSoft
    v06.46.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes064600){.external}
-   larbatch v01.32.04
-   cetbuildtools v5.14.00

[]{#Change-List}

Change List[¶](#Change-List){.wiki-anchor}
==========================================

[]{#sbndcode-v06_46_00}

sbndcode v06\_46\_00[¶](#sbndcode-v06_46_00){.wiki-anchor}
----------------------------------------------------------

-   2017-08-12 Thomas Brooks : Merge branch \'release/v06\_46\_00\'
-   2017-08-12 Thomas Brooks : Update to cetbuildtools v5\_14\_00
-   2017-08-12 Thomas Brooks : Merge remote-tracking branch
    \'remotes/origin/feature/gp\_geometry\_v1\' into release/v06\_46\_00
-   2017-08-11 Thomas Brooks : Update to larsoft v06\_46\_00 (trivial)
-   2017-08-09 Usher, Tracy L : Bringing the definition of
    sbnd\_gaushitfinder up to date with the version in larreco
-   2017-08-04 Gianluca Petrillo : Use Geometry v. 1.0 by default.
-   2017-08-04 Gianluca Petrillo : Merge branch
    \'feature/mastbaum\_NewGeometry\_crt\' into develop
-   2017-08-04 Gianluca Petrillo : Merge branch \'develop\' into
    feature/mastbaum\_NewGeometry\_crt
-   2017-08-03 Andrzej Szelc : fix small overlap problem
-   2017-08-02 Thomas Brooks : Merge tag \'v06\_45\_01\' into develop
-   2017-07-10 Andrew Mastbaum : CRT implementation in the new v00\_09
    geometry (wip)
-   2017-07-10 Andrew Mastbaum : Merge remote-tracking branch
    \'origin/feature/gp\_NewGeometry\' into feature/gp\_NewGeometry
-   2017-07-10 Andrew Mastbaum : wip nearly overlap-free crt
-   2017-07-07 Gianluca Petrillo : Updated geometry description files
    version 0.9.0.
-   2017-07-07 Gianluca Petrillo : Replaced a few hard-coded constants
    with formulas.
-   2017-07-07 Gianluca Petrillo : Increased the internal precision of
    the preparser from single to double precision.
-   2017-07-07 Gianluca Petrillo : Changed internals of argument parsing
    of preparseGDML.
-   2017-07-07 Gianluca Petrillo : Make GDML validator a bit happier.
-   2017-07-07 Gianluca Petrillo : Renamed the preparser to
    \"preparseGDML\".
-   2017-07-07 Gianluca Petrillo : GDML preparser is now automatically
    compiled with sbndcode.
-   2017-07-07 Gianluca Petrillo : Fix arguments of geometry test.
-   2017-07-06 Gianluca Petrillo : Merge branch \'develop\' into
    feature/gp\_NewGeometry
-   2017-06-20 Gianluca Petrillo : Merge branch
    \'feature/gp\_NewGeometry\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into
    feature/gp\_NewGeometry
-   2017-06-20 Andrzej Szelc : merge with recent version
-   2017-06-20 Andrzej Szelc : add geometry version 00\_09 with swapped
    wire planes at negative x to reflect reality. As of now it throws
    errors of distance.
-   2017-06-19 Gianluca Petrillo : GIT magic messed with one fix\...
    pushing it back.
-   2017-06-19 Gianluca Petrillo : Merge branch
    \'feature/gp\_NewGeometry\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into
    feature/gp\_NewGeometry
-   2017-05-18 Gianluca Petrillo : Temporary commit (we all know how
    this will end\...)
-   2017-06-19 Gianluca Petrillo : Use \"future\" geometry in gemetry
    test.
-   2017-06-16 Gianluca Petrillo : Updated test configuration to use
    geometry service bundle.
-   2017-06-16 Andrzej Szelc : hacky fix to fix the wire overlap
-   2017-06-16 Gianluca Petrillo : Fixing order of setup (ROOT picks
    last)
-   2017-06-16 Gianluca Petrillo : Update to LArSoft 6.40.1 (trivial).
-   2017-06-12 Gianluca Petrillo : Updated geometry visualisation script
-   2017-04-14 Gianluca Petrillo : Forgot to move files.
-   2017-06-12 Gianluca Petrillo : Update for LArSoft 6.39.00.01
    (trivial).
-   2017-06-12 Gianluca Petrillo : Update for LArSoft 6.39.00 (trivial).
-   2017-06-06 Gianluca Petrillo : Update to LArSoft 6.38.00 (trivial).
-   2017-05-18 Gianluca Petrillo : Changed process name of GENIE job.
-   2017-05-18 Gianluca Petrillo : Update to LArSoft 6.36.00.
-   2017-06-16 Andrzej Szelc : fix pitch problem, introduce overlap
    problem
-   2017-06-16 Andrzej Szelc : file reshuffling
-   2017-06-16 Andrzej Szelc : adding root overlap script
-   2017-04-14 Gianluca Petrillo : This branch uses future geometry.
    THIS COMMIT SHOULD NOT BE MERGED INTO DEVELOP!
-   2017-06-16 Andrzej Szelc : hacky fix to fix the wire overlap
-   2017-06-16 Andrzej Szelc : fix pitch problem, introduce overlap
    problem
-   2017-06-16 Andrzej Szelc : file reshuffling
-   2017-06-16 Andrzej Szelc : adding root overlap script
-   2017-06-12 Andrzej Szelc : Merge branch \'develop\' into
    feature/gp\_NewGeometry
-   2017-04-14 Gianluca Petrillo : Forgot the auxdet for the future. Not
    that it helps\...
-   2017-04-14 Gianluca Petrillo : This branch uses future geometry.
    THIS COMMIT SHOULD NOT BE MERGED INTO DEVELOP!

[]{#sbndutil-v01_22_00}

sbndutil v01\_22\_00[¶](#sbndutil-v01_22_00){.wiki-anchor}
----------------------------------------------------------

-   2017-08-12 Thomas Brooks : Merge branch \'release/v01\_22\_00\'
-   2017-08-12 Thomas Brooks : Update to cetbuildtools v5\_14\_00
-   2017-08-11 Thomas Brooks : Update to larsoft v06\_46\_00 (trivial)
-   2017-08-02 Thomas Brooks : Merge tag \'v01\_21\_01\' into develop
