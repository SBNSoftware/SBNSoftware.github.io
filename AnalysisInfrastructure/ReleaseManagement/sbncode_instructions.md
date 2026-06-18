# Detailed instructions for building sbncode releases

This page contains detailed instructions for building ups style / SL7 sbncode releases.
It does not cover everything in
[Miquel's release manager instrucions](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/rm_instructions).

## Sbncode packages

Sbncode releases generally consist of the following four packages, which are listed below in dependency order, low to high.
* sbnobj
* sbnanaobj
* sbnalg
* sbncode

Normally sbncode releases are only concerned with updating and tagging these four packages.
For a list of related packages that may need to be built separately, refer to
[Miquel's release manager instrucions](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/rm_instructions).

### Sbnd and Icarus packages

It is often desirable to check out and test sbnd or icarus packages together with sbncode packages.
Here are the related packages for sbnd.
* sbndutil
* sbndcode

Here are the related packages for icarus.
* icarusutil
* icarus_signal_processing
* icarusalg
* icaruscode

### SBN suite
When checking out packages using mrb, you can check out all sbn-related packages using sbn_suite.
<pre>
$ mrb g sbn_suite
</pre>
Checking out sbn_suite will check out all of the sbncode, sbnd, and icarus packages listed above, plus package sbnci.
However, it is not generally possible to build sbnd and icarus packages in the same mrb test release.
Therefore, if you check out sbn_suite, you should prune the checked out packages down to just the ones you are interested in.

## Step by step instructions for building sbncode releases

This section contains step-by-step instructions for building sbncode releases.

### Set up a new mrb test release

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

### Check out all sbncode and related packages

Check out all sbncode packages.  Optionally check out either sbnd or icarus packages for testing.
<pre>
$ cd $MRB_SOURCE
$ mrb g sbn_suite
$ rm -rf &lt;unneeded packages&gt;
$ mrb uc
</pre>

### Prepare a working branch for each package

Visit each checked out package and make sure that the correct working branch is checked out.
For integration releases, check out branch "main" for sbncode packages.  Sbnd and icarus packages that
are checked out for testing should generally have branch "develop" checked out.
For production releases, check out the appropriate production branch.
If you are working with an existing mrb test release, make sure to "git pull" the working branch.
<pre>
$ git checkout &lt;working branch&gt;
% git pull
</pre>
For integration releases, for each sbncode package, merge already commited updates from develop branch to main.
<pre>
$ git merge origin/develop
$ git merge develop
</pre>

### Update dependent package versions

Update the larsoft base version, if necessary.  Use command "mrb uv."
<pre>
$ mrb uv larsoft &lt;larsoft version&gt;
</pre>
Update any other changed dependent package versions and fix any remaining version conflicts involving
sbnd and icarus packages.
In general, as long as the larsoft version has been properly updated, any remaining version conflicts can be discovered by 
initializing the build environment using mrbsetenv.
<pre>
$ mrb uv &lt;package&gt; &lt;version&gt;
</pre>

### Merge approved pull requests

You can see a list of open pull requests for any package using the following command, or using the github web interface.
<pre>
$ gh pr list
</pre>

To include a github pull request in your test release, first check out the pull request into a local branch,
then merge the pull request branch into your working branch.

<pre>
$ gh pr checkout &lt;number&gt;
$ git checkout &lt;working-branch&gt;
$ git merge &lt;pr-branch&gt;
</pre>

### Do initial test build

If there are any additional required updates that are not covered in the previous sections, do them now.
After all such updates, do a full build-and-test.
<pre>
$ cd $MRB_BUILDDIR
$ mrbsetenv
$ mrb i -jN
$ mrb t -jN
</pre>
If there are errors at this point, fix them before proceeding.

### Update sbncode package versions

Make a "notag" directory adjacent to $MRB_SOURCE.
<pre>
$ cd $MRB_SOURCE
$ mkdir ../notag
</pre>

Visit each sbncode package in dependency order (low to high), ending with package sbncode.
Compare each package to the previous suite tag.
<pre>
$ cd $MRB_SOURCE/&lt;package&gt;
$ git diff SBN_SUITE_vxx_yy_zz
</pre>
If the package does not have any updates. move it out of $MRB_SOURCE.
<pre>
$ cd $MRB_SOURCE
$ mv &lt;package&gt; ../notag
</pre>
If the package does have updates, update its package version using command "mrb uv."
<pre>
$ mrb uv &lt;package&gt; &lt;new version&gt;
</pre>

### Do final test build

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

### Commit changes and make tags

For each package that is still checked out in $MRB_SOURCE, commit changes and make a tag on the working branch.
Push the working branch and tag to the main repository.
<pre>
$ git status
$ git add &lt;modified files&gt;
$ git commit -m&lt;version&gt;
$ git tag -a -m&lt;version&gt; &lt;version&gt;
$ git push origin &lt;working branch&gt;
$ git push origin &lt;version&gt;
</pre>

### Do Jenkins build

Use Jenkins build project sbn-release-build for both integration releases and production releases.
The configuration of this build project includes the following parameters which may need updating.
* Ups version.
* sbncode package tags (four parameters).
* sbndaq_artdaq_core version.
* s-qualifier

The base qualifier and build type (debug, prof) are included in the Jenkins configuration matrix.

### Upload built packages to SciSoft

Fetch build artifacts (tarballs and manifests) Add "-q" options (repeatable) for any qualifiers that are part of the
configuration matrix.
<pre>
$ copyFromJenkins -q e26 sbn-release-build
</pre>

Upload tarballs and manifests to the scisoft products server using copyToSciSoft.
<pre>
$ copyToSciSoft *
</pre>

Note that scripts copyFromJenkins and copyToSciSoft can be downloaded from https://scisoft.fnal.gov/scisoft/bundles/tools/ .

### Upload built packages to cvmfs

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

### Create a suite tag

Create a suite tag SBN_SUITE_<version> for each sbncode package, whether updated or not.
<pre>
$ cd $MRB_SOURCE/&lt;package&gt;
$ git tag -a -m"Sbn suite vxx_yy_zz" SBN_SUITE_vxx_yy_zz
$ git push origin SBN_SUITE_vxx_yy_zz
</pre>

### Update develop branch

For integration releases, merge updates from branch main to develop.
<pre>
$ cd $MRB_SOURCE/&lt;package&gt;
$ git checkout develop
$ git merge main
$ git push origin develop
</pre>

### Final checks

* Make sure that newly released sbncode version is able to be set up.
* Verify that pull requests you intended to merge are closed.

### Generate release notes

Generate github release notes.  Steps for doing this are as follows.
* Navigate to the main [sbncode github web page](https://github.com/SbnSoftware/sbncode).
* Click on [Releases](https://github.com/SBNSoftware/sbncode/releases)
* Click on button [Draft a new release](https://github.com/SBNSoftware/sbncode/releases/new).
* Choose the correct tag from the pull down menu.
* Fill in the release title box with the tag.
* Fill in the release description box.
* Use the preview tab to make sure everything looks OK.
* Click on the "Publish release" button.

### Update the sbncode release list

* Navigate to the [sbncode release list](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases) wiki page.
* Click on button [Improve this page](https://github.com/SBNSoftware/SBNSoftware.github.io/edit/master/AnalysisInfrastructure/ReleaseManagement/Releases/List_of_SBN_code_releases.md)
* Add a line to the table of releases with link to newly generated release notes.
* Commit update.
