---
layout: page
title: Tagging a release
---

[Return to Release Management Workflow](https://sbnsoftware.github.io/sbndcode_wiki/Release_management_workflow.html)


Tagging a release
======================================================



Summary
----------------------------------

-   Start release in `releases/` directory.
-   Merge feature branches.
-   Bump the version numbers.
-   Install and run unit tests.
-   Push release branch to origin and build in Jenkins
-   Finish release.
-   Push new tag to origin.



Instructions
--------------------------------------------

-   As you will be building sbndcode and sbndutil as part of the
    release, the use of `sbndbuild01/02` is advisable as they have more
    cores.

-   It is a good idea to have a `releases/` directory in your area
    for keeping different versions. I would recommend keeping the previous 6 releases.

-   Setup the container `sh /exp/sbnd/data/users/vito/podman/start_SL7dev.sh` and setup `. /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh`

-   Go into your `releases/` directory and run the script
    `git_start_release.sh` with

        . git_start_release.sh < version tag >
		
-   Additional modes are available for production releases (which utilize different branches) and for sbndutil (production script repo). If doing a production repo, you will also need to enter the branch associated with the production.

-   This will create new releases of `sbndcode` and `sbndutil`, with branches `release/vXX_YY_ZZ`. You will need to cd into the directory the script just created and load up the mrb environment.

-   Update the versioning in CMakeLists.txt and ups/product_deps

-   Files to edit:
    -   `$MRB_SOURCE/sbndcode/CMakeLists.txt`
    -   `$MRB_SOURCE/sbndutil/CMakeLists.txt` (if using sbndutil mode)
    -   `$MRB_SOURCE/sbndcode/ups/product_deps`
    -   `$MRB_SOURCE/sbndutil/ups/product_deps` (if using sbndutil mode)

-   Do a full install and run the unit tests.
  
		If you haven't already...
        cd lardev-<your version>
		source localProducts_larsoft_<your version>_e26_prof/setup
        mrbsetenv
		
		Then do...
        mrb t -j16

-   If any unit tests fail, identify the offending code and email the
    author asking them to either push a fix or undo their commit.

-   Commit updates to your local repository for each package

        git commit -a -m "Update to larsoft < version tag >"

-   Push release branch to the remote repository (origin) for each package:

        git push origin release/vXX_YY_ZZ

-   Next go to the Jenkins build instructions, return here once the builds succeed. 
    We use the release/vXX_YY_ZZ branch to build the binaries BEFORE finishing the release and pushing the tags.
    This allows any issues in the Jenkins builds to be resolved without needed to revert the tag. 

-   Finish the release branch (once for `sbndcode` and once for
    `sbndutil`):
    -   Merge to master and develop

    -   Creates a tag on the master branch

    -   Deletes the release branch

    -   Checks out the develop branch

            git flow release finish

-   You will be asked to write some commit messages, leave the first and
    third as they are, for the second put \"Version \< version \> \"

-   Push everything to origin (once for sbndcode and once for sbndutil)

        git push origin develop master # if mainline release
		git push origin production/<production_branch> production/<production_branch>-master # if mainline release
        git push --tags
        git flow release start < version >

-   Checked out branch is now release/\< version \>.
