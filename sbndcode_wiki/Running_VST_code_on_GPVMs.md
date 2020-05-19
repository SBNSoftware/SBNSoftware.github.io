---
lang: en
title: Running VST code on GPVMs
---



Running VST code on GPVMs(#Running-VST-code-on-GPVMs)
======================================================================



Starting from scratch(#Starting-from-scratch)
--------------------------------------------------------------

1.  Log on to sbndgpvm01/02/03\

        ssh <uname>@sbndgpvm01.fnal.gov

2.  Go to your app directory

3.  Create a new directory and cd into it\

        mkdir develop_vst
        cd develop_vst

4.  Set up the SBND environment\

        source /grid/fermiapp/products/sbnd/setup_sbnd_legacy.sh

5.  Set up a new development area for larsoft version v06\_73\_00\

        mrb newDev -v v06_73_00 -q e15:prof
        source localProducts_larsoft_v06_73_00_e15_prof/setup

6.  Fetch sbndcode using git\

        cd srcs
        mrb g sbndcode

7.  Checkout the VST purity analysis branch\

        cd sbndcode
        git checkout feature/tb_PurityVST

8.  Build the code\

        cd $MRB_BUILDDIR
        mrbsetenv
        mrb i -j4
        mrbslp



Setting up and existing build(#Setting-up-and-existing-build)
------------------------------------------------------------------------------

1.  On a gpvm set up the SBND environment\

        source /grid/fermiapp/products/sbnd/setup_sbnd_legacy.sh

2.  Go to your development directory

3.  Set up the development environment\

        source localProducts_larsoft_v06_73_00_e15_prof/setup
        cd $MRB_BUILDDIR
        mrbsetenv
        mrbslp



Simulating and viewing events(#Simulating-and-viewing-events)
------------------------------------------------------------------------------

-   There is currently one file for generating single particle events
    called prodsingle\_vst.fcl

-   It contains configuration parameters that can be edited to change
    the particle type, energy, position, direction, etc.

-   It lives in sbndcode/JobConfigurations

-   You generate events with the command\

        lar -c prodsingle_vst.fcl -n <number of events> -o <name of output(.root) file>

-   It is best to do this in your data directory for small numbers of
    events or Dcache for large jobs

-   There is an event display available for viewing events.\

        lar -c evd_vst.fcl -s <name of event file>

-   You will need to either ssh with X11 forwarding or use a [VNC
    server](Viewing_events_remotely_with_VNC.html) to see
    the event display



Running the analysis code(#Running-the-analysis-code)
----------------------------------------------------------------------

-   The VST purity analysis code is run using pipeline\_RawHit.fcl which
    lives in sbndcode/VSTAnalysis/fcl/pipeline\_example/\

        lar -c pipeline_RawHit.fcl -s <name of event file>

-   It calls the VSTAnalysis\_module.cc but the bulk of the analysis
    code is in Analysis.cc

-   The purity code lives in Purity.cc
