---
layout: page
title: "ICARUS simulation: propagation through liquid argon"
description: Simulation of the physics of scintillation
toc: true
---

Simulation of the propagation of scintillation light through argon
===================================================================

This stage of the simulation carries scintillation photons from their birth
to their end, either absorbed by some passive material or hitting a sensitive detector
and successfully initiating a signal.

Two steps and one half are simulated here:
* where the photons end
* how long they take to get to where they end
* whether they initiate a signal in the optical sensors
  (which would not belong here but it is in fact for convenience the first step simulated)

Because of the type of the parametrizations used in this stages,
the first two steps are simulated independently, so that it is possible to find a scintillation photon
born two centimetres away from a PMT, heading straight to it, and still taking microseconds to get there.


Where scintillation photons end
--------------------------------

Scintillation photon transportation through the cryostat is parametrized via a lookup table
called "photon visibility library", to which [its own whole wiki page](PhotonLibrary.md) is devoted.
The total of the scintillation photons in a step is split between all the PMT according to the values
of that table, and a large part of them is lost, i.e. not assigned to any channel:
those are the ones absorbed in passive material.


When scintillation photons end
-------------------------------

**big fat to-do**




How scintillation photons end
------------------------------

Assuming that a scintillation photon reaches the sensitive surface of a photodetector
(in ICARUS, the wavelength-shifter-coated surface of one of the 180 Hamamatsu R5912 PMT within one the cryostat),
it has a certain probability to convert into an electric signal (photoelectron) that can be detected.
This process includes:
* probability of the [TPB](https://en.wikipedia.org/wiki/Tetraphenyl_butadiene) layer to absorb the photon
  and re-emit it as a visible photon (λ ≈ 430 nm);
  if this does not happen, the PMT photocathode will not convert it
* probability that this emission happens toward the photocathode:
  the emission is isotripic, so this is a 50%
* probability of this visible photon to cross the rest of the TPB without being reabsorbed
  and reach the PMT photocathode; our coating is quite thin, so this one is likely high;
* probability of the photocathode to convert that visible photon into an electron ("photoelectron")
  inside the PMT; this is quoted by the manifacturer to be ≈25% at λ ≈ 430 nm wavelength.

All these probabilities have been measured together, resulting in what we call "quantum efficiency"
(and LArSoft code calls `ScintPrescale`) of about (12.1 ± 1.0)%.

Since we are simulating million of scintillation photons one by one and at the end only ⅛ does something we can see,
the evaluation of the quantum efficiency is actually made as the first step:
would this photon convert into a photoelectron _if_ it managed to reach a PMT?
This assumes the quantum efficiency to be constant in time and between PMT, which is a reasonable approximation.
So for each step only 12.1% of the expected scintillation photons is given the chance of propagating.

