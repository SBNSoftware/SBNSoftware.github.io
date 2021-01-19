---
layout: page
title: CI Validation
---

# CI Validation

This page describes the CI validation based upon the *sbnci* package and utilising the *lar_ci* package.   

To get back to the main CI wiki page, click [here](Continuous_integration.html).


## The *sbnci* Package
- The *sbnci* package can be found [here](https://github.com/SBNSoftware/sbnci).
- It is a UPS package that currently depends on sbndcode, but is expected to depend on icaruscode in the future.
- The package is written to run validation scripts on the output of the simulation chain, and to compare these validation plots with specified reference plots.
- There are 3 main directories found in `sbnci/sbnci` for running this ci validation: *Modules*, *PlottingScripts* and *scripts*.
- The main recipe for this package is to create ROOT TTrees from an analysis module, create plots of these variables, and then compare them to reference plots.

### *Modules*
The *Modules* directory contains LArSoft analysis modules for making ROOT TTrees from the simulations, e.g. it currently contains the Shower Validation Module. 
These modules should probably move to sbndcode, icaruscode or sbncode at some point down the road. 

### *PlottingScripts*
The *PlottingScripts* directory contains the Contains ROOT macro (.C) files reading in the `.root` files from the module outputs and making a `.root` file 
containing histograms and separate `.png` files for each plot to be displayed online. This directory also contains the comparison script 
`CompareDataDistributions.C` which has been ported over having been written by Vito Di Benedetto for the DUNE CI validation. 

### *scripts*
The *scripts* directory contains the `.sh` scripts used to run the plotting macros in *PlottingScripts*, setup the appropriate reference files 
and run the comparison script.


## The *lar_ci* Package
- The *lar_ci* package is written by Vito Di Benedetto for running all of the LAr experiment CI's at Fermilab, 
it can be found [here](https://cdcvs.fnal.gov/redmine/projects/lar_ci/).
- The main part of *lar_ci* that we need to be aware of for the CI validation is `lar_ci/cfg`, this directory holds all of the config files that tell the CI 
which files to run and which settings to use.


## Updating the CI validation.

- Updating the CI validation to include a new set of validation plots requires updating both *sbnci* and *lar_ci*. 

### Updates to *sbnci*

- The first update will be to include the LArSoft analysis modules inside `sbnci/sbnci/Modules`. As *sbnci* depends on *sbndcode* (and *icaruscode* in the future)
regular LArSoft analysis modules can be used and run here.
- Next a new ROOT macro will be needed in `sbnci/sbnci/PlottingScripts`. The file *sbnciplot_showervalidation.C* can be used as an example, the structure of the 
file should match with the ROOT plots saved inside gDirectories. The output file should always have the name `ci_validation_histos.root` for the comparison 
script to work.  The validation output files from different CI modules are all kept in separate directories so they won’t get confused.
- Lastly a new bash script should be created inside the `sbnci/sbnci/scripts` to drive the validation steps. 


