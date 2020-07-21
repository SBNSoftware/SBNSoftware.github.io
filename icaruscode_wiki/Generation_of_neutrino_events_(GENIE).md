---
layout: page
title: 'Generation of neutrino events (GENIE)'
---



Generation of neutrino events (GENIE)
============================================================================================

-   **Table of contents**
-   [Generation of neutrino events
    (GENIE)]
    -   [Selecting generated interactions: FilterNeutrinosActiveVolume
        module]
        -   [Selecting events with interactions in selected
            volumes]
            -   [Interactions in the active volumes of the
                detector]
            -   [Interaction location via volume
                name]
            -   [Interaction location via volume
                coordinates]
        -   [Selecting events with a specific interaction
            type]
        -   [Selecting events via a specific current
            type]



Selecting generated interactions: FilterNeutrinosActiveVolume module
-----------------------------------------------------------------------------------------------------------------------------------------------------------

There are a few facilities in LArSoft and ICARUS code which allow
filtering of events based on the features of the interaction(s).

They are implemented as *art* filters, which allow to write an event
into the output *art* ROOT file only if it satisfies some requirements.

ICARUS has its own flavor of selector implemented in
[[FilterNeutrinosActiveVolume](https://icarus-exp.fnal.gov/at_work/software/doc/icaruscode/latest/classFilterNeutrinosActiveVolume.html){.external}]{style="font-family: monospace;"}
filter module.\
Note that this module has nothing that is specific to ICARUS and can be
actually used in any LArSoft experiment (but at present it is
distributed in [ICARUS
LArSoft](/redmine/projects/icaruscode){.project}).

Three types of requirements are supported: interaction location,
interaction type and weak current type.\
An event (intended as *art* event, possibly containing multiple
interactions in `std::vector<simb::MCTruth>` data products) is selected
if *all* the requirement types in the configuration are satisfied. For
example, if all three types are specified, the selected events must
contain an interaction with the requested current type *and* interaction
type *and* location.

Also note that when using *art* filter modules an event will be accepted
in its entirety. For example, an event with two interactions will be
selected even if only one of them satisfies all the requirements of the
filter, and both interactions will be included in the selected event.



### Selecting events with interactions in selected volumes

Events can be selected if they have a neutrino-like interaction in a
specified volume.

The location of the interaction is determined by the position
(`EndPosition()`) of its incoming neutrino-like particle.\
There are a few ways to specify the volumes: the interaction will be
accepted if it happens in *any* of the specified volumes.



#### Interactions in the active volumes of the detector

The active volume is defined as the volume in between the anode and
cathode planes, limited by the field cage. That volume is fully
instrumented and permeated by a uniform electric field.\
One can assume that only ionization produced in the active volume will
be measured by the wires, while the same is *not* true for scintillation
light, that can originate from outside it and still be detected.

In ICARUS detector geometry description the active volume is described
by several (eight, in [v08\_50\_02](/redmine/versions/2119){.version}
default geometry) volumes called `volTPCActive`.

To select only events that have at least a neutrino interaction (of any
type) in the active volume, the job configuration
`filter_genie_active.fcl` or the module FHiCL settings
`icarus_FilterNeutrinoActive` (from `FilterNeutrinoActive.fcl`) can be
used.\
The explicit configuration of the module, instead, will look like:\

    physics.filters.selectInActiveVolume: {

      module_type: "FilterNeutrinosActiveVolume" 
      inActive:     true

    }

(do not forget to ask `RootOutput` to filter the events with the
`SelectEvents` configuration parameter).

Note that if the active volume requirement is requested, no other
location requirement can be specified.



#### Interaction location via volume name

Events can be required to have at least one interaction in any of the
specified volumes, described by the name they have in the GDML detector
geometry.\
For example:

    physics.filters.selectInActiveVolume: {

      module_type: "FilterNeutrinosActiveVolume" 

      volumeNames: [ "volTPC", ".*CRT.*" ]

    }

will select interactions happening in *any* of the volumes called
`volTPC` (in the default ICARUS detector in
[v08\_50\_02](/redmine/versions/2119){.version}, there are eight of
them), or in *any* volume whose name contains `CRT`.\
As this example shows, multiple volumes can be specified, and the
specification is actually a C++ \"default\" regular expression (see e.g.
[[std::regex]{style="font-family: monospace;"}](https://en.cppreference.com/w/cpp/regex){.external}).

These volumes are selected in additions to the ones specified by
coordinates (below), but can\'t be specified together with the request
of active volume (`inActive: true`). Hint: LArSoft convention prescribes
the active volumes to be called `volTPCActive`, so for compliant
detectors like ICARUS `inActive: true` is actually a shortcut for
`volumeNames: [ "volTPCActive" ]`. This also allows to specify
*additional* volumes.



#### Interaction location via volume coordinates

Events can be required to have at least one interaction in any of the
specified box-shaped volumes, described by the coordinate ranges on each
dimension.\
For example:

    physics.filters.selectInActiveVolume: {

      module_type: "FilterNeutrinosActiveVolume" 

      volumeBoxes: [
        {
          Xmin: -150.0
          Ymin: -150.0
          Zmin:  -50.0
          Xmax:  -50.0
          Ymax:  -50.0
          Zmax:  +50.0
        },
        {
          Xmin:   50.0
          Ymin:   50.0
          Zmin:  150.0
          Xmax:  150.0
          Ymax:  -50.0
          Zmax:  +50.0
        }
      ] # volumeBoxes

    }

will select interactions happening in one of two 1 meter cubes centered
in ( &plusm;1 ; &plusm;1 ; 0 ) meters, specified in world coordinates
and in centimeters.\
These volumes are selected in additions to the ones specified by name,
but can\'t be specified together with the request of active volume
(`inActive: true`).

------------------------------------------------------------------------



### Selecting events with a specific interaction type

The filter module
[[FilterNeutrinosActiveVolume](https://icarus-exp.fnal.gov/at_work/software/doc/icaruscode/latest/classFilterNeutrinosActiveVolume.html){.external}]{style="font-family: monospace;"}
described above allows to narrow the selection by requiring *also* a
specific neutrino interaction type.\
For example, this configuration requires an neutral current interaction
via resonant production of a pion (neutral or positive charged) and
neutron:\

    physics.filters.selectInActiveVolume: {

      module_type:      "FilterNeutrinosActiveVolume" 

      interactionTypes: [
        1007, # simb::kResNCNuNeutronPiPlus
        1008  # simb::kResNCNuNeutronPi0
      ]

    }

The interaction types are coded in
[nusimdata:source:nusimdata/SimulationBase/MCNeutrino.h](/redmine/projects/nusimdata/repository/entry/nusimdata/SimulationBase/MCNeutrino.h){.source}
(type
[simb::int\_type\_](https://nusoft.fnal.gov/larsoft/doxsvn/html/namespacesimb.html#a2cce734d1b71408bbc7d98d148ac4360){.external}).

This requirement can be specified *together with* the current type
(below) and the interaction location requirements.



### Selecting events via a specific current type

The filter module
[[FilterNeutrinosActiveVolume](https://icarus-exp.fnal.gov/at_work/software/doc/icaruscode/latest/classFilterNeutrinosActiveVolume.html){.external}]{style="font-family: monospace;"}
described above allows to narrow the selection by requiring *also* a
specific neutrino current type:\

    physics.filters.selectInActiveVolume: {

      module_type: "FilterNeutrinosActiveVolume" 
      weakCurrent:  NC

    }

The allowed values for `weakCurrent` are `charged` (or `CC`), `neutral`
(or `NC`), and `any` (which still requires a weak interaction to be
present).

Again note that an event will be accepted in its entirety, and an event
with two interactions will be selected even if only one of them
satisfies the requirement of the filter.

This requirement can be specified *together with* the interaction type
and the interaction location requirements.
