---
layout: page
title: MC sample descriptions
---



MC sample descriptions
================================================================

-   **Table of contents**
-   [MC sample descriptions]
    -   [Particle gun (single) samples]
        -   [prodsingle\_mu\_3GeV\_fixposupstream\_gaus20degree]
        -   [prodsingle\_mu\_3GeV\_fixposapacross\_gaus20degree]
        -   [prodsingle\_mu\_10GeV\_frontcorners\_cornertocorner]
        -   [prodsingle\_mu\_3GeV\_uniformupstream\_fixangleforwardgoing]
        -   [prodsingle\_dualmu\_5GeV\_fixposcontained\_openingangle1.0degree]
        -   [prodsingle\_electron\_50-300MeV\_fixposcentertpc1\_isotropicangle]
        -   [prodsingle\_electron\_200-1500MeV\_fixposcentertpc1\_isotropicangle]
        -   [prodsingle\_gamma\_50-300MeV\_fixposcentertpc1\_isotropicangle]
        -   [prodsingle\_gamma\_200-1500MeV\_fixposcentertpc1\_isotropicangle]
        -   [prodsingle\_mu\_100-1257MeV\_fixposcontained\_fixangle]
        -   [prodsingle\_proton\_200-2250MeV\_fixposcontained\_fixangle]
        -   [prodsingle\_pi+\_200-2250MeV\_fixposcontained\_fixangle]
        -   [prodsingle\_electron\_100-2250MeV\_fixposcontained\_fixangle.fcl]
        -   [prodsingle\_gamma\_100-2250MeV\_fixposcontained\_fixangle.fcl]
    -   [Beam (GENIE) samples]
        -   [prodgenie\_nu\_singleinteraction\_cryostat\_gsimple-configb-v1.fcl]
        -   [prodgenie\_nu\_spill\_cryostat\_gsimple-configb-v1.fcl]
        -   [prodgenie\_nu\_spill\_world\_gsimple-configc-v1.fcl]
        -   [prodgenie\_nue\_spill\_cryostat\_gsimple-configb-v1.fcl]
    -   [Cosmic ray (CORSIKA) samples]
        -   [prodcorsika\_cosmics\_cmc.fcl]
        -   [prodcorsika\_cosmics\_cmc\_frontbackcrt\_mu\_filter.fcl]
    -   [Overlayed (overlay) samples]
        -   [prodoverlay\_corsika\_cosmics\_cmc\_genie\_nu\_spill\_gsimple-configb-v1\_cryostat]
    -   [Supernova (marley) samples]
        -   [prodmarley\_nue\_fermidirac]



Particle gun (single) samples 
----------------------------------------------------------------------------



### prodsingle\_mu\_3GeV\_fixposupstream\_gaus20degree

[Details]{#collapse-8097cb59-show .collapsible
.collapsed}[Details]

::: 
A rough basis case for particle generation, useful for making quick
checks. The sample contains muons produced from a fixed position just
infront of the upstream face of TPC 2 and fired with a fixed momentum
aimed downstream. The muon\'s initial angle in both the XZ and YZ plane
is gaussian distributed with a width of 20 degrees. The central muon
angle is chosen so the trajectories are not quite parallel to the
z-axis, this reduces the number of isochronous events. The muons are
generally through going.

!(/redmine/attachments/download/37680/prodsingle_mu_1.5GeV_fixposupstream_gaus10degree_evd.larortho3d.png)
:::



### prodsingle\_mu\_3GeV\_fixposapacross\_gaus20degree

[Details]{#collapse-dc7eb08c-show .collapsible
.collapsed}[Details]

::: 
Similar to
[prodsingle\_mu\_3GeV\_fixposupstream\_gaus20degree]
but the fixed start point is chosen to be just outside of the TPC2 wall
closest to the APA plane and the initial angles are chosen such that the
track crosses the central cathode and (generally) the APA plane in TPC1.
This sample is particularly useful for cross-checking T0 measurements
from either the photon detectors or the cosmic ray taggers as, after T0
correcting the event, the tracks in each TPC should align with each
other; any offset possibly implies a mis-calibration or offset of the
applied T0.

!(/redmine/attachments/download/37681/prodsingle_mu_1.5GeV_fixposapacross_gaus10degree_evd.larortho3d.png)
:::



### prodsingle\_mu\_10GeV\_frontcorners\_cornertocorner

[Details]{#collapse-948ad891-show .collapsible
.collapsed}[Details]

::: 
The sample is designed to test low level wire characteristics for every
TPC wire. The fcl file produces a muon which is fired from an upstream
corner of one of the TPCs and fired into the opposing corner in the same
TPC. There are four possible starting corners set up in the fcl file,
one of which is chosen at random for each event. The momentum is chosen
to be very high so that the trajectories are very straight. The
principle is that when the four topologies are considered together,
every wire in every plane for both TPCs should receive an energy
deposition.

