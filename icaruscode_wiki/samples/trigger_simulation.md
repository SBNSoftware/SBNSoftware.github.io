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
Author         | [Ryan Howell](mailto:rjhowell)
`icaruscode`   | `v08_37_00`
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

To do!



## The versions ###############################################################

Information in wiki:

* [geometry](../Detector_geometry.md)


### `v08_37_00`

* geometry: first induction plane wires 18 m long, _with_ 3 m thick concrete overburden
