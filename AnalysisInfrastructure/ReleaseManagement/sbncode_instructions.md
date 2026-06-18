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

It is often desirable to check out and test sbnd or icarus packages together with sbncode packages.  Here are the related packages for sbnd.
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
Update any other changed dependent package versions and fix any remaining version conflicts involving sbnd and icarus packages.
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

To include a github pull request in your test release, first check out the pull request into a local branch, then merge the pull request branch into your working branch.

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