!(/redmine/attachments/download/37682/prodsingle_mu_10GeV_frontcorners_cornertocorner_evd.larotho3d_A.png)

!(/redmine/attachments/download/37683/prodsingle_mu_10GeV_frontcorners_cornertocorner_evd.larotho3d_B.png)

!(/redmine/attachments/download/37684/prodsingle_mu_10GeV_frontcorners_cornertocorner_evd.larotho3d_C.png)

!(/redmine/attachments/download/37685/prodsingle_mu_10GeV_frontcorners_cornertocorner_evd.larotho3d_D.png)
:::



### prodsingle\_mu\_3GeV\_uniformupstream\_fixangleforwardgoing

[Details]{#collapse-4d597ff5-show .collapsible
.collapsed}[Details]

::: 
The sample contains a set of straight muon trajectories which start just
in front of the upstream face of the SBND TPC, who have a starting point
which is uniformly distributed along a line parallel to the x-axis (no
variation in y) and whose momentum vector is parallel to the z-axis. The
idea is that the sample contains a set of straight tracks which are all
parallel to, but at different drift distances from, the APA planes. Such
events are handy for studying drift distance dependent effects such as
LAr impurities and electron diffusion.

!(/redmine/attachments/download/37686/prodsingle_mu_3GeV_uniformupstream_fixangleforwardgoing_evd.larotho3d.png)
:::



### prodsingle\_dualmu\_5GeV\_fixposcontained\_openingangle1.0degree

[Details]{#collapse-237738af-show .collapsible
.collapsed}[Details]

::: 
This sample contains two muons which have exactly the same
characteristics except that one of the muon\'s initial angle in the XZ
plane is slightly larger than the other. All input parameters are fixed
and include a start point inside of the TPC2 and a high initial
momentum. Each event contains both muons which simulates a mock vertex.
The sample is useful for any vertexing studies.\
NB the vertex opening angle has been picked by hand and is currently 1
degree, this could be too small for many studies and may need changing.
Please contact the manager if you require a sample with a wider opening
angle

!(/redmine/attachments/download/37687/prodsingle_dualmu_5GeV_fixposcontained_openingangle1.0degree.evd.larortho3d.png)
:::



### prodsingle\_electron\_50-300MeV\_fixposcentertpc1\_isotropicangle

[Details]{#collapse-218e4745-show .collapsible
.collapsed}[Details]

::: 
This sample contains single, fairly low momentum electrons fired
isotropically from the centre of TPC2. Useful for comparing with
[prodsingle\_gamma\_50-300MeV\_fixposcentertpc1\_isotropicangle].

!(/redmine/attachments/download/37688/prodsingle_electron_50-300MeV_fixposcentertpc1_isotropicangle.evd.larortho3d.png)
:::



### prodsingle\_electron\_200-1500MeV\_fixposcentertpc1\_isotropicangle

[Details]{#collapse-9b4dda3c-show .collapsible
.collapsed}[Details]

::: 
Same as
[prodsingle\_electron\_50-300MeV\_fixposcentertpc1\_isotropicangle]
but with a uniform momentum range of 200-1500 MeV.

!(/redmine/attachments/download/38653/prodsingle_electron_200-1500MeV_fixposcentertpc1_isotropicangle.png)
:::



### prodsingle\_gamma\_50-300MeV\_fixposcentertpc1\_isotropicangle

[Details]{#collapse-84e0146c-show .collapsible
.collapsed}[Details]

::: 
This sample contains single, fairly low momentum photons fired
isotropically from the centre of TPC2. Useful for comparing with
[prodsingle\_electron\_50-300MeV\_fixposcentertpc1\_isotropicangle].

!(/redmine/attachments/download/37689/prodsingle_gamma_50-300MeV_fixposcentertpc1_isotropicangle.evd.larorotho3d.png)
:::



### prodsingle\_gamma\_200-1500MeV\_fixposcentertpc1\_isotropicangle

[Details]{#collapse-6a79c7d2-show .collapsible
.collapsed}[Details]

::: 
Same as
[prodsingle\_gamma\_50-300MeV\_fixposcentertpc1\_isotropicangle]
but with a uniform momentum range of 200-1500 MeV.

!(/redmine/attachments/download/38652/prodsingle_gamma_200-1500MeV_fixposcentertpc1_isotropicangle.png)
:::



### prodsingle\_mu\_100-1257MeV\_fixposcontained\_fixangle

[Details]{#collapse-deeb4671-show .collapsible
.collapsed}[Details]

::: 
A single muon with a starting point inside of TPC 2, fixed initial
angles (not parallel to the APA) and a uniform range of momentums chosen
such that the muon should always be detectable but also always
contained. The maximum momentum bound was hand tuned via a simple dE/dx
calculation. The sample should be handy for energy reconstruction and
PID.

