---
layout: page
title: SBN DAQ Software Setup Instructions
hero_height: is-small
---

Setup instructions to run `CAENdump`

* TOC
{:toc}

## Prerequisites

You need to [setup sbndaq and sbndaq-artdaq](Installation.md), either as yourself or SBND.  Then make a directory in a home area (NOT in the local git repository). 

## CAENdump

You can look at `~mstancar/PMT_ana` on `sbnd-daq34` at DAB for an example.  or `~sbnd/ana_crt` on `sbnd-gateway01` (but those are crt things, not 1730 things)
The analysis modules live here . . . .
[sbndaq_artdaq/sbndaq-artdaq/ArtModules/Common/](https://github.com/SBNSoftware/sbndaq-artdaq/tree/develop/sbndaq-artdaq/ArtModules/Common)
and there you will see scripts for running them
`dump_CAENV1730.fcl` and `dump_multi.fcl`
