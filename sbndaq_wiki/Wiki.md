---
layout: page
title: SBN DAQ Software Wiki
###subtitle: Specific Wiki for SBNDAQ
description: Wiki documentation for SBNDAQ
hero_height: is-small
toc: true
toc_title: SBNDAQ Contents
---


Configuration DB Instructions
======================================
[See here for instructions on working with the configuration database](ConfigDB)

JULY 21 2020: GITHUB MIGRATION
======================================
We are officially switching over to using the Github hosted repositories as our central repo.

Edit July 23: We have done this!

* Instructions for setup with the new repositories have been updated [here](Installation). If you want to update the `origin` in your existing local repository, you can do so by doing:
```
git remote set-url origin git@github.com:SBNSoftware/sbndaq-artdaq.git
```
(for `sbndaq-artdaq`, please make sure to get the appropriate repo!)
* See the [updated setup instructions](Installation) for more details, but new `mrb g` commands should now point to the new repository. For example:
```
mrb g -d sbndaq_artdaq --repo-type github -g SBNSoftware sbndaq-artdaq.git
```
(again, replacing `sbndaq-artdaq` with the appropriate/desired repository ... we will work to make this a default for mrb).
* See [here](https://guides.github.com/) for more guides on how to use Github tools. Particularly useful are the [instructions for setting up an ssh key](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh) for easier pushes.

Please see [here](https://sbnsoftware.github.io/AnalysisInfrastructure/github-migration-to-do-list.html) for some useful info on migrating to Github in general, but important things for sbndaq and sbndqm are the above.


Old wiki
======================================
Please
see the old wiki for a lot of historical detail.

[Ported Old Redmine Wiki](../sbndaq_oldwiki/Wiki)

[Old redmine wiki](https://cdcvs.fnal.gov/redmine/projects/sbndaq/wiki).

(we are slowly going to work on updating/adding more info here...)

Developing in sbndaq
----------------------------------------------

* [Setup Instructions](Installation)
* [Development Model](DevModel)

# Useful Links
* artdaq: 
* git info: 

sbndaq detector components
----------------------------------------------
* [CAEN DT5702 (CRT)](CRT/CAEN_DT5702_readout.md)
* [White Rabbit Timing System](WR/WhiteRabbit.md)

Troubleshooting
----------------------------------------------



Contributing to this wiki
----------------------------------------------


The content of this wiki is tracked in a GitHub repository [SBNSoftware/SBNSoftware.github.io](https://github.com/SBNSoftware/SBNSoftware.github.io)
under the
[`sbndaq_wiki`](https://github.com/SBNSoftware/SBNSoftware.github.io/tree/master/sbndaq_wiki)
subdirectory. Some details using this particular theme can be found [here](https://github.com/chrisrhymes/bulma-clean-theme).
