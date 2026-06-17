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
$ mkdir <some empty directory>
$ cd \<some empty directory\>
$ mrb n-v \<larsoft-version\> -q \<larsoft-qualifiers\> \[-f\]    # Use -f to use existing srcs.
$ source localProducts*/setup
</pre>
Check out all sbncode packages.  Optionally check out either sbnd or icarus packages.
For integration releases, check out branch "main" for sbncode packages (sbnd and icarus can have branch "develop" checked out for testing).
For production releases, check out the production branch.
<pre>
$ cd $MRB_SOURCE
$ mrb g  \[-b main|<production branch>\] sbn_suite
$ rm -rf \<unneeded packages\>
$ mrb uc
</pre>
