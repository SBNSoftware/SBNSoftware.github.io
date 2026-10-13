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
