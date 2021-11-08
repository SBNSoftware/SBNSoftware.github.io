---
layout: page
title: Managing the CI
---

# Managing the CI System

This page is intended to only be used by people responsible for keeping the CI system up-to-date and managing a particular validation workflow, please do not use these commands if you are not one of those people! 

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
A crucial ingredient of the validation system is the reference version/tag of the code being tested. The SBN CI system supports a user specifying a reference tag by passing the option `-e ci_reference_tag=vXX_YY_ZZ` to the trigger command. If this option is not specified, the CI system defaults to the most recent reference tag.

For each reference tag, before any validation tests can be triggered, a corresponding set of art-ROOT input files as well as a set of histograms for each validation metric must be produced. As part of `sbnci` RM, these files will be produced each time the reference version is updated. If the reference version specified by a user has not yet been used, the user will need to generate the files prior to running any validation tests. 

The default reference tag will be updated whenever something has changed upstream from the stage being validated that the inputs should reflect, there is a breaking change, a significant improvment has been made or a new feature is introduced.

##### Input Samples
Commonly used CI input samples are stored in `/pnfs/<experiment>/persistent/ContinuousIntegration/input/validation/<sample name>`. For convenience and robustness against grid hickups, input samples are declared to SAM. The input samples use the same names regardless of the default reference tag, however the tag used in the sample production is written to the file metadata in `Dataset.Tag` with the format `<SAM definition name>_vXX_YY_ZZ`. This is used to check if a requested reference tag has a corresponding dataset. When the default reference tag is updated, the previous reference files get transfered to a subdirectory within their parent directory with name, `vXX_YY_ZZ`. 

To generate an input sample for a particular tag, you run a standard validation trigger but using a special config file:
  ```
  trigger --build-delay 0 --jobname sbnd_ci --workflow CI_VALIDATION_<exp> \
           --gridwf-cfg <sample_config_goes_here.cfg> --revisions "SBNSoftware/<exp code>@<tag>"
  ```
  
Information on available samples is given below. Note that the template argument below <exp> = `sbnd` or `icarus`. <stage> refers to `g4` or `detsim`.
  
  |   BNB + IntrNuE Mix |                                                                             | 
  | ------------------- | --------------------------------------------------------------------------- |
  | Test configuration  | cfg/grid_workflow_<exp>_generate_bnb_intrnue_mix_validation_sample_test.cfg |
  | Full configuration  | cfg/grid_workflow_<exp>_generate_bnb_intrnue_mix_validation_sample.cfg      |
  | SAM test definition | <exp>_ci_input_bnb_intrnue_mix_<stage>_test                                 |
  | SAM full definition | <exp>_ci_input_bnb_intrnue_mix_<stage>                                      |
  
  | BNB w/ Cosmics      |                                                                       |
  | ------------------- | --------------------------------------------------------------------- |
  | Test configuration  | cfg/grid_workflow_<exp>_generate_nu_cosmic_validation_sample_test.cfg |
  | Full configuration  | cfg/grid_workflow_<exp>_generate_nu_cosmic_validation_sample.cfg      |
  | SAM test definition | <exp>_ci_input_nu_cosmic_overlay_<stage>_test                         |
  | SAM full definition | <exp>_ci_input_nu_cosmic_overlay_<stage>                              |
  
  The \_test configs are not *only* for testing whether the generation works with current develop branches but also produces the input files required for the \_test versions of the actual validation. Hence, it is important to run the \_test config first even if you are sure the main config will be successful.

##### Reference Files
*Not yet available*
