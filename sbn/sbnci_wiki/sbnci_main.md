---
layout: page
title: SBN Continuous Integration and Validation Wiki

hero_height: is-medium
---

Welcome to the SBN CI & validation main page! If you just want to run a validation test for your SBNSofware pull request, continue reading the Quick Start Guide below. For more information, check out the links at the bottom. 

## Outages
#### sbndcode
- BNB nu + cosmics unavailable for 'current'
- references unavailable for SBN2022A and 'current'

#### icaruscode
- input samples unavailable for 'current'
- PDS validation unavailable for SBN2022A
- references unavailable for SBN2022A and 'current'

## Approved reference tags (and alias, if available)
- sbndcode:    `v09_37_01_03p01` (sbn2021c), `v09_37_02_01` (sbn2022a), `v09_51_00` (current)
- icaruscode:  `v09_37_01_03` (sbn2021c), `v09_37_02_01` (sbn2022a), `v09_51_00` (current)

## [ICARUS CI Validation Results](/sbn/sbnci_wiki/icarus_ci_validation_results)

## Quick Start Guide
1. Get a valid kerberos ticket with forwarding enabled (`kinit -f <username>`)
2. ssh into one of your experiment's gpvm nodes
3. setup your environment 
```
source /cvmfs/<sbnd or icarus>.opensciencegrid.org/products/<sbnd or icarus>/setup_<sbnd or icarus>.sh
```
4. `setup sbnci v09_51_00_01 -q e20:prof`
5. `source get_proxy.sh`
6. To validate your code, you will need to provide the following.
- Validation workflow (`tpcreco`, `tpcsim`, `pdssim`, `pdsreco` or `crt`)
- From `SBNSoftware/` only, a branch or list of branches (`repository1@branch1 repository2@branch2 ...`) or from `LArSoft/` if it's a tag of the form `LARSOFT_SUITE_vXX_YY_ZZ`
- The approved reference tag that you want to test your branch(es) against

    Test the CI workflow with a small sample (pass flag `-t or --test`) using the executable, `validate.sh`. 
 ```
 validate.sh <validation workflow> --revisions <branches> [--ref <vXX_YY_ZZ or alias> or --current] [[--test]]
 ```

7. Verify the the test succeeds by following its progress on [the test dashboard](https://dbweb9.fnal.gov:8443/TestCI/app/ns:sbnd/view_builds/index). Validation tests sometimes take several minutes to appear and usually complete in under four hours.
8. If your test succeeded, move on to the full validation test by repeating the same command as Step 6 except omit the `--test` flag.
9. Await your final results on [the CI dashboard](https://dbweb8.fnal.gov:8443/LarCI/app/ns:sbnd/view_builds/index).
10. If performing this validation for PR approval, post the link to the validation panel on the dashboard as a comment in your PR.

### More Information
1. [SBN CI & Validation working group information](/sbn/sbnci_wiki/SBN_CI_Validation_group)
2. [List of validation metrics](/sbn/sbnci_wiki/CI_validation_metrics)
3. [Validation results](https://docs.google.com/spreadsheets/d/15rEeZ8xrf1LXR84cB7tLVJPEKxr8JYftXa69TUqqUNU/edit?usp=sharing)
4. [SBN CI & validation system](/sbn/sbnci_wiki/Continuous_integration)
5. [Integration tests](/sbn/sbnci_wiki/Integration_test_guide)
6. [Validation tests](/sbn/sbnci_wiki/CI_Validation)
7. [CI development](/sbn/sbnci_wiki/Developing_Validation_Tests)
8. [Managing the CI system](/sbn/sbnci_wiki/Managing_the_CI_Validation_System)


