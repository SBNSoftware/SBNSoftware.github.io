---
layout: page
title: Write files to SciSoft
---

[Return to Release Management Workflow](https://sbnsoftware.github.io/sbndcode_wiki/Release_management_workflow.html)


Write files to SciSoft
================================================================

-   Currently sbndcode, sbndutil and sbnd\_data can be written to
    scisoft
-   You will need permission to copy files to SciSoft, these can be requested by submitting a ticket to scisoft. See instructions here: https://scisoft.fnal.gov/
-   You will need the scripts copyFromJenkins and copyToSciSoft which
    can be obtained here
    (<http://scisoft.fnal.gov/scisoft/bundles/tools/>). They are also located in the [attachments folder of the wiki](https://github.com/SBNSoftware/SBNSoftware.github.io/tree/master/sbndcode_wiki/attachments).



Copy sbndcode and sbndutil to SciSoft
----------------------------------------------------------------------------------------------

-   Go to an empty directory on an sbndgpvm, I have a `Jenkins`
    directory in my `data` area and create a directory for each new
    version. (Like the `releases/` directory I usually keep the last 6
    builds).

-   Fetch results of Jenkins from both e26 build using

        copyFromJenkins -q e26 -m swarm sbndcode-release-build
        
-   This will fetch the build artifacts (tarballs and manifests)

-   There should be one manifest for each binary flavour, and one
    tarball for each binary flavour of each ups product

-   Upload all files to scisoft

        copyToSciSoft *

-   The script decides where to copy files based on name and type, the
    naming conventions from Jenkins should not be changed as they are
    understood by the script.

-   The script will not overwrite an existing file with the same name.

-   To replace an existing file on scisoft.fnal.gov, ssh in to
    scisoftgpvm01.fnal.gov and cd in to /nasroot/SciSoft. Changes can be
    made in this directory



Copy sbnd\_data to SciSoft
-----------------------------------------------------------------------

-   sbnd\_data is treated differently as it is not version controlled
    with git or built on Jenkins

-   After a new version is created and [manually
    deployed](Write_files_to_grid.html) on /grid/fermiapp
    and CVMFS it needs to be uploaded to SciSoft.

-   You should do the steps in this section from your personal account.
    Go to any scratch directory and make a tarball of the new sbnd\_data
    version.

        cd < scratch >
        tar -cjf sbnd_data-< dot version >-noarch.tar.bz2 -C /grid/fermiapp/products/sbnd sbnd_data/< new version > sbnd_data/< new version >.version

-   It is important to follow the above naming convention exactly when
    making the tarball. Note that the version number embedded in the
    tarball name should be the \"dot version\" (underscores replaced by
    periods, and no initial \"v\"), e.g. 01.02.00.

-   It is a good idea to check the contents of the generated tarball.

        tar -tf *.bz2

-   Next, upload the tarball to scisoft using script copyToSciSoft.

        copyToSciSoft *.bz2

-   If you need to replace an existing tarball, you first need to log in
    to scisoftportal.fnal.gov and delete the existing version from
    directory /nasroot/SciSoft/packages/sbnd\_data.
