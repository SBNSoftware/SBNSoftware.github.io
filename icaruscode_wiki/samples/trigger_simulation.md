Trigger simulation samples
===========================

This is meant to be a list of the samples that are used for trigger simulation.
This kind of lists has the remarkable ability of falling out of date in days, so in case of doubt throw a line to [SBN Slack channel #icarus-trigger-simulation](https://shortbaseline.slack.com/archives/G015B91SL8N).

There are two sections in this page:
* the [sample list] includes the relevant samples, SAM definitions,
  file locations, processing information and known uses of the samples
  (which is going to be partial for sure)
* the [version list] describes the details of the software used
  for those samples, with stress on what is different from earlier versions and
  from "standard" samples


## The samples #################################################################


Process list:
* [neutrino interactions: BNB beam](#neutrino-interactions-bnb-beam)
* [neutrino interactions: NuMI beam](#neutrino-interactions-numi-beam)
* [cosmic ray interactions](#cosmic-ray-interactions)
* [BNB beam events (neutrino interaction(s) + background(s))](#bnb-beam-events-neutrino-interactions--backgrounds)
* [NuMI beam events (neutrino interaction(s) + background(s))](#numi-beam-events-neutrino-interactions--backgrounds)
* [radioactivity](#radioactivity)


### Neutrino interactions: BNB beam ###########################################

#### BNB neutrino (`v08_37_00`)

sample         | BNB neutrino (`v08_37_00`)
-------------- | -----------------------------------------------------------------
Author         | @rhowell42
`icaruscode`   | [`v08_37_00`](#v08_37_00)
Generation     | `simulation_genie_icarus_bnb.fcl`
Filtering      | _none_
Detector       | `standard_g4_icarus.fcl`
Digitisation   | `standard_detsim_icarus.fcl`
Reconstruction | `reco_icarus_driver_reco_multitpc_gauss.fcl`
Data path      | `/pnfs/icarus/persistent/users/rhowell/poms/v08_37_00/detsim/bnb` 


### Neutrino interactions: NuMi beam ##########################################

To do!



### Cosmic ray interactions ###################################################

To do!



### BNB beam events (neutrino interaction(s) + background(s)) #################

None used so far.



### NuMI beam events (neutrino interaction(s) + background(s)) ################

None used so far.



### Radioactivity #############################################################

sample         | BNB neutrino (`v09_09_01`)
-------------- | -----------------------------------------------------------------
Authors        | @PetrilloAtWork, @rhowell42
`icaruscode`   | [`v09_09_01`](#v09_09_01) with custom branch
Generation     | `prodbackground_Ar39_icarus.fcl`
Filtering      | _none_
Detector       | `standard_g4_icarus.fcl` _(pending)_
Digitisation   | `standard_detsim_icarus.fcl` _(pending)_
Reconstruction | `reco_icarus_driver_reco_multitpc_gauss.fcl` _(pending)_
Data path      | `/pnfs/icarus/persistent/users/petrillo/data/trigger/20201112/v09_09_01/prodbackground_Ar39_icarus/filelists` 


## The versions ###############################################################

Information in wiki:

* [geometry](../Detector_geometry.md)
* [photon visibility map](../physics/PhotonLibrary.md)


### `v08_37_00`

* geometry: first induction plane wires 18 m long, _with_ 3 m thick concrete overburden


### `v09_09_01`

* geometry: first induction plane wires 9 m long, _without_ 3 m thick concrete overburden by default
* visibility library: [September 2020](../physics/PhotonLibrary.md#20200925)
* PMT single photoelectron response with double exponential shape, 55 ADC (7 mV) amplitude
* PMT digitisation threshold: 5 ADC
* PMT electronics noise: disabled by default (3 ADC when enabled)
