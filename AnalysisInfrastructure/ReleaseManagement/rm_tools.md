---
layout: page
title:  Release Management tools
toc: true
---


##SBN Release Management tools

Helper scripts are kept as part of the sbnbuild repo(https://github.com/SBNSoftware/sbnbuild)
* `SBN/setup_build.sh` sets up local mrb area for testing a sbncode / SBN stack release build. Takes larsoft version number and qualifiers as argument.
* `SBN/setup_build_sbana.sh` sets up a local mrb area for testing a sbnana release build. Takes sbnana version number to use and qualifiers as argument.
* `SBN/copyToSciSoft_sbn.sh` pulls down from jenkins and pushes up to SciSoft the output of a successful release build for SBN software.
* `SBN/copyToSciSoft_sbnana.sh` pulls down from jenkins and pushes up to SciSoft the output of a successful release build for sbnana package.
* `ScisoftScripts` folder has copies of scripts from https://scisoft.fnal.gov/scisoft/bundles/tools/.

Note SciSoft script get updated from time to time. 
