---
lang: en
title: Job configurations
---

[]{#Configuration-of-SBND-jobs-services-and-algorithms}

Configuration of SBND jobs, services and algorithms[¶](#Configuration-of-SBND-jobs-services-and-algorithms){.wiki-anchor}
=========================================================================================================================

-   **Table of contents**
-   [Configuration of SBND jobs, services and
    algorithms](#Configuration-of-SBND-jobs-services-and-algorithms)
    -   [Organization](#Organization)
    -   [Job configurations](#Job-configurations)
    -   [Service configurations](#Service-configurations)
    -   [Algorithm/module
        configurations](#Algorithmmodule-configurations)

[]{#Organization}

Organization[¶](#Organization){.wiki-anchor} {#organization .count}
--------------------------------------------

The guidelines for the location of the configuration within a repository
are:

-   configuration of SBND algorithms are in the same directory as the
    algorithm.\
    *Example: the algorithm `OpticalHitRecoSBND` would have a
    `opticalhitreco_sbnd.fcl` FHiCL configuration file that provides one
    or more valuable configuration presets: then,
    `opticalhitreco_sbnd.fcl` would live in the same directory as
    `OpticalHitRecoSBND.h`/`OpticalHitRecoSBND.cxx`.*
-   SBND-specific configuration of LArSoft services and algorithms
    should go in `sbndcode/LArSoftConfigurations` directory.\
    *Example: `LArProperties` is a core LArSoft service provider, and we
    use it directly. The SBND configuration is in
    `sbndcode/LArSoftConfigurations/larproperties_sbnd.fcl`. The SBND
    tuning of hit finder algorithms is in
    `sbndcode/LArSoftConfigurations/hitfindermodules_sbnd.fcl`.*
-   bundles of presets are also in `sbndcode/LArSoftConfigurations`.\
    *Example: service bundles are in `services_sbnd.fcl`. Hit finder
    presets are collected in
    `sbndcode/LArSoftConfigurations/hitfindermodules_sbnd.fcl`.*
-   complete job configurations go in `sbndcode/JobConfigurations`.\
    *Examples: `prodsingle_sbnd.fcl` and `standard_reco_sbnd.fcl` are in
    `sbndcode/JobConfigurations`.*

Summary:

  ------------------------------------------ ------------------------------------------------------------------------------------------------------------------------------
  SBND algorithms and services               together with the source code of the algorithm/service provider
  LArSoft/external algorithms and services   [source:sbndcode/LArSoftConfigurations](/redmine/projects/sbndcode/repository/entry/sbndcode/LArSoftConfigurations){.source}
  service configuration bundles              [source:sbndcode/LArSoftConfigurations](/redmine/projects/sbndcode/repository/entry/sbndcode/LArSoftConfigurations){.source}
  full job configurations                    [source:sbndcode/JobConfigurations](/redmine/projects/sbndcode/repository/entry/sbndcode/JobConfigurations){.source}
  ------------------------------------------ ------------------------------------------------------------------------------------------------------------------------------

[]{#Job-configurations}

Job configurations[¶](#Job-configurations){.wiki-anchor} {#job-configurations .count}
--------------------------------------------------------

Job configurations are being updated on demand: many of the
configurations in
[source:sbndcode/JobConfigurations](/redmine/projects/sbndcode/repository/entry/sbndcode/JobConfigurations){.source}
are not working yet.\
Here a selection of the ones that are updated already:

  ------------------------------------ ------------------------------------------ -------------------------------------------------------------------------------------
  `prodsingle_sbnd.fcl`                generation + simulation                    test job to create and simulate single muons
  `prodsingle_sbnd_proj.fcl`           generation                                 like `prodsingle_sbnd.fcl`, plus configuration for production-like grid environment
  `prodsingle_sbnd.fcl`                generation + simulation + reconstruction   like `prodsingle_sbnd.fcl`, plus signal calibration
  `prod_eminus_0.1_0.9_sbnd.fcl`       generation                                 production of single electrons in 0.1-0.9 GeV range
  `prodgenie_bnb_nu_cosmic_sbnd.fcl`   generation                                 Booster neutrinos from GENIE plus cosmic rays
  `standard_g4_sbnd.fcl`               simulation                                 propagation through matter (Geant4)
  `standard_detsim_sbnd.fcl`           simulation                                 readout simulation
  `standard_reco_sbnd_basic.fcl`       reconstruction                             a single-path track/shower/optical reconstruction
  `anatree_sbnd.fcl`                   analysis                                   creates an analysis tree with the standard configuration
  `edv_sbnd.fcl`                       event display                              SBND event display in LArSoft
  ------------------------------------ ------------------------------------------ -------------------------------------------------------------------------------------

Note that these can be still improved (some, vastly so).\
For more information on each of them, check the documentation in the
configuration files.

[]{#Service-configurations}

Service configurations[¶](#Service-configurations){.wiki-anchor} {#service-configurations .count}
----------------------------------------------------------------

Some preset bundles are provided either as reference of for direct
inclusion. The most used are:prefer

-   `services_sbnd.fcl` contains presets for jobs that do not perform
    simulation
-   `simulationservices_sbnd.fcl` contains presets for jobs that perform
    detector and/or readout simulation

For the details about their content, refer to the comments included in
the files themselves.\
It is preferable for your job to include the basic bundle,
`sbnd_basic_services` or `sbnd_core_services`, and then bundles by area.
For example, if your job needs access to the condition databases:\

    services: {
      @table::sbnd_core_services
      @table::sbnd_condition_databases
    } # services

\
In this way, when the maintainers change the configuration needed to
access the databases, your configuration does not need to be updated,
but also you are loading the minimal set of services you need.

[]{#Algorithmmodule-configurations}

Algorithm/module configurations[¶](#Algorithmmodule-configurations){.wiki-anchor} {#algorithmmodule-configurations .count}
---------------------------------------------------------------------------------
