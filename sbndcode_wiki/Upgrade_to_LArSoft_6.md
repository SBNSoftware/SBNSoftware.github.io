---
lang: en
title: Upgrade to LArSoft 6
---

{#Upgrade-to-LArSoft-6}

Upgrade to LArSoft 6(#Upgrade-to-LArSoft-6)
============================================================

-   **Table of contents**
-   [Upgrade to LArSoft 6](#Upgrade-to-LArSoft-6)
    -   [LArSoft resources on updating
        code](#LArSoft-resources-on-updating-code)
    -   [From LArSoft 5.12.1 to LArSoft
        6.32.0](#From-LArSoft-5121-to-LArSoft-6320)

{#LArSoft-resources-on-updating-code}

LArSoft resources on updating code(#LArSoft-resources-on-updating-code) {#larsoft-resources-on-updating-code .count}
----------------------------------------------------------------------------------------

The code in our branches (including in fact `develop`) needs to be
compatible with LArSoft.\
Every time LArSoft breaks backward compatibility with the past, it
[announces a breaking change](Breaking_Changes.html).
Sometimes, tools are provided to help or automatically perform the
upgrade.\
If your branch is written against LArSoft version `vXX` (e.g.,
`v05_12_01`) and the current version is `vZZ` (e.g., `v06_20_00`),
you\'ll have to examine all the breaking changes that happened after
`vXX` one by one, and take the proper action on each of them, until the
target version (in the example, relevant breaking changes are documented
for `v05_13_00`, `v06_00_01`, `v06_02_00`, `v06_11_00`, `v06_14_00`,
`v06_16_00` and `v06_22_00`\... quite a number of them!).

{#From-LArSoft-5121-to-LArSoft-6320}

From LArSoft 5.12.1 to LArSoft 6.32.0(#From-LArSoft-5121-to-LArSoft-6320) {#from-larsoft-5.12.1-to-larsoft-6.32.0 .count}
------------------------------------------------------------------------------------------

The old feature branches created before April 17, 2017 are based on a
`develop` branch which was using LArSoft 5.12.1.\
In order to use those branches with the newer `sbndcode` `develop`
branch, some update work needs to be done to raise them to a current
version.

This section guides you to such update. [The update does require
attention and active actions.]{style="color: orange;"} Usually not hard,
usually not pleasant.

Let\'s assume you have your working area set up with the old LArSoft
5.12.1, and you want to update o the latest version (which is 6.32.00 in
the following example). We are using a *profiling* version here, which
used to have a `e9:prof` qualifier, but nowadays is `e14:prof`.\
The content of your working area might look vaguely like this:

    build_slf6.x86_64
    localProducts_larsoft_v05_12_01_e9_prof
    srcs
    |- sbndcode

> **Note** If you have `larsoft` repository checked out in your area (in
> `$MRB_SOURCE`), you might need to manually adda directory to the
> python paths:
> `export PYTHONPATH="${PYTHONPATH}:${MRB_SOURCE}/larsoft/bin/python"`,
> or some fix scripts might not find some custom library they rely on.

1.  start from a new shell

2.  \`cd\` to that working area and update the area itself:\

        cd /my/working/area
        source '/cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh'
        setup larsoft v06_32_00 -q e14:prof
        mrb newDev -f -p -v v06_32_00 -q e14:prof

3.  rebase your branch (because you have your code in your own branch,
    right?):

        cd ${MRB_SOURCE}/sbndcode" 
        git fetch
        git rebase feature/gp_forLArSoftDevelop

    [Merging and rebasing branches](Rebasing.html){.wiki-page .new} may
    be a tedious process.

4.  run all the update scripts; the correct list is something you\'ll
    have to figure out from the [breaking change
    page](Breaking_Changes.html)\... not fun. This is **just
    an example**:\

        cd "$MRB_SOURCE" 
        UpdateTestInfrastructure.py -Uv               # check the output!
        UpdateTestInfrastructure.py -Uv --doit
        "${LARSOFT_DIR}/bin/v06_00_00-larsoftobj/UpdateToLArSoftObj.sh" 
        "${LARSOFT_DIR}/bin/v06_00_00-root6/UpdateUnitTestsBoost1.61.py" -Uv        # check the output!
        "${LARSOFT_DIR}/bin/v06_00_00-root6/UpdateUnitTestsBoost1.61.py" -Uv --doit
        "${LARSOFT_DIR}/bin/v06_00_00-root6/check_dictionaries.sh" # if the script complains, some action is required
        "${LARSOFT_DIR}/bin/v06_11_00-reorganize/UpdateReorg611.sh" 
        UpdateToNuRandomService.py -Uv                # check the output!
        UpdateToNuRandomService.py -Uv --doit
        UpdateArtDataHelper.sh

    The python scripts typically do not take action unless explicitly
    told to do so. It is recommended that you run them in \"dry run\"
    mode first, check that there are no obvious mistakes (obvious to
    you, at least) and then rerun with the `--doit` option. Be
    especially careful with changes affecting FHiCL files: the compiler
    won\'t catch mistakes there.\
    Also note that there are changes that you will need to do
    manually\...\
    Then the branch is ready to be compiled!

    -   in this case, the compiler has also been updated, which may call
        for additional effort in improving the code (get used to the
        idea that the compiler is right, and the newer compiler is
        righter\... so if t asks for something new, it\'s typically for
        the best)

5.  run the usual set of commands to compile:

        mrbsetenv
        mrb install -j4
        mrb test -j4

    It\'s not unlikely that you\'ll have to fix the code in some places.

6.  the good news is that you won\'t have to do this ever again.

7.  Probably.
