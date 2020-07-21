---
layout: page
title: Tagging a release
---



Tagging a release
======================================================



Summary
----------------------------------

-   Start release in `releases/` directory.
-   Merge feature branches.
-   Bump the version numbers.
-   Install and run unit tests.
-   Finish release.
-   Push to origin.



Instructions
--------------------------------------------

-   As you will be building sbndcode and sbndutil as part of the
    release, the use of `sbndbuild01/02` is advisable as they have more
    cores.

-   It is a good idea to have a `releases/` directory in your `app` area
    for keeping different versions.
    -   I would recommend keeping the previous 6 releases so it\'s easy
        to go back and make changes and you can free up space if app
        gets full.

-   Go into your `releases/` directory and run the script
    `start_release.sh` with\

        . start_release.sh < version tag > 

-   This will create new releases of `sbndcode` and `sbndutil`.

-   Merge any feature branches that are going into the release, fixing
    any merge conflicts.

-   Change any files that include the version number of the package
    being tagged and the version numbers of dependent products.

-   Check the [larsoft release
    notes](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/LArSoft_release_list){.external}
    for version numbers.

-   Files to edit:
    -   `$MRB_SOURCE/sbndcode/ups/product_deps`
    -   `$MRB_SOURCE/sbndutil/ups/product_deps`

-   Do a full install and run the unit tests.\

        cd $MRB_BUILDDIR
        mrbsetenv
        mrb t -j16

-   If any unit tests fail, identify the offending code and email the
    author asking them to either push a fix or undo their commit.

-   Commit updates to your local repository for each package\

        cd $MRB_SOURCE/< package >
        git commit -a -m "Update to larsoft < version tag >"

-   Finish the release branch (once for `sbndcode` and once for
    `sbndutil`):
    -   Merge to master and develop

    -   Creates a tag on the master branch

    -   Deletes the release branch

    -   Checks out the develop branch\

            git flow release finish

-   You will be asked to write some commit messages, leave the first and
    third as they are, for the second put \"Version \< version \> \"

-   Push everything to origin (once for sbndcode and once for sbndutil)\

        git push origin develop master
        git push --tags



Details: start\_release.sh
---------------------------------------------------------------------

Example file can be found [here](https://github.com/SBNSoftware/SBNSoftware.github.io/blob/master/sbndcode_wiki/attachments/git_start_release.sh).

-   Create a new directory for the new tag\

        mkdir lardev-< version >
        cd lardev-< version >

-   Create an mrb development area corresponding to the base release of
    larsoft\

        export MRB_PROJECT=larsoft
        mrb newDev -v < larsoft version > -q < qualifiers >
        source localproducts*/setup

-   Check out sbndcode and sbndutil\

        cd $MRB_SOURCE
        mrb g sbndcode
        mrb g sbndutil

-   Make sure local copies of develop and master are up to date with
    origin for each package\

        cd $MRB_SOURCE/< package >
        git checkout develop
        git pull
        git checkout master
        git pull

-   Use git flow to create a release branch in your local repo
    (automatically from head of develop) for each package\

        git flow release start < version >

-   Checked out branch is now release/\< version \>.
