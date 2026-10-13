# How to Build a Spack Environment for Distribution in CVMFS (Manual Method)

## Overview

This page contains instructions for building a binary spack environment for distribution in CVMFS.  This article assumes that all of the relevant packages have already been tagged.  This article covers the manual method, meaning that the build does not use Jenkins.  

## Step-by-step Instructions

Step by step instructions follow.

### Create a Spack Instance

In your own account on the sbn gpvm's, create a spack instance that is a subspack of a suitable parent spack instance. Use padding.
<pre>
$ source /cvmfs/sbn.opensciencegrid.org/spack-sbn-v1.1.1/setup-env.sh
$ spack subspack --with-padding /path/to/spack/instance
$ source /path/to/spack/instance/setup-env.sh
</pre>
If your experiment already has a spack instance in cvmfs, use that as the parent.  If you are creating a new spack instance, use the next upstream spack instance as the parent.

Check file `$SPACK_ROOT/etc/spack/upstreams.yaml` to make sure that upstream instances are in the correct order (downstream to upstream).  Usually, the larsoft spack instance should be listed last.
<pre>
$ cat $SPACK_ROOT/etc/spack/upstreams.yaml
upstreams:
  spack_1791905173.805394:
    install_tree: /cvmfs/sbn.opensciencegrid.org/spack-sbn-v1.1.1/opt/spack
    modules:
      tcl: $spack/share/spack/modules
  spack_1790350987.766301:
    install_tree: /cvmfs/larsoft.opensciencegrid.org/spack-fnal-v1.1.1/opt/spack
    modules:
      tcl: $spack/share/spack/modules
</pre>

If you are reusing an existing local spack instance, update the spack recipes.
<pre>
$ spack repo update
</pre>

### Update Environment Configuration

Check out `sbn-release-configs` from github.
<pre>
$ git clone git@github.com:SBNSoftware/sbn-release-configs
$ cd sbn-release-configs
</pre>

This repository contains release configurations for sbn, sbnd, and icarus.  You should be on branch `main`.  Make any required edits to the top level release config (`sbn-release.yaml`, `sbnd-release-yaml`, or `icarus-release.yaml`), as well as files in subdirectory `included_yaml`.  Make sure that the top level release config includes a `mirrors:` section pointing to any experiment-specific binary caches.
<pre>
  mirrors:
    uboone: https://spack-cache-1.fnal.gov/binaries/sbn
</pre>
Commit updates and tag the newly created head version.  The tag should match the tag mentioned in the release config.

### Create a new environment

Use the newly updated release config to make a new environment.
<pre>
$ spack env create &lt;environment&gt; /path/to/release/config
$ spack env activate &lt;environment&gt;
</pre>

If you need to edit the environment configuration during the build process, the top level configuration file can be edited directly at the following location.
<pre>
$SPACK_ROOT/var/spack/environments/&lt;environment&gt;/spack.yaml
</pre>
If you need to edit a configuration file in the `included_yaml` subdirectory, those files need to be commited back to github and the tag moved.  If you do edit the environment configuration directly in the spack instance, remember to copy and commit it back to github later.

### Update Recipes

Before concretizing the newly created environment for the first time, we will want to make sure that sbn package recipes are up to date.
Visit the checked out recipe repo, which for all sbn-related packages is `sbn-spack`.
<pre>
$ cd $SPACK_ROOT/var/spack/repos/sbn-spack
$ git status
</pre>
Note the checked out branch, which in the latest larsoft spack instance is `spack-v1.0`.

Change the upstream branch to point to remote `origin` instead of `upstream`.  Do a `git pull` to bring the checked out branch up to date with `origin`.
<pre>
$ git branch -u origin/spack-v1.0
$ git pull
</pre>

### Concretize the new environment.

Concretize the new environment.
<pre>
$ spack concretize
</pre>

Verify the correctness and reasonableness of the concretized environment using the following command.
<pre>
$ spack find -lc  
</pre>

### Build and install the new environment.

Update package recipes with any new checksums.  This step can be interleaved with `spack install` to identify packages requiring updated checksums.
<pre>
$ spack checksum &lt;package&gt; &lt;version&gt;
</pre>

Install packages.
<pre>
$ spack install -j&lt;Njobs&gt;
</pre>

Verify that all packages have been installed using `spack find -lc`.  

When you are finished, push updated recipes to github.  If necessary, update the git configuration to use a pushable url (i.e. `git@github.com:SBNSoftware/sbn-spack.git`).

### Install a Siging Key

Make sure that your working spack instance has a signing key.
<pre>
$ spack gpg trust &lt;public-key-file&gt;
$ spack gpg trust &lt;secret-key-file&gt;
$ spack gpg list
</pre>
For instructions on how to generate key files, refer to [Fermilab instructions](https://fnalssi.github.io/spack-at-fnal/pages/build_manager_process.html).

### Create Local Binary Cache

Make sure that this spack instance has a local binary build cache, and populate it with newly installed packages.
<pre>
$ spack cd -e
$ spack localbuildcache --key &lt;key&gt; --local --not-bc --with-build-dependencies
</pre>
The key name `<key>` is the name assigned when the key was created.  The name of an installed key can be discovered using command `spack gpg list`.

### Upload Local Binary Cache to Cache Server

Upload local binary build cache content to the cache server.
<pre>
$ scp -r bc/* products@fifeutilgpvm03.fnal.gov:/spack_cache/sbn
$ ssh products@fifeutilgpvm03.fnal.gov
$ source /cvmfs/larsoft.opensciencegrid.org/spack-fnal-v1.1.1/setup-env.sh
$ spack buildcache update-index -k /spack_cache/sbn
$ logout
</pre>

### Install the Environment in CVMFS

Copy `spack.yaml` and `spack.lock` from the newly built environment to the cvmfs server.
<pre>
$ spack cd -e
$ scp spack.yaml spack.lock cvmfssbn@oasiscfs.fnal.gov:
</pre>

Log in to the cvmfs server and open a transaction.
<pre>
$ ssh cvmfssbn@oasiscfs.fnal.gov
$ cvmfs_server transaction sbn.opensciencegrid.org
</pre>

If necessary create a new stand alone or subspack instance in cvmfs.  Do this once per instance.  Do not use padding.
<pre>
$ source /cvmfs/larsoft.opensciencegrid.org/spack-fnal-v1.1.1/setup-env.sh
$ spack subspack /cvmfs/sbn.opensciencegrid.org/spack-sbn-v1.1.1
</pre>

Create a new environment using the uploaded `spack.yaml`.  Use the same name as your working spack instance.  Use the uploaded version of `spack.yaml` as the environment configuration.
<pre>
$ source /cvmfs/sbn.opensciencegrid.org/spack-sbn-v1.1.1/setup-env.sh
$ spack env create uboonecode-v10_27_00-rc1 spack.yaml
$ spack env activate uboonecode-v10_27_00-rc1
</pre>

Copy `spack.lock` to the newly created environment.  There should be no need to concretize this environment manually.
<pre>
$ cp spack.lock $SPACK_ENV
</pre>

Verify that the concretized environment is as expected.
<pre>
$ spack find -lc
</pre>

Update package recipes.
<pre>
$ spack repo update
</pre>

Install packages from cache.
<pre>
$ spack install --include-build-deps --no-add --only-concrete --cache-only [--no-check-signature]
</pre>
This step should be able to install all packages from cache (option @--cache-only@).
Verify that all packages have been installed.
<pre>
$ spack find -lc
</pre>

Publish cvmfs transaction
<pre>
$ cvmfs_server publish sbn.opensciencegrid.org
</pre>

