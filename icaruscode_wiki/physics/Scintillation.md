---
layout: page
title: "ICARUS simulation: scintillation"
description: Simulation of the physics of scintillation
toc: true
---


Simulation of the physics of scintillation
===========================================

The simulation needs to decide the energy, time and space distribution of the scintillation photons
from the energy deposited into liquid argon by a crossing particle,
as simulated for particle propagation by GEANT4.

Unless otherwise specified, the following description reports the configuration as seen in `icaruscode` `v09_32_01_01`.

The simulation currently stores each single scintillation photon
([`sim::OnePhoton`](https://nusoft.fnal.gov/larsoft/doxsvn/html/structsim_1_1OnePhoton.html))
grouped by channel ([`sim::SimPhotons`](https://nusoft.fnal.gov/larsoft/doxsvn/html/classsim_1_1SimPhotons.html)).


**To be done:**
* where the configuration parameters are
* which are their actual values


### Number of scintillation photons

ICARUS uses (since `v09_28_01`) the "`Correlated`" model implemented by [William Foreman][SBN DocDB 17964].
The model described the allocation of the deposited energy between ionization and scintillation.
A summary of the model is the following:

1. all the energy deposited in a GEANT4 step is considered (steps are usually small: millimetre-sized)
2. the deposited energy is divided in 19.5-eV "quanta"
3. 17% of the quanta is immediately assigned to scintillation, the remaining 79% is assigned to ionization
4. recombination is estimated, and the ionization quanta lost for recombination are reassigned to scintillation

(note that the 17% is encoded in an obscure way, with the ionization quanta being 19.5/(1-17%) = 23.5 eV).


### Photon energy

The energy of each photon is assigned arbitrarily, and should not be used.


### Time

The time of scintillation is currently stochastically assigned to each scintillation photon.
The excitation (and recombination) are assumed to be instantaneous and do not contribute to the scintillation time.
Scintillation time is extracted from an exponential distribution with charatcheristic time:
* τ(s) = 1.59 µs ("slow")
* τ(f) = 6.0 ns ("fast")

Which characteristic time is used for each photon is also decided stochastically,
with a fraction of fast light that ranges from 23 to 56% according to the type of particle depositing energy.


### Direction

Photons are distributed isotropically, and the direction of each is stochastically chosen.





References
-----------

* William Foreman, _Adding charge/light anticorrelation to larsim_, [SBN DocDB 17964]
* Laura Paulucci _et al._, _LArQL, a model for ionization charge and scintillation light in LAr_ [SBN DocDB 21270](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=21270)

[SBN DocDB 17964]: https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=17964
