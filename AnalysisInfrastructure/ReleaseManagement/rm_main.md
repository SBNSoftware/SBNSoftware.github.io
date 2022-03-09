---
layout: page
title:  Release Management
toc: true
---

# Software Release Management

Charge:

Define the methodology for integrating new code into the software stack, managing its integration, and overseeing the building and release of this code in coordination with SBND and ICARUS release managers.

# Release code convention
![image](https://user-images.githubusercontent.com/8134042/157476481-912159d9-9f92-4e82-b772-a2f159f52452.png)


# Release types

* Weekly release: Meant to maintain the work ongoing. Snapshot of the more recent code developments. Cut from the develop branch.
* Production release: Frozen code for specific goals production. 
    * Beta release (i.e. SBN2021C - Goal: “Beta release” for the simulation,  high-level reconstruction and calibration.) cut from develop.
    * Full production release (i.e. SBN2022A - Goal: Produce the samples needed for Summer 2022 conferences.) cut from the previous beta release branch.
* Patch releases: As needed to maintain the previous ones.

# Continuous Integration and validation of the software stack 

All PRs for all flavours are CI tested (LArSoft, SBND, ICARUS):
* e20: prof c7:prof by GitHub trigger comment. 
* e20:debug c7:debug nightly.

And full stack tested before released (Jenkins).

# Release management for managers
[Release management instructions](https://sbnsoftware.github.io/AnalysisInfrastructure/ReleaseManagement/rm_instructions)
