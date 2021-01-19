---
layout: page
title: Deploying a release on CVMFS
---

[Return to Release Management Workflow](https://sbnsoftware.github.io/sbndcode_wiki/Release_management_workflow.html)


Deploying a release on CVMFS
============================================================================



Summary
----------------------------------

-   Log on to the cvmfs server.
-   Start a transaction.
-   Add the new versions of `sbndcode` and `sbndutil`.
-   Finish the transaction.



Instructions
--------------------------------------------

-   Log on to the cvmfs server\

        ssh cvmfssbnd@oasiscfs.fnal.gov

-   Source content for the sbnd cvmfs repository will be visible in
    /cvmfs/sbnd.opensciencegrid.org

-   Check the last tags of the cvmfs repository\

        cvmfs_server tag -l sbnd.opensciencegrid.org

-   I usually do this from the `temp/` directory as the scripts copy
    over some manifest files into your current directory for some
    reason, these can just be deleted.

-   Start a transaction\

        cvmfs_server transaction sbnd.opensciencegrid.org

-   Update repository content with shell scripts\

        ~/scripts/install_on_cvmfs.sh sbnd-< dot version (no preceeding v) >

    -   e.g.\

            ~/scripts/install_on_cvmfs.sh sbnd-08.43.00

-   Make sure the installation didn\'t fail.

-   End transaction and publish updated content\

        cvmfs_server publish -m "Published sbndcode < version > and sbndutil < version >" -a < new tag > sbnd.opensciencegrid.org

-   If something goes wrong and you want to get rid of the changed you
    just made and end the transaction you can\

        cvmfs_server abort sbnd.opensciencegrid.org

-   log out

-   When you initially log in, you only have read access. Starting and
    ending the update transaction involves dismounting and remounting
    the repository read/write or read only. You should not cd to any
    location in the repository when you\'re inside a transaction.



sbnd\_data
---------------------------------------

-   If you want to update sbnd\_data without changing the version number
    you can add new files to the relevant `/grid/fermiapp` directory and
    use `rsync`\

        rsync -r < user >@sbndgpvm01.fnal.gov:/grid/fermiapp/products/sbnd/sbnd_data/< version >* /cvmfs/sbnd.opensciencegrid.org/products/sbnd/sbnd_data/



Details: install\_on\_cvmfs.sh
----------------------------------------------------------------------------

-   A modified version of the script used to deploy on `/grid/fermiapp/`
    taken from microboone (not sure where to find the original.
-   You will have to modify this if qualifiers and/or build types
    change.
-   The large commented out section at the end was used to remove the
    need for qualifiers when setting up pre-built binaries.
    -   It wasn\'t very robustly written and had to be changed every
        time new build types were added.
    -   Given the limited number of users of pre-built binaries I
        decided to drop this feature.
-   Most of the heavy lifting is done by the
    [pullProducts](https://scisoft.fnal.gov/scisoft/bundles/tools/pullProducts)
    script, you shouldn\'t ever have to modify this script but may have
    to pick up changes if instructed.
