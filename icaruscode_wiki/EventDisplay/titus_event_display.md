---
layout: page
title: TITUS Event Display
subtitle: Wiki for the TITUS event display in ICARUS
description: Wiki documentation specific to TITUS
toc: true
toc_title: TITUS Contents
---



TITUS Event Display
===================

![alt text](../images/evd_icarus_R2278_S1_E1300.png "TITUS Event Display")


Options for Running the TITUS Event Display
-------------------------------------------

- Instructions [here](titus_event_display_vnc.md) for running on one of the ICARUS gpvm machines at FNAL
- Instructions [here](titus_event_display_docker.md) for using a docker container on your local machine

How to Find Data Files
----------------------

- Find data files at this [link](https://docs.google.com/spreadsheets/d/1nkMDRcguwIuaHFUH6sFDLd3UcQVNrCpe8pLdELHsuAk/edit#gid=41507160)
    - Note that this is a protected link, you will need to request access to view the list of runs
- You can use `samweb` to locate decode files available on PNFS disks:
    - `samweb list-files "run_number=nnnn"`   where `nnnn` is the run number being searched for
    - `samweb locate-file filename`   where filename is a decoded file
- When the display initially opens no drawing objects will have been selected, in the display select "Raw Digit" in the right column to display waveforms.
