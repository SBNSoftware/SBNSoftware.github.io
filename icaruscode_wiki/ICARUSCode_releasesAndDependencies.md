---
layout: page
title: ICARUSCode Releases & Dependencies
subtitle: 
toc: true
toc_title: Contents
---

ICARUSCode is the main simulation and reconstruction software repository for the ICARUS experiment/collaboration.

List of ICARUSCode Releases
============================================================================

This list of ICARUSCode releases is no longer actively maintained. Please refer to the [GitHub page for ICARUSCode releases](https://github.com/SBNSoftware/icaruscode/releases). You can also find a historical record of all tagged versions of ICARUSCode by clicking on the menu to select different branches/tags on the [main GitHub page for ICARUSCode](https://github.com/SBNSoftware/icaruscode/) (see screenshot below).

![Image showing how to navigate from the main page of a GitHub repository to the taggged versions of said repository.](/icaruscode_wiki/images/how_to_see_github_tags.png)

For any questions about releases of ICARUSCode or to ask for a new release, please contact the current (as of January 2026) Release Manager and author of this page, Jacob Smith (jacob dot a dot smith at stonybrook dot edu).


ICARUSCode Dependencies
--------------------------------------------

ICARUSCode currently depends on the following non-exhaustive list of software:

[ICARUSData](https://cdcvs.fnal.gov/redmine/projects/icarus_data/repository) (housed on Fermilab Redmine): includes data files for, e.g., signal processing  

[ICARUS Signal Processing](https://github.com/SBNSoftware/icarus_signal_processing): includes algorithms for readout signal processing  

[ICARUSAlg](https://github.com/SBNSoftware/icarusalg): includes things independent of the ART framework/package such as detector geometry descriptions and GDML files  

[ICARUSUtil](https://github.com/SBNSoftware/icarusutil) (mostly optional): includes scripts and facilities for submitting computing jobs to the scientific computing grid  

[SBNCode](https://github.com/SBNSoftware/sbncode): the main 'parent package' of ICARUSCode that contains code shared by all SBN experiments (e.g. SBND)  


However, ICARUSCode is part of a much larger software stack, all of which is based on LArSoft (`larsoft`). Intermediate software packages (e.g. SBNCode, GENIE_xSec, SBNDAQ-ARTDAQ-Core, etc.) will have their own list of dependencies. But as a user of ICARUSCode, you will likely not have to worry about those upstream dependencies.  

For an up-to-date look at a GitHub software package's list of dependencies, the source of truth is always the `ups/product_deps` file in the associated repository. For example, here is the link to the [SBNCode product_deps file](https://github.com/SBNSoftware/sbncode/blob/develop/ups/product_deps) for the development branch of SBNCode. Note that different GitHub branches may have different dependency lists.

### SBNDAQ-ARTDAQ-Core (`sbndaq-artdaq-core`) Quirks

[SBNDAQ-ARTDAQ-Core](https://github.com/SBNSoftware/sbndaq-artdaq-core) is explicitly a dependency of SBNCode. But it often causes problems for those who use it. If you need to check out SBNDAQ-ARTDAQ-Core in your working area, the effective MRB command is:

    mrb gitCheckout -d sbndaq_artdaq_core sbndaq-artdaq-core
    
which checks out the repository `sbndaq-artdaq-core` from the default repository
in GitHub and puts it into `sbndaq_artdaq_core` directory. **Note the use of both hyphens (-) and underscores (_). This is, unfortunately, required syntax as of May 2026. While the GitHub repo uses hyphens, ups (the package manager we use on GPVMs) doesn't play nice with hyphens.** 



Versioning Conventions
--------------------------------------------

In all releases, the **first three** qualifiers of the ICARUSCode release tag match the underlying LArSoft version. For example, ICARUSCode v10_06_00_06p05 is based on LArSoft v10_06_00. The remaining part, _06p05, denotes the 06 release of SBNCode and the 05 patch made at the ICARUSCode level. Note that other software packages may follow their own versioning conventions.  
