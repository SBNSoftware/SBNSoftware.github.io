---
layout: page
title:  Release Management Instructions
toc: true
---
# Table of contents
1. [Release management (pre)requisites](#requisites)
2. [SBN Release instructions for an SBN software stack build, release and distribution.](#instructions)
    1. [Prepare and test](#test)
    2. [Jenkins](#jenkins)
    3. [Tag](#tag)
    4. [Distribution](#distribute)
3. [Especial packages](#especialpackages)
4. [Production release](#production)
5. [Adding new packages to a bundle](#contribute)
6. [Troubleshooting](#troubleshooting)

## Release management (pre)requisites. <a name="requisites"></a>

Multiple permissions are needed to perform all of the actions involved
in release management, these include:

-   Access to cvmfssbn account on oasiscfs.fnal.gov
-   Access to sbn account on GPVMs
-   Account on the Jenkins build server and a [CILogon
    certificate](Setting_up_access_with_CILogon_certificate.html)
    loaded in your browser (Will need [Fermilab
    VPN](VPN.html) running if off-site)
-   Access to `scisoftgpvm01.fnal.gov`


## SBN Release instructions for an SBN software stack build, release and distribution.<a name="instructions"></a>

Different release instructions for:
   * sbncode and partners (standard packages)
   * Especially managed packages:
    	*  sbndaq_artdaq_core
     	*  sbnana
     	*  sbndata
   * Production release peculiarities 


### Prepare release and test locally.<a name="test"></a>

0. log in to one of the build nodes, move to a working area and clone the sbnbuild repo (where [release management tools](rm_tools.md) live.
1. Move into `sbnbuild` and do `source SBN/setup_build.sh <version> <quals>` where the version in the larsoft version, and the quals are a choice of quals for testing (e.g. `c7:debug`).
2. Do `mrb g <repo>` for the repositories that need to be updated.
3. For each of the special dependency key-value pairs, check release notes or use `ups active | grep <key>` to see if `<key>` has changed. If it has, you will need to change the product table in `<pair>`.
   - lardataobj : sbnobj (update lardataobj)
   - lardataalg : sbnalg (update lardataalg)
   - nugen      : sbncode (update nusystematics to the version that matches nugen. If unsure, run `ups depend nusystematics <version> <qual> | grep nugen`)
4. For each repo, do `cd srcs/<repo>` and then `git flow init`. Use `main` as the 'production' branch (for sbnalg it's `master`), but use defaults for all the rest of the prompts.
5. In each repo, do `git flow release start vXX_YY_ZZ` where `vXX_YY_ZZ` is the new version number for this package. This will create a `release/vXX_YY_ZZ` in this repo based on `develop`.
6. Merge in any pull requests that were not already on develop. (E.g. `git merge origin/feature/username_MyImportantPR`.) Resolve any conflicts as needed.
7. Edit `CMakeLists.txt` to have the new version number (at `project(sbncode VERSION `) and update versions of any dependencies in `ups/product_deps` (middle of file) as needed. Check LArSoft release notes and search for dependencies changes.
8. Commit all changes, and push up to the origin: `git commit -a -m 'my message'; git push origin release/vXX_YY_ZZ`
9. Do this for all needed repos.
10. Test locally: `cd $MRB_BUILDDIR; mrbsetenv; mrb i -j64; mrbslp`. Resolve any conflicts, and be sure to commit and push updates.

### Run build on Jenkins. <a name="jenkins"></a>
1. log in to buildmaster.fnal.gov (need to be on VNC and need to have a certificate added), and go to the "sbn" tab.
2. Click on "sbn-release-build" (or just go here: https://buildmaster.fnal.gov/buildmaster/view/sbn/job/sbn-release-build/)
3. Click on "Build with Parameters" on the left, and modify the parameters as needed:
   - "SBN_VERSION" should be the version number of `sbncode` you are building.
   - "SBN", "SBNALG", "SBNOBJ", "SBNANAOBJ", and "SBNDAQ_ARTDAQ_CORE" are the tags/branches/commits within those repositories that you want to build. If using the above this would be the appropriate `release/vXX_YY_ZZ` branch for that repository.
   - "SQUAL" is the matching s-qualifier for larsoft: see the Larsoft release notes (it doesn't change so often).
4. Click the "Build" button, and make sure all build configs are successful. If one or more is unsuccessful, investigate by looking at the console output via Jenkins webpage. Make updates in the code as necessary (in your local area), and commit/push them back up to the repo.

### Finalize the tag. <a name="tag"></a>
1. In your testing area, in each repo do `git flow release finish`. Make sure to include a message for the tag.
2. Make tags for each of `sbncode`, `sbnalg`, `sbnanaobj`, and `sbnobj` called `SBN_SUITE_v<VERSION>`. For example, if you're cutting a release for sbncode v10_14_02, all four repositories should have the `SBN_SUITE_v10_14_02` tag. This is important for CI.
3. Do `git push origin main develop --tags` to push up the changes to main (master on `sbnalg`), develop, and the new tags.

### Distribute software. <a name="distribute"></a>
#### SciSoft:
1. Create an empty directory (better in `data/` ) for each new release version for storing the traballs and manifests.
2. Fetch results of Jenkins from both e20 and c7 builds using

        perl copyFromJenkins -q e20 -q c7 sbn-release-build
        
from `ScisoftScripts` folder. This will fetch the build artefacts (tarballs and manifests, one per flavour).

3. Upload all files to scisoft

        perl copyToSciSoft *
        
(The script decides where to copy files based on name and type, the naming conventions from Jenkins should not be changed as they are understood by the script)

#### CVMFS:
1. Login to CVMFS: `ssh cvmfssbn@oasiscfs.fnal.gov`
2. Start a server transaction: `cvmfs_server transaction sbn.opensciencegrid.org`
3. Install the new software into cvmfs: `~/sbnbuild/CVMFS/install_on_cvmfs.sh sbn-XX.YY.ZZ` where `XX.YY.ZZ` is the sbncode version number (note dots instead of underscores!)
4. Publish the changes with a message and a tag: `cvmfs_server publish -m "Published sbn XX.YY.ZZ" -a XX.YY.ZZ sbn.opensciencegrid.org`

### Notify and distribute Release notes:
Send/post release notes (currently email/slack with changes) and let SBND and ICARUS release distributors know.

## Especially managed packages:<a name="especialpackages"></a>

### osclib
[osclib](https://github.com/cafana/OscLib) is an external package that we host on the SBN OSG. The standard `pullProducts` based approach isn't immediately applicable here - instead, here is a simple way to grab tagged versions and upload them.
1. Login to the NOvA buildmaster, and go to [Nova/job/external/job/osclib_collect](https://buildmaster.fnal.gov/buildmaster/view/Nova/job/external/job/osclib_collect/). Each build is a tag (match dates with tags on Github). Take note of the build number (e.g. osclib v00.27 was build 85)
2. Log on to `cvmfssbn@oasiscfs.fnal.gov`
3. Fetch the build artifacts (e.g. `wget https://buildmaster.fnal.gov/buildmaster/view/Nova/job/external/job/osclib_collect/85/artifact/*zip*/archive.zip`)
4. Unzip the archive and tar it into a suitable `.tar` file: `unzip archive.zip && tar -cf osclib_00.27.tar -C archive .`
5. Let CVMFS ingest the tarball: _This will automatically start a transaction, copy the tarball contents to the specified location, and publish changes with an automatic tag. Take care!_ Also see Section 4 of [this CVMFS tutorial](https://cvmfs-contrib.github.io/cvmfs-tutorial-2021/04_publishing/).
   
   For example, if `archive` contains `v00.27/` and `v00.27.version`, and you want the contents to go to `/cvmfs/sbn.opensciencegrid.org/products/sbn/osclib/`, the correct command is:
```
cvmfs_server ingest -t osclib_00.27.tar -b products/sbn/osclib sbn.opensciencegrid.org
```

6. Shuffle tags: It's generally better to have a meaningful tag name. First make a new tag (don't worry about specifying revision numbers, the current TRUNK revision will be used so you're good) and then remove the auto-generated one:
```
cvmfs_server tag -a osclib-v00.27 -m "Added osclib v00.27" sbn.opensciencegrid.org
cvmfs_server tag -r generic-2025-07-18T01:05:18Z sbn.opensciencegrid.org
```

### submodules (e.g. SUPERA)
After merging the sbncode PR, submodule tracking neeeds to be updated:


    git submodule update --remote
    git add -u
    git commit -m "Updated commit hashtag for Supera"



### sbndaq_artdaq_core
Different branches exist and are maintained for the DAQ. Currently, the SBN RM team only manages the `offline` branch of sbndaq_artdaq_core updating it as needed for the offline software (when sbncode/larsoft or specific PRs for offline require it to be updated) It requires local tests (is not GitHub-triggered CI, although other packages CIs checks it out, so feature branches could be tested from other packages GH comments) tagging (following v1_08_00of4 numbering scheme) and merging into the `offline` branch. Note the `develop` branch is kept for online DAQ as well as the sbndaq_artdaq package, managed by the DAQ in a different way, FYI:   

>integrating them into the next sbndaq release. Meanwhile, if you need them for running the daq, you can set up a new daq dev area and merge your PRs. Please note that we do not merge PRs directly into the develop branch; instead, PRs are merged into release/v1_xx_xx branches. They are then run through integration tests on both Icarus and SBND clusters, followed by standalone builds in the Jenkins environment, and deployed into the /software/products directory. Only after that is the release branch merged into develop. (by Gennadiy)


### sbnana
sbnana repository does not have CI enabled. For release proposes, developers are kindly requested/reminded to test-build themselves their PRs and note the details (flavour used) in the PR. The Release Manager then builds a local release with a complementary flavour. 
The procedure is similar to sbncode above just noting some differences i.e. `source SBN/setup_build_sbnana.sh <version> <quals>` 



### sbndata

sbndata is a package designed to contain external data needed for SBN. It is also versioned with tags and released as ups product available from `/cvmfs/sbn.opensciencegrid.org/products/sbn` (so distribution is similar to others). Nevertheless, it is not built (has no architecture) nor mrb handled.

As a data product, checks are on the developer (analyser) and update (merging) is handled via GitHub pull request. Once ready, merge the update and create a new tag in GitHub.
#### ups product declare and distribution
In a data directory, clone (or checkout) the updated sbndata, declare the product and distribute it

`cd /exp/sbnd/data/users/mnebot/sbndata/sbndata`

`git clone git@github.com:SBNSoftware/sbndata.git `

`mkdir v01_04`

`cd sbndata`

`mv * ../v01_04/`

`ups declare -0 -z /exp/sbnd/data/users/mnebot/sbndata -r sbndata/v01_04 -m sbndata.table sbndata v01_04`

`tar -cjf sbndata-01.04-noarch.tar.bz2 -C /exp/sbnd/data/users/mnebot/sbndata sbndata/v01_04 sbndata/v01_04.version`

`tar -tf sbndata-01.04-noarch.tar.bz2`

Distribute to scisoft

`perl ../sbnbuild/Jenkins/copyToSciSoft sbndata-01.04-noarch.tar.bz2`

Distribute  to cvmfs

`cvmfs_server transaction sbn.opensciencegrid.org`

`source sbnbuild/CVMFS/install_on_cvmfs_sbndata.sh sbndata-01.04`

`cvmfs_server publish -m "Published sbndata 01.04" -a sbndata.01.04 sbn.opensciencegrid.org`


## Production release <a name="production"></a>

 Production release branches are meant to be maintained so, don't close the release branch when it's created. Use:
 
    git flow release finish -k <branch name>
    
For keeping up a production branch, when a patch is needed:

1). Checkout release branch from git, use git fetch and git switch to get in non-detached head:
    
    git fetch origin release/SBN2021C
    git switch release/SBN2021C
    
2). Merge any updates. Note: PRs can be directed to merge into this branch instead of develop. 
3). Bump version numbers and push updated branch for use on Jenkins as normal.
4). Create a new tag (from within the release branch) and push it:
    
    git tag -a v09_37_01_01 -m "Version v09_37_01_01, patch release for SBN2021C"
    git push --tags
    
 5). Distribute it as usual.

## Adding new packages to a bundle<a name="contribute"></a>
It can happen that dependencies of sbncode need to be refactored, and new packages added. It is important to make a distinction between:
   * _packages_, which describe self-contained pieces of code under their own version control, and
   * _bundles_, which put packages together to publish under one repository on the SBN CVMFS.

An example: In sbncode v10_04_07, refactoring of code led to the introduction of package `sbnalg` (see [DocDB #40408](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=40408)). 

You will find that there are various problems when you try to test said code:
1) `mrb g` will not work: this is because `mrb` looks up lists of known repositories and returns an error if you're trying to check out a repo it doesn't know about;
2) The Jenkins build (which depends on `mrb`) will fail;
3) Even if you do get Jenkins to build, you won't be able to use `perl copyToSciSoft *` as you'll run into permissions issues making directories on `/SciSoft/packages/` on scisoftgpvm01.fnal.gov .

You should follow the instructions on the [SciSoft redmine page](https://cdcvs.fnal.gov/redmine/projects/scisoft/wiki/SciSoft) and open a ticket ASAP for SciSoft; at the same time, you need to reach out to the mrb maintainers about adding the new package to mrb. You should also add a Github issue to the [mrb issues page](https://github.com/art-framework-suite/mrb/issues/).

You should also add a new String parameter to Jenkins so that it can pick up the new package you are using a dependency with, and update the `buildSBN.sh` on the SBNSoftware fork of `larutils` (which is what our Jenkins build looks at to trigger builds). When you're sure the updated script works, open a PR to the upstream repo of `larutils` and make sure to let the maintainers know.

## Troubleshooting, useful git procedures (TO BE UPDATED)<a name="troubleshooting"></a>

### Trouble shooting cvmfs/scisoft publications
   * delete manually 
   * re-install

NOTE that the cvmfs publish tag is not the same as the release tag. cvmfs will complain about a tag already used.
```bash
cvmfs_server publish -m "Publication message" -a 09.41.00 sbn.opensciencegrid.org
Tag name '09.41.00' is already in use.
```
just increment an extra number each time you need to update

`cvmfs_server publish -m "Published sbn 09.41.00.00" -a 09.41.00.00 sbn.opensciencegrid.org`

### Create a tag from a tag

* If the branch is at the same stage just create a release in GitHub with the tag name from the branch.

* From past versions :
  
    `git fetch --all --tags`
  
    `git checkout tags/SBN2021C -b release/v09_12_08`
  
    `git log --oneline --graph`
  
    `git tag -a v09_12_08 -m "Version v09_12_08, production release SBN2021C"`
  
    `git push --tags`


### Cherry-picking commits for patch/fix

`mrb g sbnanaobj@v09_17_06_01` 

`git checkout -b feature/miquelnebot_prodCAFfix`

`git cherry-pick dedb4687017d111bb938f09ec5fbec7bdd7a3516`

`git push origin feature/miquelnebot_prodCAFfix` 


### Working with forks

when merging locally 

 `git remote add gitusername https://github.com/gitusername/repo_url.git`
 
 `git pull gitusername`
 
 `git merge gitusername/PR_branch_name`
 
