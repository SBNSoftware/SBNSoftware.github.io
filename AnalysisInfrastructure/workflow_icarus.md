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
