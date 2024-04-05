---
layout: page
title: SBN DAQ Software Setup Instructions
hero_height: is-small
---

These instructions should be largely the same for the different locations in which we typically run/install software: the DAB teststand at Fermilab, and the SBN-FD and SBN-ND DAQ clusters. Please be sure to substitute for the environment where appropriate.

* TOC
{:toc}

## Prerequisites

* You need an account on the appropriate cluster. Fill out a [Test Stand Service Request Form](https://fermi.servicenowservices.com/wp/?id=evg_sc_cat_item&sys_id=b0a7f0b46f8ec200c6df5d412e3ee4b6&spa=1) on Fermilab ServiceNow and ask that you be added to the SBN DAQ clusters at DAB and FD/ND as needed.
* You need to have a github account and be added to the [SBN Software Github Organization](https://github.com/SBNSoftware). Contact Wes `(wketchum` AT `fnal` DOT `gov`) or fill out [this form](https://docs.google.com/forms/d/e/1FAIpQLSf_jrYDbaC3_WoLDzBappZkEpPpyD7tSt7UWF59TUyUEAjaSA/viewform?usp=sf_link).

## Logging in and setting up

1. Login to the desired machine under your user name:
```bash
ssh username@sbnd-daq00.fnal.gov
```
or
```bash
ssh username@icarus-gateway01.fnal.gov
```
or
```bash
sbnd-gateway01.fnal.gov
```
2. Setup the common artdaq products area, and the `dev` area if appropriate (you need it):
```bash
source /daq/software/products/setup   #common area
source /daq/software/products_dev/setup   #dev area
```
3. Setup the version of sbndaq we are based. To see a list of the different available versions, use
```bash
ups list -aK+ sbndaq -qe26:s120a:prof
```
It's recommended you use the latest available version (this is currently v1_10_01 as of 4/2024) with e26:prof:s120a as the option. Then, to set up, use:
```bash
setup sbndaq v#_##_## -qe26:prof:s120a
```
Quick detour:
	- `e` qualifiers specify the gcc compiler version
	- `py2` qualifier specifies to use python2 (default is python3)
	- `s` qualifiers specify the `art` suite version
	- `prof` specifies optimization flags in the compiler, while `debug` specifies debug flags.
	
	If you want to just run from there, that's all you need to do! 

## Build/install local build

If you're doing development work, then you'll want to be able to create a development area and download source code, modify it, then build and install your local changes. We use [`mrb`](https://cdcvs.fnal.gov/redmine/projects/mrb/wiki) for that.

1. Setup the `mrb` environment:
```bash
setup mrb v6_08_01
export MRB_PROJECT=sbndaq
export my_sbndaq_version=$(echo  $SETUP_SBNDAQ |cut -d " " -f 2)
export my_sbndaq_quals=$(echo  $SETUP_SBNDAQ |cut -d " " -f 8)
echo sbndaq version: $my_sbndaq_version
echo sbndaq qualifiers: $my_sbndaq_quals
```

2. Create and setup a new `mrb` development directory:
```bash
mkdir <your_working_area>
cd <your_working_area>
mrb newDev  -q $my_sbndaq_quals -v $my_sbndaq_version
source localProducts_*/setup
```
*Important:* If using a shared user account, create a working area in the ```${HOME}/DAQ_DevAreas``` directory. When naming the area, please use the pattern `$(date +"DAQ_%Y-%m-%d")_${your_initials}_${purpose}`, e.g. `DAQ_2023-08-29_AA_testing_CRT`.
```bash
export your_initials=FNL
purpose=testing_name
export your_working_area=${HOME}/DAQ_DevAreas/$(date +"DAQ_%Y-%m-%d")_${your_initials}_${purpose}
mkdir -p ${your_working_area}
cd ${your_working_area}
mrb newDev  -q $my_sbndaq_quals -v $my_sbndaq_version
source localProducts_*/setup
````

3. Pull down the necessary repositories using mrb. Note, the dashes in the repository name need to be replaced with underscores, e.g. `sbndaq-artdaq-core` should be typed as `sbndaq_artdaq_core`:
```bash
cd $MRB_SOURCE
mrb g <repo_name_with_underscore>
```
*Note:* you may need to do some setup of your github account with proper SSH keys. See [here](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh).)
*Note:* This will pull from the HEAD of the develop branch and include any changes that may have been pushed since the last tag (`v#_##_##`) was created. Alternatively, if you want to build the tagged, working version that was set up in the previous steps, directly:
```bash
mrb g <repo_name_with_underscore>@<desired tag version *e.g.* v1_10_01, or branch *e.g.$ feature/me_myAwesomeFeature>
```
<!---
*Note:* An error can occur when attempting to pull down the repositories with a message of "Unable to verify write access...". If this happens, go the the appropriate srcs directory and do these:
```bash
git remote set-url origin ssh://p-sbndaq@cdcvs.fnal.gov/cvs/projects/sbndaq 
git remote set-url origin ssh://p-sbndaq@cdcvs.fnal.gov/cvs/projects/sbndaq-artdaq 
git remote set-url origin ssh://p-sbndaq@cdcvs.fnal.gov/cvs/projects/sbndaq-artdaq-core
```
--->
If you're not sure what tags are needed for the various repos you can do a quick check:
```bash
ups active | grep <repo_name_with_underscore>
```
Repository names are likely one of (or multiples of) these:
```
wibtools
sbndaq-artdaq-core
sbndaq-artdaq
sbndaq
```

4. Build by doing:

Important: If prompted to run the `mrb uc` command (see the output example below) then run it followed by `mrbsetenv` and rerun the build `mrb i -j8`.
```bash
------------------------------------
INFO: stage cmake for MRB project sbndaq v1_00_00
------------------------------------
CMake Error at /daq/software/products/mrb/v5_18_01/Modules/Mrb.cmake:37 (message):
  Current CMake subdirectory inclusion order is not consistent with current
  packages and their interdependencies.

  Please run "mrb uc" to regenerate ${MRB_SOURCE}/CMakeLists.txt with
  subdirectories listed for inclusion in the correct order.
Call Stack (most recent call first):
  /daq/software/products/mrb/v5_18_01/Modules/Mrb.cmake:79 (mrb_check_subdir_order)
  CMakeLists.txt:5 (include)
-- Configuring incomplete, errors occurred!
FATAL ERROR: stage cmake FAILED for MRB project sbndaq v1_00_00 with code 1
```

```bash
cd $MRB_BUILDDIR
mrbsetenv
mrb i -j8
#run only if prompted by mrb
#mrb uc && mrbsetenv && mrb i -j8
mrbslp
```
The `-j8` option tells it to parallelize the build on 8 threads. You may use more or less depending on the number of cores available on the machine you are building on.

If prompted to run the `mrb uc` command then run it followed by `mrbsetenv` and rerun the build `mrb i -j8`.

5. If you need to rebuild repositories you've already pulled down (like, after changing a few lines of code), you will typically only need to do:
```
cd $MRB_BUILDDIR
make i -j8
```
However, if you pull down new repositories or make changes to product dependencies, it's often true you may need to do a cleanup ("zap") and complete rebuild:
```bash
cd $MRB_BUILDDIR
mrb z
mrb zi
mrbsetenv
mrb i -j8
#run only if prompted by mrb
#mrb uc && mrbsetenv && mrb i -j8
mrbslp
```
*Note:* If using a shared user account, create a symbolic link to ```${MRB_TOP}/srcs/sbndaq/<cluster_name>/DAQInterface``` in the ```${MRB_TOP}``` directory.
```bash
export cluster_name=sbn-fd #use sbn-fd for Icarus, sbn-nd for SBND, or dab for DO/DAB
ln -s ${MRB_TOP}/srcs/sbndaq/${cluster_name}/DAQInterface ${MRB_TOP}/
```

### How to update your development area when a new release is available

Sometimes, you will be working on a new feature, and need to update your code to incorporate a new release of the `sbndaq` software suite to keep your feature up-to-date. Do the following from a fresh login.

1. Set up the common products:
```bash
source /daq/software/products/setup
source /daq/software/products_dev/setup
```
2. Set up the sbndaq version corresponding to the new release:
```bash
setup sbndaq {version} -q {qualifiers}
```
3. Create a new `localProducts` directory, _while keeping the same `srcs` directory_:
```bash
setup mrb v6_08_01
export MRB_PROJECT=sbndaq
cd <your_existing_working_area>
mrb newDev -p
source localProducts_<new one>/setup  #the new localProducts dir!
```
Make sure you source the new `localProducts` directory! (It is usually good to delete the outdated `localProducts` directory once you have things working.)
4. Update your git repositories with the latest release(s).
5. Then, make a clean build:
```bash
cd $MRB_BUILDDIR
mrb z
mrbsetenv
mrb i -j8
#run only if prompted by mrb
#mrb uc && mrbsetenv && mrb i -j8
```

### Suggested summary install script
Put the commands that never change into your bash login script
```bash
source /daq/software/products/setup
source /daq/software/products_dev/setup
setup mrb v6_08_01
export MRB_PROJECT=sbndaq
```
And then to checkout and build `sbndaq` and `sbndaq-artdaq` (most common situation) source the script below _from your work directory_:
```bash
setup sbndaq v1_10_01 -q e26:prof:s120a
export my_sbndaq_version=$(echo  $SETUP_SBNDAQ |cut -d " " -f 2)
export my_sbndaq_quals=$(echo  $SETUP_SBNDAQ |cut -d " " -f 8)
echo sbndaq version: $my_sbndaq_version
echo sbndaq qualifiers: $my_sbndaq_quals
mrb newDev  -q $my_sbndaq_quals -v $my_sbndaq_version
source localProducts_*/setup

mrb g sbndaq
mrb g sbndaq_artdaq

cd build*
mrbsetenv
mrb i -j8 |& tee make.log
#run only if prompted by mrb
#mrb uc && mrbsetenv && mrb i -j8 |& tee make.log

mrbslp
```

## Installation on a remote server
First set up local directories that you will need for building and running.  We suggest you put the ```/daq``` mount point on one physical disk or disk array, with each directory below a separate partition.  This is not stricly needed, but will keep your local areas identical to the ones at Fermilab, but modify as local conditions necessitate.

| Directory/Partition | Suggested Size | Purpose |
| ------------------- | -------------- | ------------------ |
| /daq/software       | 2 TB           | Prepackaged software copied from FNAL |
| /daq/log            | 3 TB           | Locally generated log files |
| /daq/scratch        | 3 TB           | Temporary scratch data files |
| /daq/run_records    | 1 TB           | Record of locally produced runs and their configurations |

In order to install sbndaq on a server which doesn't have software directory (e.g. outside FNAL), one first needs to copy the software with following commands:
```bash
rsync -arvtzl --del -e 'ssh -o "ProxyCommand ssh -A USERNAME@icarusgpvm01.fnal.gov -W %h:%p"' USERNAME@sbnd-daq32.fnal.gov:/software/products/ /software/products/.  --delete-excluded --exclude 'Xilinx*' --exclude 'Quartus'  --exclude="*.tar.bz2" --exclude "products/" 
rsync -arvtzl --del -e 'ssh -o "ProxyCommand ssh -A USERNAME@icarusgpvm01.fnal.gov -W %h:%p"' USERNAME@sbnd-daq32.fnal.gov:/software/products_dev/ /software/products_dev/.
```
Replace `USERNAME` with your login. SBND users may need to replace `icarusgpvm01` with another VM. Replace `sbnd-daq32.fnal.gov` with the location you are installing.

As of Jul 2020 /software occupies 202 GB. The --exclude options help to omit tens of GB of data which doesn't need to be synchronised (in most cases).
