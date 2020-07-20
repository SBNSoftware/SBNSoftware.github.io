---
lang: en
title: Updating sbnd data
---



Updating sbnd data
========================================================

-   sbnd\_data is not version controlled by git so everything is much
    more difficult.
-   There are two ways to treat sbnd\_data to make life a little easier



Current version can be updated
--------------------------------------------------------------------------------

-   If new files or directories need to be added the current version can
    be updated as it will still contain all previous files and be
    backwards compatible.

-   Log in to <sbnd@sbndgpvm01.fnal.gov>

-   You can write directly to /grid/fermiapp/products/sbnd/sbnd\_data/\<
    version \>

-   This directory isn\'t version controlled so be careful!

-   Make note of any added file or directories in the relevant `CHANGES`
    files.

-   Log out of <sbnd@sbndgpvm01.fnal.gov> and into
    <cvmfssbnd@oasiscfs.fnal.gov>

-   Start a transaction

-   rsync the directories\

        rsync -r < user >@sbndgpvm01.fnal.gov:/grid/fermiapp/products/sbnd/sbnd_data/< version >* /cvmfs/sbnd.opensciencegrid.org/products/sbnd/sbnd_data/

-   Publish the transaction.



New version required
------------------------------------------------------------

-   If a file that already exists needs to be updated then the version
    of sbnd\_data must be updated to ensure backwards compatability.
-   This used to be a big issue because the photon library (O(500MB)) is
    in sbnd\_data.
-   We don\'t need this anymore so it can be dropped when sbnd\_data
    v01.03 is needed.
-   There are some instructions of how to do a manual deployment
    [here](Write_files_to_SciSoft.html) but it has been a
    while since they were used and may not be valid any more.
-   A worked example of what I did last time sbnd\_data was uploaded to
    SciSoft follows.
-   Once the tarball is on SciSoft it can be distributed on
    /grid/fermiapp [like sbndcode and
    sbndutil](Deploying_a_release_on_fermigrid.html) and
    then rsync\'d to cvmfs (I think).



New version worked example
------------------------------------------------------------------------

    ssh tbrooks@sbndgpvm01.fnal.gov
    source /grid/fermiapp/products/sbnd/setup_sbnd.sh
    app
    mkdir data_v01_01_00
    cd data_v01_01_00/
    cp -av /grid/fermiapp/products/sbnd/setup /grid/fermiapp/products/sbnd/.up* .
    mkdir -p sbnd_data
    source "$(pwd)/setup" 
    declare LatestVersion="v01_00_00" 
    cp -av "/grid/fermiapp/products/sbnd/sbnd_data/${LatestVersion}" sbnd_data/
    mkdir -p sbnd_data/v01_00_00/OpticalLibrary
    cp /sbnd/data/users/gamez/OpLibraryFiles/NewOpLibrary/op_library_sbnd_v2.root sbnd_data/v01_00_00/OpticalLibrary/.
    cp sbnd_data/v01_00_00/Response/CHANGES sbnd_data/v01_00_00/OpticalLibrary/.
    vim sbnd_data/v01_00_00/OpticalLibrary/CHANGES
    vim sbnd_data/v01_00_00/CHANGES
    vim sbnd_data/v01_00_00/README
    declare NewVersion="v01_01_00" 
    mv -v "sbnd_data/${LatestVersion}" "sbnd_data/${NewVersion}" 
    ups declare sbnd_data "$NewVersion" -f NULL -m sbnd_data.table -r "sbnd_data/${NewVersion}" 
    setup larutils v1_20_05
    makeDataTar.sh "$(pwd)" sbnd_data "$NewVersion" 
    cp sbnd_data-01.01.00-noarch.tar.bz2 /sbnd/data/users/tbrooks/.
    ssh sbnd@sbndgpvm01.fnal.gov
    tar xvvf /sbnd/data/users/tbrooks/sbnd_data-01.01.00-noarch.tar.bz2 -C /grid/fermiapp/products/sbnd/
    logout
    ssh cvmfssbnd@oasiscfs.fnal.gov
    cvmfs_server transaction sbnd.opensciencegrid.org
    rsync -r tbrooks@sbndgpvm01.fnal.gov:/grid/fermiapp/products/sbnd/sbnd_data/v01_01_00* /cvmfs/sbnd.opensciencegrid.org/products/sbnd/sbnd_data/
    cvmfs_server publish -m "Published sbnd_data 01.01.00" -a 2.0 sbnd.opensciencegrid.org
    logout
    ~/scripts/copyToSciSoft.sh sbnd_data-01.01.00-noarch.tar.bz2
