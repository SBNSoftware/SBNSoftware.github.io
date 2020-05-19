---
lang: en
title: Software parameters and settings
---

[]{#Software-parameters-and-settings}

Software parameters and settings[¶](#Software-parameters-and-settings){.wiki-anchor}
====================================================================================

-   **Table of contents**
-   [Software parameters and
    settings](#Software-parameters-and-settings)
    -   -   [How to update this page](#How-to-update-this-page)

    -   [Detector geometry](#Detector-geometry)
    -   [Timings](#Timings)
        -   [Code and configuration
            information](#Code-and-configuration-information)
        -   [Timing overview](#Timing-overview)
        -   [Detailed timing explanation](#Detailed-timing-explanation)
    -   [Simulation](#Simulation)
        -   [Event generation](#Event-generation)
        -   [TPC simulation](#TPC-simulation)
        -   [Optical simulation](#Optical-simulation)
            -   [Scintillation](#Scintillation)
            -   [Transportation of scintillation photons to the optical
                detectors](#Transportation-of-scintillation-photons-to-the-optical-detectors)
            -   [Optical readout
                simulation](#Optical-readout-simulation)

This page is an attempt to keep track of the parameters of the ICARUS
detector relevant to the simulation and reconstruction.

[]{#How-to-update-this-page}

### How to update this page[¶](#How-to-update-this-page){.wiki-anchor}

-   changes are ultimately tracked by Redmine (check the \"history\"
    link usually on top right of the page)
-   when updating or adding a setting, always mark the version of
    [ICARUS LArSoft](/redmine/projects/icaruscode){.project} it is
    extracted from
    -   use the `version:` Redmine tag (e.g. `version:v08_19_01` will
        show as s link: [v08\_19\_01](/redmine/versions/1911){.version})
    -   if the version you look for is not registered yet, use it anyway
        and inform the [release
        manager](Roles_and_people.html#release-management){.wiki-page}

[]{#Detector-geometry}

Detector geometry[¶](#Detector-geometry){.wiki-anchor}
------------------------------------------------------

Detector geometry is described in [its own
page](Detector_geometry.html){.wiki-page}.

[]{#Timings}

Timings[¶](#Timings){.wiki-anchor}
----------------------------------

[]{#Code-and-configuration-information}

### Code and configuration information[¶](#Code-and-configuration-information){.wiki-anchor}

-   \[[v08\_19\_01](/redmine/versions/1911){.version}\] ICARUS uses the
    implementation `detinfo::DetectorClocksStandard` of the detector
    clocks service provider
-   \[[v08\_19\_01](/redmine/versions/1911){.version}\] its
    configuration happens in `icarus_detectorclocks` configuration table
    defined in
    [source:icaruscode/Utility/detectorclocks\_icarus.fcl](/redmine/projects/icaruscode/repository/entry/icaruscode/Utility/detectorclocks_icarus.fcl){.source}
-   \[[v08\_19\_01](/redmine/versions/1911){.version}\] optical
    simulation configuration is in `icarus_pmtsimulationalg_standard`
    ([source:icaruscode/Light/Algorithms/pmtsimulation\_icarus.fcl](/redmine/projects/icaruscode/repository/entry/icaruscode/Light/Algorithms/pmtsimulation_icarus.fcl){.source})

This is an excerpt of from `icarus_detectorclocks`
[v08\_19\_01](/redmine/versions/1911){.version}:\

    G4RefTime:        -1.15e3  # G4 time [us] where electronics clock counting start
    TriggerOffsetTPC: -0.340e3 # Time offset for TPC readout start time w.r.t. trigger [us]
    FramePeriod:       1638.4  # Frame period [us]; 4096 * 400 ns
    ClockSpeedTPC:     2.5     # TPC clock speed in MHz;
    ClockSpeedOptical: 500     # Optical clock speed in MHz
    ClockSpeedTrigger: 16      # Trigger clock speed in MHz
    ClockSpeedExternal:31.25   # External clock speed in MHz
    DefaultTrigTime:   1.15e3  # Default trigger time in electronics clock [us]
    DefaultBeamTime:   1.15e3  # Default beam gate time in electronics clock [us]

[]{#Timing-overview}

### Timing overview[¶](#Timing-overview){.wiki-anchor}

For a more detailed explanation of these timings and their relation, see
the next section.

-   trigger: arbitrary absolute definition
-   electronics time (reference):
    \[[v08\_19\_01](/redmine/versions/1911){.version}\] 1150 µs before
    the trigger (`DefaultTrigTime`)
-   TPC electronics time (when `raw::RawDigit` start):
    \[[v08\_19\_01](/redmine/versions/1911){.version}\] 340 µs before
    the trigger (`TriggerOffsetTPC`)
-   simulation (Geant4) time (for `simb::MCParticle` objects from
    detector simulation, *not necessarily true* for `simb::MCTruth`):
    \[[v08\_19\_01](/redmine/versions/1911){.version}\] 1150 µs after
    electronics time, that is at trigger time (`G4RefTime`)
-   beam gate opening time:
    \[[v08\_19\_01](/redmine/versions/1911){.version}\] 1150 µs after
    the electronics time start (`DefaultBeamTime`), i.e. at the *same
    time as the trigger*
-   optical simulation:
    \[[v08\_19\_01](/redmine/versions/1911){.version}\] starts 1150 µs
    before the trigger
    (`icarus_pmtsimulationalg_standard.TriggerOffsetPMT`), and stops
    2300 µs after the trigger
    (`icarus_pmtsimulationalg_standard.ReadoutEnablePeriod`)

> The drift time (cathode to anode) is simulated to be 937.19 µs (2343
> ticks).

Clocks:

  clock             frequency   period   source                 from                                              notes
  ----------------- ----------- -------- ---------------------- ------------------------------------------------- ---------------------
  TPC readout       2.5 MHz     400 ns   `ClockSpeedTPC`        [v08\_19\_01](/redmine/versions/1911){.version}   
  optical readout   500 MHz     2 ns     `ClockSpeedOptical`    [v08\_19\_01](/redmine/versions/1911){.version}   
  trigger           16 MHz      62 ns    `ClockSpeedTrigger`    [v08\_19\_01](/redmine/versions/1911){.version}   needs to be updated
  CRT readout       31.25 MHz   62 ns    `ClockSpeedExternal`   [v08\_19\_01](/redmine/versions/1911){.version}   to be confirmed

Pictographically:\

     electronics time start
     start of optical detector readout simulation
     optical waveforms time reference (raw::OpDetWaveform::TimeStamp())
     |                 
     |                 start of TPC readout simulation (raw::RawDigit, recob::Wire)
     |                 |
     |                 |       trigger instant
     |                 |       beam gate opening instant
     |                 |       simulation time reference (simb::MCParticle)
     |                 |       |
     |                 |<340µs>|
     |                 |       |
     |<------- 1150 µs ------->|
     |                 |       |                       one drift window after trigger
     |                 |       |<----- 937.19 µs ----->|
     |                 |       |                       |
     |                 |       |                       |                   end of optical readout simulation                      
     |<----------------------------- 3450 µs ----------------------------->|
     |                 |       |                       |                   |
     |-----------------+-------+-----------------------+-------------------+
     #0              #2025   #2875                   #5218               #8625 electronics time ticks
     |-----------------+-------+-----------------------+-------------------+
    #-2025            #0      #850                   #3107               #6600 TPC readout ticks (raw::RawDigit)

[]{#Detailed-timing-explanation}

### Detailed timing explanation[¶](#Detailed-timing-explanation){.wiki-anchor}

LArSoft timing system is documented with the `detinfo::DetectorClocks`
provider interface, which manages the conversion between different
timings. Its documentation is in [LArSoft
Doxygen](http://nusoft.fnal.gov/larsoft/doxsvn/html/classdetinfo_1_1DetectorClocks.html#details){.external}
.

-   trigger time: the instant the global event trigger fires
    -   accessed in code by `detinfo::DetectorClocks::TriggerTime()`
        -   describes when the global event trigger happens with respect
            to the electronics time scale
        -   practically, this *defines* the absolute electronics time
            line, whose definition is to start `TriggerTime()` µs before
            the trigger itself
-   electronics time: reference time scale (see the trigger time
    definition above)
    -   with no actual hardware trigger, its value is taken from
        configuration `DefaultTrigTime`, that tells how many µs before
        the trigger the electronics time started
    -   with a hardware trigger signal (real or simulated), the trigger
        time is taken from the trigger itself *(this needs to be
        understood and documented better once ICARUS owns a solution)*
-   TPC electronics time: time of the first tick of TPC `raw::RawDigit`
    -   set by `TriggerOffsetTPC` which describes how many µs before the
        trigger the TPC readout started recording
-   simulation time: the time the detector simulation (e.g. Geant4) uses
    for its particles
    -   defined by `G4RefTime`, which is the electronics start time in
        simulation time (kind of inverse definition)
-   optical readout start: when optical electronics starts recording
    -   optical detector readout is continuous
    -   readout is threshold-based and asynchronous with respect to the
        TPC: it can produce several waveforms per channel per triggered
        event
    -   the simulation of the optical waveforms assigns a time stamp to
        the waveform which is in electronics time
    -   nevertheless, the simulation by `icarus::SimPMTIcarus` only
        starts at `TriggerOffsetPMT` (module configuration), and it
        lasts for a finite time

[]{#Simulation}

Simulation[¶](#Simulation){.wiki-anchor}
----------------------------------------

[]{#Event-generation}

### Event generation[¶](#Event-generation){.wiki-anchor}

-   [cosmic rays](Cosmic_ray_generation_(CORSIKA).html){.wiki-page}

[]{#TPC-simulation}

### TPC simulation[¶](#TPC-simulation){.wiki-anchor}

-   \[[v08\_19\_01](/redmine/versions/1911){.version}\] TPC readout
    starts recording 340 µs before the global event trigger
    (`icarus_detectorclocks.TriggerOffsetTPC: -0.340e3 # [us]`,
    [source:icaruscode/Utilities/detectorclocks\_icarus.fcl](/redmine/projects/icaruscode/repository/entry/icaruscode/Utilities/detectorclocks_icarus.fcl){.source})

[]{#Optical-simulation}

### Optical simulation[¶](#Optical-simulation){.wiki-anchor}

[]{#Scintillation}

#### Scintillation[¶](#Scintillation){.wiki-anchor}

Scintillation is simulated based on energy deposition by each particle
propagating in the detector, via the `FastOptical` process defined in
[larsim:source:larsim/LArG4/FastOpticalPhysics.h](/redmine/projects/larsim/repository/entry/larsim/LArG4/FastOpticalPhysics.h){.source}.\
The current default algorithm does not take into account the correlation
of scintillation with ionization, and is implemented in
`larg4::OpFastScintillation`
(larsim::source:larsim/LArG4/OpFastScintillation.cxx).\
Some details of the simulation are described in [LArG4 module
documentation](http://nusoft.fnal.gov/larsoft/doxsvn/html/classlarg4_1_1LArG4.html#details){.external}.
In particular, scintillation yields and quantum efficiency (in disguise
as `detinfo::LArProperties::ScintPreScale()`) are applied.\
The configuration derived from `detinfo::LArProperties` service
provider. Most of the relevant parameters are configured via
[source:icaruscode/Utilities/opticalproperties\_icarus.fcl](/redmine/projects/icaruscode/repository/entry/icaruscode/Utilities/opticalproperties_icarus.fcl){.source}:

description

value(s)

source

from

notes

Cherenkov light

`false`

`EnableCerenkovLight`

[v08\_34\_00](/redmine/versions/2022){.version}

scintillation by particle type

`true`

`ScintByParticleType`

[v08\_34\_00](/redmine/versions/2022){.version}

• e

20000 γ/MeV, 27% fast

`ElectronScintYield`/`ElectronScintYieldRatio`

[v08\_34\_00](/redmine/versions/2022){.version}

• μ

24000 γ/MeV, 23% fast

`MuonScintYield`/`MuonScintYieldRatio`

• π

24000 γ/MeV, 23% fast

`PionScintYield`/`PionScintYieldRatio`

• p

19200 γ/MeV, 29% fast

`ProtonScintYield`/`ProtonScintYieldRatio`

• K

24000 γ/MeV, 23% fast

`KaonScintYield`/`KaonScintYieldRatio`

• α

16800 γ/MeV, 56% fast

`AlphaScintYield`/`AlphaScintYieldRatio`

τ: fast scintillation

6 ns

`ScintFastTimeConst`

[v08\_34\_00](/redmine/versions/2022){.version}

τ: slow scintillation

1.59 µs

`ScintSlowTimeConst`

[]{#Transportation-of-scintillation-photons-to-the-optical-detectors}

#### Transportation of scintillation photons to the optical detectors[¶](#Transportation-of-scintillation-photons-to-the-optical-detectors){.wiki-anchor}

A summary of the procedures and settings used in ICARUS can be found in
[SBN DocDB
14569](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=14569){.external}
(with the usual warning: that is a static documents and things may have
changed).

During the \"normal\" sample simulation, the \"fast\" optical simulation
is used, where a lookup table (\"photon library\") is used to
characterise the visibility of each point in the active volume from each
of the optical detector channels (read: PMT\'s).\
The service interfacing with the table is `PhotonVisibilityService`,
whose standard configuration for ICARUS is in
`icarus_photonvisibilityservice` table at
[[source:fcl/services/photpropservices\_icarus.fcl](/redmine/projects/icaruscode/repository/entry/fcl/services/photpropservices_icarus.fcl){.source}]{style="font-family: monospace;"}.
This is the configuration used in
[v08\_31\_01](/redmine/versions/1993){.version}:

description

value(s)

source

from

notes

library data file

`PhotonLibrary/PhotonLibrary-20180801.root`

`LibraryFile`

[v08\_13\_02](/redmine/versions/1990){.version}

file stored in [icarus\_data](/redmine/projects/icarus_data){.project}

map range (*x*)

`-395` -- `-45` cm

`XMin`, `XMax`

[v08\_13\_02](/redmine/versions/1990){.version}

these parameters must reflect both the lookup table and the detector
geometry

map range (*y*)

`-215.2` -- `174.8` cm

`YMin`, `YMax`

[v08\_13\_02](/redmine/versions/1990){.version}

map range (*z*)

`-995` -- `965` cm

`ZMin`, `ZMax`

[v08\_13\_02](/redmine/versions/1990){.version}

cells (*x*)

`70`, `78`, `392`

`NX`, `NY`, `NZ`

[v08\_13\_02](/redmine/versions/1990){.version}

these parameters must reflect the lookup table

`false`

`UseCryoBoundary`

[v08\_13\_02](/redmine/versions/1990){.version}

autodetection of map range is disabled

propagation time

`true`

`IncludePropTime`

[v08\_13\_02](/redmine/versions/1990){.version}

cell interpolation

`false`

`Interpolate`

mapping

`ICARUSPhotonMappingTransformations`

`Mapping.tool_type`

[v08\_27\_00](/redmine/versions/1991){.version}

The library data file covers the *TPC active volume* of the first
cryostat (`C:0`) only, and the range parameters refer to that one.\
The data is mapped (`ICARUSPhotonMappingTransformations` tool, see
[presentation](https://indico.fnal.gov/event/20409/contribution/2/material/slides/0.pdf){.external}
at [LArSoft coordination meeting on April 9,
2019](https://indico.fnal.gov/event/20409){.external}) to the second
cryostat to complete the coverage, which is still limited to the TPC
active volumes; a query outside that volume will return visibility `0`
on all channels.\
The map coverage range needs also to match the geometry description. For
example, the geometry description was at a certain time modified so that
the cryostats would be shifted by a few centimeters: in that case, the
library needn\'t to be regenerated, but the coordinates in this
configuration needed to be shifted accordingly.\
Note that the propagation time is explicitly enabled.

[]{#Optical-readout-simulation}

#### Optical readout simulation[¶](#Optical-readout-simulation){.wiki-anchor}

Optical detector readout simulation is performed by
`icarus::simPMTIcarus` module via `icarus::opdet::PMTsimulationAlg`.

  parameter                        frequency                source                  from                                              notes
  -------------------------------- ------------------------ ----------------------- ------------------------------------------------- -------------------------------
  start of readout simulation      1150 µs before trigger   `TriggerOffsetPMT`      [v08\_19\_01](/redmine/versions/1911){.version}   at electronics time `0`
  duration of readout simulation   3450 µs                  `ReadoutEnablePeriod`   [v08\_19\_01](/redmine/versions/1911){.version}   three 1.15 ms \"frames\"
  minimum waveform length          2000 ticks (4 µs)        `ReadoutWindowSize`     [v08\_19\_01](/redmine/versions/1911){.version}   
  waveform length before signal    25% (500 ticks, 1 µs)    `PreTrigFraction`       [v08\_19\_01](/redmine/versions/1911){.version}   
  waveform baseline                8000                     `Baseline`              [v08\_19\_01](/redmine/versions/1911){.version}   
  waveform polarity                negative (`-1`)          `PulsePolarity`         [v08\_19\_01](/redmine/versions/1911){.version}   develops *below* the baseline

This is an excerpt of from `icarus_pmtsimulationalg_standard`
[v08\_19\_01](/redmine/versions/1911){.version}
([source:icaruscode/PMT/Algorithms/pmtsimulation\_icarus.fcl](/redmine/projects/icaruscode/repository/entry/icaruscode/PMT/Algorithms/pmtsimulation_icarus.fcl){.source}):\

    TransitTime:               55.1           #ns
    ADC:                       -11.1927       #charge to adc factor
    Baseline:                  8000.0         #in ADC
    FallTime:                  13.7           #ns
    RiseTime:                  3.8            #ns
    MeanAmplitude:             0.9            #in pC
    AmpNoise:                  1.0            #in ADC
    DarkNoiseRate:             1000.0         #in Hz

    ##This is the readout window size for each "trigger" on the electronics
    ReadoutWindowSize:         2000           #ticks (if 2ns each --> 4us)

    ##fraction of readout window size that should come before the "trigger" on the electronics
    PreTrigFraction:           0.25           # fraction

    ##Threshold in ADC counts for a PMT self-trigger.
    ##NOTE this is assumed to be positive-going and ABOVE BASELINE! Pulse polarity is corrected before determining trigger.
    ThresholdADC:              10             #ADC counts

    PulsePolarity:             -1             #Pulse polarity (1 = positive, -1 = negative)
    TriggerOffsetPMT:          -1150          #Time (us) relative to trigger that readout begins
    ReadoutEnablePeriod:       3450           #Time (us) for which pmt readout is enabled
    CreateBeamGateTriggers:    true           #Option to create unbiased readout around beam spill
    BeamGateTriggerRepPeriod:  2.0            #Repetition Period (us) for BeamGateTriggers
    BeamGateTriggerNReps:      10             #Number of beamgate trigger reps to produce
    Saturation:                300            #in number of p.e. to see saturation effects in the signal
    QE:                        0.07           #TPB coated PMT quantum efficiency
