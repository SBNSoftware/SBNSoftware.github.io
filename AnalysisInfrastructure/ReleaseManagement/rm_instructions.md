---
layout: page
title:  Release Management Instructions
toc: true
---
# Table of contents
1. [Release Management Prerequisites](#prerequisites)
2. [How to Make and Distribute a Software Release](#instructions)
    1. [Clone Packages](#clone)
    2. [Update Dependencies & Version Tag](#update-deps-and-version)
    3. [Merge Relevant Pull Requests (PRs)](#merge-prs)
    4. [Propagate Changes to 'main' Branch](#propagate-changes)
    5. [Create GitHub Tag](#create-github-tag)
    6. [Run Build on Jenkins](#jenkins)
    7. [Distribute Release to CVMFS & SciSoft](#distribute)
    8. [Make an Official GitHub Release](#make-github-release)
    9. [Publicize the Release](#publicize)
3. [Special Packages](#special-packages)
4. [Adding New Packages to a Bundle](#add-new-package)




## Release Management Prerequisites <a name="prerequisites"></a>

Multiple permissions are needed to perform all of the actions involved
in release management, such as the following:

-   Access to cvmfssbn account (or cvmfsicarus/cvmfssbnd) on `oasiscfs.fnal.gov`
-   Access to SBN General Purpose Virtual Machines (GPVMs)
-   Access to `scisoftgpvm01.fnal.gov` (for publishing releases to SciSoft)
-   An account on the Jenkins build server and a [CILogon certificate](Setting_up_access_with_CILogon_certificate.html) loaded in your browser (you will also need to be connected to the [Fermilab VPN](VPN.html) if you are not on-site)





## How to Make and Distribute a Software Release <a name="instructions"></a>

### General Notes and Advice
- ALWAYS cut integration releases from the ‘develop’ branch.
- Explicit code/steps given are for ICARUS release management and authored by Jacob Smith. Most commands can be adjusted for, e.g. SBND, by substituting the experiment name where applicable. Beware that version naming schemes and other intricacies may differ according to experiment.
- Instructions will vary depending on what kind of package you are releasing:
   * **SBNCode (and partners), ICARUSCode (including ICARUSAlg, ICARUSUtil, and ICARUS_Signal_Processing), SBNDCode (and partners); these are the main three suites of software release managers work with and is what is (mostly) detailed for the ICARUS Release Manager below!**
   * Production release peculiarities will also sometimes modify the instructions you follow.
   * Special packages include but are not limited to (i.e. this list may be painfully out of date):
    	*  sbndaq_artdaq_core
     	*  sbnana
     	*  sbndata
     	*  icarus_data




> [!NOTE]
> ### Prerequisite Steps: Environment Setup
> * **0.1:** Set up Scientific Linux 7: `sh /exp/icarus/data/users/smithja/podman/start_SL7dev.sh` 
> * **0.2:** Source experiment setup code: `source /cvmfs/icarus.opensciencegrid.org/products/icarus/setup_icarus.sh`
> * **0.3:** Create your working directory: e.g. `mkdir -p /path/to/work/dir/`  and then `cd /path/to/work/dir`
> * **0.4:** Set up MRB environment according to LArSoft version (-v) and qualifiers (-q) **to which you will be upgrading**: e.g. `mrb newDev -v v10_15_00 -q e26:prof`
> * **0.5:** Source your MRB environment’s setup script. For example, if you set up your environment with version v10_15_00 and qualifier e26:prof, you will do the following: `source /path/to/work/dir/localProducts_larsoft_v10_15_00_e26_prof/setup`
>
> Note that LArSoft does not have version numbers with `pUU` (e.g. `v10_06_00_06p02`) syntax like what is used in ICARUSCode as of August 2026. For example, when upgrading `vXX_YY_ZZ_WWp01` --> `vXX_YY_ZZ_WWp02`, you would want to run the above MRB command with `vXX_YY_ZZ`. This includes the major (`XX`), minor (`YY`), and patch (`ZZ`) version numbers as used by the LArSoft collaboration. SBNCode-level packages have historically used the `WW` version number for patches of their own, and ICARUSCode-level packages have followed suit with the `pUU` designation. **However**, versioning schemes sometimes need hot fixes, e.g. LArSoft may have to cut a patch release for `v10_06_00` when collaborators specifically cannot use code contained in the `v10_06_01` release (which will have already been released). So you may run into the occaisional LArSoft tag like `v10_06_00_02` where the fourth version number **does not** correspond to something like an SBNCode-level patch.
>
> ### Prerequisite Steps: Standalone Pull Request (PR) Building
> You will sometimes be asked to cut a release that only requires updating the dependencies of your chosen package. For example, an ICARUSCode production release may only require that you pull in SBNCode updates but not have to merge any PRs at the ICARUSCode level. If this is the case, **skip this section**.
>
> 
> In an open PR, comment “trigger build” (without quotes). This starts the automatic building process. You may have to specify software versions (i.e. branches, tags, or even PRs) if working with, e.g., a production release. **Do not use new lines when specifying dependencies in a trigger build comment.**
>
> 
> You can only specify one tag/branch/PR per package:
> * To specify a tag/branch for a package: <owner>/<package>@<tag/branch>
> * To specify a PR for a package: <owner>/<package>#<PR number>
>
> 
> You must specify the version of your package (e.g. ICARUSCode) you want to compile if it is not the latest version on ‘develop’. While specifying a version of your package should automatically grab all of its dependencies, sometimes you are trying to test a PR with an upgraded dependency. The example below for ICARUSCode is (painfully) explicit, specifying the version of each package for illustrative purposes. Note that you list packages with the most upstream package (e.g. LArSoft) first and then work your way down the dependency list.
>
>`trigger build LArSoft/larsoft@v10_06_00_02 LArSoft/lar*@LARSOFT_SUITE_v10_06_00_02 SBNSoftware/sbncode@v10_06_00_14 SBNSoftware/sbnalg@v10_06_00_12 SBNSoftware/sbndaq-artdaq-core@v1_10_06 SBNSoftware/sbnobj@v10_06_00_12 SBNSoftware/sbnanaobj@v10_00_05_03 SBNSoftware/icaruscode@v10_06_00_14 SBNSoftware/icarusalg@v10_06_00_12 SBNSoftware/icarusutil@v10_06_00_04 SBNSoftware/icarus_signal_processing@v10_06_00_01`
>
> The example above was for the latest production release cut from ‘release/SBN2025A’ as of July 30th, 2026.
>
> 
> Builds should pass all checks for relevant repositories on the [CI Dashboard](https://dbweb0.fnal.gov/LarCI/app/view_builds/index). For example, if you are cutting an ICARUSCode release, there will be lar_ci tests and icarus_ci tests since ICARUSCode depends on LArSoft.





### 1) Clone relevant package(s) into a working directory. <a name="clone"></a>
This is done with `mrb g <package>` and puts the package’s source code in `/path/to/work/dir/srcs/<package>`. This command loads whatever branch is designated as the “default” branch for the given package, which is almost always named ‘develop’. 

You probably want to git-checkout a different branch (e.g. ‘release/SBN2024A’) if you are not cutting an integration release. However, you may be asked to cut an entirely new production release (e.g. if the current production branch is ‘release/SBN2025A’ and the collaboration is moving to ‘release/SBN2025B’) from the latest state of ‘develop’.


----------------


### 2) Update Dependencies and Version Tag. <a name="update-deps-and-version"></a>
2.1) At a minimum, you will want to update the version number for the package you are upgrading. This version number lives in the `/path/to/work/dir/srcs/<package>/CMakelist.txt` file. Of course, you’ll want to make other updates when cutting your release, but it’s good practice to first sort out what version you’ll name your release. See the ICARUSCode and ICARUSAlg sections below to see what to change when cutting a release for that package.

> Version number lines to change when cutting releases for ICARUS-level packages
> #### ICARUSCode:
> * For an SBNCode-level update, uncomment this line and adjust the relevant versioning number(s): `project(icaruscode VERSION XX.YY.ZZ.WW LANGUAGES CXX)`
> * For an ICARUSCode-level ONLY update, uncomment these two lines and adjust the relevant versioning number(s): `set(${PROJECT_NAME}_CMAKE_PROJECT_VERSION_STRING XX.YY.ZZ.WW-pUU)` and `project(icaruscode LANGUAGES CXX)`
> 
> #### ICARUSAlg:
> * Uncomment this line and adjust the relevant versioning number(s): `project(icarusalg VERSION XX.YY.ZZ.WW LANGUAGES CXX)`

2.2) Most often, there will at least be some dependency updates for a given integration release of the applicable package. Ensure you update the relevant version numbers for dependencies that have had updates in the `/path/to/work/dir/srcs/<package>/ups/product_deps` file. This may require repeated use of the commands that build software (specifically `mrbsetenv`) to trace the dependency tree(s). Most often, this is just incrementing the relevant major/minor/patch version number(s) relative to the latest state of your checked-out branch.

> [!NOTE]
> You will have to do `mrb g <dependency>` for each dependency that has had an updated version that has not yet been published on CVMFS/SciSoft. This will get rid of `mrbsetenv` errors if you have already updated the relevant dependency.

Build (`cd $MRB_BUILDDIR; mrbsetenv; mrb i -j<number of cores>; mrbslp`) to verify you have the correct dependencies and valid syntax for your updated CMakelist.txt file. For the ICARUS Release Manager, using icarusbuild02 affords the use of more cores, which speeds up the building process. Regular General Purpose Virtual Machines (GPVMs) have 4 cores. icarusbuild02 has 64, which allows you to use the -j16 flag. Then, git-add, git-commit, and git-push the relevant product_deps and CMakelist.txt files to the target branch.


----------------


### 3) Merge Relevant Pull Requests (PRs) <a name="merge-prs"></a>
If the release you’re cutting should incorporate unmerged PRs for the target branch at your chosen package’s level: git-merge PRs one by one into the target branch, git-pull the updated target branch, and ensure the package builds locally after incorporating each PR.
More explicitly, for each PR you want to incorporate, repeat the following steps:

3.1) Merging a PR into a target branch is done with the following: `git checkout <target branch>`, then `git pull origin <target branch>`, and finally `gh pr merge <PR number>`

> [!NOTE]
> `gh pr merge` commands require you to be authenticated via `gh auth login` with an SSH/HTTPS token. This token must have the appropriate permissions to merge PRs.

> [!NOTE]
> git-merging will not complete automatically if there are merge conflicts. You may have to manually resolve these conflicts (if they exist) and then git-add and git-commit the changes before finally git-pushing to your target branch.

3.2) `gh pr merge <PR number>` takes place on the remote repository, which is why you have to pull down the merge changes from the target branch after git-merging with `git pull origin <target branch>`. 

3.3) Building locally is done with `cd $MRB_BUILDDIR; mrbsetenv; mrb i -j<number of cores>; mrbslp`. For the ICARUS Release Manager, using icarusbuild02 affords the use of more cores.


----------------


### 4) Propagate Changes to 'main' Branch <a name="propagate-changes"></a>
If you are cutting a release from ‘develop’ or otherwise need to sync ‘develop’ with ‘main’, propagate changes to the ‘main’ branch.
Collaborators should submit an equivalent PR for ‘develop’ if they are submitting a PR to, e.g. a production branch, and want those changes to propagate to future releases of the given package. While this step should only be carried out to propagate changes from ‘develop’ to ‘main’, you may have to double back and revisit this step if a PR author later submits an equivalent PR for ‘develop’.

The ‘main’ branch serves as a way to track stable releases of a given repository. Conversely, ‘develop’ contains all approved PRs and serves as the branch against which all collaborators should build their code. Propagating changes to ‘main’ is as simple as checking out the target branch and merging in your work from ‘develop’: `git checkout main; git merge develop`. You may have to resolve merge conflicts manually (like the previous step) and then git-add, git-commit, and git-push the final state to ‘main’.


----------------


### 5) Create GitHub Tag <a name="create-github-tag"></a>
If the given package lives on GitHub, create a GitHub tag.

If this tag marks the beginning of a branch––besides ‘develop’ or ‘main’––that will receive further, continuous development, you should create a new branch before cutting any tags. This preserves the repo history so that collaborators can look back to see at what tag branches diverge.

If you are coming from step 4 (i.e., you have synced ‘develop’ with ‘main’), create a release tag from ‘main’. Otherwise, create a release tag from the target branch. This can be done with the following, where the version number, `vXX_YY_ZZ(_WWpUU)`, corresponds to the version you listed in this package’s CMakelist.txt file from step 2.1: `git checkout <target branch>` and then `git tag -a vXX_YY_ZZ(_WWpUU) -m ‘Message detailing what this tag is for.’`. 

Create SBN_SUITE tags for the package according to the LArSoft version and SBNCode-level updates. That is, _**DO NOT**_ create new tags for `pUU` patch releases to something like ICARUSCode-level packages. Rather, re-create the SBN_SUITE tag to reference the new patch.

> [!NOTE]
> For example, you could create tags like the following alongside each other:
>
> Note that the latest version of a package being published in this example is v10_06_00_06p06. Thus, we first remove the SBN_SUITE_v10_06_00_06 tag from the remote repo (which references v10_06_00_06p05) and re-create the tag to reference the code of the latest version of the given package.
>
>	`git tag -a v10_06_00_06p06 -m ‘Tag for production release. Incorporates bugfixes for dirt workflows via PR #897.’`
> 
>   `git push origin --delete SBN_SUITE_v10_06_00_06 # deletes remote tag`
> 
>	`git tag --delete SBN_SUITE_v10_06_00_06 # deletes local tag`
> 
>	`git tag -a SBN_SUITE_v10_06_00_06 -m ‘Tag for v10_06_00_06 suite of entire SBN Software stack.’`

After tags are created, push them with `git push origin vXX_YY_ZZ(_WWpUU) SBN_SUITE_vXX_YY_ZZ(_WW) …`


----------------


### 6) Run Build on Jenkins <a name="jenkins"></a>
Only do a Jenkins build for the main line package of a given software level. For example, ICARUSAlg, ICARUS_Signal_Processing, and ICARUSUtil are built as part of the process of building ICARUSCode. Don’t worry about this step for these packages when working with ICARUSCode.

Navigate to the [Jenkins Dashboard](https://buildmaster.fnal.gov/buildmaster) and select your experiment, e.g. ICARUS. Note that an FNAL VPN connection is required to access the Jenkins Dashboard. 

Click on the correct job (e.g. icarus-release-build for ICARUSCode or icarus_data-release-build for ICARUS_data), and then click on the button on the left-hand side of the screen that says “Build with Parameters.”

Fill in the package version and qualifier information for the GitHub tag you just created. The LArSoft qualifier is not frequently updated, and the SBNCode release manager will notify you if it is updated. Hit the green Build button, and wait for Jenkins output. ICARUSCode usually takes about 5 minutes to compile on Jenkins.


----------------


### 7) Distribute Release to CVMFS & SciSoft <a name="distribute"></a>

> [!NOTE]
> Note that for ICARUS release management workflows, Jacob Smith has written a bash script that automates the distribution process. You will still need access to CVMFS (via the username cvmfsicarus for ICARUS workflows) and SciSoft. The script (and accompanying scripts for sub-functions) can be found at `/home/cvmfsicarus` on the `oasiscfs.fnal.gov` machine. See the main script, publishICARUSPackage.sh, for details on how to use it.

If upgrading a main line package (e.g. SBNCode or ICARUSCode) or certain special packages (e.g. icarus_data), write files to CERN Virtual Machine File System (CVMFS).

> [!NOTE]
> A useful CVMFS manual is located at [https://cvmfs.readthedocs.io/en/stable/index.html](https://cvmfs.readthedocs.io/en/stable/index.html).
>
> To see all tags for ICARUS, do `cvmfs_server tag icarus.opensciencegrid.org`.

You should create a new release each time you update a dependency (e.g. ICARUSAlg, ICARUSUtil, and ICARUS_Signal_Processing when working with ICARUSCode). However, a package like ICARUSCode often has all its dependencies uploaded to CVMFS simultaneously and after the package builds on Jenkins (see step 6).


7.0) After having your username added to the .k5login file for the cvmfs user account on oasiscfs.fnal.gov, ssh into the OasisCFS machine: `ssh <cvmfssbn, cvmfsicarus, cvmfssbnd>@oasiscfs.fnal.gov.` 

You can contact those who currently have access to cvmfsicarus to be added to the .k5login file. These persons contact information is located at [https://sbnsoftware.github.io/icaruscode_wiki/Write_files_to_CVMFS.html#access-privileges](https://sbnsoftware.github.io/icaruscode_wiki/Write_files_to_CVMFS.html#access-privileges).

**While the above webpage may include instructions on how to write files to CVMFS, the instructions for the ICARUS Release Manager differ. Please refer to these instructions below. Note that all the following instructions in the "How to Make and Distribute a Software Release" section are tailored to the ICARUS Relase Manager.**

7.1) Start the CVMFS update session by doing `cvmfs_server transaction icarus.opensciencegrid.org`. Then navigate to a temporary folder for storing the tarballs. The usual directory for the ICARUS Release Manager is `/cvmfs/icarus.opensciencegrid.org/products/icarus/.workdir`.

7.3) Use the copyFromJenkins_vito script to download the build from Jenkins: `perl copyFromJenkins_vito -n buildservice104 icaruscode-release-build # alt: use icarus_data-release-build if distributing ICARUS_data` 

7.4) Copy over tarballs from your work directory to CVMFS: `tar xvvf <tarball file> -C /cvmfs/icarus.opensciencegrid.org/products/icarus`

> [!NOTE]
> Ensure that you copy over the tarball files for each qualifier version you want to put on CVMFS––don’t forget debug alongside prof qualifiers! If a dependency at the ICARUSCode level was additionally updated (e.g. ICARUSAlg, ICARUSUtil, or ICARUS_Signal_Processing), be sure to copy those files over as well.

7.5) Clean up your work directory by deleting the tarballs and .txt files. Then cd out of the work directory and publish the update (note that this also closes the transaction): `cvmfs_server publish -m “<package> <version>” icarus.opensciencegrid.org`

> [!NOTE]
> ICARUS is no longer pushing with -a flags to CVMFS, so we don’t affect their garbage collection. However, we can specify a package name and version in the description (-m) option.

Finally, log out of the oasiscfs.fnal.gov machine. You should see your package listed on a regular General Purpose Virtual Machine (GPVM) by doing `ups list -aK+ <package>` after 5-10 minutes.

7.6) Similar to starting from step 7.3, we now publish our release on SciSoft. Use copyFromJenkins_vito to download the build from Jenkins **to some working directory on a General Purpose Virtual Machine (GPMV)**: `perl copyFromJenkins_vito -n buildservice104 icaruscode-release-build # alt: use icarus_data-release-build if distributing ICARUS_data`

7.7) Copy the tarballs AND .txt files to SciSoft: `perl copyToSciSoft_new *tar.bz2`	AND	`perl copyToSciSoft_new *txt`.

> [!NOTE]
> A copy of the copyToSciSoft_new script can be found at `/exp/icarus/app/users/smithja/rm_scripts/copyToSciSoft_new`.

7.8) Clean up your work directory by deleting the tarballs and .txt files. You should see your package listed at [https://scisoft.fnal.gov/scisoft/packages/](https://scisoft.fnal.gov/scisoft/packages/) almost immediately.


----------------


### 8) Make an Official GitHub Release <a name="make-github-release"></a>
If upgrading a main line package such as ICARUSCode, make a release on GitHub. For ICARUSCode, navigate to [https://github.com/SBNSoftware/icaruscode/releases](https://github.com/SBNSoftware/icaruscode/releases) and click on the “Draft a Release” Button near the top right. Select the tag of the release you published to GitHub, and fill in the necessary information. You can look at previous releases for your package to see what kind of information you should include in the release notes.


----------------


### 9) Publicize the Release <a name="publicize"></a>
Ensure collaborators know about your hard work! Usual channels to communicate that a new release has been cut include but are not limited to the following:
* the #sbn_release_management channel on the SBN Slack,
* SBN software listservs such as sbn-software and icarus-software, and
* your experiment's Analysis Infrastructure (name may vary) meetings, for verbal updates and conversation about new releases


----------------
----------------


## Specially Managed Packages:<a name="special-packages"></a>


### osclib
[osclib](https://github.com/cafana/OscLib) is an external package that we host on the SBN OSG. The standard `pullProducts` based approach isn't immediately applicable here - instead, here is a simple way to grab tagged versions and upload them.

1. Login to the NOvA buildmaster, and go to [Nova/job/external/job/osclib_collect](https://buildmaster.fnal.gov/buildmaster/view/Nova/job/external/job/osclib_collect/). Each build is a tag (match dates with tags on Github). Take note of the build number (e.g. osclib v00.27 was build 85).
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


----------------


### submodules (e.g. SUPERA)
After merging the SBNCode PR, submodule tracking needs to be updated:


    git submodule update --remote
    git add -u
    git commit -m "Updated commit hashtag for Supera"


----------------


### sbndaq_artdaq_core
Different branches exist and are maintained for the DAQ. Currently, the SBN RM team only manages the 'offline' branch of sbndaq_artdaq_core, updating it as needed for the offline software (when SBNCode/LArSoft or specific PRs for offline require it to be updated). It requires local tests (i.e. it is not GitHub-triggered CI, although other packages' CIs check it out, so feature branches could be tested from other packages' GitHub comments), tagging (following v1_08_00of4 numbering scheme), and merging into the 'offline' branch. Note that the 'develop' branch is kept for online DAQ as well as the sbndaq_artdaq package, managed by the DAQ in a different way.

FYI, integrating them into the next sbnDAQ release. Meanwhile, if you need them for running the DAQ, you can set up a new DAQ dev area and merge your PRs. Please note that we do not merge PRs directly into the 'develop' branch; instead, PRs are merged into 'release/v1_xx_xx' branches. They are then run through integration tests on both ICARUS and SBND clusters, followed by standalone builds in the Jenkins environment, and deployed into the `/software/products` directory. Only after that is the release branch merged into 'develop'.


----------------


### sbnana
sbnana repository does not have CI enabled. For release purposes, developers are kindly requested/reminded to test-build their PRs themselves and note the details (flavour used) in the PR. The Release Manager then builds a local release with a complementary flavour. 
The procedure is similar to sbncode above with subtle differences, i.e. `source SBN/setup_build_sbnana.sh <version> <quals>`.


----------------


### sbndata
sbndata is a package designed to contain external data needed for SBN. It is also versioned with tags and released as a UPS product available from `/cvmfs/sbn.opensciencegrid.org/products/sbn` (so distribution is similar to others). Nevertheless, it is not built (has no architecture), nor is it handled by MRB.

As a data product, checks are on the developer (analyzer), and updates are handled via a GitHub Pull Request (PR). Once ready, merge the update and create a new tag in GitHub.

#### UPS Product Declare and Distribution
In a data directory, clone (or checkout) the updated sbndata, declare the product, and distribute it:

`cd /exp/sbnd/data/users/mnebot/sbndata/sbndata`

`git clone git@github.com:SBNSoftware/sbndata.git `

`mkdir v01_04`

`cd sbndata`

`mv * ../v01_04/`

`ups declare -0 -z /exp/sbnd/data/users/mnebot/sbndata -r sbndata/v01_04 -m sbndata.table -U ups sbndata v01_04`

`tar -cjf sbndata-01.04-noarch.tar.bz2 -C /exp/sbnd/data/users/mnebot/sbndata sbndata/v01_04 sbndata/v01_04.version`

`tar -tf sbndata-01.04-noarch.tar.bz2`

Distribute to SciSoft:

`perl ../sbnbuild/Jenkins/copyToSciSoft sbndata-01.04-noarch.tar.bz2`

Distribute to CVMFS:

`cvmfs_server transaction sbn.opensciencegrid.org`

`source sbnbuild/CVMFS/install_on_cvmfs_sbndata.sh sbndata-01.04`

`cvmfs_server publish -m "Published sbndata 01.04" -a sbndata.01.04 sbn.opensciencegrid.org`


----------------
----------------


## Adding New Packages to a Bundle<a name="add-new-package"></a>
It can happen that dependencies of a main line package need to be refactored, and new packages added. It is important to make a distinction between:
   * _packages_, which describe self-contained pieces of code under their own version control, and
   * _bundles_, which put packages together to publish under one repository on CVMFS.

An example: In sbncode v10_04_07, refactoring of code led to the introduction of package `sbnalg` (see [DocDB #40408](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=40408)). 

You will find that there are various problems when you try to test said code:
1) `mrb g` will not work: this is because `mrb` looks up lists of known repositories and returns an error if you're trying to check out a repo it doesn't know about;
2) The Jenkins build (which depends on `mrb`) will fail;
3) Even if you do get Jenkins to build, you won't be able to use `perl copyToSciSoft *` as you'll run into permissions issues making directories on `/SciSoft/packages/` on `scisoftgpvm01.fnal.gov`.

You should follow the instructions on the [SciSoft redmine page](https://cdcvs.fnal.gov/redmine/projects/scisoft/wiki/SciSoft) and open a ticket ASAP for SciSoft; at the same time, you need to reach out to the MRB maintainers about adding the new package to MRB. You should also add a GitHub issue to the [MRB issues page](https://github.com/art-framework-suite/mrb/issues/).

You should also add a new String parameter to Jenkins so that it can pick up the new package you are using a dependency with, and update the `buildSBN.sh` on the SBNSoftware fork of `larutils` (which is what our Jenkins build looks at to trigger builds). When you're sure the updated script works, open a PR to the upstream repo of `larutils` and make sure to let the maintainers know.
