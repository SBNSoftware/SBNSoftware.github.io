# Blip Reconstruction in SBND

BlipReco refers to a class of algorithms (BlipRecoAlg) that identify MeV-scale charge depositions 
in the TPC and reconstruct them in 3D by matching clusters of hits between the multiple wire planes. 
These tools take the principles developed in ArgoNeuT and MicroBooNE, and are designed to be easily 
integrated into a broad range of analyses and reconstruction frameworks.

These instructions explain how to set up and use BlipReco in SBND. 
The first part is a crash course in setting up sbndcode and pulling the necessary repositories. 
If you already have a local working area that you want to integrate BlipReco into, feel free to skip ahead to the steps on getting and using the code.

## Logging into the SBND GPVMs

Establish a kerberos ticket and log onto a SBND GPVM:
```bash
ssh USERNAME@sbndgpvm03.fnal.gov
```

Most the GPVMs now use AlmaLinux9 (or “E9”), though much of larsoft has not yet been adapted for this new environment. 
To work around this (hopefully temporary) problem, we set up Scientific Linux container to work in:
```bash
sh /exp/sbnd/data/users/vito/podman/start_SL7dev.sh
```

Once inside the SL7 container, you may want to re-source your login profile (.profile or .bashrc, etc).
More details about this are found here: https://sbnsoftware.github.io/GPVM_migration

## Setting up SBNDCode (with BlipReco)

Copy this script to your local area and modify the top few lines to include your username and the desired name of your setup area:
```bash
/nashome/w/wforeman/setup_sbnd_blipreco.sh
```

This script will setup the necessary SBNDCode environment and also set up a local working area, with my branch of ⁠`sbndcode` pulled down. 
The full script is shown below.
```bash
export USERDIR="/exp/sbnd/app/users/<USERNAME>"
export AREA="sbndcode_myarea"
export CODE="sbndcode"
export SETUP_VERSION="v09_75_03"
export SETUP_QUALS="e20:prof"

# Source experiment-specific environment
source /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh
export MRB_PROJECT=$CODE
setup ninja

# Go to user directory
cd $USERDIR

# If area already exists, source its local products
if [ -d "$AREA" ]; then
  cd $AREA
  source localProducts*/setup
  mrbsetenv
  setup $MRB_PROJECT $MRB_PROJECT_VERSION -q $MRB_QUALS

# ... otherwisee, set up new area
else
  mkdir $AREA
  cd $AREA
  setup $CODE $SETUP_VERSION -q $SETUP_QUALS
  mrb newDev
  source localProducts*/setup
  mrb g -t $SETUP_VERSION $CODE
  cd srcs/$CODE
  git checkout remotes/origin/feature/wforeman_blipreco
  cd ../..
  mrbsetenv
  mrb i -j 4 --generator ninja
  mrbslp
fi
```


You can run this script every time you log in and set up your SL7 environment by doing `source setup_sbnd_blipreco.sh`.

The script will source your working area if it already exists. 
Whenever you want to re-compile newly developed code, you just re-run the installation command
```bash
mrbsetenv
mrb i -j 4 --generator ninja
```

It’s convenient to make aliases for this, since you’ll be doing it a lot if you end up developing code or writing your own analysis modules. 
For example, you can add these lines to `~/.profile`:

```bash
# Rebuild code
alias rb="mrb i -j 4 --generator ninja"

# Do 'mrb zap' before re-building
alias rbz="mrb z; mrbsetenv; rb; mrbslp"

# Same as above, but also clears out dictionaries
alias rbzd="mrb zd; mrbsetenv; rb; mrbslp"
```

It’s advised to always build code on the dedicated sbndbuild machine, like `⁠sbndbuild03.fnal.gov`. 

## Generating Simple Monte Carlo Samples

Copy the following file into your own working area:

`/exp/sbnd/data/users/wforeman/example/prod_eminus_0to5MeV_multi_sbnd.fcl`

This fhicl file will will generate primary truth information for events containing 20 isotropic electrons 
randomly positioned throughout the SBND volume, with kinetic energies ranging from 0 to 5 MeV. 
(This directory also contains a similar file that will simulate protons with KE from 0-50 MeV.)

To generate just 10 electron events, do
```bash
lar -c prod_eminus_0to5MeV_multi_sbnd.fcl -n 10
```

This will produce an ‘artROOT’ output file containing your events, which will be formatted something like this:

`prod_eminus_0to5MeV_multi_sbnd_20240501T001240_gen.root`

To propagate these primary particles through the Geant4 SBND geometry by running the command below, pointing to the output file.
```bash
lar -c g4_sce_lite.fcl <OUTPUT.root>
```

The full workflow is listed below, with each FCL script processing the output of the previous stage. 
The output artROOT file at each stage will be the name of the previous file, with extra information appended to the end.
```bash
g4_sce_lite.fcl
detsim_sce_lite.fcl
reco1_sce_lite.fcl
reco2_sce.fcl
```

After the final reco stage, your file will contain fully-reconstructed events! You can now run BlipReco on the events by running:
```bash
lar -c run_blipana.fcl <file.root>
```

This module (”BlipAna_module”) will create an output file called “hist_BlipAna.root” that will include a  ROOT TTree in which information about 
each event is saved, including truth information, reconstructed hit clusters, and reconstructed 3D blips. 

To manually check out the TTree using ROOT’s TBrowser, open the ROOT file (⁠root hist_BlipAna.root), 
then in the ROOT terminal type ⁠TBrowser b , and locate the file in the left-hand file browser that pops up. 
You should be able to expand the file (double-click) to see the ⁠blipana subdirectory:

<img width="255" alt="image" src="https://github.com/SBNSoftware/SBNSoftware.github.io/assets/12041182/98ac35e4-2ac3-41ba-b67c-f9669d5f925a">

The components of the file are described below:

* **BlipRecoAlg**: This directory includes diagnostic histograms made by the BlipRecoAlg algorithm.
These plots are useful for optimizing blip reconstruction parameters (time-matching thresholds between planes, maximum blip size, etc). 
I’m happy to explain these in detail if you want to dig deeper, but for now you shouldn’t need to look in here!

* **Diagnostics**: Some more diagnostic histograms, but made by the BlipAna module itself.
  
* **anatree**: This is the TTree containing information from each event. You can manually look at different tree branches and 
make plots in the TBrowser itself (there are some tutorials online, or I can help you), but you’ll ultimately have more 
flexibility by writing a ROOT macro to read the TTree and make customized plots. More on this later.

* **nblips, blip_zy...**: Just a couple histograms of the blip multiplicity per event and their distribution along the YZ plane.
Useful for checking if your reco actually worked.
