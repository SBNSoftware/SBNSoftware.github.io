---
layout: page
title:  Release Management
toc: true
---

Looking for how to get your piece of code in, see the [Code Development](https://sbnsoftware.github.io/AnalysisInfrastructure/how-to-develop) instructions.


# Software Release Management

### Charge:

Define the methodology for integrating new code into the software stack, managing its integration, and overseeing the building and release of this code in coordination with SBND and ICARUS release managers.

### Model:

A Release model based on reviewed Pull Request code development. See [how to develop](https://sbnsoftware.github.io/AnalysisInfrastructure/how-to-develop) for detailed instructions.

### Software managed:
* sbncode, sbnobj, sbnanaobj
* sbnana
* sbndata
* sbndaq_artdaq_core

# Release code convention
![image](https://user-images.githubusercontent.com/8134042/157476481-912159d9-9f92-4e82-b772-a2f159f52452.png)


# Release types

* Weekly release: Meant to maintain the work ongoing. Snapshot of the more recent code developments. Cut from the develop branch.
* Production release: Frozen code for specific goals production. 
    * Beta release (i.e. SBN2021C - Goal: “Beta release” for the simulation,  high-level reconstruction and calibration.) cut from develop.
    * Full production release (i.e. SBN2022A - Goal: Produce the samples needed for Summer 2022 conferences.) cut from the previous beta release branch.
* Patch releases: As needed to maintain the previous ones.

# Continuous Integration and validation of the software stack 

Our software stack in sbncode/sbnobj/sbnanaobj/sbndcode/icaruscode/icarusalg, is CI tested (build, unit_test and ci_tests for LArSoft, SBND, ICARUS) for all flavours :
* e26:prof c14:prof by GitHub trigger commenting in PR. 
* e26:debug c14:debug nightly by checking out develop.

And full stack tested before released (Jenkins).


# Release management for managers
[Release management instructions](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/rm_instructions)

**Release managment team**: [Miquel Nebot-Guinot, Francisco Javier Nicolás, Tracy Usher, Matt Rosenberg](mailto:miquel.nebot@ed.ac.uk,fjnicolas@ugr.es,usher@slac.stanford.edu,Matthew.Rosenberg@tufts.edu)