!(/redmine/attachments/download/37690/prodsingle_mu_100-1257MeV_fixposcontained_fixangle.evd.larorotho3d.png)
:::



### prodsingle\_proton\_200-2250MeV\_fixposcontained\_fixangle

[Details]{#collapse-5908c006-show .collapsible
.collapsed}[Details]

::: 
Similar to
[prodsingle\_mu\_100-1257MeV\_fixposcontained\_fixangle]
but for protons. The lower momentum threshold for this sample was taken
from an ArgoNeuT talk and the upper momentum bound was taken from the
PSTAR database but increased slightly by hand.\
NB the upper momentum bound could probably be increased more.

!(/redmine/attachments/download/37691/prodsingle_proton_200-2250MeV_fixposcontained_fixangle.evd.larortho3d.png)
:::



### prodsingle\_pi+\_200-2250MeV\_fixposcontained\_fixangle

[Details]{#collapse-0b76fdfc-show .collapsible
.collapsed}[Details]

::: 
Similar to
[prodsingle\_mu\_100-1257MeV\_fixposcontained\_fixangle]
but for pi+. The lower momentum threshold is taken from
[prodsingle\_mu\_100-1257MeV\_fixposcontained\_fixangle]
and the upper momentum bound is taken from
[prodsingle\_proton\_200-2250MeV\_fixposcontained\_fixangle]
as a pi+ is kind of like a muon which also obeys the strong force.\
NB hand scans showed the events were contained by the momentum bounds
could be improved.

!(prodsingle_pi+_100-2250MeV_fixposcontained_fixangle.evd.larorotho3d.png)
:::



### prodsingle\_electron\_100-2250MeV\_fixposcontained\_fixangle.fcl

[Details]{#collapse-6ed0fe27-show .collapsible
.collapsed}[Details]

::: 
Similar to
[prodsingle\_mu\_100-1257MeV\_fixposcontained\_fixangle]
but for electrons. Both momentum bounds are stolen from
[pprodsingle\_pi+\_200-2250MeV\_fixposcontained\_fixangle].\
NB hand scans showed the events were contained but there really isn\'t
any reason why the bounds for an electron should be the same as a pi+;
the momentum bounds need improving.

!(/redmine/attachments/download/37693/prodsingle_electron_100-2250MeV_fixposcontained_fixangle.evd.larortho3d.png)
:::



### prodsingle\_gamma\_100-2250MeV\_fixposcontained\_fixangle.fcl

[Details]{#collapse-4ed726f3-show .collapsible
.collapsed}[Details]

::: 
Similar to
[prodsingle\_mu\_100-1257MeV\_fixposcontained\_fixangle]
but for photons. Both momentum bounds are stolen from
[pprodsingle\_pi+\_200-2250MeV\_fixposcontained\_fixangle].\
NB hand scans showed the events were contained but there really isn\'t
any reason why the bounds for a photon should be the same as a pi+; the
momentum bounds need improving.

!(/redmine/attachments/download/37694/prodsingle_gamma_100-2250MeV_fixposcontained_fixangle.evd.larortho3d.png)
:::



Beam (GENIE) samples 
----------------------------------------------------------



### prodgenie\_nu\_singleinteraction\_cryostat\_gsimple-configb-v1.fcl

[Details]{#collapse-9cbf9d07-show .collapsible
.collapsed}[Details]

