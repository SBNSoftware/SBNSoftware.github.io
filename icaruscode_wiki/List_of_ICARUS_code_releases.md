---
layout: page
title: List of ICARUS code releases
subtitle: 
toc: true
toc_title: Contents
---


List of ICARUS code releases
============================================================================

Here we enumerate the impressive number of code releases by the ICARUS army.

The army has also filled a [list of dependencies], after the list of releases below.


List of `icaruscode` releases
----------------------------------------------------------------------------

[**Transient and temporary release manager**: Tracy
Usher](mailto:usher@slac.stanford.edu)

These are the `icaruscode` releases tagged until now:

  Version       | Notes            | Detailed Notes
  ------------- | ---------------- | -----------------------------------------------------------
  `v08_52_00`   | Weekly release   | [Release Notes](ReleaseNotes085200.md)
  `v08_43_00`   | Weekly release   | [Release Notes](ReleaseNotes084300.md)
  `v08_37_00`   | Weekly release   | [Release Notes](ReleaseNotes083700.md)
  `v08_36_02`   | Weekly release   | [Release Notes](ReleaseNotes083602.md)
  `v08_36_01`   | Weekly release   | [Release Notes](ReleaseNotes083601.md)
  `v08_34_00`   | Weekly release   | [Release Notes](ReleaseNotes083400.md)
  `v08_33_00`   | Weekly release   | [Release Notes](ReleaseNotes083300.md)
  `v08_32_00`   | Weekly release   | [Release Notes](ReleaseNotes083200.md)
  `v08_31_01`   | Weekly release   | [Release Notes](ReleaseNotes083101.md)
  `v08_22_00`   | Weekly release   | [Release Notes](ReleaseNotes082200.md)
  `v08_19_01`   | Weekly release   | [Release Notes](ReleaseNotes081901.md)
  `v08_14_00`   | Weekly release   | [Release Notes](ReleaseNotes081400.md)
  `v08_13_02`   | Weekly release   | [Release Notes](ReleaseNotes081302.md)
  `v08_12_00`   | Weekly release   | [Release Notes](ReleaseNotes081200.md)
  `v08_11_00`   | Weekly release   | [Release Notes](ReleaseNotes081100.md)
  `v08_10_01`   | Weekly release   | [Release Notes](ReleaseNotes081001.md)
  `v08_07_01`   | Weekly release   | [Release Notes](ReleaseNotes080701.md)
  `v08_03_00`   | Weekly release   | [Release Notes](ReleaseNotes080300.md)
  `v08_01_00`   | Weekly release   | [Release Notes](ReleaseNotes080100.md)
  `v07_11_00`   | Weekly release   | [Release Notes](ReleaseNotes071100.md)
  `v07_08_00`   | Weekly release   | [Release Notes](ReleaseNotes070800.md)



Dependencies
--------------------------------------------

The ICARUS code repository (`icaruscode`) currently depends on
`icarusutil`, `icarus_data`, `larsoft`, `sbndaq_artdaq_core` and
`cetbuildtools` (for building). In all releases the `icaruscode` release
tag matches the underlying `larsoft` version. Note that in general,
`icarusutil` versions are independent though generally also match. Also,
`icarusutil` is an "optional" dependency. So, on
[Fermilab GPVMs](Computing_resources.html#Where-to-work-interactive-nodes-GPVM)
it will be set up but offsite it will not be set up unless it is
available: usually it is not. If you are building your own `icaruscode`
with MRB, you can check out also `icarusutil` (`mrb g icarusutil`) and
when you build the area `icarusutil` will be available to you.

Summary of dependencies; all are mandatory (even when "not necessary")
unless otherwise specified:

- `icaruscode` is the main ICARUS simulation
  and reconstruction software repository;
- `icarus_signal_processing` includes algorithms for readout signal processing;
- `larsoft`includes, well, LArSoft; you won't go very far without this;
- `icarus_data` includes data files of moderate size (e.g. for signal processing);
  it is often necessary, but not always so;
- `genie_xsec` to allow our experiment to choose which GENIE cross section set to use;
  necessary when running GENIE;
- `sbndaq_artdaq_core` (mandatory since `icaruscode` `v08_32_00`)
  connects to data acquisition (see below);
- `icarusutil` *(optional)* includes scripts
  and facilities for job submission to the grid(s);



### `sbndaq_artdaq_core` quirks

If you need to check out `sbndaq_artdaq_core` in your working area, the
effective MRB command is:

    mrb gitCheckout -d sbndaq_artdaq_core sbndaq-artdaq-core

which checks out the repository `sbndaq-artdaq-core` from the default repository
in GitHub (SBNSoftware), and puts it into `sbndaq_artdaq_core` directory because
if it is true, as it is, that UPS hates underscores, it is just as true that
LArSoft build system `cet_build_tools` hates hyphens.
_(also, this seems still not to be enough to make `cetbuildtools` happy...)_
