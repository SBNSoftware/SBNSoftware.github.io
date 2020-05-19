---
lang: en
title: Detector geometry
---

[]{#ICARUS-detector-geometry-description}

ICARUS detector geometry description[¶](#ICARUS-detector-geometry-description){.wiki-anchor}
============================================================================================

-   **Table of contents**
-   [ICARUS detector geometry
    description](#ICARUS-detector-geometry-description)
    -   [Geometry description versions](#Geometry-description-versions)
        -   [Testing a new version of the geometry
            description](#Testing-a-new-version-of-the-geometry-description)
    -   [Selecting a geometry](#Selecting-a-geometry)
        -   [icaruscode versions version:v08\_52\_00 and
            later](#icaruscode-versions-versionv08_52_00-and-later)
        -   [icaruscode versions version:v08\_51\_00 and
            earlier](#icaruscode-versions-versionv08_51_00-and-earlier)
    -   [Where is located everything?](#Where-is-located-everything)

[]{#Geometry-description-versions}

Geometry description versions[¶](#Geometry-description-versions){.wiki-anchor}
------------------------------------------------------------------------------

Detector geometry description is currently stored in GDML format as a
text file in
[source:icaruscode/Geometry/gdml](/redmine/projects/icaruscode/repository/entry/icaruscode/Geometry/gdml){.source}
directory.

  version   introduced                                        default                                           removed   file path                                                                                                                                                                                                                                      description
  --------- ------------------------------------------------- ------------------------------------------------- --------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------
            [v08\_45\_00](/redmine/versions/2121){.version}   [v08\_50\_02](/redmine/versions/2119){.version}             [[source:icaruscode/Geometry/gdml/icarus\_complete\_no\_overburden.gdml](/redmine/projects/icaruscode/repository/entry/icaruscode/Geometry/gdml/icarus_complete_no_overburden.gdml){.source}]{style="font-style: monospace;"}                  complete geometry, first induction plane wires 9 m, with no concrete overburden
            [v08\_44\_00](/redmine/versions/2085){.version}                                                               [[source:icaruscode/Geometry/gdml/icarus\_complete.gdml](/redmine/projects/icaruscode/repository/entry/icaruscode/Geometry/gdml/icarus_complete.gdml){.source}]{style="font-style: monospace;"}                                                complete geometry, first induction plane wires 9 m, with concrete overburden
            [v08\_44\_00](/redmine/versions/2085){.version}   [v08\_44\_00](/redmine/versions/2085){.version}             [[source:icaruscode/Geometry/gdml/icarus\_single\_complete\_no\_overburden.gdml](/redmine/projects/icaruscode/repository/entry/icaruscode/Geometry/gdml/icarus_single_complete_no_overburden.gdml){.source}]{style="font-style: monospace;"}   complete geometry, first induction plane wires 18 m, with no concrete overburden
            [v08\_44\_00](/redmine/versions/2085){.version}                                                               [[source:icaruscode/Geometry/gdml/icarus\_single\_complete.gdml](/redmine/projects/icaruscode/repository/entry/icaruscode/Geometry/gdml/icarus_single_complete.gdml){.source}]{style="font-style: monospace;"}                                 complete geometry, first induction plane wires 18 m, with concrete overburden

*Older versions:*

  version   introduced                                        default                                           removed                                           file path                                                                                                                                                                                                                       description
  --------- ------------------------------------------------- ------------------------------------------------- ------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------------------------------------
            [v08\_44\_00](/redmine/versions/2085){.version}                                                     [v08\_45\_00](/redmine/versions/2121){.version}   [[source:icaruscode/Geometry/gdml/icarus\_complete\_no\_overburden.gdml](/redmine/projects/icaruscode/repository/entry/icaruscode/Geometry/gdml/icarus_complete_no_overburden.gdml){.source}]{style="font-style: monospace;"}   complete geometry, first induction plane wires 9 m, with half concrete overburden (bug)
            [v08\_41\_00](/redmine/versions/2084){.version}                                                     [v08\_44\_00](/redmine/versions/2085){.version}   [[source:icaruscode/Geometry/gdml/icarus\_complete\_no\_overburden.gdml](/redmine/projects/icaruscode/repository/entry/icaruscode/Geometry/gdml/icarus_complete_no_overburden.gdml){.source}]{style="font-style: monospace;"}   complete geometry, first induction plane wires 18 m, with no concrete overburden
            [v08\_30\_00](/redmine/versions/1992){.version}   [v08\_30\_00](/redmine/versions/1992){.version}   [v08\_44\_00](/redmine/versions/2085){.version}   [[source:icaruscode/Geometry/gdml/icarus\_complete\_light.gdml](/redmine/projects/icaruscode/repository/entry/icaruscode/Geometry/gdml/icarus_complete_light.gdml){.source}]{style="font-style: monospace;"}                    \"temporary\" version with niobium and molybdenum components of steel removed
            \...                                              \...                                              [v08\_41\_00](/redmine/versions/2084){.version}   [[source:icaruscode/Geometry/gdml/icarus\_complete.gdml](/redmine/projects/icaruscode/repository/entry/icaruscode/Geometry/gdml/icarus_complete.gdml){.source}]{style="font-style: monospace;"}                                 complete geometry: TPC (first induction plane wires 18 m), PMT, CRT, concrete overburden

[]{#Testing-a-new-version-of-the-geometry-description}

### Testing a new version of the geometry description[¶](#Testing-a-new-version-of-the-geometry-description){.wiki-anchor}

LArSoft provides a geometry test module with a decent coverage for
geometry and channel mapping functions.\
A new version of GDML geometry description or channel mapping software
must be tested with it.\
To run the test in the current geometry, one would run:\

    lar -c test_geometry_icarus.fcl

\
after setting up the desired version of `icaruscode` (e.g.
`setup icaruscode v08_34_00 -q e17:prof`; any qualifier will do).\
This test is supposed to succeed, or otherwise that geometry/channel
mapping would not be the default one!\
That configuration can be used as a template to test other geometries,
or to selectively run tests, or even to enable the thorough ROOT
geometry overlap test (which takes many, many minutes to complete).

[]{#Selecting-a-geometry}

Selecting a geometry[¶](#Selecting-a-geometry){.wiki-anchor}
------------------------------------------------------------

Configurations using the current default geometry will have to configure
the relevant services: the recommended way is:

    #include "icarus_geometry.fcl" 

    # ...

    services: {

      @table::icarus_geometry_services

      # ...
    }

\
The
[[source:icaruscode/Geometry/icarus\_geometry.fcl](/redmine/projects/icaruscode/repository/entry/icaruscode/Geometry/icarus_geometry.fcl){.source}]{style="font-family: monospace;"}
defines and described other options.

If a specific geometry is needed in a job configuration that has already
configured a different one, the following patterns can be used to select
the desired geometry.

[]{#icaruscode-versions-versionv08_52_00-and-later}

### `icaruscode` versions version:v08\_52\_00 and later[¶](#icaruscode-versions-versionv08_52_00-and-later){.wiki-anchor}

Geometry can be selected by including one of the predefined
configurations defined in
[source:icaruscode/Geometry/geometry\_icarus.fcl](/redmine/projects/icaruscode/repository/entry/icaruscode/Geometry/geometry_icarus.fcl){.source},
which also has documentation on how to do that.\
For some selected geometry configurations, drop-in FHiCL files are
available which change the geometry of a job configuration into a
different one.\
For example, say you need to run a cosmic ray generation job as defined
by `prodcorsika_standard_icarus.fcl`
([source:fcl/gen/corsika/prodcorsika\_standard\_icarus.fcl](/redmine/projects/icaruscode/repository/entry/fcl/gen/corsika/prodcorsika_standard_icarus.fcl){.source}),
but with a geometry including the overburden.\
Your job configuration file can be:\

    #include "prodcorsika_standard_icarus.fcl" 
    #include "use_overburden_geometry_icarus.fcl"

\
where we have used the drop-in configuration
`use_overburden_geometry_icarus.fcl`
([source:icaruscode/Geometry/use\_overburden\_geometry\_icarus.fcl](/redmine/projects/icaruscode/repository/entry/icaruscode/Geometry/use_overburden_geometry_icarus.fcl){.source}).
*\[note that there is a `prodcorsika_overburden_icarus.fcl` for this
specific example\...\]*

The available drop in configurations are:

name

introduced

description

defaults

version:v08\_52\_00

`use_overburden_geometry_icarus.fcl`

version:v08\_52\_00

default geometry with the addition of concrete overburden

*9-m first induction plane wires*

`use_nooverburden_geometry_icarus.fcl`

version:v08\_52\_00

default geometry but without the concrete overburden

`use_singlewire_geometry_icarus.fcl`

version:v08\_52\_00

18-m first induction plane wires geometry with default overburden

*no overburden*

`use_singlewire_nooverburden_geometry_icarus.fcl`

version:v08\_52\_00

18-m first induction plane wires without the concrete overburden

`use_singlewire_overburden_geometry_icarus.fcl`

version:v08\_52\_00

18-m first induction plane wires geometry with the concrete overburden

`use_splitwire_geometry_icarus.fcl`

version:v08\_52\_00

9-m first induction plane wires geometry with default overburden

*no overburden*

`use_splitwire_nooverburden_geometry_icarus.fcl`

version:v08\_52\_00

9-m first induction plane wires without the concrete overburden

`use_splitwire_overburden_geometry_icarus.fcl`

version:v08\_52\_00

9-m first induction plane wires geometry with the concrete overburden

> **Note: breaking change with respect to
> [v08\_50\_02](/redmine/versions/2119){.version} and earlier**: the
> configurations `use_overburden_geometry_icarus.fcl` and
> `use_nooverburden_geometry_icarus.fcl` used to directly select a
> specific geometry. Now they rely on what is defined as \"default\"
> geometry in
> [[source:icaruscode/Geometry/geometry\_icarus.fcl](/redmine/projects/icaruscode/repository/entry/icaruscode/Geometry/geometry_icarus.fcl){.source}]{style="font-family: monospace;"}
> for their respective categories (for example, in version:v08\_52\_00
> both geometries default to the split 9-m long wire versions).

> **Note**: none of these configurations is enough to process data files
> produced before [v08\_50\_02](/redmine/versions/2119){.version}: at
> that time, the PMT channel mapping also changed.\
> A complete service configuration for that purpose is provided
> (**as-is**!) as `icarus_legacy_services_v08_50_00` in
> [[source:fcl/services/services\_icarus\_simulation.fcl](/redmine/projects/icaruscode/repository/entry/fcl/services/services_icarus_simulation.fcl){.source}]{style="font-family: monospace;"},
> that can be used as
>
>     services: @local::icarus_legacy_services_v08_50_00
>
> but still requires careful check.

[]{#icaruscode-versions-versionv08_51_00-and-earlier}

### `icaruscode` versions version:v08\_51\_00 and earlier[¶](#icaruscode-versions-versionv08_51_00-and-earlier){.wiki-anchor}

Geometry can be selected by including one of the predefined
configurations defined in
[source:icaruscode/Geometry/geometry\_icarus.fcl](/redmine/projects/icaruscode/repository/entry/icaruscode/Geometry/geometry_icarus.fcl){.source},
which also has documentation on how to do that.\
The procedures are the same as documented for the newer versions.\
The drop-in configurations also work as above, but with two relevant
differences.\
First, fewer configurations are available here, changing only the
overburden setting.\
Second, each of the drop in configurations explicitly selects a specific
geometry (namely, the one with single 18-m long wires on the first
induction plane).

The available drop in configurations are:

  name                                     introduced                                        description
  ---------------------------------------- ------------------------------------------------- -----------------------------------------------------------------------
  `use_overburden_geometry_icarus.fcl`     [v08\_44\_00](/redmine/versions/2085){.version}   18-m first induction plane wires geometry with concrete overburden
  `use_nooverburden_geometry_icarus.fcl`   [v08\_44\_00](/redmine/versions/2085){.version}   18-m first induction plane wires geometry without concrete overburden

[]{#Where-is-located-everything}

Where is located everything?[¶](#Where-is-located-everything){.wiki-anchor}
---------------------------------------------------------------------------

A LArSoft module (analyzer) is available which produces an outline of
the location and characteristics of the main elements of the detector:
after setting up the desired version of `icaruscode` (e.g.
`setup icaruscode v08_34_00 -q e17:prof`),\

    lar -c dump_icarus_geometry.fcl

\
will create a text file (in `icaruscode` `v08_36_00` it is called
`ICARUS-geometry.txt`) with information about wires, TPC\'s, optical
detectors, auxiliary detectors (i.e. CRT) etc. in a human-readable
form.\
By changing the configuration (in particular, `services.Geometry.ROOT`
and `services.Geometry.GDML` parameters), alternative geometries can be
dumped.

Another LArSoft module connects all wires and all optical detectors with
a channel number:\

    lar -c dump_icarus_channelmap.fcl

\
(which in `icaruscode` `v08_36_00` it is called
`icarus_channelmap.txt`).
