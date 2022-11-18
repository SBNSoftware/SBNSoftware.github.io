---
layout: page
title: SBN DAQ Software Wiki
###subtitle: Specific Wiki for SBNDAQ
description: Wiki documentation for SBNDAQ
hero_height: is-small
toc: true
toc_title: SBN Online Release Instructions
---

sbndaq
=====================================
Instructions can be found [here](Installation.md).


sbndqm
=====================================
This largely follows the workflow layed out in the [offline release management instructions](https://sbnsoftware.github.io/AnalysisInfrastructure/rm.html).

### Prepare the release
1. First build/test locally by setting up a local dev area. If you're doing this from an offline machine with access to cvmfs, you can use the `sbnbuild/SBN/setup_build_sbndqm.sh` script (provide target version and quals as first and second argument).
2. Pull down `sbndqm`: `mrb g sbndqm`. If you need to make changes to `sbndaq_online`, then also do `mrb g sbndaq_online`.
3. In each repo, perform a `gitflow init`. Use `main` as the ‘production’ branch, but use defaults for all the rest of the prompts.
4. In each repo, do `git flow release start vXX_YY_ZZ` where `vXX_YY_ZZ` is the new version number for this package. This will create a `release/vXX_YY_ZZ` in this repo based on develop.
5. Merge any needed additional PRs, and edit `ups/product_deps` appropriately to have the new version number and updated dependencies as needed. Build locally and make sure everything builds ok.
6. Commit all changes and push the release branch(es) to the origin `git push origin release/vXX_YY_ZZ` for all the needed repos.

### Run build on Jenkins.
1. Login to buildmaster.fnal.gov (need to be on VNC and need to have certificate added), and go to the "sbn" tab.
2. Click on "sbndqm-release-build" (or just go here: https://buildmaster.fnal.gov/buildmaster/view/sbn/job/sbndqm-release-build/)
3. Click on "Build with Parameters" on the left, and modify the parameters as needed:
   - "SBNDQM_VERSION" should be the version number of `sbndqm` you are building.
   - "SBNDQM","SBNDAQ_ONLINE" are the tags/branches/commits within those repositories that you want to build. If using the above this would be the appropriate `release/vXX_YY_ZZ` branch for that repository.
4. Click the "Build" button, and make sure all build configs are successful. If one or more is unsuccessful, investigate by looking at the console output via jenkins webpage. Make updates in the code as necessary (in your local area), and commit/push them back up to the repo.

### Finalize the tag.
1. In your testing area, in each repo do `git flow release finish`. Make sure to include a message for the tag.
2. Do `git push origin main develop --tags` to push up the changes to main, develop, and the new tag.

### Distribute software.
#### SciSoft:
Fetch results of Jenkins from both e20 and c7 builds by calling `source SBN/copyToSciSoft_sbndqm.sh` from the parent `sbnbuild` area.

#### CVMFS:
1. Login to CVMFS: `ssh cvmfssbn@oasiscfs.fnal.gov`
2. Start a server transaction: `cvmfs_server transaction sbn.opensciencegrid.org`
3. Install the new software into cvmfs: `~/sbnbuild/CVMFS/install_on_cvmfs_sbndqm.sh sbndqm-XX.YY.ZZ` where `XX.YY.ZZ` is the sbndqm version number (note dots instead of underscores!)
4. Publish the changes with a message and a tag: `cvmfs_server publish -m "Published sbndqm XX.YY.ZZ" -a sbndqm.XX.YY.ZZ sbn.opensciencegrid.org`


sbndaq_artdaq_core for offline
=====================================





Contributing to this wiki
----------------------------------------------


The content of this wiki is tracked in a GitHub repository [SBNSoftware/SBNSoftware.github.io](https://github.com/SBNSoftware/SBNSoftware.github.io)
under the
[`sbndaq_wiki`](https://github.com/SBNSoftware/SBNSoftware.github.io/tree/master/sbndaq_wiki)
subdirectory. Some details using this particular theme can be found [here](https://github.com/chrisrhymes/bulma-clean-theme).
