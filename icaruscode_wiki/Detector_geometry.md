---
layout: page
title: ICARUS detector geometry description
description: Description of the detector geometry settings available for ICARUS
toc: true
---


Geometry description versions
------------------------------

Detector geometry description is currently stored in GDML format as a
text file in
[icaruscode/Geometry/gdml](https://github.com/SBNSoftware/icaruscode/blob/develop/icaruscode/Geometry/gdml)
directory.


| version  | introduced  | default     | file path                                                     | description
| -------- | ----------- | ----------- | ------------------------------------------------------------- | ------------
|          | `v08_45_00` | `v08_50_02` | `icaruscode/Geometry/gdml/icarus_complete_no_overburden.gdml` | complete geometry, first induction plane wires 9 m, with no concrete overburden
|          | `v08_44_00` |             | `icaruscode/Geometry/gdml/icarus_complete.gdml`               | complete geometry, first induction plane wires 9 m, with concrete overburden
|          | `v08_44_00` | `v08_44_00` | `icaruscode/Geometry/gdml/icarus_single_complete_no_overburden.gdml` | complete geometry, first induction plane wires 18 m, with no concrete overburden
|          | `v08_44_00` |             | `icaruscode/Geometry/gdml/icarus_single_complete.gdml`        | complete geometry, first induction plane wires 18 m, with concrete overburden

### Older versions

| version | introduced  | default     | removed     | file path                                                     | description
| ------- | ----------- | ----------- | ----------- | ------------------------------------------------------------- | ------------------------------
|         | `v08_44_00` |             | `v08_45_00` | `icaruscode/Geometry/gdml/icarus_complete_no_overburden.gdml` | complete geometry, first induction plane wires 9 m, with half concrete overburden (bug)
|         | `v08_41_00` |             | `v08_44_00` | `icaruscode/Geometry/gdml/icarus_complete_no_overburden.gdml` | complete geometry, first induction plane wires 18 m, with no concrete overburden
|         | `v08_30_00` | `v08_30_00` | `v08_44_00` | `icaruscode/Geometry/gdml/icarus_complete_light.gdml`         | `icarus_complete.gdm`, "temporary" version with niobium and molybdenum components of steel removed
|         | ...         | ...         | `v08_41_00` | `icaruscode/Geometry/gdml/icarus_complete.gdml`               | complete geometry: TPC (first induction plane wires 18 m), PMT, CRT, concrete overburden


### Testing a new version of the geometry description

LArSoft provides a geometry test module with a decent coverage
for geometry and channel mapping functions.
A new version of GDML geometry description or channel mapping
software must be tested with it.
To run the test in the current geometry, one would run:

    lar -c test_geometry_icarus.fcl

after setting up the desired version of `icaruscode` (e.g.
`setup icaruscode v08_34_00 -q e17:prof`; any qualifier will do).
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
[`icaruscode/Geometry/icarus_geometry.fcl`](https://github.com/SBNSoftware/icaruscode/blob/develop/icaruscode/Geometry/icarus_geometry.fcl)
defines and describes other options (look at the documentation at top of the file).

If a specific geometry is needed in a job configuration that has already
configured a different one, the following patterns can be used to select
the desired geometry.


### `icaruscode` versions `v08_52_00` and later

Geometry can be selected by including one of the predefined
configurations defined in
[`icaruscode/Geometry/geometry_icarus.fcl`](https://github.com/SBNSoftware/icaruscode/blob/develop/icaruscode/Geometry/geometry_icarus.fcl),
which also has documentation on how to do that.
For some selected geometry configurations, drop-in FHiCL files are
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
([`icaruscode/Geometry/use_overburden_geometry_icarus.fcl`](https://github.com/SBNSoftware/icaruscode/blob/develop/icaruscode/Geometry/use_overburden_geometry_icarus.fcl)).
_[note that there is a `prodcorsika_overburden_icarus.fcl` for this
specific example...]_

The available drop in configurations are:

name                                              | introduced  | description                                               | defaults: `v08_52_00`
------------------------------------------------- | ----------- | --------------------------------------------------------- | ----------------
`use_overburden_geometry_icarus.fcl`              | `v08_52_00` | default geometry with the addition of concrete overburden | _9-m first induction plane wires_
`use_nooverburden_geometry_icarus.fcl`            | `v08_52_00` | default geometry but without the concrete overburden      | _9-m first induction plane wires_
`use_singlewire_geometry_icarus.fcl`              | `v08_52_00` | 18-m first induction plane wires geometry with default overburden | _no overburden_ _(see note below)_
`use_singlewire_nooverburden_geometry_icarus.fcl` | `v08_52_00` | 18-m first induction plane wires without the concrete overburden | _(see note below)_
`use_singlewire_overburden_geometry_icarus.fcl`   | `v08_52_00` | 18-m first induction plane wires geometry with the concrete overburden | _(see note below)_
`use_splitwire_geometry_icarus.fcl`               | `v08_52_00` | 9-m first induction plane wires geometry with default overburden | _no overburden_
`use_splitwire_nooverburden_geometry_icarus.fcl`  | `v08_52_00` | 9-m first induction plane wires without the concrete overburden
`use_splitwire_overburden_geometry_icarus.fcl`    | `v08_52_00` | 9-m first induction plane wires geometry with the concrete overburden

> **Note: breaking change with respect to `v08_50_02` and earlier**: 
> the configurations `use_overburden_geometry_icarus.fcl` and
> `use_nooverburden_geometry_icarus.fcl` used to directly select a
> specific geometry. Now they rely on what is defined as "default"
> geometry in [`icaruscode/Geometry/geometry_icarus.fcl`](https://github.com/SBNSoftware/icaruscode/blob/develop/icaruscode/Geometry/geometry_icarus.fcl)
> for their respective categories (for example, in `v08_52_00`
> both geometries default to the split 9-m long wire versions).

> **Note**:  PMT channel mapping is also different in the two geomety types:
> if photon visibility is needed (`PhotonVisibilityService`)
> and a old photon library (like the one from August 2018) is being used,
> it needs a specific configuration; this is for _the_ August 2018 photon library:
>     
>     PhotonVisibilityService: @local::icarus_legacy_photonvisibilityservice_v08_50_00
>     
> A complete service configuration for that purpose is also provided
> (**as-is**!) as `icarus_legacy_services_v08_50_00` in
> [`fcl/services/services_icarus_simulation.fcl`](https://github.com/SBNSoftware/icaruscode/blob/develop/fcl/services/services_icarus_simulation.fcl),
> that can be used as
>
>     services: @local::icarus_legacy_services_v08_50_00
>
> and pulls in most ICARUS simulation services, but still requires careful check.



### `icaruscode` versions `v08_51_00` and earlier

Geometry can be selected by including one of the predefined
configurations defined in
[source:icaruscode/Geometry/geometry_icarus.fcl](https://github.com/SBNSoftware/icaruscode/blob/develop/icaruscode/Geometry/geometry_icarus.fcl),
which also has documentation on how to do that.
The procedures are the same as documented for the newer versions.
The drop-in configurations also work as above, but with two relevant
differences.
First, fewer configurations are available here, changing only the
overburden setting.
Second, each of the drop in configurations explicitly selects a specific
geometry (namely, the one with single 18-m long wires on the first
induction plane).

The available drop in configurations are:

name                                   | introduced  | description
-------------------------------------- | ----------- | ---------------------------------------------------------------------
`use_overburden_geometry_icarus.fcl`   | `v08_44_00` | 18-m first induction plane wires geometry with concrete overburden
`use_nooverburden_geometry_icarus.fcl` | `v08_44_00` | 18-m first induction plane wires geometry without concrete overburden


Where is located everything?
-----------------------------

A LArSoft module (analyzer) is available which produces an outline of
the location and characteristics of the main elements of the detector:
after setting up the desired version of `icaruscode` (e.g.
`setup icaruscode v08_34_00 -q e17:prof`),

    lar -c dump_icarus_geometry.fcl

will create a text file (in `icaruscode` `v08_36_00` it is called
`ICARUS-geometry.txt`) with information about wires, TPC's, optical
detectors, auxiliary detectors (i.e. CRT) etc. in a human-readable
form.
By changing the configuration (in particular, `services.Geometry.ROOT`
and `services.Geometry.GDML` parameters), alternative geometries can be
dumped.

Another LArSoft module connects all wires and all optical detectors with
a channel number:

    lar -c dump_icarus_channelmap.fcl

(which in `icaruscode` `v08_36_00` it is called `icarus_channelmap.txt`).
