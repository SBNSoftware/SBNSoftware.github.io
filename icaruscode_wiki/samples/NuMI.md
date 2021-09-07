---
layout: page
title: ICARUS NuMI samples for studies and physics analysis
description: ICARUS NuMI samples for studies and physics analysis
toc: true
---


NuMI samples for studies and physics analysis
==============================================

This is meant to be a list of the samples that are used for NuMI physics analyses and studies.
This kind of lists has the remarkable ability of falling out of date in days, so in case of doubt throw a line to [SBN Slack channel #numi-nus](https://shortbaseline.slack.com/archives/C014QFKGHK4).

There are two sections in this page:
* the [sample list](#the-samples) includes the relevant samples, SAM definitions,
  file locations, processing information and known uses of the samples
  (which is going to be partial for sure)
* the [version list](#the-versions) describes the details of the software used
  for those samples, with stress on what is different from earlier versions and
  from "standard" samples


The samples
------------

### Neutrinos and cosmic rays, no concrete overburden ###########################

sample           | proton-only cosmic ray model
---------------- | :----------------------------------------------------------------
Date             | March 2021
Author           | SBN production (request by NuMI group)
Local contact    | [Guadalupe Moreno](mailto:guadalupe.moreno@cinvestav.mx)
`icaruscode`     | [`v09_17_01`](#v09_17_01) (branch `feature/gp_numiCosmicProton`, later merged)
Generation       | [`prodcorsika_genie_protononly_icarus_numi.fcl`](https://github.com/SBNSoftware/icaruscode/blob/v09_18_00/fcl/gen/numi/prodcorsika_genie_protononly_icarus_numi.fcl)
Filtering        | [`filter_genie_active.fcl`](https://github.com/SBNSoftware/icaruscode/blob/feature/gp_NuMIplusCosmics/icaruscode/Filters/filter_genie_active.fcl)
Detector         | [`cosmics_g4_icarus.fcl`](https://github.com/SBNSoftware/icaruscode/blob/v09_17_01/fcl/g4/cosmics_g4_icarus.fcl)
Digitisation     | [`multitpc_detsim_icarus.fcl`](https://github.com/SBNSoftware/icaruscode/blob/v09_17_01/fcl/detsim/multitpc_detsim_icarus.fcl)
Reconstruction   | [`reco_icarus_driver_reco_multitpc_gauss.fcl`](https://github.com/SBNSoftware/icaruscode/blob/feature/gp_NuMIplusCosmics/fcl/reco/reco_icarus_driver_reco_multitpc_gauss.fcl)
"                | [`reco_icarus_driver_reco_multitpc_raw.fcl`](https://github.com/SBNSoftware/icaruscode/blob/feature/gp_NuMIplusCosmics/fcl/reco/reco_icarus_driver_reco_multitpc_raw.fcl)
SAM definition   | `icarus_numi_offaxis_cosmic_v09_17_01`
Data path        | `root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/icarus/archive/sam_managed_users/icaruspro/data/mc/reco2/artroot/SBN/2021A_00/icarus_numi_offaxis_cosmic_v09_17_01/icaruscode/v09_17_01` _[checked 20210823]_
Statistics       | `48025` events (`1921` files)
Special features | only active volume interactions; only `volCryostat` particles kept; no space charge effect simulated
Superseded by    | **current**



The versions
-------------

The information in this list is incremental: features not mentioned in one version should be unchanged since the previous listed version.

Information in wiki:

* [geometry](../Detector_geometry.md)


### `v09_17_01` ###############################################################

Tag `v09_17_01` was released on March 2, 2021.

Default configurations:
* NuMI beam position: ?
* NuMI beam spill structure: 3·10¹³ POT/spill, 81-bucket structure, [bugged `GENIEHelper` implementation](https://github.com/SBNSoftware/sbncode/issues/112)
* cosmic ray model: Constant Mass Composition (CMC)
* geometry: [`20201107`](../Detector_geometry.md) _without_ the 3 m thick concrete overburden
* photon visibility map: [December 2020](../physics/PhotonLibrary.md#20201209)
* space charge effects: not simulated
