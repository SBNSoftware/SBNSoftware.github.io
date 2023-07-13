---
layout: page
title: ReleaseNotes097503
toc: true
---

-----------------------------------------------------------------------------
| v09.75.03 | 13 Jul 2023 | [ReleaseNotes](ReleaseNotes097503.html) |
| --- | --- | --- |



sbndcode v09_75_03 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_75_03](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_75_03/sbndcode-v09_75_03.html)

Purpose
---------------------------------------------------
Weekly release + tag for the summer 2023 SBN Analysis Workshop

New features
---------------------------------------------------

- Updates to WireCell+production fhicls:
  - SBNSoftware/sbndcode#366: **production fhicl+workflow** for the Summer 2023 SBN Analysis Workshop 
    - Added recombination and diffusion variation fcls
    - Added reco1 fhicls for WireCell (1D and 2D):
      - 1D: takes wirecell 2DSIM as input, performs 1D deconvolution
      - 2D: takes wirecell 2DSIM as input, performs 2D deconvolution  
    - Added "scrubs" fhils for the new production workflow:
      - This allows for keeping the identical simulated event on the file and running a variation of the downstream detector simulation / reconstruction. 
  - SBNSoftware/sbndcode#358
    - Add fcls for wire-cell 2D signal processing
  - SBNSoftware/sbndcode#373
    - Add TimeTracker in WireCell
- Updates to OpDetSim and OpDetReco:
  - SBNSoftware/sbndcode#364
    - Updated electronics for "Daphne" flavored XARAPUCAs
    - Updates to detsim and reco1 stages to take into account the new sampling frequency of the latest choice for this subsystem readout, the CAEN v1740 model: https://www.caen.it/products/v1740/.
    - The SER has also been resampled to the latest 16ns binning, from the previous expected from Daphne electronics 80MHz/12.5ns.
  - SBNSoftware/sbndcode#371
    - Adds 2 fhicl files that run Reco1 stage keeping the raw::OpDetWaveforms in the output
- Updates to the flux:
  - SBNSoftware/sbndcode#363
    - Update from flux config J-v1 to config K-v1
      - What’s new:
        - New flux production on gpvm
        - Kaon weight is applied with a stand alone code and does not have MiniBooNE dependency
      - Validation can be found on docdc: 32091
  - SBNSoftware/sbndcode#367
    -  Update nu+overlay fhicl for new flux K
- Fhicl for GIBUU workflow:
  -  SBNSoftware/sbndcode#372
      - This fcl produces overlay CORSIKA cosmics and the dirt propagation throught the detector using largeant and with an input of neutrino events. This is made especially for GiBUU events since they are produced indepently of the overlay and the "dirt".

- Other:
  - SBNSoftware/sbndcode#365
    -  Updates to save waveforms from software metrics

Bug fixes
---------------------------------------------------
- SBNSoftware/sbndcode#369
  - Don't drop SimEnergyDeposit in standard G4 fhicl


Updated dependencies
---------------------------------------------------
- sbncode v09_75_03
- larsoft v09_75_03
- sbnd_data v1_21_00

Notes
---------------------------------------------------
- Release branch kept for future possible patches as `release/SBN2023_AnaWs`
  
Change List
==========================================

sbndcode sbndcode
---------------------------------------------------

