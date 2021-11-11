---
layout: page
title: CI Validation
---

# CI Validation

This page describes how to use the CI validation system. 

To get back to the main CI wiki page, click [here](Continuous_integration.md).
There are also pages for [developing](Developing_Validation_Tests.md) new Validations and for those responsible for [managing](Managing_the_CI_Validation_System.md) tests.

## What is CI validation 

In testing our code, the CI tests check for changes in product sizes as well as memory and disk usage when excersising the simulation and reconstruction chain. The purpous of CI validation is to verify the physics produced by our code performs as expected. Such a test is performed as part of the pull request review process. For example, does our tracking efficiency suddenly plummet when a change is introduced elsewhere? In principle, validation tests can be developed and performed for any repository we wish to monitor.

Metrics to monitor are defined by the physics working groups and are compared to a set of reference input files produced with a stable tag of the experiment code. The reference input files need to be updated occasionally due to breaking changes. Automated production tools exist for this in order to have a fast turnaround. 

## Using the validation

### Available Workflows
- There are currently validation workflows available for each of the major physics groups in SBN. : TPC Simulation and Calibration, TPC Reconstruction, PDS Simulation and Reconstruction, & CRT Simulation and Reconstruction). If you're interested in developing new validation workflows then read the developers section below and feel free to get in contact with the CI & Validation working group via Chris Hilgenburg (chilgenb@umn.edu).
- The validation workflows utilise a set of standard input files relevant to their particular validation (for example the TPC Reco validation uses a set of 10k neutrino events simulated up to detsim so the validation then tests the reco stage only). 
- You can run the validation with any combination of feature branches from the following repositories: `sbndcode`, `sbndutil`, `sbnci` (and `larpandoracontent` if you use `CI_VALIDATION_SBND_pandora` as your workflow). If you require use of feature branch from any other repository contact [Henry Lay](h.lay@lancaster.ac.uk) or [Vito Di Benedetto](vito@fnal.gov) to have a custom repository added. Longer term there are plans to allow command line requests of any of the required products.
- Before running any CI jobs you need to setup `lar_ci` and provide yourself with the correct proxies:

   ```
   setup lar_ci
   setup cigetcert
   cigetcert -s 'fifebatch.fnal.gov'
   voms-proxy-init -noregen -rfc -voms 'fermilab:/fermilab/sbnd/Role=Analysis'
   ```
   Alternatively, after `sbnci` is setup, you can do `source get_proxy.sh`.
   
- I would recommend a test submission first, this will allow you to test that your combination of feature branches work together and don't cause an easy-to-fix failure for all 10k events on the grid. Note that the validation plots will be meangingless, this is a test that the machinery works. This submission can be followed on the [test dashboard.](https://dbweb9.fnal.gov:8443/TestCI/app/ns:SBND/view_builds/index)
- The test trigger uses the following command:
   
   ```
   trigger --build-delay 0 --jobname <sbnd or icarus>_ci --workflow CI_VALIDATION_<SBND or ICARUS>.cfg --gridwf-cfg cfg/<sbnd or icarus>/<your grid workflow>_test.cfg --revisions "SBNSoftware/<repo1>@<branch1> SBNSoftware/<repo2>@<branch2> ..." --testmode
   ```
 
- Once your test job has succeeded (or you're feeling brave) then the full validation can be triggered with the following command:
   
   ```
   trigger --build-delay 0 --jobname <sbnd or icarus>_ci --workflow CI_VALIDATION_<SBND or ICARUS>.cfg --gridwf-cfg cfg/<sbnd or icarus>/<your grid workflow>.cfg --revisions "SBNSoftware/<repo1>@<branch1> SBNSoftware/<repo2>@<branch2> ..."
   ```

**READ THIS SECTION BEFORE TRIGGERING**
- There are two key tags here that you will need to specify for your tests `--revisions` and `--gridwf-cfg`.
   - The `--revisions` tag is where you specify the branches you want to test. For example: 
     ```
     --revisions "SBNSoftware/sbndcode@feature/hlay_vertexing henrylay97/LArContent>larpandoracontent@feature/hlay_vertex_bdt_changes"
     ``` 
     would provide the two custom branches for `sbndcode` and `larpandoracontent` respectively. Note the different syntaxes for specifying a branch in the main repository and for using a branch in a forked repository and directing it towards the correct product name.
    - The `gridwf-cfg` tag is where you determine *which* validation workflow you want to run
      
      | Validation | test config | full config |
      | --- | --- | --- |
      | TPC Reco | cfg/grid_workflow_sbnd_mc_reco_all_test.cfg | cfg/grid_workflow_sbnd_mc_reco_all.cfg |
      | CRT Sim/Reco | cfg/grid_workflow_sbnd_crt_test.cfg | cfg/grid_workflow_sbnd_crt_all.cfg |
      | PDS Sim/Reco | cfg/grid_workflow_sbnd_pds_test.cfg | cfg/grid_workflow_sbnd_pds_all.cfg |
      | TPC Sim/Calib | cfg/grid_workflow_sbnd_tpcsim_test.cfg | cfg/grid_workflow_sbnd_tpcsim_all.cfg |

- Other options for the trigger command can be found as usual by running `trigger -h`.
- The results of your trigger can be followed on the [dashboard.](https://dbweb8.fnal.gov:8443/LarCI/app/ns:sbnd/view_builds/index)
