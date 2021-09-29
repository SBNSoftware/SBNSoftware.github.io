---
layout: page
title: Developing Validation Tests
---

# Developing Validation Tests

If you want to add to the existing validation tests described [here](CI_Validation.md) then this article describes the packages where the validations are defined and some basics about how to create new ones. Like all coding there is a large element of trial and error to this, but feel free to contact the CI & Valdiation group for help / queries.

## Relevant Software Packages 

### The `sbnci` Package
- The `sbnci` package can be found [here](https://github.com/SBNSoftware/sbnci).
- It is a UPS package that currently depends on sbndcode, but is expected to depend on icaruscode in the future.
- The package is written to run validation scripts on the output of the simulation chain, and to compare these validation plots with specified reference plots.
- There are 4 main directories found in `sbnci/sbnci` for running this ci validation: *Modules*, *PlottingScripts*, *scripts* and *thresholds*.
- The main recipe for this package is to create ROOT TTrees from an analysis module, create plots of these variables, and then compare them to reference plots.

###### *Modules*
The *Modules* directory contains LArSoft analysis modules for making ROOT TTrees from the simulations, e.g. it currently contains the Shower Validation Module. 
These modules should probably move to sbndcode, icaruscode or sbncode at some point down the road. 

###### *PlottingScripts*
The *PlottingScripts* directory contains the Contains ROOT macro (.C) files reading in the `.root` files from the module outputs and making a `.root` file 
containing histograms and separate `.png` files for each plot to be displayed online. This directory also contains the comparison script 
`CompareDataDistributions.C` which has been ported over having been written by Vito Di Benedetto for the DUNE CI validation. 

###### *scripts*
The *scripts* directory contains the `.sh` scripts used to run the plotting macros in *PlottingScripts*, setup the appropriate reference files 
and run the comparison script.

###### *thresholds*
The *thresholds* directory contains the `.txt` files with chi-squared thresholds for the plot comparisons in each validation. Each plot is given two thresholds, this defines "good", "okay" and "bad" agreement. These scales are also used to colour code the chi-squared tables and the plots on the CI dashboard.


### The `lar_ci` Package
- The `lar_ci` package is written by Vito Di Benedetto for running all of the LAr experiment CI's at Fermilab, 
it can be found [here](https://cdcvs.fnal.gov/redmine/projects/lar_ci/).
- The main part of `lar_ci` that we need to be aware of for the CI validation is `lar_ci/cfg`, this directory holds all of the config files that tell the CI 
which files to run and which settings to use.


## Updating the CI validation.

Updating the CI validation to include a new set of validation plots requires updating both `sbnci` and `lar_ci`. 

###### Updates to `sbnci`

- The first update will be to include the LArSoft analysis modules inside `sbnci/sbnci/Modules`. As `sbnci` depends on `sbndcode` (and `icaruscode` in the future)
regular LArSoft analysis modules can be used and run here.
- You will need to provide a prolog-type fcl in the same folder as your new module to define a relevant table of fcl parameters. You should also provide a job fcl in the *JobConfigurations* folder which can be used to run your module.
- Next a new ROOT macro will be needed in `sbnci/sbnci/PlottingScripts`. The file `sbnciplot_showervalidation.C` can be used as an example, the structure of the 
file should match with the ROOT plots saved inside gDirectories. The output file should always have the name `ci_validation_histos.root` for the comparison 
script to work.  The validation output files from different CI modules are all kept in separate directories so they won’t get confused.
- Lastly a new bash script should be created inside the `sbnci/sbnci/scripts` to drive the validation steps. The script `showervalidation.sh` can be used as
an example for this. It should provide `sbnciplots.sh` with the desired Root macro from `sbnci/sbnci/PlottingScripts` and the input file which is passed into `showervalidation.sh` as the first argument, this is set in the `lar_ci` config file.

###### Updates to `lar_ci`

- The change required in the `lar_ci` package is to create a new config file for the new validation workflow, this should be located inside `lar_ci/cfg`. 
A good example to use here is `grid_workflow_sbnd_mc_reco_all.cfg`, note this workflow also details how to use multiple analysis modules in the same workflow. 
- There are a lot of parameters to set in the config file
   - *validation_process* and *validation_tag* provide a name for your validation workflow
   - *validation_function* provides the name of the validation script (from *sbnci/scripts*) followed (just a comma inbetween, no gaps) by the name of the input file (this needs to match the output of your *[mergeana]* stage later on, i.e. the tree file
   - You can have multiple *validation_functionX* parameters (*X=1,2,3...*), you will need a name for each in front of the script name deliminated by a *#* symbol
   - The *ci_extra_vars_X* parameters allow you to define the enviroment variables needed later. This includes the reference version, the location of reference histogram file(s) and the location of the threshold file.
   - The desired simulation chain can be set in the *[sim]* and *[reco]* sections. The *[reco]* section should also include the fcl to be used to run the analysis module (e.g. `allrecovalidation_job_sbnd.fcl`). The files do not have to be simulated from scratch, a SAM definition can be used with the *input_defname* tag.
   - Make sure (particularly with multiple validations) that you get the formatting of *output_to_transfer* in the final stage correct to get all of the histogram files correctly transferred.
   - Note if you want to test your new workflow with the trigger command you will need to specify the feature branch that you're working on using the `--version` tag e.g. `--version feature/hlay_automated_samples`
  
For more info check out the [lar_ci wiki](https://cdcvs.fnal.gov/redmine/projects/lar_ci/wiki).
For help with importing a new module/workflow feel free to contact me [h.lay@lancaster.ac.uk](h.lay@lancaster.ac.uk) and I'll do my best to answer any questions!

## Available Input Samples

Currently the CI Validation group maintains the following samples for use as input to validation workflows:

   | Sample | Contains | Available from | 
   | --- | --- | --- |
   | BNB + IntrNuE Mix | 5k BNB nu events + 5k BNB intrnue events | g4, detsim | 
   | BNB w/ Cosmics | 1k BNB nu events with cosmic overlay | g4, detsim |

If your validation would require a new sample speak to the CI & Validation group and we'd be happy to help!
