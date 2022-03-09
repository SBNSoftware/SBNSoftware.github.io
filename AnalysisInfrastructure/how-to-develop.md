# How To Add Features, Fix Bugs, or Otherwise Develop 

Need help? Things not working? Contact: [Wes Ketchum, Joseph Zennamo, and Miquel Nebot-Guinot](mailto:wketchum@fnal.gov,jaz8600@fnal.gov,miquel.nebot@ed.ac.uk)

*First, thank you for taking the time to everyone maintain the health and vitality of our code!*

## Development Philosophy

In general, we suggest that you develop in a ["feature branch"](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow) based on the lastest stable, built, and distributed release (_link to release page and notes to be added._)

This model enables you to start your development from a well-defined starting point:
1. The code should build out-of-the-box
2. The CI-validation for this release provides a basis for comparing any changes you make
3. It allows reviewers to have a clearly defined starting point

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
`cd srcs`

From here you are ready to start checking out package! We will start with our baseline package `<sbncode/icaruscode/sbndcode>`:  
`mrb g <sbncode/icaruscode/sbndcode>@<version>`  

If you need to checkout other packages you'll want to check out the scisoft manifests:

1. Go to this website: [https://scisoft.fnal.gov/scisoft/bundles/](https://scisoft.fnal.gov/scisoft/bundles/)
2. Select the bundle you are working on SBN, SBND, or ICARUS 
3. Select the <version> you checked out, it is probably the first item in the list
4. Click the manifest 
5. Select the <qualifier>, but selecting any of these is probably fine
6. Search for the <package> you want to edit and then copy the <package_version> listed

Then you can checkout the <package> via:  
   
`mrb g <package>@<package_version>`

## Creating a Feature Branch

You now have the code based on the previous release! From here we want to help make it your own. To do that select the `<package>` that you'll be editing and:

`cd <package>`  
`git checkout feature/$USER_<feature_name>`  

This feature name should be unique but not overly wordy. At this point I would recommend that you build your code before making any edits.

`cd $MRB_BUILDDIR`  
`mrbsetenv`  

The block that reads "`check this block for errors`" should be empty, if it isn't then you have a version mismatch somewhere and should check the `ups/product_deps` in each of the `packages` in `$MRB_SOURCE`. If this block is empty then you are *ready to build!*

On the gpvms:  
`mrb i -j4` 

On the build machines:  
`mrb i -j16` 

This can take a while (the more packages, the more time) so feel free to go get a cup of tea, coffee... OK, are you back? Great! Let's check how the build did.

If you read "`INFO: Stage install / package successful.`" then you are ready to proceed. To point the operating system to your local build do:  

`mrbslp`

If you check `ups active` you'll see that it points to your locally built products! 

Now (finally?) you are ready to edit the code:  
`cd $MRB_SOURCE`  
`cd <package>`  
 and edit away!
 A [list of coding guidelines](../sbn/codingconv/CodingConventions.md) is provided that summarises some local conventions and best practices,
 and that is strictly enforced for Common Analysis Format (CAF) code.
 
 We recommend to regularly commit the changes you make, starting inside `$MRB_SOURCE/<package>`:  
 `git status`, this will list all the changes you've made  
 `git add <edited_file>`, this adds a change to be tracked  
 `git commit -m "<a commit message>"`, this tells git-hub to track this change  
 `git push -u origin feature/$USER_<feature_name>`, this pushes it to our shared repository   

After doing a bunch of those you are probably ready for these changes to be merged into our next distributed code release so others can play with it too!
Code intended for most repository will be subject to an internal review before merging;
for example, [coding guidelines](../sbn/codingconv/CodingConventions.md) are enforced for Common Analysis Format (CAF) code (in `sbncode`).

## Building and Testing Your Code

There are two things you should do first:
1. Test building your code by: `cd $MRB_BUILDDIR; mrbsetenv; mrb i -j16`, if it doesn't build it isn't ready to merge into a release
2. Validate that your change is propogating. Follow the instructions in [CI and Validation](https://sbnsoftware.github.io/sbn/sbnci_wiki/sbnci_main).

For #2 it would be great to post these checks to the DocDB so that others can see what you did!
 
## Submitting a Pull-Request 

Great! Now we know your code builds and you have validated it now we can move to merging it into our release. 
   
1. Open a Pull Request  (PR) when your code is ready.
Check [here](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/larsoft_pr) if your development its at LArSoft level.
The next step is to alert the [Release-Management Team](https://sbnsoftware.github.io/AnalysisInfrastructure/index) that you would like your code to be reviewed for inclusion into a release. We do this via a [pull-request](https://www.atlassian.com/git/tutorials/making-a-pull-request).
There are two ways to do this:
   
a. use the github website: `https://github.com/SBNSoftware/<package>/tree/feature/$USER_<feature_name>` and click "pull request"
   
b. use command line [hub](https://hub.github.com/) extension.
   
You can track your pull-requests here: `https://github.com/SBNSoftware/<package>/pulls`
Add as much information as possible to the comments: description, validation slides dodDB entry [Validation plots], priority, contact details … 

2. Assign a reviewer.
working group colleague, someone familiar with your code, reviewers [list](suggested-reviewers and their git-hub handles) …

3. Address request, changes or comments to get the reviewers approval.

4. Trigger the integrated (for e20/c7:prof) CI test with the comment `trigger build` in your GitHub PR. If the PR is dependent on other PRs, the CI test should be performed once for all with `trigger build org/repo#num,org2/repo2#num2` (as for an example `trigger build LArSoft/larevt#11,SBNSoftware/sbndcode#108`) in a GitHub comment. Look at the checks comments (CI Dashboard) to find information about the possible cause of failures and try to solve it.    
Wait until the nightly build for e20/c7:debug CI test and check the outputs in CI Dashboard or Slack (#sbn_ci_alerts).
If successful your code will be ready to be merged into the stack.
   The succes should be posted in the dependent PRs as well to inform about the readiness.



   
 
Your code is ready to be released and will be merged into our next release! 
