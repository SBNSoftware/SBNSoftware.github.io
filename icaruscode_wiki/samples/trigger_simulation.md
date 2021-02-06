Trigger simulation samples
===========================

This is meant to be a list of the samples that are used for trigger simulation.
This kind of lists has the remarkable ability of falling out of date in days, so in case of doubt throw a line to [SBN Slack channel #icarus-trigger-simulation](https://shortbaseline.slack.com/archives/G015B91SL8N).

There are two sections in this page:
* the [sample list](#the-samples) includes the relevant samples, SAM definitions,
  file locations, processing information and known uses of the samples
  (which is going to be partial for sure)
* the [version list](#the-versions) describes the details of the software used
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
Author         | Ryan Howell
`icaruscode`   | [`v08_37_00`](#v08_37_00)
Generation     | `simulation_genie_icarus_bnb.fcl`
Filtering      | _none_
Detector       | `standard_g4_icarus.fcl`
Digitisation   | `standard_detsim_icarus.fcl`
Reconstruction | `reco_icarus_driver_reco_multitpc_gauss.fcl`
Data path      | `/pnfs/icarus/persistent/users/rhowell/poms/v08_37_00/detsim/bnb` 


### Neutrino interactions: NuMi beam ##########################################

sample         | NuMI neutrino (`v09_10_01`)
-------------- | -----------------------------------------------------------------
Author         | production (request by NuMI group)
`icaruscode`   | [`v09_10_01`](#v09_10_01)
Generation     | `simulation_genie_icarus_numi_volDetEnclosure.fcl`
Filtering      | `filter_genie_active.fcl`
Detector       | `standard_g4_icarus.fcl`
Digitisation   | `multitpc_detsim_icarus.fcl`
Reconstruction | `reco_icarus_driver_reco_multitpc_gauss.fcl`
"              | `reco_icarus_driver_reco_multitpc_raw.fcl`
SAM definition | `ICARUS_prod_2020A_00_numioffaxis_v09_10_01_reco2`
Data path      | 


### Cosmic ray interactions ###################################################

sample         | Short exposure (`v09_06_00`)
-------------- | -------------------------------------------------------------------
Author         | Marta Babicz
`icaruscode`   | [`v09_06_00`](#v09_06_00)
Generation     | custom (`prodcorsika_standard_icarus.fcl` + 500 &micro;s exposure)
Detector       | custom (`cosmics_g4_icarus_volDetEnclosure.fcl`)
Digitisation   | custom (`standard_detsim_icarus.fcl` with PMT only)
Reconstruction | none
SAM definition | 
Data path      | `/pnfs/icarus/scratch/users/mbabicz/cosmic_muons_p0[12]/v09_06_00`


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

### `v09_06_00`

* geometry: first induction plane wires 9 m long, _without_ 3 m thick concrete overburden by default
* visibility library: [September 2020](../physics/PhotonLibrary.md#20200925)
* PMT single photoelectron response with double exponential shape, 55 ADC (7 mV) amplitude
* PMT digitisation threshold: 4 ADC
* PMT electronics noise: disabled by default

### `v09_09_01`

As [`v09_06_00`](#v09_06_00) above, plus:
* PMT digitisation threshold: 5 ADC
* PMT electronics noise: disabled by default (3 ADC when enabled)

### `v09_10_01`

* geometry: [`20201107`](https://sbnsoftware.github.io/icaruscode_wiki/Detector_geometry.html) _without_ 3 m thick concrete overburden
