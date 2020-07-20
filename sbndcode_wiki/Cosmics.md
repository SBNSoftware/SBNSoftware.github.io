---
lang: en
title: Cosmics
---



Cosmic-ray generation (under-development, but good enough for preliminary studies)
=====================================================================================================================================================================================



How to generate cosmic events 
------------------------------------------------------------------------------

100 events in the examples:

-   CRY:

        lar -c prodcosmics_cry_sbnd.fcl -n 100

    \
    will produce a
    `prodcosmics_cry_sbnd_CosmicsGen-YearMoDaThhmmss.root` *art* ROOT
    output file (and a similarly-named histogram files with suffix
    `_hists.root`)

-   CORSIKA:

        lar -c prodcosmics_corsika_sbnd.fcl -n 100

    \
    will produce a
    `prodcosmics_corsika_sbnd_CosmicsGen-YearMoDaThhmmss.root` *art*
    ROOT output file (and a similarly-named histogram files with suffix
    `_hists.root`). It will need access to dCache (and, likely, a
    [certificate proxy](Get_a_certificate_proxy.html)).


-   Job Configuration FHiCL files (in `sbndcode/JobConfigurations` as
    usual):

  ------------------------- --------------------------------
  Cry Generation file       `prodcosmics_cry_sbnd.fcl`
  CORSIKA Generation file   `prodcosmics_corsika_sbnd.fcl`
  ------------------------- --------------------------------



### Cry parameters 

Full module configuration is in `cry_sbnd.fcl` (from
`sbndcode/LArSoftConfigurations`), and it can be included in your job by
adding to the producers list:\

    generator: @local::sbnd_cry

Configuration is customised by:\

    physics.producers.generator.BufferBox: [ -250.0, +250.0, -250.0, +250.0, -250.0, +250.0 ]

Buffer box around the boundaries of the cryostat. These are the
dimensions \[-x. +x, -y, +y, -z + z\] added to the cryostat boundaries
that can intercept (hence keep for the simulation) the trajectory of the
primary cosmic rays. The larger the buffer box, the longer the
simulation will take. This has to be optimised with the level on
precision on the rate you need. However, due to the fact that CRY is
already know to produce significantly lower rates, this should be
negligible (to confirm with studies?).



### CORSIKA parameters 

Full module configuration is in `corsika_sbnd.fcl` (from
`sbndcode/LArSoftConfigurations`), and it can be included in your job by
adding to the producers list:\

    generator: @local::sbnd_corsika_cmc

This tells CORSIKA which generation model to use for the simulation (CMC
or p).\
CMC will use the composite model of several primary nuclei (p, He, \...)
to produce the cosmic rays.\
p will generate only primary protons.

    physics.producers.generator.BufferBox: [ -250.0, +250.0, -250.0, +250.0, -250.0, +250.0 ]

(same as with CRY)

------------------------------------------------------------------------

*For questions, contact [Roxanne
Guenette](mailto:Roxanne.Guenette@physics.ox.ac.uk) .*
