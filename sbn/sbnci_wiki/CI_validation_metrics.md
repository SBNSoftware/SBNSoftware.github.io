---
layout: page
title: Validation Samples and Metrics
---
# Input Samples

| Experiment | BNB &nu;&mu; + Intr. &nu;e (10k events) | CORSIKA + BNB &nu;&mu; (1k events) |
| --- | --- | --- |
| SBND   | prodgenie_nu_singleinteraction_tpc_sbnd.fcl + prodgenie_intrnue_singleinteraction_tpc_sbnd.fcl | prodoverlay_corsika_cosmics_proton_genie_nu_spill_tpc_sbnd.fcl |
| ICARUS | simulation_genie_icarus_bnb.fcl + simulation_genie_icarus_Mar2019_nue.fcl | prodcorsika_proton_intime_icarus_bnb.fcl |

Location: `/pnfs/<sbnd or icarus>/persistent/ContinuousIntegration/input/validation/`

# Validation Metrics by Working Group

## TPC reco
- Shower completeness, purity, true kinematics for electrons and PandoraShowers
- Tracks length, completeness, purity, true kinematics for muons and protons 
- PFParticles

## TPC sim/calibration

### If Online (not yet available)
- Noise RMS distribution across all TPC channels
- Average TPC Pulse Height distribution across all TPC channels 
- Average PMT Pulse Height distribution across all PMT channels

### If Reconstructed (not yet available)
- Noise RMS across all TPC channels
- Average TPC pulse height across all TPC channels
- Average PMT pulse height across all PMT channels
- Track end points and lengths
- Average OpFlash time and amplitude

## PDS sim/reco
- SimPhotons multiplicity
- OpHit time and amplitude (PEs)
- Flash time, position, amplitude (PEs) and multiplicity

## CRT sim/reco
- Hit position/uncertainties and light yield
- Track end points/angles

[Main CI page](/sbn/sbnci_wiki/sbnci_main)
