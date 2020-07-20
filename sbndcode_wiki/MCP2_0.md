---
lang: en
title: MCP2 0
---



MCP2\_0
=================================

  ------------------------------ ------------------------------------------------------------------------ ----------- ---------------------- ---------------------------------------------------------------------------------------------------------------------------
  **Sample**                     **Description**                                                          **Stage**   **Number of Events**   **SAM Definition**
  Photon and Pi+ vertex-like     Detector centre, forward going, BNB spectrum                             Reco        18.1k                  official\_MCP2.0\_prodsingle\_gamma\_pi+\_bnblike\_forward\_reco\_sbnd
  electron and Pi+ vertex-like   Detector centre, forward going, BNB spectrum                             Reco        21.4k                  official\_MCP2.0\_prodsingle\_electron\_pi+\_bnblike\_forward\_reco\_sbnd
  BNB neutrinos                  TPC interactions, no pile-up, new flux, buckets                          Reco        82.4k                  official\_MCP2.0\_prodgenie\_nu\_singleinteraction\_tpc\_gsimple-configf-v1\_reco\_sbnd
  BNB neutrinos                  TPC interactions, no pile-up, new flux, buckets, cut based vertex reco   Reco        81k                    official\_MCP2.0\_prodgenie\_nu\_singleinteraction\_tpc\_gsimple-configf-v1\_cutbasedvertex\_reco\_sbnd
  BNB neutrinos                  TPC interactions, no pile-up, new flux, alternative buckets              Reco        43.1k                  official\_MCP2.0\_prodgenie\_nu\_singleinteraction\_tpc\_gsimple-configf-v1\_rotatedbuckets\_reco\_sbnd
  BNB neutrinos + Cosmics        3 frame, pile-up, new flux, buckets                                      Reco        40.37k                 official\_MCP2.0\_prodoverlay\_corsika\_cosmics\_proton\_genie\_nu\_spill\_gsimple-configf-v1\_tpc\_reco\_sbnd
  Cosmics                        Proton model                                                             Reco        43.62k                 official\_MCP2.0\_prodcorsika\_cosmics\_proton\_reco\_sbnd
  Cosmics                        Proton model, Front/back CRT filtered, 1ms lifetime                      Detsim      48.68k                 official\_MCP2.0\_prodcorsika\_cosmics\_proton\_frontbackcrt\_mu\_filter\_infinite\_electron\_lifetime\_SCE\_detsim\_sbnd
  Cosmics                        Proton model, Front/back CRT filtered, 5ms lifetime                      Detsim      48.68k                 official\_MCP2.0\_prodcorsika\_cosmics\_proton\_frontbackcrt\_mu\_filter\_5ms\_electron\_lifetime\_detsim\_sbnd
  Cosmics                        Proton model, Front/back CRT filtered, 10ms lifetime                     Detsim      46.655k                official\_MCP2.0\_prodcorsika\_cosmics\_proton\_frontbackcrt\_mu\_filter\_10ms\_electron\_lifetime\_detsim\_sbnd
  Cosmics                        Proton model, Front/back CRT filtered, infinite lifetime                 Detsim      46.475k                official\_MCP2.0\_prodcorsika\_cosmics\_proton\_frontbackcrt\_mu\_filter\_infinite\_electron\_lifetime\_detsim\_sbnd
  Cosmics                        Proton model, Front/back CRT filtered, 10ms lifetime, SCE                Detsim      47.295k                official\_MCP2.0\_prodcorsika\_cosmics\_proton\_frontbackcrt\_mu\_filter\_1ms\_electron\_lifetime\_detsim\_sbnd
  Cosmics                        Proton model, Front/back CRT filtered, infinite lifetime, SCE            Detsim      46.2k                  official\_MCP2.0\_prodcorsika\_cosmics\_proton\_frontbackcrt\_mu\_filter\_10ms\_electron\_lifetime\_SCE\_detsim\_sbnd
  BNB neutrinos                  TPC interactions, pile-up, new flux, buckets, physics book               G4          6.9m                   official\_MCP2.0\_prodgenie\_nu\_spill\_tpc\_gsimple-configf-v1\_physicsbook\_g4\_sbnd
  BNB intrinsic nu\_e            TPC interactions only, pile-up, new flux, buckets, physics book          G4          194.1k                 official\_MCP2.0\_prodgenie\_intrnue\_spill\_tpc\_gsimple-configf-v1\_physicsbook\_g4\_sbnd
  ------------------------------ ------------------------------------------------------------------------ ----------- ---------------------- ---------------------------------------------------------------------------------------------------------------------------



Notes: - All reconstructed samples also have an anatree stage with similar stats. These can be accessed by replacing \'reco\' with \'anatree\' in the SAM definition - GENIE and CORSIKA have a known seeding issue in these samples, details can be found at: <https://cdcvs.fnal.gov/redmine/issues/23921>.
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
