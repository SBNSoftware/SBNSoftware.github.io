---
lang: en
title: The SBND Guide to using LArSoft
---

[]{#The-SBND-Guide-to-using-LArSoft}

The SBND Guide to using LArSoft[¶](#The-SBND-Guide-to-using-LArSoft){.wiki-anchor}
==================================================================================

-   **Table of contents**
-   [The SBND Guide to using LArSoft](#The-SBND-Guide-to-using-LArSoft)
    -   [Brief LArSoft overview.](#Brief-LArSoft-overview)
    -   [List of SBND code releases](#List-of-SBND-code-releases)
    -   [Useful Examples](#Useful-Examples)

> DISCLAIMER: There is a lot of material that constantly befalls out of
> date. Remember that problems that are unknown don\'t fix by
> themselves: got a problem? write an e-mail **and** [open a ticket
> here](https://cdcvs.fnal.gov/redmine/projects/sbndcode/issues/new){.external}
> (you need to be logged in to Redmine).

The following is a quick guide (based largely on MicroBooNE experience)
to the things you need to do in order to run and develop applications in
LArSoft. The following assumes:

-   You have all your computing privileges and accounts, including an
    account on the [SBND GPVM
    nodes](Computing_resources.html#Where-to-work-interactive-nodes-GPVM){.wiki-page}.
    If you don't, then you need to [submit a Fermilab Service Desk
    ticket](Computing_resources.html#Opening-a-ticket-in-Fermilab-Service-Desk){.wiki-page}
    requesting access to this node. We will approve as soon as possible.
-   You are working on one of the SBND GPVM nodes. Many of these should
    work on other machines/sites as well, if they are configured in the
    standard way, but there are no guarantees for that. Talk to your
    system/local administrator if you're having trouble, to make sure
    there's no differences in the basic setup. Running on your local
    desktop or laptop is often possible too, but it should be a second
    step.
-   You have a working knowledge of UNIX.
-   You are using the `bash` shell (`zsh` is not well supported to
    date^[1](#fn1)^ ).

[]{#Brief-LArSoft-overview}

Brief LArSoft overview.[¶](#Brief-LArSoft-overview){.wiki-anchor}
-----------------------------------------------------------------

LArSoft is the software framework used by a number of LArTPC experiments
for simulation and reconstruction.\
It is currently divided into multiple `git` repositories which contain
parts of the whole toolkit. Building the code across the repositories is
managed by MRB (Multi Repository Build).

For now, it is highly recommended that you read up on the above, before
we compile our own set of experiences.\
Hence, helpful reading material:

[LArSoft wiki](.html){.wiki-page}:
<https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki>\
[LArSoft quick start
part](_Quick-start_guide_to_using_and_developing_LArSoft_code_.html){.wiki-page}:
<https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/_Quick-start_guide_to_using_and_developing_LArSoft_code_>\
[MRB reference guide](MrbRefereceGuide.html){.wiki-page}:
<https://cdcvs.fnal.gov/redmine/projects/mrb/wiki/MrbRefereceGuide>

If you are new to LArsoft you might find the [Newbie
Material](Newbie_Material.html){.wiki-page} page useful as well.

[]{#List-of-SBND-code-releases}

[List of SBND code releases](List_of_SBND_code_releases.html){.wiki-page}[¶](#List-of-SBND-code-releases){.wiki-anchor}
-----------------------------------------------------------------------------------------------------------------------

[]{#Useful-Examples}

Useful Examples[¶](#Useful-Examples){.wiki-anchor}
--------------------------------------------------

-   [How to setup your directory and launch your first
    job](How_to_setup_your_directory_and_launch_your_first_job.html){.wiki-page}

```{=html}
<!-- -->
```
-   [Working on a feature branch (to easily share
    code)](Working_on_a_feature_branch_(to_easily_share_code).html){.wiki-page}

```{=html}
<!-- -->
```
-   [Viewing events remotely with
    VNC](Viewing_events_remotely_with_VNC.html){.wiki-page}

```{=html}
<!-- -->
```
-   [Using LArSoft on a local
    machine](Using_LArSoft_on_a_local_machine.html){.wiki-page}

```{=html}
<!-- -->
```
-   [Running standard SBND
    tests](Integration_test_guide.html){.wiki-page}

------------------------------------------------------------------------

The links below haven\'t been updated yet:

-   [How To Launch Grid Jobs](How_To_Launch_Grid_Jobs.html){.wiki-page}\
    SBND\'s [How to launch grid
    jobs](How_to_launch_grid_jobs.html){.wiki-page} (in progress)

```{=html}
<!-- -->
```
-   [How to run simple track
    reconstruction](How_to_run_simple_track_reconstruction_.html){.wiki-page}

```{=html}
<!-- -->
```
-   [How to run Fast Optical Simulation
    Jobs](How_to_run_Fast_Optical_Simulation_Jobs_.html){.wiki-page}

```{=html}
<!-- -->
```
-   [How to set up lar1ndcode
    offiste](How_to_set_up_lar1ndcode_offiste.html){.wiki-page}

------------------------------------------------------------------------

^1^ Whenever in Redmine wiki you see the claim \"to date\", you can
verify when that claim was written by exploring the *History* of that
page, via the link on the top right of the page itself.
