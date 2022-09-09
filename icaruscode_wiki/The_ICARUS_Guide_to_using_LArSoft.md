---
layout: page
title: The ICARUS Guide to using LArSoft
toc: true
---



The ICARUS Guide to using LArSoft
======================================================================================


> DISCLAIMER: Due to rapid development this page can become out of date
> at times. As well, remember that unknown problems don\'t materialize
> solutions out of the ether: do you have a problem? start by writing in
> Slack channel [`#icarus_general`](https://shortbaseline.slack.com/archives/C014TBQ9P6J)
> (or another more appropriate one in [workspace SBN](https://shortbaseline.slack.com));
> optionally also [open a GitHub issue in `icaruscode`](https://github.com/SBNSoftware/SBNSoftware.github.io/issues)
> or where appropriate.

The following is a quick guide (based largely on MicroBooNE experience
and stolen from SBNDcode wiki) to the things you need to do in order to
run and develop applications in LArSoft. The following assumes:

-   You have all your computing privileges and accounts, including an
    account on the [ICARUS GPVM
    nodes](Computing_resources.html#Where-to-work-interactive-nodes-GPVM).
    If you don't, then you need to [submit a Fermilab Service Desk
    ticket](Computing_resources.html#Opening-a-ticket-in-Fermilab-Service-Desk)
    requesting access to this node. It will be approved as soon as
    possible.
-   You are working on one of the ICARUS GPVM nodes. Many of these
    should work on other machines/sites as well, if they are configured
    in the standard way, but there are no guarantees for that. Talk to
    your system/local administrator if you're having trouble, to make
    sure there's no differences in the basic setup. Running on your
    local desktop or laptop is often possible too, but it should be a
    second step.
-   You have a working knowledge of UNIX.
-   You are using the `bash` shell (`zsh` is not well supported to
    date¹).



Brief LArSoft overview.
-----------------------------------------------------------------

LArSoft is the software framework used by a number of LArTPC experiments
for simulation and reconstruction.\
It is currently divided into multiple `git` repositories which contain
parts of the whole toolkit. Building the code across the repositories is
managed by MRB (Multi Repository Build).

For now, it is highly recommended that you read up on the above, before
we compile our own set of experiences.\
Hence, helpful reading material:

[LArSoft wiki](.html):
<https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki>\
[LArSoft quick start
part](_Quick-start_guide_to_using_and_developing_LArSoft_code_.html):
<https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/_Quick-start_guide_to_using_and_developing_LArSoft_code_>\
[MRB reference guide](MrbRefereceGuide.html):
<https://cdcvs.fnal.gov/redmine/projects/mrb/wiki/MrbRefereceGuide>

If you are new to LArsoft you might find the [Newbie
Material](Newbie_Material.html){.wiki-page .new} page useful as well.



[List of ICARUS code releases](List_of_ICARUS_code_releases.html)
-----------------------------------------------------------------------------------------------------------------------------



Useful Examples
--------------------------------------------------

-   [How to setup your directory and launch your first
    job](How_to_setup_your_directory_and_launch_your_first_job.html)

<!-- -->

-   [Working on a feature branch (to easily share
    code)](Working_on_a_feature_branch_(to_easily_share_code).html)

<!-- -->

-   [Viewing events remotely with
    VNC](Viewing_events_remotely_with_VNC.html)

<!-- -->

-   [Using LArSoft on a local
    machine](Using_LArSoft_on_a_local_machine.html)

<!-- -->

-   [Running standard SBND
    tests](Integration_test_guide.html)

------------------------------------------------------------------------

The links below haven\'t been updated yet:

-   [How To Launch Grid Jobs](How_To_Launch_Grid_Jobs.html)\
    SBND\'s [How to launch grid
    jobs](How_to_launch_grid_jobs.html){.wiki-page .new} (in progress)

<!-- -->

-   [How to run simple track
    reconstruction](How_to_run_simple_track_reconstruction_.html)

<!-- -->

-   [How to run Fast Optical Simulation
    Jobs](How_to_run_Fast_Optical_Simulation_Jobs_.html)

<!-- -->

-   [How to set up lar1ndcode
    offiste](How_to_set_up_lar1ndcode_offiste.html)

------------------------------------------------------------------------

¹ Whenever in GitHub wiki you see the claim "to date", you can
verify when that claim was written by exploring the commit history of that
page. You'll need to switch to the edit mode ("Improve this page" on top right),
then take note of the name of the file, click on the directory that contains it
(the link is shown by GitHub just above the editing box) and then look for the
file in the listing.
