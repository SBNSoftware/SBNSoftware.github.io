- SBNSoftware/sbndcode#358
  - Add fcls for wire-cell 2D signal processing
- SBNSoftware/sbndcode#364
  - Updated electronics for "Daphne" flavored XARAPUCAs
  - Updates to detsim and reco1 stages to take into account the new sampling frequency of the latest choice for this subsystem readout, the CAEN v1740 model: https://www.caen.it/products/v1740/.
  - The SER has also been resampled to the latest 16ns binning, from the previous expected from Daphne electronics 80MHz/12.5ns.
- SBNSoftware/sbndcode#365
  -  Updates to save waveforms from software metrics
- SBNSoftware/sbndcode#372
  - This fcl produces overlay CORSIKA cosmics and the dirt propagation throught the detector using largeant and with an input of neutrino events. This is made especially for GiBUU events since they are produced indepently of the overlay and the "dirt". 
- SBNSoftware/sbndcode#371
  - Adds 2 fhicl files that run Reco1 stage keeping the raw::OpDetWaveforms in the output
- SBNSoftware/sbndcode#363
  - Update from flux config J-v1 to config K-v1
  - What’s new:
    - New flux production on gpvm
    - Kaon weight is applied with a stand alone code and does not have MiniBooNE dependency
  - Validation can be found on docdc: 32091
- SBNSoftware/sbndcode#367
  -  Update nu+overlay fhicl for new flux K

- sbncode v09_75_03
- larsoft v09_75_03
- sbnd_data v1_21_00