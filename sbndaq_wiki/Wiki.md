---
layout: page
title: SBN DAQ Software Wiki
###subtitle: Specific Wiki for SBNDAQ
description: Wiki documentation for SBNDAQ
hero_height: is-small
toc: true
toc_title: SBNDAQ Contents
---

JULY 21 2020: GITHUB MIGRATION
======================================
We are officially switching over to using the Github hosted repositories as our central repo.

We aim to do this by the end of the week of July 20!

Please see [here](https://sbnsoftware.github.io/AnalysisInfrastructure/github-migration-to-do-list.html) for some useful info on migrating to Github in general, but important things for sbndaq and sbndwm are:
* Try to make sure all branches on all sbndaq/sbndqm repositories are pushed and updated by 5 pm CDT on Wednesday July 22! All branches in the redmine repo will be mirrored to Github.
* Please do not push to the redmine repository after 5 pm CDT on Wednesday July 22! We will plan to shut-off write access, but any pushes there will not be merged with the github.
* Please wait until a message from me ~morning (CDT) of Thursday July 23 to push directly to the github repositories. Instructions for setup with the new repositories have been updated [here](Installation). If you want to update the `origin` in your existing local repository, you can do so by doing:
```
git remote set-url origin git@github.com:SBNSoftware/sbndaq-artdaq.git
```
(for `sbndaq-artdaq`, please make sure to get the appropriate repo!)



Old wiki
======================================
Please
see the old wiki for a lot of historical detail.

[Old redmine wiki](https://cdcvs.fnal.gov/redmine/projects/sbndaq/wiki).

(we are slowly going to work on updating/adding more info here...)

Developing in sbndaq
----------------------------------------------

* [Setup Instructions](Installation)
* [Development Model](DevModel)

# Useful Links
* artdaq: 
* git info: 

Troubleshooting
----------------------------------------------



Contributing to this wiki
----------------------------------------------


The content of this wiki is tracked in a GitHub repository [SBNSoftware/SBNSoftware.github.io](https://github.com/SBNSoftware/SBNSoftware.github.io)
under the
[`sbndaq_wiki`](https://github.com/SBNSoftware/SBNSoftware.github.io/tree/master/sbndaq_wiki)
subdirectory. Some details using this particular theme can be found [here](https://github.com/chrisrhymes/bulma-clean-theme).
