---
layout: page
title: Detector Geometry
---



SBND Detector Geometry
================================================================

Detector description files are stored in GDML format in the
`sbndcode/Geometry/gdml` directory.
The file name is `sbnd_<PATCHLEVEL>.gdml` (`<PATCHLEVEL>` is reported in
the namesake column of the table below).

The "standard" configuration of SBND geometry is contained in the
`sbnd_geometry_services` configuration bundle, and in particular in the
`sbnd_geo_source`, in `sbndcode/Geometry/geometry_sbnd.fcl` file. The
name of the GDML file loaded by LArSoft geometry is printed on the
console when the `Geometry` service is initialised or updated.

> A "no wires" version is present for each regular one, which has no
> TPC wires. This special file is not processed by LArSoft geometry but
> is intended to be used for Geant4 simulation, where the presence of
> wires has been shown to strongly slow down the simulation for little
> physics gain.

> NOTE: Files produced with a version of `sbndcode` prior to `v09_25_00_01`
> cannot be analyzed with `v09_25_00_01` or higher, as the geometry
> `v02_00` is a breaking change. To analyze old files, you need to add
> the following at the end of your fcl file in order to set the old geometry:
```
services.Geometry.GDML: "sbnd_v01_05.gdml"
services.Geometry.ROOT: "sbnd_v01_05.gdml"
services.AuxDetGeometry.GDML: "sbnd_v01_05.gdml"
services.AuxDetGeometry.ROOT: "sbnd_v01_05.gdml"
```

  | Series | Variant | Patch level | Present in `sbndcode`      |  Default in `sbndcode`     | Description                               
  |--------|---------|-------------|----------------------------|----------------------------|---------------------------------------
  |`2`     | `2.0`   | `v02_00`    | `v09_25_00_01` to `develop`| `v09_25_00_01` | Description
  |`1`     | `1.5`   | `v01_05`    | `v09_01_00` to `develop`  | `v09_01_00` | `v01_04` + Description
  |`1`     | `1.4`   | `v01_04`    | `v08_36_01_1_MCP2_0` to `v09_25_00_01` | `v08_36_01_1_MCP2_0`| `v01_03` - bars + X-ARAPUCAs + field cage
  |`1`     | `1.3`   | `v01_03`    | `v08_13_00` to `v09_25_00_01` | `v08_35_00` to `v08_36_01`| `v01_02` + semi-sphere PMTs model + 5 PMTs per APA window
  |`1`     | `1.2`   | `v01_02`    | `v06_64_00` to `v09_25_00_01` |                 | `v01_01` + arapuca, light bars and foils
  |`1`     | `1.1`   | `v01_01`    | `v06_48_00_MCC` to `v09_25_00_01` | `v06_48_00_MCC` | baseline + overburden
  |`1`     | `1.0`   | `v01_00_01` | `v06_46_00` to `v06_47_00` |                            | Two TPCs, with CRT, without overburden (baseline)
  |`1`     | `1.0`   | `v01_00`    | `v06_46_00` to `v06_47_00` | `v06_46_00` to `v06_48_00` | Two TPCs, with CRT, without overburden (bugged baseline: no CPA and APA)

Versions prior to 1.0 are not documented here.

Questions about the geometry? Post them in the #sbnd_geometry Slack channel, or contact [Gustavo Valdiviesso](mailto:gustavo.valdiviesso@unifal-mg.edu.br), [Marina Reggiani-Guzzo](mailto:marina.reggianiguzzo@postgrad.manchester.ac.uk), and [Marco Del Tutto](mailto:mdeltutt@fnal.gov).
