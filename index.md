---
layout: page
title: SBN Software Wiki
subtitle: A wiki for documentation of the SBN Software packages
hero_height: is-medium
toc: false
---


# Welcome to the SBN Software Wiki Page
This page is designed to serve as a hub for SBN collaborators to find what they need.

## For New Collaborators ##
If you're looking for a tutorial on one of the many aspects of SBN physics, collaboration, or computing, chances are, you'll find it here:
* [SBN Young Guide](SBNYoung/SBNYoungIndex.md)
* To be broken down into further categories, such as physics and computing

## Collaboration Organization Documents ##
* [SBND](ExperimentDocuments/sbnd.md)
* [ICARUS](ExperimentDocuments/icarus.md)
* [SBN](ExperimentDocuments/sbn.md)

## Software Documentation ###
* [doxygen](doxygen): Auto-generated from the source code, updated nightly
* [LArSoft Wiki](https://larsoft.github.io/LArSoftWiki/)

## Operations ##
* [ICARUS Operations](Operations/SBN_FD/index)
* [SBND Operations](Operations/SBN_ND/index)

## [Analysis Infrastructure](AnalysisInfrastructure/index) ##
New to the SBN Github? Go to the [Github migration to do list](AnalysisInfrastructure/github-migration-to-do-list.md)**
### [How to Add New Features, Fix Bugs, Or Otherwise Develop](AnalysisInfrastructure/how-to-develop) ###
* [SBND Calibration Database](sbnd_calibration_database.md)

## List of Repositories ##

### Offline Repositories ###
* [sbncode](https://github.com/SBNSoftware/sbncode): Common SBN code and configs.
* [icaruscode](https://github.com/SBNSoftware/icaruscode): ICARUS-specific code and configs.
  * [Wiki](icaruscode_wiki/Wiki) ([old Redmine wiki here](https://cdcvs.fnal.gov/redmine/projects/icaruscode/wiki))
* [sbndcode](https://github.com/SBNSoftware/sbndcode): SBND-specific code and configs.
  * [Wiki](sbndcode_wiki/Wiki) ([old Redmine wiki here](https://cdcvs.fnal.gov/redmine/projects/sbndcode/wiki))
* [sbana](https://github.com/SBNSoftware/sbnana): Joint SBN non-art (i.e. CAF-based) analysis
* [sbnanaobj](https://github.com/SBNSoftware/sbnana): Joint SBN non-art data formats (i.e. StandardRecord)
* [sbndaq-artdaq-core/offline](https://github.com/SBNSoftware/sbndaq-artdaq-core/tree/offline): offline version of the SBN DAQ code data definitions.
* [sbndata](https://github.com/SBNSoftware/sbndata):external data needed for SBN.

* [sbnbuild](https://github.com/SBNSoftware/sbnbuild): Common SBN build scripts and utilities.

### Online Repositories ###
* [sbndaq](https://github.com/SBNSoftware/sbndaq): SBN DAQ parent code base, including scripts for run control
  * [Wiki](sbn_online_wiki/sbndaq_Wiki) ([old Redmine wiki here](https://cdcvs.fnal.gov/redmine/projects/sbndaq/wiki))
* [sbndaq-artdaq](https://github.com/SBNSoftware/sbndaq-artdaq): SBN DAQ code base (e.g. the generators)
* [sbndaq-artdaq-core](https://github.com/SBNSoftware/sbndaq-artdaq-core): SBN DAQ code data definitions (e.g. the overlays)

* [sbndqm](https://github.com/SBNSoftware/sbndqm): Common data quality monitoring code for SBN
* [sbndaq-minargon](https://github.com/SBNSoftware/sbndaq-minargon): Web-based detector monitoring for SBN

* [sbndaq-xporter](https://github.com/SBNSoftware/sbndaq-xporter): Code for online SBN data management

## Contribute to this wiki ##

The content of this wiki is tracked by the [GIT repository SBNSoftware/SBNSoftware.github.io](https://github.com/SBNSoftware/SBNSoftware.github.io).
It can be edited directly online or by pushing changes to the repository with GIT. Take a look at an [example](example). Find a step-by-step guide [here](HowToEdit.md).

If you have an old redmine wiki page that you want to port, there are instructions on [importing from redmine](importing_from_redmine).

If you are making changes, you can download and test them locally. [Instructions here](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll)

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
