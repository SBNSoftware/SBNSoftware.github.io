---
layout: page
title: Detector geometry
---



SBND detector geometry
================================================================

Detector description files are stored in GDML format in the
`sbndcode/Geometry/gdml` directory.\
The file name is `sbnd_<PATCHLEVEL>.gdml` (`<PATCHLEVEL>` is reported in
the namesake column of the table below).

The \"standard\" configuration of SBND geometry is contained in the
`sbnd_geometry_services` configuration bundle, and in particular in the
`sbnd_geo_source`, in `sbndcode/Geometry/geometry_sbnd.fcl` file. The
name of the GDML file loaded by LArSoft geometry is printed on the
console when the `Geometry` service is initialised or updated.

> A \"no wires\" version is present for each regular one, which has no
> TPC wires. This special file is not processed by LArSoft geometry but
> is intended to be used for Geant4 simulation, where the presence of
> wires has been shown to strongly slow down the simulation for little
> physics gain.

Versions prior to 1.0 are not documented here.

Series

Variant

Patch level

Description

Present in `sbndcode`

Default in `sbndcode`

1

By [Gustavo Valdiviesso](mailto:gustavo.valdiviesso@unifal-mg.edu.br)

1.0

Two TPCs, with CRT, without overburden

`v01_00`

(bugged baseline: no CPA and APA)

[v06\_46\_00](/redmine/versions/1340){.version} to
[v06\_47\_00](/redmine/versions/1346){.version}

[v06\_46\_00](/redmine/versions/1340){.version} to
[v06\_48\_00](/redmine/versions/1356){.version}

`v01_00_01`

*baseline*

1.1

`v01_01`

*baseline* + overburden

[v06\_48\_00\_MCC](/redmine/versions/1364){.version} to `develop`

[v06\_48\_00\_MCC](/redmine/versions/1364){.version}

1.2

`v01_02`

`v01_01` + arapuca, light bars and foils

[v06\_64\_00](/redmine/versions/1502){.version} to `develop`

By [Marina
Reggiani-Guzzo](mailto:marina.reggianiguzzo@postgrad.manchester.ac.uk)

1.3

`v01_03`

`v01_02` + semi-sphere PMTs model + 5 PMTs per APA window

[v08\_13\_00](/redmine/versions/1881){.version}

[v08\_35\_00](/redmine/versions/2055){.version} to
[v08\_36\_01](/redmine/versions/2058){.version}

1.4

`v01_04`

`v01_03` - bars + X-ARAPUCAs + field cage

[v08\_36\_01\_1\_MCP2\_0](/redmine/versions/2059){.version}

[v08\_36\_01\_1\_MCP2\_0](/redmine/versions/2059){.version}
