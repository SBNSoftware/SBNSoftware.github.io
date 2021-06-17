---
layout: page
title: SBND Commissioning - Samples
subtitle: Description of Samples for SBND Commissioning Studies
image: sbndcode_wiki/sbnd_logo.png
description: Description of Samples for SBND Commissioning Studies
hero_height: is-medium
# menubar: sbndcode_menu
toc: true
toc_title: SBND Commissioning - Samples
---




SBND Commissioning - Samples
========================================================================

There are commissioning samples available that have already been processed and contain the HitDumper tree. These samples are on disk located at `/sbnd/data/commissioning/simulation/`.

BNB Neutrino Plus Cosmics: `bnb_cosmics/`

Cosmics only, CRT filtered (front-back): `cosmics_frontbackcrt/`

Cosmics only, CRT filtered (east-west): `cosmics_eastwestcrt/`




BNB Neutrino Plus Cosmics
-----------------------------------------------------------------------------

This sample includes BNB neutrino interactions (all neutrino flavors) together with
cosmic rays simulated by CORSIKA (proton model). No filters have been applied.
The list of fcl files used to make this sample are: 

```bash
prodoverlay_corsika_cosmics_proton_genie_nu_spill_tpc_sbnd.fcl
standard_g4_sbnd.fcl
standard_detsim_sbnd.fcl
run_hitdumper.fcl
```


Cosmics only, CRT filtered (front-back)
-----------------------------------------------------------------------------

This sample includes cosmic rays simulated by CORSIKA (proton model) withouth
neutrino interactions. The following filters were applied:
- [GenCRTFilter](https://github.com/SBNSoftware/sbndcode/blob/develop/sbndcode/SimulationFilters/GenCRTFilter_module.cc): Checks if initially generated muons would intersect the front and back CRT planes, only based on their initial position and direction (GEANT4 propagation has not appened yet). There is also an additional requirement on the time of the muons: they are required to have a time between 0 and one drift window before the end of the readout window, so that their track will be fully recorded by the electronics (it is not truncated because they arrive towards the edges of the readout window).
- [LArG4CRTFilter](https://github.com/SBNSoftware/sbndcode/blob/develop/sbndcode/SimulationFilters/LArG4CRTFilter_module.cc): Only keeps events where there is a muon traversing the CRT front or back planes. This is done by checking every trakectory point of the fully propagated muons. There is also an additional requirement on the time of the muons: they are required to have a time between 0 and one drift window before the end of the readout window, so that their track will be fully recorded by the electronics (it is not truncated because they arrive towards the edges of the readout window).

The list of fcl files used to make this sample are: 

```bash
prodcorsika_cosmics_proton_frontbackcrt_mu_filter.fcl
g4_mu_frontbackcrt_filter.fcl
commissioning_detsim_sbnd.fcl
run_hitdumper.fcl
```



Cosmics only, CRT filtered (east-west)
-----------------------------------------------------------------------------

This sample includes cosmic rays simulated by CORSIKA (proton model) withouth
neutrino interactions. The following filters were applied:
- [GenCRTFilter](https://github.com/SBNSoftware/sbndcode/blob/develop/sbndcode/SimulationFilters/GenCRTFilter_module.cc): Checks if initially generated muons would intersect the east and west CRT planes, only based on their initial position and direction (GEANT4 propagation has not appened yet). There is also an additional requirement on the time of the muons: they are required to have a time between 0 and one drift window before the end of the readout window, so that their track will be fully recorded by the electronics (it is not truncated because they arrive towards the edges of the readout window).
- [LArG4CRTFilter](https://github.com/SBNSoftware/sbndcode/blob/develop/sbndcode/SimulationFilters/LArG4CRTFilter_module.cc): Only keeps events where there is a muon traversing the CRT east and west planes. This is done by checking every trakectory point of the fully propagated muons. There is also an additional requirement on the time of the muons: they are required to have a time between 0 and one drift window before the end of the readout window, so that their track will be fully recorded by the electronics (it is not truncated because they arrive towards the edges of the readout window).

The list of fcl files used to make this sample are: 

```bash
prodcorsika_cosmics_proton_eastwestcrt_mu_filter.fcl
g4_mu_eastwestcrt_filter.fcl
commissioning_detsim_sbnd.fcl
run_hitdumper.fcl
```



