---
layout: page
title: ICARUS detector geometry description
description: Description of the detector geometry settings available for ICARUS
toc: true
---


Geometry description versions
------------------------------

**Breaking changes in geometry: `v09_53_02`, `v09_25_00`, `v09_18_00`, `v08_57_00`.**


Detector geometry description is currently stored in GDML format as a
text file in
[icarusalg/Geometry/gdml](https://github.com/SBNSoftware/icarusalg/blob/develop/icarusalg/Geometry/gdml)
directory.
The "version" string also comprises a compatibility check:
`Geometry` service will refuse to process an input file generated with a version
different from the one configured in the current job
(override with `services.Geometry.SkipConfigurationCheck: true`).


| version      | introduced                  | default     | file path                                                                   | based on    | description
| ------------ | --------------------------- | ----------- | --------------------------------------------------------------------------- | ----------- | ------------
| `icarus_v4`  | `v09_53_02`, `v09_37_02_09` | `v09_53_02` | `icarusalg/Geometry/gdml/icarus_complete_20220518_overburden.gdml`          | `icarus_v3` | updated CRT module positions
| `icarus_v3`  | `v09_25_00`                 |             | `icarusalg/Geometry/gdml/icarus_complete_20210527_overburden.gdml`          | `icarus_v2` | closer cryostats, added building details; with concrete overburden
| `icarus_v3`  | `v09_25_00`                 | `v09_25_00` | `icarusalg/Geometry/gdml/icarus_complete_20210527_no_overburden.gdml`       | `icarus_v2` | closer cryostats, added building details; with no concrete overburden
| `icarus_v2`* | `v09_18_00`                 |             | `icarusalg/Geometry/gdml/icarus_complete_20210311_rotUV.gdml`               | `20201107`  | fixed orientation of wires, with concrete overburden
| `icarus_v2`* | `v09_18_00`                 | `v09_18_00` | `icarusalg/Geometry/gdml/icarus_complete_20210311_no_overburden_rotUV.gdml` | `20201107`  | fixed orientation of wires, with no concrete overburden
| `20201107`** | `v09_09_01`                 |             | `icarusalg/Geometry/gdml/icarus_complete_20201107.gdml`                     | `20200709`  | more realistic description of walls, updates to PMT materials, with concrete overburden
| `20201107`** | `v09_09_01`                 | `v09_10_01` | `icarusalg/Geometry/gdml/icarus_complete_20201107_no_overburden.gdml`       | `20200709`  | more realistic description of walls, updates to PMT materials, with no concrete overburden
| `20200709`** | `v08_57_00`                 |             | `icarusalg/Geometry/gdml/icarus_complete_20200709.gdml`                     | `20200307`  | fixed overlaps, with concrete overburden
| `20200709`** | `v08_57_00`                 | `v08_57_00` | `icarusalg/Geometry/gdml/icarus_complete_20200709_no_overburden.gdml`       | `20200307`  | fixed overlaps, with no concrete overburden

> _*_ _Versions `v09_18_00` to `v09_19_00_01` erroneously still report this geometry as `icarus_splitwires`. To process files generated with those versions, `services.Geometry.Name: icarus_splitwires` must be specified in the job configuration_
> 
> _*_ _*_ _The detector name configured for these geometry descriptions is `icarus_splitwires`._

> _Note_: since `icarus_v4` geometry, no-overburden geometry is not provided any more.

### Unsupported versions

The following older geometry versions have been dropped from our codebase, and the only way to use them is to retrieve a version of `icaruscode` where they were still supported (either as main or as legacy options).

| name       | version     | introduced  | default     | removed     | file path                                                             | description
| ---------- | ----------- | ----------- | ----------- | ----------- | --------------------------------------------------------------------- | ------------------------------
| `20200307` | `20200307`  | `v08_45_00` | `v08_50_02` | `v08_57_00` | `icaruscode/Geometry/gdml/icarus_complete_no_overburden.gdml`         | complete geometry, first induction plane wires 9 m, with no concrete overburden
| `20200307` | `20200307`  | `v08_44_00` |             | `v08_57_00` | `icaruscode/Geometry/gdml/icarus_complete.gdml`                       | complete geometry, first induction plane wires 9 m, with concrete overburden
|            |             | `v08_44_00` | `v08_44_00` |             | `icaruscode/Geometry/gdml/icarus_single_complete_no_overburden.gdml`  | complete geometry, first induction plane wires 18 m, with no concrete overburden
|            |             | `v08_44_00` |             |             | `icaruscode/Geometry/gdml/icarus_single_complete.gdml`                | complete geometry, first induction plane wires 18 m, with concrete overburden
|            |             | `v08_44_00` |             | `v08_45_00` | `icaruscode/Geometry/gdml/icarus_complete_no_overburden.gdml`         | complete geometry, first induction plane wires 9 m, with half concrete overburden (bug)
|            |             | `v08_41_00` |             | `v08_44_00` | `icaruscode/Geometry/gdml/icarus_complete_no_overburden.gdml`         | complete geometry, first induction plane wires 18 m, with no concrete overburden
|            |             | `v08_30_00` | `v08_30_00` | `v08_44_00` | `icaruscode/Geometry/gdml/icarus_complete_light.gdml`                 | `icarus_complete.gdml`, "temporary" version with niobium and molybdenum components of steel removed
|            |             | ...         | ...         | `v08_41_00` | `icaruscode/Geometry/gdml/icarus_complete.gdml`                       | complete geometry: TPC (first induction plane wires 18 m), PMT, CRT, concrete overburden

In this table, "name" refers to the specific geometry, while "version" is the "detector name" that was assigned to it in LArSoft. All geometry files with the same version are expected to be compatible at LArSoft `GeometryCore` level, but they may differ either in format or in details besides the cryostat/TPC/plane/wire/PMT/CRT active components.

> _Note_: detector geometry description files have been moved from
> [`icaruscode`](https://github.com/SBNSoftware/icaruscode/blob/develop/icaruscode/Geometry/gdml)
> into [`icarusalg`](https://github.com/SBNSoftware/icarusalg/blob/develop/icarusalg/Geometry/gdml)
> starting with ICARUS software release `v09_06_00` (October 2020).


### Running standard tets on a a new version of the geometry description

LArSoft provides a geometry test module with a decent coverage
for geometry and channel mapping functions.
A new version of GDML geometry description or channel mapping
software must be tested with it.
To run the test in the current geometry, one would run:

    lar -c test_geometry_icarus.fcl

after setting up the desired version of `icaruscode` (e.g.
`setup icaruscode v09_15_00 -q e19:prof`; any qualifier will do).
This test is supposed to succeed, or otherwise that geometry/channel
mapping would not be the default one!
That configuration can be used as a template to test other geometries,
or to selectively run tests, or even to enable the thorough ROOT
geometry overlap test (which takes many, many minutes to complete).


Selecting a geometry
---------------------

Configurations using the current default geometry will have to configure
the relevant services: the recommended way is:

    #include "icarus_geometry.fcl" 

    # ...

    services: {

      @table::icarus_geometry_services

      # ...
    }

The configuration file
[`icarusalg/Geometry/geometry_icarus.fcl`](https://github.com/SBNSoftware/icarusalg/blob/develop/icarusalg/Geometry/geometry_icarus.fcl)
defines and describes other options (look at the documentation at top of the file).

If a specific geometry is needed in a job configuration that has already
configured a different one, the following patterns can be used to select
the desired geometry.


### Legacy configurations

For some breaking changes, legacy configurations are provided for a while,
which help bridging the gap of the breaking change.

The following table describes the bundles available to process samples
with a geometry of a specified version.
If you are in the situation where you have an input file processed
with a different geometry version you will want to add to your configuration
a legacy geometry configuration from the table below
making sure that `icaruscode` you are _currently_ using is listed in the availability column.
For example, if your `simulation_genie_icarus_bnb_v09_09_02.root` was generated
with `icaruscode` `v09_09_02` (and, according to the paragraph above,
with a geometry version `icarus_splitwires`), you may use `icaruscode` `v09_19_00`
and the geometry configuration preset `icarus_geometry_services_legacy_icarus_splitwires`
found in there:
    
    services: {
      @table::services                                           # all existing services are replicated
      @table::icarus_geometry_services_legacy_icarus_splitwires  # overwrite the complete geometry configuration
    }
    

Versions are listed and explained in the [paragraph above](#geometry-description-versions).

| applies to samples with | availability | configuration bundle name                                         | notes                                  |
| ----------------------- | ------------ | ----------------------------------------------------------------- | -------------------------------------- |
| `icarus_v3`             | `v09_53_02`  | `icarus_geometry_services_legacy_icarus_v3`                       | standard configuration (no overburden) |
| `icarus_v2`             | `v09_25_00`  | `icarus_geometry_services_legacy_icarus_v2`                       | standard configuration (no overburden) |
|                         |              | `icarus_geometry_services_no_overburden_legacy_icarus_v2`         | no overburden (same as standard)       |
|                         |              | `icarus_geometry_services_overburden_legacy_icarus_v2`            | with 3-m concrete overburden           |
| `icarus_splitwires`     | `v09_19_02`  | `icarus_geometry_services_legacy_icarus_splitwires`               | standard configuration (no overburden) |
|                         |              | `icarus_geometry_services_no_overburden_legacy_icarus_splitwires` | no overburden (same as standard)       |
|                         |              | `icarus_geometry_services_overburden_legacy_icarus_splitwires`    | with 3-m concrete overburden           |

The configuration bundes can be used with the `@table::` syntax as described above.
Remember that legacy configurations may be retired after a while.
In such cases, reverting to a previous `icaruscode` version
is the only way to properly process the legacy samples.

There may also be drop-in configuration files setting up a legacy geometry (and possibly other settings proper for their legacy context).
Instructions to use them are provided in the [following section](#drop-in-configurations). The available drop-in configurations for legacy geometries are:

name                                              | introduced  | removed     | description                                                            
------------------------------------------------- | ----------- | ----------- | ---------------------------------------------------------------------- 
`services_compat_icarus_v3.fcl`                   | `v09_53_02` |             | `icarus_v3` default geometry (i.e. no overburden)



### Drop-in configurations

Geometry can be selected by including one of the predefined
configurations defined in
[`icarusalg/Geometry/geometry_icarus.fcl`](https://github.com/SBNSoftware/icarusalg/blob/develop/icarusalg/Geometry/geometry_icarus.fcl),
which also has documentation on how to do that.
For some selected geometry configurations, drop-in FHiCL files are also
available which change the geometry of a job configuration into a
different one.
For example, say you need to run a cosmic ray generation job as defined
by `prodcorsika_standard_icarus.fcl`
([`fcl/gen/corsika/prodcorsika_standard_icarus.fcl`](https://github.com/SBNSoftware/icaruscode/blob/develop/fcl/gen/corsika/prodcorsika_standard_icarus.fcl)),
but with a geometry including the overburden.
Your job configuration file can be:

    #include "prodcorsika_standard_icarus.fcl" 
    #include "use_overburden_geometry_icarus.fcl"

where we have used the drop-in configuration
`use_overburden_geometry_icarus.fcl`
([`icarusalg/Geometry/use_overburden_geometry_icarus.fcl`](https://github.com/SBNSoftware/icarusalg/blob/develop/icarusalg/Geometry/use_overburden_geometry_icarus.fcl)).
_[note that there is a `prodcorsika_overburden_icarus.fcl` for this
specific example...]_

The available drop-in configurations for geometry options are:

name                                              | introduced  | removed     | description                                                            | defaults: `v08_52_00`
------------------------------------------------- | ----------- | ----------- | ---------------------------------------------------------------------- | ----------------
`use_overburden_geometry_icarus.fcl`              | `v08_52_00` | `v09_53_02` | default geometry with the addition of concrete overburden              | _9-m first induction plane wires_
`use_nooverburden_geometry_icarus.fcl`            | `v08_52_00` | `v09_53_02` | default geometry but without the concrete overburden                   | _9-m first induction plane wires_
`use_singlewire_geometry_icarus.fcl`              | `v08_52_00` | `v09_32_01` | 18-m first induction plane wires geometry with default overburden      | _no overburden_
`use_singlewire_nooverburden_geometry_icarus.fcl` |             |             | 18-m first induction plane wires without the concrete overburden
`use_singlewire_overburden_geometry_icarus.fcl`   |             |             | 18-m first induction plane wires geometry with the concrete overburden
`use_splitwire_geometry_icarus.fcl`               | `v08_52_00` | `v09_53_02` | 9-m first induction plane wires geometry with default overburden       | _no overburden_
`use_splitwire_nooverburden_geometry_icarus.fcl`  |             |             | 9-m first induction plane wires without the concrete overburden
`use_splitwire_overburden_geometry_icarus.fcl`    |             |             | 9-m first induction plane wires geometry with the concrete overburden

> **Note**: detector geometry description files have been moved
> from [`icaruscode`](https://github.com/SBNSoftware/icaruscode/blob/develop/icaruscode/Geometry/gdml)
> into [`icarusalg`](https://github.com/SBNSoftware/icarusalg/blob/develop/icarusalg/Geometry/gdml)
> starting with ICARUS software release `v09_06_00` (October 2020).

### Geometry compatibility checks

With LArSoft `v09_12_00`, `Geometry` service will perform a consistency check
between the input file and the job configuration: the idea is that the geometry
configured in the current job must be "compatible" with the one that was used
to create the input file. If the check fails, an exception will be thrown like:

    %MSG-s ArtException:  PostEndJob 01-Jun-2021 20:59:45 CDT ModuleEndJob
    ---- EventProcessorFailure BEGIN
      EventProcessor: an exception occurred during current event processing
      ---- Geometry BEGIN
        Geometry used for run run: 5729 is incompatible with the one configured in the job!
        === job configuration ==================================================
        Geometry information version: 2
        Detector name:               'icarus_splitwires'
        Full configuration:
        --------------------------------------------------------------------------------
        ChannelMapping: {
          WirelessChannels: {
              CollectionEvenPostChannels: 96
              CollectionEvenPreChannels: 64
              CollectionOddPostChannels: 64
              CollectionOddPreChannels: 96
              FirstInductionPostChannels: 96
              FirstInductionPreChannels: 0
              SecondInductionEvenPostChannels: 64
              SecondInductionEvenPreChannels: 96
              SecondInductionOddPostChannels: 96
              SecondInductionOddPreChannels: 64
          }
          tool_type: "ICARUSsplitInductionChannelMapSetupTool"
        }
        DisableWiresInG4: true
        GDML: "icarus_complete_20201107_no_overburden.gdml"
        Name: "icarus_splitwires"
        ROOT: "icarus_complete_20201107_no_overburden.gdml"
        SurfaceY: 690
        service_type: "Geometry"
        --------------------------------------------------------------------------------
        === run configuration ==================================================
        Geometry information version: 2
        Detector name:               'icarus_v2'
        Full configuration:
        --------------------------------------------------------------------------------
        ChannelMapping: {
          WirelessChannels: {
              CollectionEvenPostChannels: 96
              CollectionEvenPreChannels: 64
              CollectionOddPostChannels: 64
              CollectionOddPreChannels: 96
              FirstInductionPostChannels: 96
              FirstInductionPreChannels: 0
              SecondInductionEvenPostChannels: 64
              SecondInductionEvenPreChannels: 96
              SecondInductionOddPostChannels: 96
              SecondInductionOddPreChannels: 64
          }
          tool_type: "ICARUSsplitInductionChannelMapSetupTool"
    }
        DisableWiresInG4: true
        GDML: "icarus_complete_20210311_no_overburden_rotUV.gdml"
        Name: "icarus_v2"
        ROOT: "icarus_complete_20210311_no_overburden_rotUV.gdml"
        SurfaceY: 690
        service_type: "Geometry"
        --------------------------------------------------------------------------------
        ========================================================================
      ---- Geometry END
    ---- EventProcessorFailure END
    ---- FatalRootError BEGIN
      Fatal Root Error: TTree::SetEntries
      Tree branches have different numbers of entries, eg art::TriggerResults_TriggerResults__Trigger. has 0 entries while EventAuxiliary has 50 entries.
      ROOT severity: 2000
    ---- FatalRootError END
    %MSG

In this case, a ICARUS data file (from run 5729) had been decoded with a newer version
of `icaruscode` (`v09_22_00`) which used a geometry with "detector name" `icarus_v2`.
The job producing the message, though, was from `icaruscode` `v09_17_00` and, as such,
configured with the geometry named `icarus_splitwires`.
The error message has two exceptions. The first is from `Geometry` service, informing
about the failure of the check, of the `Geometry` service configuration of the job being run
(`job configuration`) and the one found in the input file (`run configuration`,
referring to the fact that the input file keeps the geometry check information in each
`art::Run`). The second exception is a consequence of the first one and does not contain
any relevant information.
The strongly recommended solution is to solve the inconsistency. In this case, it may be
a request to ICARUS production for reprocessing the data of the run with a more modern
`icaruscode` release or, conversely, to configure the current job to use a
[legacy geometry](#legacy-configurations) or, if at all possible, use an older release of
`icaruscode` (which is, sadly, the safest bet).
In case of simulated samples, plain reprocessing is not possible because the very first
stage (generation) is already bound to a specific geometry; in that case, new samples
should be generated or requested.
Only when knowing exactly the implications and consequences, the check should be just
bypasssed: in that way, physics results are almost always going to be incorrect.


Where is located everything?
-----------------------------

A LArSoft module (analyzer) is available which produces an outline of
the location and characteristics of the main elements of the detector:
after setting up the desired version of `icaruscode` (e.g.
`setup icaruscode v09_15_00 -q e19:prof`),

    lar -c dump_icarus_geometry.fcl

will create a text file (in `icaruscode` `v09_15_00` it is called
`ICARUS-geometry.txt`) with information about wires, TPC's, optical
detectors, auxiliary detectors (i.e. CRT) etc. in a human-readable form.
By changing the configuration (in particular, `services.Geometry.ROOT`
and `services.Geometry.GDML` parameters), alternative geometries can be
dumped.

Another LArSoft module connects all wires and all optical detectors with
a channel number:

    lar -c dump_icarus_channelmap.fcl

(which in `icaruscode` `v09_15_00` it is called `icarus_channelmap.txt`).

ICARUS geometry update was described in [SBN DocDB 21693](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=21693) (April 2021).


### Access to the `Geometry` service via Python

It is possible to interact with LArSoft and ICARUS service providers via Python.
With a fully set up `icaruscode` in the working area, the geometry provider ([`geo::GeometryCore`](https://nusoft.fnal.gov/larsoft/doxsvn/html/classgeo_1_1GeometryCore.html))
can be initialized with the standard ICARUS configuration via:
```.py
from ICARUSservices import ServiceManager
geom = ServiceManager.get('Geometry')
```
For example, to get the standard geometry dump the statement `print(geom.Info())` can be used.
The bridge between the C++ code and Python is provided by `cppyy` library, which defines also what can be expected to work and what shouldn't.

Examples are available in [a specific wiki page](interfaces/python/geometry_examples.md).


### Booster Neutrino Beam target and decay pipe

Roughly, the BNB target is about 600 m upstream of the detector, i.e. at `( 0, 0, -60000 )` cm.

> **TODO** people with more exact knowledge feel free to add it here (also mentioning `icaruscode` version when referring to world coordinates)


### Neutrinos from Main Injector target and decay pipe (NuMI)

ICARUS position w.r.t. NuMI coordinates is described in [SBN DocDB 22998](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=22998) (August 2021).
Detector position for MC was updated in the [`icaruscode` pull request #230](https://github.com/SBNSoftware/icaruscode/pull/230)/

## Information phased out of this wiki

The following information has been removed from this page; look for it in GIT history if needed.

* [`icaruscode` versions `v08_51_00` and earlier](https://github.com/SBNSoftware/SBNSoftware.github.io/blob/83a33e9236c4a88babd003627a62b87a279c3a6b/icaruscode_wiki/Detector_geometry.md)


