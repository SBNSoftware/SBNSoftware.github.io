---
layout: page
title: SBN Continuous Integration and Validation Wiki

hero_height: is-medium
---

Welcome to the SBN CI & validation main page! If you just want to run a validation test for your pull request, continue reading the Quick Start Guide below. For more information, check out the links at the bottom. 

## Outages
- `sbndcode`: undergoing maintainance
- `icaruscode`: undergoing maintainance

## Current reference tags
- `sbndcode`:    `v09_37_01_03p01`
- `icaruscode`:  `v09_37_01_03`

## Quick Start Guide
1. Get a valid kerberos ticket with forwarding enabled (`kinit -f <username>`)
2. ssh into one of your experiment's gpvm nodes
3. setup your environment: `source /cvmfs/<sbnd or icarus>.opensciencegrid.org/products/<sbnd or icarus>/setup_<sbnd or icarus>.sh`
4. `setup sbnci v09_37_01 -q e20:prof`
5. `source get_proxy.sh`
6. Test the CI workflow with a small sample using one of the following executables. Pass as an argument a space-separated list of the `repository@branch`'s you are testing and omit SBNSoftware from the repository name. Note that only SBNSoftware repositories are supported at this time.
-  `tpc_reco_validation_test.sh`
-  `tpc_sim_validation_test.sh`
-  `pds_validation_test.sh`
-  `crt_validation_test.sh`
7. Verify the the test succeeds by following its progress on [the test dashboard](https://dbweb9.fnal.gov:8443/TestCI/app/ns:sbnd/view_builds/index).
8. If your test succeeded, move on to the full validation test using one of the following executables. Pass as an argument a space-separated list of the `repository@branch`'s you are testing and omit SBNSoftware from the repository name. Note that only SBNSoftware repositories are supported at this time.
-  `tpc_reco_validation.sh`
-  `tpc_sim_validation.sh`
-  `pds_validation.sh`
-  `crt_validation.sh`
9. Await your final results on [the CI dashboard](https://dbweb8.fnal.gov:8443/LarCI/app/ns:sbnd/view_builds/index).
10. Upon a successful test, note the CI build number in your pull request (get this from the CI dashboard, left column).

### More Information
1. [SBN CI & Validation working group information](/sbn/sbnci_wiki/SBN_CI_Validation_group)
2. [List of validation metrics](/sbn/sbnci_wiki/CI_validation_metrics)
3. [Validation results](https://docs.google.com/spreadsheets/d/15rEeZ8xrf1LXR84cB7tLVJPEKxr8JYftXa69TUqqUNU/edit?usp=sharing)
4. [SBN CI & validation system](/sbn/sbnci_wiki/Continuous_integration)
5. [Integration tests](/sbn/sbnci_wiki/Integration_test_guide)
6. [Validation tests](/sbn/sbnci_wiki/CI_Validation)
7. [CI development](/sbn/sbnci_wiki/Developing_Validation_Tests)
8. [Managing the CI system](/sbn/sbnci_wiki/Managing_the_CI_Validation_System)


