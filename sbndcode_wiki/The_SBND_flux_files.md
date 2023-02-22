---
layout: page
title: The SBND flux files
subtitle: Description of the SBND flux files
image: sbndcode_wiki/sbnd_logo.png
description: All about flux files
hero_height: is-medium
# menubar: sbndcode_menu
toc: true
toc_title: SBND Code Contents
---


The SBND flux files
==========================================================


Neutrino flux
----------------------------------------------

While flux has a [specific meaning in general
physics](https://en.wikipedia.org/wiki/Flux), neutrino
physicists normally use "flux: as shorthand when referring to the
neutrino rays impinging on a detector, often from a beam-line. "Flux"
does also get used in a more literal sense to describe the number of
neutrinos passing through a unit area, particularly relevant when
measuring a cross-section.



The SBND flux files
------------------------------------------------------------

In a nutshell, each flux file contains a tree where each entry describes
a neutrino as it passes through a 2D window (usually) defined to be
upstream of a detector. LArSoft's implementation of GENIE randomly
samples these neutrino rays to generate interactions in a detector
volume.
How the flux files are produced changed in 2017 but they are still used
in LArSoft/sbndcode in exactly the same way. More information about how
the flux files used to be generated and how they are generated now can
be found in [docdb
5672](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=5672)



Where to find the flux files and beam configurations
----------------------------------------------------------------------------------------------------------------------------

All of the flux files live on dcache as the files need to be readily
available when running grid jobs. All are stored in subdirectories of
the following location:

```bash
/pnfs/sbnd/persistent/stash/fluxFiles
```

The files are separated into several categories: 
- _BooNEToGSimple_ (which are the newest and recommended kind of BNB flux file), the older gsimple type (which were are the older flux files and were generated using NuMI style decay algorithms) and the raw files used in the generation of the former two categories.
- _BooNE_ The original flux files in BooNE ntuple format.

The flux files are further separated into "configurations" which
describe a particular setup. The configuration encapsulates all of the
necessary parameters used in propagating the neutrinos from their
parent's decay point to the flux window they pass through. The amount
of associated parameters would make the directory structure unwieldy so
each configuration is given a unique identifier with a quantitive
description given in the gsimple XML file and a more qualitative
description given on this wiki page below.

```bash
/pnfs/sbnd/persistent/stash/fluxFiles/bnb/BooNEtoGSimple/configD-v1/april07/neutrinoMode
```

In each of the configuration directories, XML files are located which
describe the flux window the neutrinos are propagated to.

An example location is:

```bash
/pnfs/sbnd/persistent/stash/fluxFiles/bnb/BooNEtoGSimple/configD-v1/configD-v1.xml
```

In all cases the XML file accurately describes the flux window but the
XML files were used in a literal sense only in the older gsimple files.
For the older gsimple files, the main XML file is stored in the sbndutil
repository along with the request files used to generate the gsimple
files.


What configuration to use?
-----------------------------------------------------------------------------------------
These are the latest and (at the time of writing) more accurate flux configurations to use.
- **Small window** (used for most productions): **configH**
- **Large window** (used for the dirt events production): **configI**


A note about pre H configurations
-----------------------------------------------------------------------------------------

The beam centre is in the incorrect place along the X-axis for all
configuration prior to H; For configurations prior to F/G, 
it is shifted too far along the +ve x-axis (1.3m rather than 0.457m). 1.3m
is actually the beam's x-centre in the uboone coordinate system.
For the F and G configurations, it was placed at 45.7 cm, but the offeset
should instead be -73.78 cm according to the latest design.



Beam configurations
----------------------------------------------------------



### ConfigA-100m-v1

The baseline length (target to SBND TPC distance) for this configuration
is 100 m. Additionally, the beam's axis is offset to the SBND origin
such that the beam centre is at +1.3 m along the x-axis in SBND's
coordinate system.
The flux window is defined to be somewhat larger than the SBND TPC
volume; a 10 m x 10 m flux window but is positioned such that the
beam's axis cuts through the exact centre of the flux window.
Additionally, the flux window is placed 10 m upstream of the SBND TPC
front face.



### ConfigB-v1

This configuration copies the settings from ConfigA-100m-v1 but uses a
110 m baseline.



### ConfigC-v1

This configuration copies the settings from ConfigB-v1 but uses a very
very large flux window (80 m x 80 m) flux window pressed up against the
front face of the TPC. The flux files produced with this beam
configuration should be used for event generation which includes
dirt-based interactions. The reason for placing the flux window up
against the TPC is that it's possible to ask GENIE to push rays back
along Z when generating interactions in the volume. The idea is that
it's better to leave the flux window in some well known location and
then have whatever generator you are using decide how far upstream the
flux rays actually start.



### ConfigD-v1

Files were produced using BooNEtoGSimple. The file uses an identical
window setup to ConfigB-v1. A new config has been used due to a newer
flux generation method.



### ConfigE-v1

Files were produced using BooNEtoGSimple. The file uses an identical
window setup to ConfigC-v1. A new config has been used due to a newer
flux generation method.



### ConfigF-v1

Files were produced using BooNEtoGSimple. The centre of the window has
been shifted along X so that it is inline with the engineer drawings
(the X,Y beam centre is now at (0.457, 0) rather than (1.3,0)), but
otherwise uses an identical window setup to ConfigD-v1.



### ConfigG-v1

Files were produced using BooNEtoGSimple. The centre of the window has
been shifted along X so that it is inline with the engineer drawings
(the X,Y beam centre is now at (0.457, 0) rather than (1.3,0)), but
otherwise uses an identical window setup to ConfigE-v1.


### ConfigH-v1

Files were produced using BooNEtoGSimple. The centre of the window has
been changed from `(X, Y) = (45.7, 0) cm` to `(X, Y) = (-73.78, 0) cm`,
as in the current design. Check [sbndcode PR #95](https://github.com/SBNSoftware/sbndcode/pull/95)
for more details. Otherwise, it uses an identical window setup to ConfigF-v1.


### ConfigI-v1

Files were produced using BooNEtoGSimple. The centre of the window has
been changed from `(X, Y) = (45.7, 0) cm` to `(X, Y) = (-73.78, 0) cm`,
as in the current design. Otherwise, it uses an identical window setup to ConfigG-v1.


### ConfigJ-v1

Files were produced using BooNEtoGSimple. 
The flux file now includes a variables called vtx that stores kaon time of flight and neutrino time of flight from production to flux window.
Check [sbndcode PR #??]() and sbn-docdb#?? for more details. 
Otherwise, it uses an identical window setup to ConfigH-v1.
