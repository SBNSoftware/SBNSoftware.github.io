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

