---
layout: page
title: SBND Generation FHICLs
---


SBND Generation FHICL Files
========================================================================

This page contains a description of most of the generation fhicl files for SBND.

A few notes about the items in the table:
- *Single interaction*: only one neutrino interaction is forced per art Event record
- *Spill*: the number of neutrino interactions is simulated taking into account the beam spill. Multiple interactions per art Event record are allowed
- *Cryostat*: interactions are simulated only inside the cryostat volume
- *TPC + 10 cm*: interactions are simulated only inside the TPC volume, plus an extra buffer of 10 cm around the TPC.


Neutrinos Only
----------

| Flavor | Volume | Spill | Other | FHICL Name |
|--------|--------|-------|-------|------------|
| BNB Neutrinos | Cryostat | Spill | - |`prodgenie_nu_spill_cryostat_sbnd.fcl` |
| BNB Neutrinos | TPC + 10 cm | Spill | - |`prodgenie_nu_spill_tpc_sbnd.fcl` |
| BNB Neutrinos | Cryostat | Singl. Int. | - |`prodgenie_nu_singleinteraction_cryostat_sbnd.fcl` |
| BNB Neutrinos | TPC + 10 cm | Singl. Int. | - |`prodgenie_nu_singleinteraction_tpc_sbnd.fcl` |
| BNB Neutrinos | TPC + 10 cm | Spill | Filters events with pi0 in the final state |`prodgenie_nu_singleinteraction_tpc_ccpi0filtered_sbnd.fcl` |
| BNB Neutrinos | TPC + 10 cm | Spill | Uses a different spill configuration |`prodgenie_nu_singleinteraction_tpc_rotatedbuckets_sbnd.fcl` |
| BNB Intr. Nue | TPC + 10 cm | Spill | - |`prodgenie_intrnue_spill_tpc_sbnd.fcl` |
| BNB Intr. Nue | TPC + 10 cm | Singl. Int. | - |`prodgenie_intrnue_singleinteraction_tpc_sbnd.fcl` |
| BNB Neutrinos | World | Spill | For dirt simulation |`prodgenie_nu_spill_world_sbnd.fcl` |


Neutrinos Plus Cosmics
----------

There are two Corsika models that are usually used:

- *Proton*: (current *default*) in which only primary cosmic protons are assumed to contribute to the Earth’s cosmic-ray flux
- *CMC*: (Costant Mass Composition) in which the primary cosmic incident flux contains substantial amounts of both light and heavy elements

| Flavor | Volume | Spill |Corsika Model | Other | FHICL Name |
|--------|--------|-------|--------------|-------|------------|
| BNB Neutrinos | Cryostat | Spill | CMC | - | `prodoverlay_corsika_cosmics_cmc_genie_nu_spill_cryostat_sbnd.fcl`
| BNB Neutrinos | TPC + 10 cm | Spill | CMC | - | `prodoverlay_corsika_cosmics_cmc_genie_nu_spill_tpc_sbnd.fcl`
| BNB Intr. Nue | TPC + 10 cm | Spill | Proton | Legacy 3 drift windows | `prodoverlay_corsika_cosmics_proton_genie_intrnue_spill_tpc_sbnd_3drift_windows.fcl`
| BNB Intr. Nue | TPC + 10 cm | Spill | Proton | - | `prodoverlay_corsika_cosmics_proton_genie_intrnue_spill_tpc_sbnd.fcl`
| BNB Neutrinos | Cryostat | Spill | Proton | - | `prodoverlay_corsika_cosmics_proton_genie_nu_spill_cryostat_sbnd.fcl`
| BNB Neutrinos | TPC + 10 cm | Spill | Proton | Legacy 3 drift window | `prodoverlay_corsika_cosmics_proton_genie_nu_spill_tpc_sbnd_3drift_windows.fcl`
| BNB Neutrinos | TPC + 10 cm | Spill | Proton | - | `prodoverlay_corsika_cosmics_proton_genie_nu_spill_tpc_sbnd.fcl`


Particle Gun
----------

To be written





