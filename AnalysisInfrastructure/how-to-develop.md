# Welcome to Add Features, Fix Bugs, or Otherwise Develop 

Need help? Not things not working? Contact: [Wes Ketchum and Joseph Zennamo](mailto:wketchum@fnal.gov,jaz8600@fnal.gov)

First, thank you for taking the time to everyone maintain the health and vitality of our code! 

Next, we will assume

## Development Philosophy

In general, we suggest that you develop in a ["feature branch"](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow) the lastest stable, built, and distributed release (link to release page and notes to be added.)

This model enables you to start your development from a well-defined starting point:
1. The code should build
2. The CI-validation run after the release was distributed provides a basis for comparing your changes against
3. It allows reviews to have a clearly defined basis 

## Finding The Release

To start you will want to think about how and where you will want to be developing:
* [`sbncode`](https://github.com/SBNSoftware/sbncode)
* [`icaruscode`](https://github.com/SBNSoftware/icaruscode)
* [`sbndcode`](https://github.com/SBNSoftware/sbndcode)

If you need to add something to a sub-package, e.g. [`sbnobj`](https://github.com/SBNSoftware/sbnobj), you should start with the upper most package, e.g. [`sbncode`](https://github.com/SBNSoftware/sbncode). 

The next step will be to setup you working area:

From an SBND gpvm or build-machine;
`source /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh`

From an ICARUS gpvm or build-machine; 
`source /cvmfs/icarus.opensciencegrid.org/products/icarus/setup_icarus.sh`

Next, you will want to find the latest release of this code. We will do this by using [`ups`](https://cdcvs.fnal.gov/redmine/projects/ups/wiki/Getting_Started_Using_UPS):

`ups list -aK+ <sbncode/sbndcode/icaruscode>`, where you should select the package you are interested in. This provides a list in the form:

`"<package>" "<version>" "<operating_system>" "< qualifer>" ""`

Once you have selected the release you would like you set it up by doing:

`setup <sbncode/sbndcode/icaruscode> <version_number> -q <qualifier>`

you can now see all the packages that are setup and where the source code lives by using `ups active`. This lists the active packages as:

`<package> <version> -f <operating system> -q <qualifer>  -z </directory/to/where/code/lives>`

Now we can start setting up a working area to play with code.

## Setting Up A Working Area

First move to your experimental `/app`-space:

From an SBND gpvm or build-machine;
`cd /sbnd/app/users/$USER`

From an ICARUS gpvm or build-machine; 
`cd /icarus/app/users/$USER`

Next you'll want to create a directory to build your working area in, I'll call this `workdir`:
`mkdir workdir`
`cd workdir`
`mrb newDev`

At this points if you `ls` you'll see three directories: `build_*`, `localProducts_larsoft_<version>_<qualifiers>`, and `src`.

Your first step will be to setup with working area:
`source localProducts*/setup`

Now we will want to start checking out the products that you would like to edit! 

## Checking Out The Packages You Want

First thing you'll want to do is move to the directory that holds all the source code:

`cd src`

From here you are ready to start checking out package! We will start with our baseline package `<sbncode/icaruscode/sbndcode>`:

`mrb g <sbncode/icaruscode/sbndcode>@<version>`

If you need to checkout other packages you'll want to check out the scisoft manifests:

1. Go to this website: https://scisoft.fnal.gov/scisoft/bundles/
2. Select the bundle you are working on SBN, SBND, or ICARUS 
3. Select the <version> you checked out, it is probably the first item in the list
4. Click the manifest 
5. Select the <qualifier>, but selecting any of these is probably fine
6. Search for the <package> you want to edit and then copy the <package_version> listed

Then you can checkout the <package> via:
  
`mrb g <package>@<package_version>`

## Creating a Feature Branch

## Building and Testing Your Code

## Submitting a Pull-Request

This section will change as things 
