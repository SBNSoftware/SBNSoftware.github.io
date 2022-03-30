---
layout: page
title: Managing the CI
---

# Managing the CI System

This page is intended to only be used by people responsible for keeping the CI system up-to-date and managing a particular validation workflow, please do not use these commands if you are not one of those people! 

More information on all these tests are available on other pages. This page is intended to give you the information needed to maintain the CI system. As a system manager, your job is to make sure the CI system remains in working condition and up-to-date. Maintainance can be separated into two catagories:
integration tests and validation tests. Maintainance topics specific to each of these are covered below.

### Reference version control

A crucial component of the CI system is the version/tag of the code being tested and that of the reference code we are comparing against. While developers are free to choose the branch point of their feature branches, we want to make sure that we only compare against well understood, quality releases. To that end, we only allow users to compare against pre-approved versions of the experiment code. 

Approved reference versions/tags are listed, one per line, in a text file stored in the experiment persistent dCache area. This file is only writeable by users in the `sbnci` Unix group.
```
/pnfs/<exp>/persistent/ContinuousIntegration/approved_reference_versions.txt
```

As CI system manager, your job is not to approve reference versions. That is done by SBN Analysis/AI conveners. Your job is to add support for these versions to the CI system. When a new version is approved, you must
1. Create integration test reference files with the new version (see "Integration tests" below);
2. Generate the full set of validation input samples (see "Validation tests" below);
3. Generate validation reference files for all validation workflows (see "Validation tests" below);
4. Add the newly approved reference version to `approved_reference_versions.txt` and to the main CI wiki page.

The reference version is specified to the CI system via the trigger command with the `-e` flag and the environmental variable `SBNCI_REF_VERSION`.
```
-e SBNCI_REF_VERSION=vXX_YY_ZZ
```
If this option is not specified, the CI system defaults to the "current" reference tag, usually the most recent integration release.


### Integration tests

Integration tests consist of build, unit, install, and regression tests. They are run everytime something is pushed to develop or someone wants to test a branch/PR. We currently run a suite of 8 unit tests and 13 regression tests. 

If you're managing the CI system then it is your job to monitor the output of these tests. Depending on where you see warnings/failures then there are different things you need to do

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
trigger --build-delay 0 --force-platform slf7 --workflow Update_ref_files_<exp code>_wf
```
where `<exp code>` = `SBNDCODE` or `ICARUSCODE`

Remember you need a valid proxy to launch a trigger and its important not to update the references until the release manager and PR-maker are happy the changes are sensible.

### Validation tests
For each reference tag, before any validation tests can be triggered, a corresponding set of art-ROOT input files as well as a set of histograms for each validation metric must be produced. As part of `sbnci` RM, these files will be produced each time the reference version is updated. If the reference version specified by a user has not yet been used, the user will need to generate the files prior to running any validation tests. 

The default reference tag will be updated whenever something has changed upstream from the stage being validated that the inputs should reflect, there is a breaking change, a significant improvment has been made or a new feature is introduced.

##### Input Samples
Validation input samples are stored in the experiment specific persistent dCache areas. Samples from simulation or reconstruction stages of interest for various reference versions of the experiment code. 
```
/pnfs/<experiment>/persistent/ContinuousIntegration/input/validation/
	sample A/
	sample B/
		gen/
		g4/
		detsim/
			files_current.root → SAM def for 'current' (version in metadata)
			vii_jj_kk/
			vxx_yy_zz/
				files_vxx_yy_xx.root → SAM def for version (version in def name)
		test/
			gen/
			g4/
			detsim/
				files_current.root → SAM def for 'current' (version in metadata)
				vii_jj_kk/
				vxx_yy_zz/
					files_vxx_yy_xx.root → SAM def for version (version in def name)
```
For convenience and robustness against grid hickups, input samples are declared to SAM. The input samples use the same names regardless of the default reference tag, however the tag used in the sample production is written to the file metadata in `Dataset.Tag` with the format `<SAM definition name>_vXX_YY_ZZ`. This is used to check if a requested reference tag has a corresponding dataset. When the default reference tag is updated, the previous reference files get transfered to a subdirectory within their parent directory with name, `vXX_YY_ZZ`. 

To generate a "standard" input sample for a particular tag, there are convenience scripts for triggering the production. See the tables below. To generate a custom reference sample, you run a standard validation trigger but using a special config file:
  ```
  trigger --build-delay 0 --jobname sbnd_ci --workflow CI_VALIDATION_<exp> \
           --gridwf-cfg <sample_config_goes_here.cfg> --revisions "SBNSoftware/<exp code>@<tag>"
  ```
  
Information on available samples is given below. Note the template arguments below `<exp>` = `sbnd` or `icarus`, `<stage>` = `g4` or `detsim`.
  
  |   BNB + IntrNuE Mix |                                                                             | 
  | ------------------- | --------------------------------------------------------------------------- |
  | Test script         | generate_bnb_intrnue_mix_validation_sample_test.sh <new reference tag>  |
  | Full script         | generate_bnb_intrnue_mix_validation_sample.sh <new reference tag>  |
  | Test configuration  | cfg/grid_workflow_\<exp\>\_generate_bnb_intrnue_mix_validation_sample_test.cfg |
  | Full configuration  | cfg/grid_workflow_\<exp\>\_generate_bnb_intrnue_mix_validation_sample.cfg      |
  | SAM test definition | \<exp\>\_ci_input_bnb_intrnue_mix_\<stage\>\_test                             |
  | SAM full definition | \<exp\>\_ci_input_bnb_intrnue_mix_\<stage\>                                  |
  
  | BNB w/ Cosmics      |                                                                         |
  | ------------------- | ----------------------------------------------------------------------- |
  | Test script         | generate_nu_cosmic_validation_sample_test.sh <new reference tag>  |
  | Full script         | generate_nu_cosmic_validation_sample.sh <new reference tag>  |
  | Test configuration  | cfg/grid_workflow_\<exp\>\_generate_nu_cosmic_validation_sample_test.cfg |
  | Full configuration  | cfg/grid_workflow_\<exp\>\_generate_nu_cosmic_validation_sample.cfg      |
  | SAM test definition | \<exp\>\_ci_input_nu_cosmic_overlay_\<stage\>\_test                       |
  | SAM full definition | \<exp\>\_ci_input_nu_cosmic_overlay_\<stage\>                            |
  
  The \_test configs are not *only* for testing whether the generation works with current develop branches but also produces the input files required for the \_test versions of the actual validation. Hence, it is important to run the \_test config first even if you are sure the main config will be successful.

##### Reference Files
Reference files contain analysis objects, only TH1F's for now (can be expanded). When the validtion is run, a new, corresponding set of analysis objects is produced and compared against those in the reference file. At present, there is only a single reference file per validation (sub)workflow. Each file contains the version of the experiment code that was used to produce it. In each (sub)workflow directory, there is a (local) symlink that points to whatever version that corresponds to the latest integration release. The directory and file naming structure is below.
```
/pnfs/<experiment>/persistent/ContinuousIntegration/reference/validation/
    WorkflowA/
    WorkflowB/
    test/
        WorkflowA/
            ci_validation_histos_vII_JJ_KK.root
            ci_validation_histos_vXX_YY_ZZ.root
            ci_validation_histos.root (symlink pointing to 'current' version)
        WorkflowB/
            SubworkflowA/
            SubworkflowB/
                ci_validation_histos_vII_JJ_KK.root
                ci_validation_histos_vXX_YY_ZZ.root
                ci_validation_histos.root (symlink pointing to 'current' version)
```