* 2023-07-13  Fran Nicolas : Merge branch 'release/v09_75_03'
* 2023-07-13  Fran Nicolas : Update to larsoft v09_75_03
* 2023-07-13  Francisco Javier Nicolás-Arnaldos : Merge pull request #373 from ebelchio12/develop
* 2023-07-13  Francisco Javier Nicolás-Arnaldos : Merge pull request #366 from SBNSoftware/isafa/detvar
* 2023-07-13  Francisco Javier Nicolás-Arnaldos : Merge branch 'develop' into isafa/detvar
* 2023-07-13  Francisco Javier Nicolás-Arnaldos : Merge pull request #368 from SBNSoftware/fjnicolas-simenergyg4
* 2023-07-13  lynnt-uchicago : update unified workflow jsonnet to have proper scaling
* 2023-07-13  Henry Lay : Last minute fix - the wirecell fcl being used has been changed since this PR was opened
* 2023-07-13  lynnt-uchicago : change scaling factor to be consistent with input to hitfinder
* 2023-07-13  lynnt-uchicago : Merge branch 'isafa/detvar' of https://github.com/SBNSoftware/sbndcode into isafa/detvar
* 2023-07-13  lynnt-uchicago : adding 2dsim+2d deconvolution input to reco1
* 2023-07-13  lynnt-uchicago : delete drops line
* 2023-07-13  lynnt-uchicago : Update reco1_sce_lite_wc1d.fcl
* 2023-07-12  lynnt-uchicago : rename file
* 2023-07-12  lynnt-uchicago : change name to 1d to specify 1d decon
* 2023-07-12  Ewerton Belchior : Wire-Cell sim + signal processing (save RawDigit)
* 2023-07-12  Ewerton Belchior : Update wirecell_sim_sp_sbnd.fcl
* 2023-07-12  Ewerton Belchior : Merge branch 'SBNSoftware:develop' into develop
* 2023-07-12  lynnt-uchicago : reference the original detsim fcl instead of defining a new one
* 2023-07-12  lynnt-uchicago : new detsim + reco1 fcls to accomodate wc 2d sim - adds a detsim fcl that **turns off** 1d tpc sim, and only runs crt+pds sim - adds a reco1 fcl that takes wc 2d sim as input
* 2023-07-12  Henry Lay : Correct include
* 2023-07-12  Henry Lay : Clean up variation fcls and add scrubs stage
* 2023-07-12  Francisco Javier Nicolás-Arnaldos : Merge pull request #367 from SBNSoftware/fnicolas_overlayfcl
* 2023-07-12  Francisco Javier Nicolás-Arnaldos : Merge pull request #363 from SBNSoftware/feature/beam_flux_update_configJ_to_configK
* 2023-07-12  Francisco Javier Nicolás-Arnaldos : Merge pull request #372 from SBNSoftware/leoaliaga-patch-3
* 2023-07-12  Francisco Javier Nicolás-Arnaldos : Merge pull request #371 from SBNSoftware/feature/fnicolas_reco1waveforms
* 2023-07-12  Ewerton Belchior : Add TimeTracker
* 2023-07-11  Leo Aliaga : Add files via upload
* 2023-07-11  Ibrahim Safa : added fix to match with proposed workflow by production team
* 2023-07-11  Fran Nicolas : Add reco1 files keeping OpDetWaveforms
* 2023-07-11  Francisco Javier Nicolás-Arnaldos : Merge pull request #365 from SBNSoftware/feature/brindenc
* 2023-07-11  Francisco Javier Nicolás-Arnaldos : Merge pull request #364 from SBNSoftware/feature/rodrigoa_64MHz_detsim
* 2023-07-10  Francisco Javier Nicolás-Arnaldos : Don't drop SimEnergyDeposit in standard G4 fhicl
* 2023-07-10  Fran Nicolas : Update overlay fhicls to use flux config K
* 2023-07-10  Francisco Javier Nicolás-Arnaldos : Update to sbncode v09_75_03
* 2023-07-10  Ibrahim Safa : added sbnd recomb and diffusion fcls
* 2023-07-07  lynnt-uchicago : change default fcl param
* 2023-07-07  lynnt-uchicago : revert changes to hardware trigger
* 2023-07-07  lynnt-uchicago : cleanup
* 2023-07-07  Brinden Carlson : Lynn's updates to save waveforms from software metrics
* 2023-07-07  Vu Chi Lan Nguyen : fix typo
* 2023-07-06  Rodrigo Alvarez Garrote : old messages updated
* 2023-07-06  Rodrigo Alvarez Garrote : point to newer wvf
* 2023-07-06  Rodrigo Alvarez Garrote : harcoded value changed, TODO: load from fhicl
* 2023-07-06  Vu Chi Lan Nguyen : update beam flux from config J to K
* 2023-07-06  Francisco Javier Nicolás-Arnaldos : Merge pull request #358 from ebelchio12/develop
* 2023-07-06  Rodrigo Alvarez Garrote : 80 to 62.5 MHz for the new  v1740 CAEN digitizers changed in both detsim and reco stages. Tick goes from 12.5 to 16 ns
* 2023-06-29  Ewerton Belchior : Update sp.jsonnet
* 2023-06-28  Ewerton Belchior : Update wcls-sim-drift-simchannel-nf-sp.jsonnet
* 2023-06-28  Ewerton Belchior : Update wcls-nf-sp.jsonnet
* 2023-06-28  Ewerton Belchior : Merge branch 'SBNSoftware:develop' into develop
* 2023-06-26  Fran Nicolas : Merge tag 'v09_75_02' into develop
* 2023-06-14  ebelchio12 : add jsonnet for unified workflow
* 2023-06-14  ebelchio12 : updated group channels and database
* 2023-06-14  ebelchio12 : update filters to use optimized values
* 2023-06-14  ebelchio12 : update resmp and extra_stky
* 2023-06-14  ebelchio12 : update tag_rules for unified workflow
* 2023-06-14  ebelchio12 : update ctoffset
* 2023-06-14  ebelchio12 : update groups for SBDN coherent noise removal
* 2023-06-14  ebelchio12 : Wire-Cell simulation + signal processing

sbndutil
---------------------------------------------------

* 2023-07-13  Fran Nicolas : Merge tag 'v09_75_03' into develop
* 2023-07-13  Fran Nicolas : Merge branch 'release/v09_75_03'
* 2023-07-13  Fran Nicolas : Update to larsoft v09_75_03
* 2023-06-26  Fran Nicolas : Merge tag 'v09_75_02' into develop
