# How to Build a Spack Environment for Distribution in CVMFS (Manual Method)

## Overview

This page contains instructions for building a binary spack environment for distribution in CVMFS.  
This article assumes that all of the relevant packages have already been tagged.
This article covers the manual method, meaning that the build does not use Jenkins.  

## Step-by-step Instructions

Step by step instructions follow.

### Create a Spack Instance

In your own account on the sbn gpvm's, create a spack instance that is a subspack of a suitable parent spack instance. Use padding.
<pre>
$ source /cvmfs/sbn.opensciencegrid.org/spack-uboone-v1.1.1/setup-env.sh
$ spack subspack --with-padding /path/to/spack/instance
$ source /path/to/spack/instance/setup-env.sh
</pre>
If your experiment already has a spack instance in cvmfs, use that as the parent.  
If you are creating a new spack instance, use the next upstream spack instance as the parent.

If you are reusing an existing local spack instance, update the spack recipes.
<pre>
$ spack repo update
</pre>
