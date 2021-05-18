# ICARUS Standard Workflows

## Data keep up processing

### Stage 0

FCL: stage0_multiTPC_icarus.fcl

Decoding and low level reconstruction.

* Raw data decoding.
* Optical reconstruction (hits and flashes).
* Flash filter.
* TPC waveform filtering.
* Hit reconstruction (Gaus Hit)

### Stage 1

FCL: stage1_multiTPC_icarus_gauss.fcl

High level reconstruction.

* Flash filter.
* Purity DQM.
* Cluster3D reconstruction.
* Pandora reconstruction.

## MC 2020

### Gen

### G4

FCL: g4_enable_spacecharge.fcl 

### Detsim

FCL: multitpc_detsim_icarus.fcl

### Reco1

FCL: reco_icarus_driver_reco_multitpc_gauss_sce.fcl 

### Reco2

FCL: reco_icarus_driver_reco_multitpc_raw.fcl

## MC 2021

### Gen

### G4

FCL: cosmics_g4_icarus.fcl  
FCL: g4_enable_spacecharge.fcl  
FCL: cosmics_g4_enable_spacecharge.fcl

### Detsim

FCL: multitpc_detsim_icarus.fcl

### Reco1

FCL: reco_icarus_driver_reco_multitpc_gauss.fcl

### Reco2

FCL: reco_icarus_driver_reco_multitpc_raw.fcl