::: 
A rough basis case for beam-related events. This fcl file produces
single-interaction events (no pileup per ART event) within and including
the cryostat. The flux files used are booster beam gsimple files in the
[ConfigB-v1](https://cdcvs.fnal.gov/redmine/projects/sbndcode/wiki/The_SBND_flux_files#ConfigB-v1){.external}
configuration.

!(/redmine/attachments/download/38582/prodgenie_nu_singleinteraction_cryostat_gsimple-configb-v1.png)
:::



### prodgenie\_nu\_spill\_cryostat\_gsimple-configb-v1.fcl

[Details]{#collapse-46f359ff-show .collapsible
.collapsed}[Details]

::: 
Simulates genie booster beam events with full spill structure (5e12
POT/spill) in the SBND cryostat volume. It uses gsimple flux files
produced with the
[ConfigB-v1](https://cdcvs.fnal.gov/redmine/projects/sbndcode/wiki/The_SBND_flux_files#ConfigB-v1){.external}
configuration.

!(/redmine/attachments/download/38624/prodgenie_nu_spill_cryostat_gsimple-configb-v1.png)
:::



### prodgenie\_nu\_spill\_world\_gsimple-configc-v1.fcl

[Details]{#collapse-9ff32373-show .collapsible
.collapsed}[Details]

::: 
Simulates genie booster beam events with full spill structure (5e12
POT/spill) in the full world volume which, as time of writing, includes
a large amount of surrounding dirt and the SciBooNE hall. The idea here
is that the simulation includes out of fiducial volume (dirt) events. It
uses gsimple flux files produced with the
[ConfigC-v1](https://cdcvs.fnal.gov/redmine/projects/sbndcode/wiki/The_SBND_flux_files#ConfigC-v1){.external}
configuration which is a very large flux window placed up against the
front face of the TPC. To properly include every possible TPC-entering
dirt event, the neutrino ray\'s starting position is placed upstream of
the flux window, specifically 18 m upstream. This value was chosen as it
is the maximum distance an 8 GeV muon (roughly 1 GeV higher than the
maximum neutrino energy in the flux simulation) can travel before
stopping.
:::



### prodgenie\_nue\_spill\_cryostat\_gsimple-configb-v1.fcl

[Details]{#collapse-dd090a00-show .collapsible
.collapsed}[Details]

::: 
Uses the same configuration as
[prodgenie\_nu\_spill\_cryostat\_gsimple-configb-v1.fcl](https://cdcvs.fnal.gov/redmine/projects/sbndcode/wiki/MC_sample_descriptions#prodgenie_nu_spill_cryostat_gsimple-configb-v1.fcl){.external}
but swaps all muon neutrinos in the beam for electron neutrinos and
vice-versa. Right now, the intrinsic beam electron neutrinos are NOT
swapped for muon neutrinos. This means the sample should be solely
composed of electron neutrino interactions. Because the generation uses
fancy gsimple files as a flux input, the original neutrino flavour is
recorded in the ART record so it is possible to distinguish the fully
oscillated electron neutrinos from the intrinsic ones.

!(/redmine/attachments/download/38651/prodgenie_nue_spill_cryostat_gsimple-configb-v1.png)
:::



Cosmic ray (CORSIKA) samples 
--------------------------------------------------------------------------



### prodcorsika\_cosmics\_cmc.fcl

[Details]{#collapse-3f0deff7-show .collapsible
.collapsed}[Details]

::: 
Produces cosmic rays using the Cosmic Mass Composition (CMC) model
implemented in CORSIKA. Only cosmic rays in which the primary ray goes
near (within 250 cm) of the cryostat are simulated. A lot of useful
details are shown in a talk by Matt Bass ([Docdb
833](http://sbn-docdb.fnal.gov:8080/cgi-bin/ShowDocument?docid=833){.external}).

!(/redmine/attachments/download/38625/prodcorsika_cosmics_cmc.png)
:::



### prodcorsika\_cosmics\_cmc\_frontbackcrt\_mu\_filter.fcl

[Details]{#collapse-c6883680-show .collapsible
.collapsed}[Details]

::: 
Produces CMC cosmic rays with exactly the same settings as
[prodcorsika\_cosmics\_cmc.fcl](https://cdcvs.fnal.gov/redmine/projects/sbndcode/wiki/MC_sample_descriptions#prodcorsika_cosmics_cmc.fcl){.external}
but tacks on an ART filter which demands that there is a muon in the
event whose potential trajectory intersects the front AND back CRTs. The
actual filter demand is that the straight line path length of the muon
intersects a buffer box which encompasses 20% around the CRTs. The
reason for the buffer box is to try and catch muons which pass through
the front/back CRTs because of an upstream scatter.
:::



Overlayed (overlay) samples 
------------------------------------------------------------------------



### prodoverlay\_corsika\_cosmics\_cmc\_genie\_nu\_spill\_gsimple-configb-v1\_cryostat

[Details]{#collapse-cb07dea2-show .collapsible
.collapsed}[Details]

::: 
Produces CORSIKA-based composite mass model cosmics overlayed in the
same ART event with GENIE-based BNB neutrinos with full spill structure.
The GENIE-produced interactions use the
[ConfigB-v1](https://cdcvs.fnal.gov/redmine/projects/sbndcode/wiki/The_SBND_flux_files#ConfigB-v1){.external}
configuration gsimple files as input and are only produced within the
cryostat volume.

!(/redmine/attachments/download/38641/prodoverlay_corsika_cosmics_cmc_genie_nu_spill_gsimple-configb-v1_cryostat.png)
:::



Supernova (marley) samples 
----------------------------------------------------------------------



### prodmarley\_nue\_fermidirac

[Details]{#collapse-1a58432a-show .collapsible
.collapsed}[Details]

::: 
Produces MARLEHY-based electron neutrino interactions from supernova
events spread evenly throughout the detector and drawn from Fermi-Dirac
statistics.

!(/redmine/attachments/download/38641/prodoverlay_corsika_cosmics_cmc_genie_nu_spill_gsimple-configb-v1_cryostat.png)
:::
