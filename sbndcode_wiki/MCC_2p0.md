---
lang: en
title: MCC 2p0
---

{#MCC-2p0}

MCC 2p0(#MCC-2p0)
==================================

{#Samples}

Samples(#Samples) {#samples .count}
----------------------------------

**\'new flux\' refers to the latest flux files produced by Zarko which
fix the detector/beam centre position (configs F/G)**\
**All reco samples will use the ROI finder implemented by Andy Scarff**

**All samples will include the light simulation**

  ------------------------------ ----------------------------------------------------------------- ----------------------- ----------------- ---------------------------------------
  **Sample request**             **Additional information**                                        **Information level**   **Sample size**   **Space required (TB) (Without ROI)**
  Photon and Pi+ vertex-like     Detector centre, forward going, BNB spectrum                      Reco                    25k               3.4
  electron and Pi+ vertex-like   Detector centre, forward going, BNB spectrum                      Reco                    25k               3.4
  BNB neutrinos                  TPC interactions, no pile-up, new flux, buckets                   Reco                    100k              13.7
  BNB neutrinos                  TPC interactions, no pile-up, new flux, alternative buckets       Reco                    50k               13.7
  BNB neutrinos + Cosmics        3 frame, pile-up, new flux, buckets                               Reco                    50k               29.7
  Cosmics                        Proton model                                                      Reco                    50k               9.9
  Cosmics                        Proton mode, 3 frame, light pulse coincidence                     Reco                    50k               29.7
  Cosmics                        Proton model, Front/back CRT filtered, 1ms lifetime               detsim                  50k               9.9
  Cosmics                        Proton model, Front/back CRT filtered, 5ms lifetime               detsim                  50k               9.9
  Cosmics                        Proton model, Front/back CRT filtered, 10ms lifetime              detsim                  50k               9.9
  Cosmics                        Proton model, Front/back CRT filtered, infinite lifetime          detsim                  50k               9.9
  Cosmics                        Proton model, Front/back CRT filtered, 10ms lifetime, SCE         detsim                  50k               9.9
  Cosmics                        Ptoron model, Front/back CRT filtered, infinite lifetime, SCE     detsim                  50k               9.9
  BNB neutrinos                  TPC interactions, pile-up, new flux, buckets, physics book        G4                      7 million         2.79
  BNB intrinsic nu\_e            TPC interactions only, pile-up, new flux, buckets, physics book   G4                      200k              0.08
  Cosmics                        Proton model, physics book                                        G4                      3 million         197
  ------------------------------ ----------------------------------------------------------------- ----------------------- ----------------- ---------------------------------------

{#Tape-space}

Tape space(#Tape-space) {#tape-space .count}
----------------------------------------

\- 395 TB of tape available\
- Non-physics books samples require 156 TB, leaving us with 239 TB\
- Reserve 39 TB, leaving 200 TB left for the physics book\
- 7 mill neutrinos + 200k intr. nu\_e require 2.87 TB, leaving 197.13
TB\
- 197.13 TB can accommodate 3129047 G4 cosmic rays, we\'ll call that 3
million cosmics

{#Changes}

Changes(#Changes) {#changes .count}
----------------------------------

    - All reco. samples include ROI finder
     - All samples disable shower rollup (KeepEMDaughters==True)
     - filtered comics only processed to detsim
     - All cosmic samples use proton model rather than CMC
     - Drop Cosmics, Proton mode, 3 frame, light pulse coincidence (g4-level filter requires SimPhotons rather than SimPhotonsLite)
