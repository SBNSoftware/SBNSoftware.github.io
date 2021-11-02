---
layout: page
title: Managing the CI
---

# Managing the CI System

This page is intended to only be used by people responsible for keeping the CI system up-to-date and managing a particular validation workflow, please don't use these commands if you're not one of those people! 

The CI system consists of two parts the integration tests and the validation tests. More information on all these tests are available on other pages. This page is intended to give you the commands needed to update things.

### Standard CI

The integration tests or standard CI are run everytime something is pushed to develop or someone wants to test a branch/PR. We currently run a suite of 8 unit tests and 13 integration tests, a build & installation check is also run. 

If you're managing the SBND CI then its your job to monitor the output of these tests. Depending on where you see warnings/failures then there are different things you need to do

##### build / install
If you see failures in either of these stages then someone is testing code that doesn't compile. The logs are usually fairly self explanatory in this scenario. If this is a test of the develop branch then you should speak to the release manager right away. If this is against a PR then you and the release manager need to ensure that the PR is updated to fix these issues before it is merged.

N.B. You will commonly see *warnings* at the build stage, these are normally due to a version mis-match with other products. For example if the develop branch of `larsoft` is at v09_31_00 but `sbndcode` is still at v09_30_00 then this will flag as a warning. 

##### unit_tests
You should rarely see failures at this stage, if you do something fundamental is being affected and you should investigate it fully. I have found this normally only happens due to a change upstream.

##### ci_tests
These are the really signficant tests on a day-to-day basis. The ci_tests for `e20:prof` are the ones we attempt to keep fully green (no warnings). The other builds (`e20:debug`, `c7:prof` and `c7:debug`) you should expect to see warnings (but **not** failures) as the tests are calibrated for the `e20:prof` build.

There are a few warnings you will see:
- *resource usage* (memory/cpu) these occur when a test is using more or less resources than we previously expected. Clearly code changes that add/remove data products or algorithms can cause changes in memory or time usage. As long as these changes seem reasonable then you can update the ranges in [ci_tests.cfg](https://github.com/SBNSoftware/sbndcode/blob/develop/test/ci/ci_tests.cfg)
- *product sizes* this means the number of a certain data product (e.g. `recob::hit`) has changed as a result of the tested code. Again this can be fine but requires checking with the person who made this code update to see if these changes are expected.
- *product names* as above but this time a new type of data product has been added or one has been removed

If you see warnings in either of the last two categories that are understood and merged to develop then you must update the reference files in order to reflect this change. This is done with the following command:

```
trigger --build-delay 0 --force-platform slf7 --workflow Update_ref_files_SBNDCODE_wf
```

Remember you need a valid proxy to launch a trigger and its important not to update the references until the release manager and PR-maker are happy the changes are sensible.

### Validation 
The key things to update for a valiadation workflow are the input samples (when something has changed upstream which you want the inputs to reflect) and the reference files (when an understood change has been merged into develop).

##### Input Samples
To update an input sample you run a standard validation trigger but using a special config file:
  ```
  trigger --build-delay 0 --jobname sbnd_ci --workflow CI_VALIDATION_SBND \
           --gridwf-cfg sample_config_goes_here.cfg
  ```
  
  There should be no need to use the `--revisions` flag. When updating the input files you want them to reflect the current `develop` branches of all the relevant repositories. 
  
  The available sample configs are given below:
  
  | Sample | test config | full config |
  | --- | --- | --- | 
  | BNB + IntrNuE Mix | cfg/grid_workflow_sbnd_generate_bnb_intrnue_mix_validation_sample_test.cfg | cfg/grid_workflow_sbnd_generate_bnb_intrnue_mix_validation_sample.cfg |
  | BNB w/ Cosmics | cfg/grid_workflow_sbnd_generate_nu_cosmic_validation_sample_test.cfg | cfg/grid_workflow_sbnd_generate_nu_cosmic_validation_sample.cfg | 
  
  The \_test configs are not *only* for testing whether the generation works with current develop branches but also produces the input files required for the \_test versions of the actual validation. Hence, it is important to run the \_test config first even if you are sure the main config will be successful.

##### Reference Files
*Not yet available*
