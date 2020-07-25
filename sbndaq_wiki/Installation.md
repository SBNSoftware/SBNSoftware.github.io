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
ups list -aK+ sbndaq
```
It's recommended you use the latest available version with e19:prof:py2:s94 as the option. Then, to set up, use:
```bash
setup sbndaq v#_##_## -qe19:prof:py2:s94
```
Quick detour:
	- `e` qualifiers specify the gcc compiler version
	- `py2` qualifier specifies to use python2
	- `s` qualifiers specify the `art` suite version
	- `prof` specifies optimization flags in the compiler, while `debug` specifies debug flags.
	
	If you want to just run from there, that's all you need to do! 

## Build/install local build

If you're doing development work, then you'll want to be able to create a development area and download source code, modify it, then build and install your local changes. We use [`mrb`](https://cdcvs.fnal.gov/redmine/projects/mrb/wiki) for that.

1. Setup the `mrb` environment:
```bash
setup mrb
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

3. Pull down the necessary repositories using mrb like so:
```bash
cd $MRB_SOURCE
mrb g -d <repo_name_with_underscore> --repo-type github -g SBNSoftware <repo-name-with-dashes>
```
*Note:* you may need to do some setup of your github account with proper SSH keys. See [here](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh).)
*Note:* This will pull from the HEAD of the develop branch and include any changes that may have been pushed since the last tag (`v#_##_##`) was created. Alternatively, if you want to build the tagged, working version that was set up in the previous steps, directly:
```bash
mrb g -t <desired tag version *e.g.* v0_05_01> -d <repo_name_with_underscore> git@github.com:SBNSoftware/<repo-name-with-dashes>
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
sbndaq-artdaq-core
sbndaq-artdaq
sbndaq
```

4. Build by doing:
```bash
cd $MRB_BUILDDIR
mrbsetenv
mrb i -j8
mrbslp
```
The `-j8` option tells it to parallelize the build on 8 threads. You may use more or less depending on the number of cores available on the machine you are building on.

5. If you need to rebuild repositories you've already pulled down (like, after changing a few lines of code), you will typically only need to do:
```
cd $MRB_BUILDDIR
make -j8 install
```
However, if you pull down new repositories or make changes to product dependencies, it's often true you may need to do a cleanup ("zap") and complete rebuild:
```bash
cd $MRB_BUILDDIR
mrb z
mrbsetenv
mrb i -j32
mrbslp
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
setup mrb
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
```

### Suggested summary install script
Put the commands that never change into your bash login script
```bash
source /daq/software/products/setup
setup mrb
export MRB_PROJECT=sbndaq
```
And then to checkout and build `sbndaq` and `sbndaq-artdaq` (most common situation) source the script below _from your work directory_:
```bash
setup sbndaq v0_06_00 -q e19:prof:py2:s94
export my_sbndaq_version=$(echo  $SETUP_SBNDAQ |cut -d " " -f 2)
export my_sbndaq_quals=$(echo  $SETUP_SBNDAQ |cut -d " " -f 8)
echo sbndaq version: $my_sbndaq_version
echo sbndaq qualifiers: $my_sbndaq_quals
mrb newDev  -q $my_sbndaq_quals -v $my_sbndaq_version
source localProducts_*/setup

mrb g -d sbndaq git@github.com:SBNSoftware/sbndaq.git
mrb g -d sbndaq_artdaq  git@github.com:SBNSoftware/sbndaq-artdaq.git

cd build*
mrbsetenv
mrb i -j8 |& tee make.log
mrbslp
```

## Installation on a remote server
In order to install sbndaq on a server which doesn't have software directory (e.g. outside FNAL), one first needs to copy the software with following commands:
```bash
rsync -arvtzl --del -e 'ssh -o "ProxyCommand ssh -A USERNAME@icarusgpvm01.fnal.gov -W %h:%p"' USERNAME@sbnd-daq32.fnal.gov:/software/products/ /software/products/.  --delete-excluded --exclude 'Xilinx*' --exclude 'Quartus'  --exclude="*.tar.bz2" --exclude "products/" 
rsync -arvtzl --del -e 'ssh -o "ProxyCommand ssh -A USERNAME@icarusgpvm01.fnal.gov -W %h:%p"' USERNAME@sbnd-daq32.fnal.gov:/software/products_dev/ /software/products_dev/.
```
Replace `USERNAME` with your login. SBND users may need to replace `icarusgpvm01` with another VM. Replace `sbnd-daq32.fnal.gov` with the location you are installing.

As of Jul 2020 /software occupies 202 GB. The --exclude options help to omit tens of GB of data which doesn't need to be synchronised (in most cases).
