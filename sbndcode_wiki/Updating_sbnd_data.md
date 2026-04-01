---
layout: page
title: Updating sbnd data
---



Updating sbnd data
========================================================

-   As of Fall 2025, sbnd\_data is now version controlled by git.
-   In order to ensure compatibility with large files, GIT LFS is used
    for deployment.
-   This package leverages Git Large File Storage in order to resolve 
    issues with files > 50 MB. If you receive errors when attempting to 
    create a PR with a large file, or are manually cloning this repo 
    for non-standard use, please reference the following documentation: 
    https://git-lfs.com/
-   CI does not run on sbnd_data PRs, this is due to some limitations on 
    the CI side.
    
Steps: GitHub Release
========================================================
1. Merge the any PR's located at https://github.com/SBNSoftware/sbnd_data that are being added to the release.
2. To cut a release, go to releases->Draft a new release. Create a new tag for the new version and target main.
3. Title the release according to the version and generate release notes.
4. After hitting 'Publish release', the release is available on github, but isn't yet available on cvmfs/scisoft 
   for users. Please follow the next set of steps to do this.

Steps: SciSoft/CVMFS Release
========================================================
1. In a dedicated sbnd_data work area, clone the sbnd_data repository.
```git clone git@github.com:SBNSoftware/sbnd_data.git```

2. Move into the repository, and checkout the new tag.
```git checkout tags/<new_version>```

3. Fetch and checkout the large files for the new version.
```git lfs fetch --all && git lfs checkout```

4. Move out of the repository, and modify the directory's name to match 
   the new versioning. Create a version info directory alongside it.
```cd .. && mv sbnd_data <new_version> && mkdir <new_version>.version && cd <new_version>.version```

5. Copy the old version information's NULL_ file into the new version information directory.
```cat ../../$1/$2.version/NULL_ > NULL_```

6. Modify the contents of the new NULL_ file.
   ```bash
    FILE = version
    PRODUCT = sbnd_data
    VERSION = vXX_YY_ZZ #Bump the version
    
    #*************************************************
    #
    FLAVOR = NULL
    QUALIFIERS = ""
      DECLARER = <your-username>
      DECLARED = 2025-03-25 19.52.40 GMT #Modify date
      MODIFIER = <your-username>
      MODIFIED = 2025-03-25 19.52.40 GMT #Modify the date
      PROD_DIR = sbnd_data/vXX_YY_ZZ #Bump the version
      UPS_DIR = ups
      TABLE_FILE = sbnd_data.table
   ```
7. Copy to fermigrid area
   ```bash
   ssh sbnd@sbndgpvm01.fnal.gov
   cp sbnd_data/vXX_YY_ZZ* /grid/fermiapp/products/sbnd/
   ```
8. Copy to cvmfs
   ```bash
   ssh cvmfssbnd@oasiscfs.fnal.gov
   cvmfs_server transaction sbnd.opensciencegrid.org
   rsync -r <your-username>@sbndgpvm01.fnal.gov:/grid/fermiapp/products/sbnd/sbnd_data/vXX_YY_ZZ* /cvmfs/sbnd.opensciencegrid.org/products/sbnd/sbnd_data/
   cvmfs_server tag -l sbnd.opensciencegrid.org #check which tag to use
   cvmfs_server publish -m "Published sbnd_data XX.YY.ZZ" -a <tag> sbnd.opensciencegrid.org
   logout
   ```
9. Copy to scisoft, use [copyToScisoft](https://github.com/SBNSoftware/SBNSoftware.github.io/blob/master/sbndcode_wiki/attachments/copyToSciSoft)
   ```
   ssh <your-username>@sbndgpvm01.fnal.gov
   #Navigate to scratch area
   tar -cjf sbnd_data-< dot version >-noarch.tar.bz2 -C /grid/fermiapp/products/sbnd sbnd_data/vXX_YY_ZZ sbnd_data/vXX_YY_ZZ.version
   tar -tf *.bz2 #check the contents
   ./copyToSciSoft.sh *.bz2
   ```
   
Deprecated Documentation
========================================================
This documentation predates the existence of the sbnd_data repository. If for some reason it becomes necessary to cut a release on SciSoft/CVMFS only,
these steps can be taken.

1. Have author copy latest `sbnd_data` into their area to modify code.
2. Once their modifications are complete, copy into your area and make the following changes to `sbnd_data/vXX_YY_ZZ.version/NULL_`
   ```bash
    FILE = version
    PRODUCT = sbnd_data
    VERSION = vXX_YY_ZZ #Bump the version
    
    #*************************************************
    #
    FLAVOR = NULL
    QUALIFIERS = ""
      DECLARER = <your-username>
      DECLARED = 2025-03-25 19.52.40 GMT #Modify date
      MODIFIER = <your-username>
      MODIFIED = 2025-03-25 19.52.40 GMT #Modify the date
      PROD_DIR = sbnd_data/vXX_YY_ZZ #Bump the version
      UPS_DIR = ups
      TABLE_FILE = sbnd_data.table
   ```
3. Copy to fermigrid area
   ```bash
   ssh sbnd@sbndgpvm01.fnal.gov
   cp sbnd_data/vXX_YY_ZZ* /grid/fermiapp/products/sbnd/
   ```
4. Copy to cvmfs
   ```bash
   ssh cvmfssbnd@oasiscfs.fnal.gov
   cvmfs_server transaction sbnd.opensciencegrid.org
   rsync -r <your-username>@sbndgpvm01.fnal.gov:/grid/fermiapp/products/sbnd/sbnd_data/vXX_YY_ZZ* /cvmfs/sbnd.opensciencegrid.org/products/sbnd/sbnd_data/
   cvmfs_server tag -l sbnd.opensciencegrid.org #check which tag to use
   cvmfs_server publish -m "Published sbnd_data XX.YY.ZZ" -a <tag> sbnd.opensciencegrid.org
   logout
   ```
5. Copy to scisoft, use [copyToScisoft](https://github.com/SBNSoftware/SBNSoftware.github.io/blob/master/sbndcode_wiki/attachments/copyToSciSoft)
   ```
   ssh <your-username>@sbndgpvm01.fnal.gov
   #Navigate to scratch area
   tar -cjf sbnd_data-< dot version >-noarch.tar.bz2 -C /grid/fermiapp/products/sbnd sbnd_data/vXX_YY_ZZ sbnd_data/vXX_YY_ZZ.version
   tar -tf *.bz2 #check the contents
   ./copyToSciSoft.sh *.bz2
   ```


Worked example (Deprecated)
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
