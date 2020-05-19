---
lang: en
title: ReleaseNotes084100
---

  ----------- ------------ -- -- ------------------------------------------------------
  v08.41.00   01/27/2020         [Release Notes](ReleaseNotes084100.html)
  ----------- ------------ -- -- ------------------------------------------------------



sbndcode v08\_41\_00 Release Notes(#sbndcode-v08_41_00-Release-Notes)
======================================================================================

-   **Table of contents**
-   [sbndcode v08\_41\_00 Release
    Notes](#sbndcode-v08_41_00-Release-Notes)
    -   [Purpose](#Purpose)
    -   [New features](#New-features)
    -   [Bug fixes](#Bug-fixes)
    -   [Updated dependencies](#Updated-dependencies)
-   [Change List](#Change-List)
    -   [sbndcode v08\_41\_00](#sbndcode-v08_41_00)
    -   [sbndutil v08\_41\_00](#sbndutil-v08_41_00)

[list of sbndcode
releases](List_of_SBND_code_releases.html)\
Download instructions for [sbndcode
v08\_41\_00](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v08_41_00/sbndcode-v08_41_00.html){.external}



Purpose(#Purpose)
----------------------------------

-   Update to art v03.04



New features(#New-features)
--------------------------------------------

-   The default e19 and c7 builds now use python 3. To use python 2,
    setup with e19:py2 or c7:py2.



Bug fixes(#Bug-fixes)
--------------------------------------



Updated dependencies(#Updated-dependencies)
------------------------------------------------------------

-   [LArSoft
    v08.41.00](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/ReleaseNotes084100){.external}



Change List(#Change-List)
==========================================



sbndcode v08\_41\_00(#sbndcode-v08_41_00)
----------------------------------------------------------

-   2020-01-26 Thomas Brooks : Merge branch \'release/v08\_41\_00\'
-   2020-01-26 Thomas Brooks : Update for larsoft v08\_41\_00
-   2020-01-26 Thomas Brooks : Merge remote-tracking branch
    \'origin/feature/team\_for\_art\_v3\_04\' into release/v08\_41\_00
-   2020-01-25 Marco Del Tutto : Adding sbndcode/python directory to
    PYTHONPATH
-   2020-01-24 Edward Tyley : Updated Pandora cheat config to account
    for change of algorithm name
-   2020-01-22 Vito Di Benedetto : Merge branch
    \'feature/vito\_ci\_proxyless\' into develop
-   2020-01-22 Andrew Scarff : Merge branch \'develop\' of
    ssh://cdcvs.fnal.gov/cvs/projects/sbndcode into develop
-   2020-01-22 Andrew Scarff : Adding a new reco fcl for the new noise
    threshold to be used with the data driven noise model.
-   2020-01-21 Lynn Garren : larsoft v08\_41\_00
-   2020-01-21 Patrick Green : Merge branch
    \'feature/pgreen\_nuRandomServicePolicyFix\' into develop
-   2020-01-21 Vito Di Benedetto : Merge branch \'develop\' into
    feature/vito\_ci\_proxyless
-   2020-01-21 Vito Di Benedetto : Merge branch \'develop\' into
    feature/vito\_ci\_proxyless
-   2020-01-21 Patrick Green : reverted NuRandomService policy from
    perEvent to random
-   2020-01-17 Thomas Brooks : Merge tag \'v08\_40\_00\' into develop
-   2020-01-17 Lynn Garren : for art 3.04
-   2020-01-17 Lynn Garren : Merge branch
    \'feature/gp\_sharedOpDetDict\' into feature/team\_for\_art\_v3\_04
-   2020-01-17 Lynn Garren : Merge branch
    \'feature/larpandoracontent\_v03\_15\_12\' into
    feature/team\_for\_art\_v3\_04
-   2020-01-13 Vito Di Benedetto : Merge tag \'v08\_39\_00\' into
    feature/vito\_ci\_proxyless
-   2019-12-31 Vito Di Benedetto : Merge tag \'v08\_38\_01\' into
    feature/vito\_ci\_proxyless
-   2019-12-23 Vito Di Benedetto : Updated
    test/ci/sbnd\_ci\_nucosmics\_gen\_quick\_test\_sbndcode.fcl to use
    GENIE Flux Files from StashCache through DIRECT method
-   2019-12-20 Vito Di Benedetto : in
    test/ci/sbnd\_ci\_nucosmics\_gen\_quick\_test\_sbndcode.fcl,
    override CORSIKA flux file path to be able to access them without a
    proxy
-   2019-12-20 Vito Di Benedetto : updated a comment in
    test/ci/ci\_tests.cfg
-   2019-12-03 Vito Di Benedetto : Updated ci\_tests.cfg to use
    unauthenticated XROOTD access with CI input/reference files located
    in SBND StashCache area, this allows CI to run CI regression tests
    without requiring the proxy



sbndutil v08\_41\_00(#sbndutil-v08_41_00)
----------------------------------------------------------

-   2020-01-26 Thomas Brooks : Merge branch \'release/v08\_41\_00\'
-   2020-01-26 Thomas Brooks : Update for larsoft v08\_41\_00
-   2020-01-26 Thomas Brooks : Merge remote-tracking branch
    \'origin/feature/team\_for\_art\_v3\_04\' into release/v08\_41\_00
-   2020-01-17 Thomas Brooks : Merge tag \'v08\_40\_00\' into develop
-   2020-01-17 Lynn Garren : for art 3.04
