# Instructions for building sbncode

## Table of Contents
1. [Overview](#overview)
2. [Sbncode packages](#sbncode_packages)
    1. [Sbnd and Icarus packages](#sbnd_icarus)
    2. [Sbn suite](#sbn_suite)
3. [Step by step instructions for building sbncode releases](#steps)
    1. [Set up a new mrb test release](#test_release)
    2. [Check out all sbncode and related packages](#checkout)
    3. [Prepare a working branch for each package](#branch)
    4. [Update dependent package versions](#larsoft_version)
    5. [Merge approved pull requests](merge_prs)
    6. [Do initial test build](#initial_build)
    7. [Update sbncode package versions](#sbn_version)
    8. [Do final test build](#final_build)
    9. [Commit changes and make tags](#commit)
    10. [Do Jenkins build](#jenkins)
    11. [Upload built packages to SciSoft](#scisoft)
    12. [Upload built packages to cvmfs](#cvmfs)
    13. [Create a suite tag](#suite_tag)
    14. [Update develop branch](#develop)
    15. [Final checks](#final_checks)
    16. [Generate release notes](#release_notes)
    17. [Update the sbncode release list](#release_list)
    18. [Send announcement](#announce)
4. [Shortcuts and helper scripts](#scripts)
    1.  [update_larsoft_version.sh](#update_larsoft_version.sh)
    2.  [update_sbncode_version.sh](#update_sbncode_version.sh)
    3.  [makeSBNRelNotes](#makesbnrelnotes)

## Overview <a name="overview"/>

This page contains detailed instructions for building ups style / SL7 sbncode releases.
It does not cover everything in
[Miquel's release manager instrucions](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/rm_instructions).

## Sbncode packages <a name="sbncode_packages"/>

Sbncode releases generally consist of the following four packages, which are listed below in dependency order, low to high.
* sbnobj
* sbnanaobj
* sbnalg
* sbncode

Normally sbncode releases are only concerned with updating and tagging these four packages.
For a list of related packages that may need to be built separately, refer to
[Miquel's release manager instrucions](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/rm_instructions).

### Sbnd and Icarus packages <a name="sbnd_icarus"/>

It is often desirable to check out and test sbnd or icarus packages together with sbncode packages.
Here are the related packages for sbnd.
* sbndutil
* sbndcode

Here are the related packages for icarus.
* icarusutil
* icarus_signal_processing
* icarusalg
* icaruscode

### SBN suite <a name="sbn_suite"/>
When checking out packages using mrb, you can check out all sbn-related packages using sbn_suite.
<pre>
$ mrb g sbn_suite
</pre>
Checking out sbn_suite will check out all of the sbncode, sbnd, and icarus packages listed above, plus package sbnci.
However, it is not generally possible to build sbnd and icarus packages in the same mrb test release.
Therefore, if you check out sbn_suite, you should prune the checked out packages down to just the ones you are interested in.

## Step by step instructions for building sbncode releases <a name="steps"/>

This section contains step-by-step instructions for building sbncode releases.

### Set up a new mrb test release <a name="test_release"/>

Log in to your own account on one of the sbnd or icarus gpvm's (or any other compatible computer) and set up 
the standard software development environment for that experiment.
<pre>
$ sh /exp/sbnd/data/users/vito/podman/start_SL7dev_jsl.sh
$ source /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh
</pre>
or
<pre>
$ sh /exp/icarus/data/users/vito/podman/start_SL7dev_jsl.sh
$ source /cvmfs/icarus.opensciencegrid.org/products/icarus/setup_icarus.sh
</pre>
Make a new mrb test release against an existing larsoft base release.
<pre>
$ mkdir &lt;some empty directory&gt;
$ cd &lt;some empty directory&gt;
$ mrb n -v &lt;larsoft-version&gt; -q &lt;larsoft-qualifiers&gt; [-f]    # Use -f to use existing srcs.
$ source localProducts*/setup
</pre>

### Check out all sbncode and related packages <a name="checkout"/>

Check out all sbncode packages.  Optionally check out either sbnd or icarus packages for testing.
<pre>
$ cd $MRB_SOURCE
$ mrb g sbn_suite
$ rm -rf &lt;unneeded packages&gt;
$ mrb uc
</pre>

### Prepare a working branch for each package <a name="branch"/>

Visit each checked out package and make sure that the correct working branch is checked out.
For integration releases, check out branch "main" for sbncode packages.  Sbnd and icarus packages that
are checked out for testing should generally have branch "develop" checked out.
For production releases, check out the appropriate production branch.
If you are working with an existing mrb test release, make sure to "git pull" the working branch.
<pre>
$ cd $MRB_SOURCE/&lt;package&gt; 
$ git checkout &lt;working branch&gt;
$ git pull
</pre>
For integration releases, for each sbncode package, merge already commited updates from develop branch to main.
<pre>
$ git merge origin/develop
$ git merge develop
</pre>

### Update dependent package versions <a name="larsoft_version"/>

Update the larsoft base version, if necessary.  Use command "mrb uv."
<pre>
$ mrb uv larsoft &lt;larsoft version&gt;
</pre>
Update any other changed dependent package versions and fix any remaining version conflicts.
In general, as long as the larsoft version has been properly updated, any remaining version conflicts can be discovered by 
initializing the build environment using mrbsetenv.
<pre>
$ mrb uv &lt;package&gt; &lt;version&gt;
</pre>

### Merge approved pull requests <a name="merge_prs"/>

You can see a list of open pull requests for any package using the following command, or using the github web interface.
<pre>
$ cd $MRB_SOURCE/&lt;package&gt;
$ gh pr list
</pre>

To include a github pull request in your test release, first check out the pull request into a local branch,
then merge the pull request branch into your working branch.

<pre>
$ gh pr checkout &lt;number&gt;
$ git checkout &lt;working-branch&gt;
$ git merge &lt;pr-branch&gt;
</pre>

### Do initial test build <a name="initial_build"/>

If there are any additional required updates that are not covered in the previous sections, do them now.
After all such updates, do a full build-and-test.
<pre>
$ cd $MRB_BUILDDIR
$ mrbsetenv
$ mrb i -jN
$ mrb t -jN
</pre>
If there are errors at this point, fix them before proceeding.

### Update sbncode package versions <a name="sbn_version"/>

Make a "notag" directory adjacent to $MRB_SOURCE.
<pre>
$ cd $MRB_SOURCE
$ mkdir ../notag
</pre>

Visit each sbncode package in dependency order (low to high), ending with package sbncode.
Compare each package to the previous suite tag.
<pre>
$ git diff SBN_SUITE_vxx_yy_zz
</pre>
If the package does not have any updates. move it out of $MRB_SOURCE.
<pre>
$ cd $MRB_SOURCE
$ mv &lt;package&gt; ../notag
</pre>
If the package does have updates, update its version using command "mrb uv."
<pre>
$ mrb uv &lt;package&gt; &lt;new version&gt;
</pre>

### Do final test build <a name="final_build"/>

After making all version updates, and after removing unneeded packages from $MRB_SOURCE,
update the master CMakeLists.txt and do another clean build and test.
<pre>
$ cd $MRB_BUILDDIR
$ mrb uc
$ mrb z
$ mrb zi
$ mrbsetenv
$ mrb i -jN
$ mrb t -jN
</pre>
Again, if there are errors, they need to be fixed before proceeding.

### Commit changes and make tags <a name="commit"/>

For each package that is still checked out in $MRB_SOURCE, commit changes and make a tag on the working branch.
Push the working branch and tag to the main repository.
<pre>
$ cd $MRB_SOURCE/&lt;package&gt;
$ git status
$ git add &lt;modified files&gt;
$ git commit -m&lt;version&gt;
$ git tag -a -m&lt;version&gt; &lt;version&gt;
$ git push origin &lt;working branch&gt;
$ git push origin &lt;version&gt;
</pre>

### Do Jenkins build <a name="jenkins"/>

Use Jenkins build project sbn-release-build for both integration releases and production releases.
The configuration of this build project includes the following parameters which may need updating.
* Ups version.
* sbncode package tags (four parameters).
* sbndaq_artdaq_core version.
* s-qualifier

The base qualifier and build type (debug, prof) are included in the Jenkins configuration matrix.

### Upload built packages to SciSoft <a name="scisoft"/>

After a successful Jenkins build, fetch build artifacts (tarballs and manifests) using copyFromJenkins.
Add "-q" options (repeatable) for any qualifiers that are part of the
configuration matrix.
<pre>
$ copyFromJenkins -q e26 sbn-release-build
</pre>

Upload tarballs and manifests to the scisoft products server using copyToSciSoft.
<pre>
$ copyToSciSoft *
</pre>

Note that scripts copyFromJenkins and copyToSciSoft can be downloaded from https://scisoft.fnal.gov/scisoft/bundles/tools/ .

### Upload built packages to cvmfs <a name="cvmfs"/>

Log in to cvmfssbn@oasiscfs.fnal.gov.
<pre>
$ ssh cvmfssbn@oasiscfs.fnal.gov
</pre>
Start a cvmfs transaction and run the install script.
<pre>
$ cvmfs_server transaction sbn.opensciencegrid.org
$ ~/sbnbuild/CVMFS/install_on_cvmfs.sh sbn-xx.yy.zz 
$ cvmfs_server publish sbn.opensciencegrid.org
</pre>

### Create a suite tag <a name="suite_tag"/>

Create a suite tag SBN_SUITE_<version> for each sbncode package, whether updated or not.
<pre>
$ cd $MRB_SOURCE/&lt;package&gt;
$ git tag -a -m"Sbn suite vxx_yy_zz" SBN_SUITE_vxx_yy_zz
$ git push origin SBN_SUITE_vxx_yy_zz
</pre>

### Update develop branch <a name="develop"/>

For integration releases, merge updates from branch main to develop.
<pre>
$ cd $MRB_SOURCE/&lt;package&gt;
$ git checkout develop
$ git merge main
$ git push origin develop
</pre>

### Final checks <a name="final_checks"/>

* Make sure that newly released sbncode version is able to be set up.
* Verify that pull requests you intended to merge are closed.

### Generate release notes <a name="release_notes"/>

* Navigate to the main [sbncode github web page](https://github.com/SbnSoftware/sbncode).
* Click on [Releases](https://github.com/SBNSoftware/sbncode/releases)
* Click on button [Draft a new release](https://github.com/SBNSoftware/sbncode/releases/new).
* Choose the correct tag from the pull down menu.
* Fill in the release title box with the tag.
* Fill in the release description box.
* Use the preview tab to make sure everything looks OK.
* Click on the "Publish release" button.

### Update the sbncode release list <a name="release_list"/>

* Navigate to the [sbncode release list](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases) wiki page.
* Click on button [Improve this page](https://github.com/SBNSoftware/SBNSoftware.github.io/edit/master/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases.md)
* Add a line in the table of releases with link to newly generated release notes.
* Commit update.

### Send announcement <a name="announce"/>

Announce the new release on slack channel #sbn_release_management or in other appropriate ways.

## Shortcuts and helper scripts <a name="scripts"/>

The procedures described in the previous sections are intended to be self-contained.  This section describes some helper 
scripts that can partially automate some of the steps described above.  The scripts described in this section are
stored in [sbn github package sbnbuild](https://github.com/SBNSoftware/sbnbuild).  These scripts are not currently
available as ups products, but direct download links are included below.

Here are the helper scripts described in this section, with direct download links.
* [update_larsoft_version.sh](https://raw.githubusercontent.com/SBNSoftware/sbnbuild/refs/heads/main/SBN/update_larsoft_version.sh)
* [update_sbncode_version.sh](https://raw.githubusercontent.com/SBNSoftware/sbnbuild/refs/heads/main/SBN/update_sbncode_version.sh)
* [makeSBNRelNotes](https://raw.githubusercontent.com/SBNSoftware/sbnbuild/refs/heads/main/ReleaseNotes/makeSBNRelNotes)

### update_larsoft_version.sh <a name="update_larsoft_version.sh"/>

Script update_larsoft_version.sh updates the version of larsoft and all of its dependent packages.
It eliminates the need to manually resolve most version conflicts.  This script should be invoked before the
initial test build.  It is invoked as follows.
<pre>
$ update_larsoft_version.sh -q &lt;qualifiers&gt; &lt;larsoft-version&gt;
</pre>
Here the qualifier option should include base qualifer (e.g. "e26"), built type (debug or prof), and the s-qualifier (e.g. "s131").

Update_larsoft_version.sh should work with any set of checked out packages, not just sbncode.

### update_sbncode_version.sh <a name="update_sbncode_version.sh"/>

Script update_sbncode_version.sh updates the version of an sbncode package only if necessary.  That is, it updates the
version of an sbncode package only if the checked out working version of a package differs from the matching tag.
This script should e invoked after a successful initial test build.  
One invocation of this script updates all sbncode package versions that require updates.
Script update_sbncode_version.sh is invoked with a single argument, which is the new version tag.
<pre>
$ update_sbncode_version.sh &lt;new version&gt;
</pre>

### makeSBNRelNotes <a name="makesbnrelnotes"/>

Script makeSBNRelNotes makes a skeleton version of sbncode release notes.  It is adapted from the standard larsoft
release notes script makePatchRelNotes from package larutils.  Script makeSBNRelNotes is invoked with three arguments,
as follows.
<pre>
$ makeSBNRelNotes &lt;working-dir&gt; &lt;new-tag&gt; &lt;old-tag&gt;
</pre>
Here the first argument \<working-dir\> is the name of a directoty that doesn't yet exist (the script will make it).
The second argument \<new-tag\> is the name of the tag for which release notes should be generated.  The third
argument \<old-tag\> is the name of the previous tag, which is used for a comparison base line.
