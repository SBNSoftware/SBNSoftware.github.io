---
lang: en
title: Wish List and Requirements for SBN artdaq Based Run Control
---

[]{#Wish-List-and-Requirements-for-SBN-artdaq-Based-Run-Control}

Wish List and Requirements for SBN artdaq Based Run Control[¶](#Wish-List-and-Requirements-for-SBN-artdaq-Based-Run-Control){.wiki-anchor}
==========================================================================================================================================

We use Esteban Cristaldo\'s
artdaq_runcontrol_gui\[\[<https://cdcvs.fnal.gov/redmine/projects/artdaq-runcontrol-gui/wiki>\]\]
as a starting point for further development, requirements and \"wish
list\" items. *If you see your name here, we expect a response. If you
do not see your name here, please feel free to add your ideas.*

At this time this page is an informal document, but it may evolve into a
more formal requirements document in the future. For fun, I have
attached slides from an old CHEP conference about past Run Controls
<https://redmine.fnal.gov/redmine/attachments/52851/RunControlHistory.pdf>
or the final CDF RunControl Shifter training
<https://redmine.fnal.gov/redmine/attachments/52858/CDF_RC_Training_2011.08.09.pdf>.
Note that the lower left image on slide 1 of the CHEP slides would often
take several minutes to load!

[]{#William-Badgett}

William Badgett[¶](#William-Badgett){.wiki-anchor}
--------------------------------------------------

-   A partition selection function prior to launching DAQInterface
-   Display of the currently active partitions with their locations,
    related to above
-   Have a \"display only\" mode where the user can see what is
    happening on a partition, but not control it
-   The ability to detach from an RC GUI leaving the DAQInterface
    running (GUI crash robustness)
-   And consequently a re-attach function to resume control of
    DAQInterface
-   A subcomponent status GUI \-- are BoardReaders, EVB, etc., happy or
    sad?
-   Simple state/transition flow diagram showing where we are in the
    state machine graphically
-   Ability to view contents of the configuration, component and boot
    files, in text and/or graphically

![CDF RC Partition
Selector](/redmine/attachments/download/52856/partition.png "CDF RC Partition Selector")
![CDF RC Subcomponent Status
Window](/redmine/attachments/download/52857/status.png "CDF RC Subcomponent Status Window")

[]{#Gray-Putnam}

Gray Putnam[¶](#Gray-Putnam){.wiki-anchor}
------------------------------------------

-   Stronger default configurations and fewer steps for shifters (i.e.
    just have the default DAQ configuration there when you open the GUI)
-   Optional selection of various config files (e.g. boot.txt) through
    the Qt file selector interface
-   Tighter integration with artdaq:

> -   It could potentially receive the messages from the different DAQ
>     processes and display important ones (the MessageViewer would then
>     be for experts). I did something like this for the VST.
> -   It seems sub-optimal to me that communication with DAQInterface is
>     done with a set of shell scripts. If DAQInterface could present a
>     C++ API, then the GUI couldl have more direct access to DAQ
>     processes.

[]{#David-Rivera}

David Rivera[¶](#David-Rivera){.wiki-anchor}
--------------------------------------------

[]{#Iker-Loïc-de-Icaza-Astiz}

Iker Loïc de Icaza Astiz[¶](#Iker-Loïc-de-Icaza-Astiz){.wiki-anchor}
--------------------------------------------------------------------

I might be repeating what others have already stated, but in the
interest of setting priorities I write everything I can think of:

-   Make it more easy and streamlined to start up. More like click
    \"next\" a few times to resume the nominal or last run settings.

```{=html}
<!-- -->
```
-   Make it play nice with other partitions and/or users, i.e. not try
    to kill everything.

```{=html}
<!-- -->
```
-   Reduce the verbosity to stdout

```{=html}
<!-- -->
```
-   Health window of the various subsystems and components

```{=html}
<!-- -->
```
-   Ability to make and load various running profiles

```{=html}
<!-- -->
```
-   \"Hearth beat\" to show status of connection

```{=html}
<!-- -->
```
-   Show current on call expert contact information

```{=html}
<!-- -->
```
-   Add various options for stopping, killing and purging processes

```{=html}
<!-- -->
```
-   A bit of a premium feature would be to have some sort of support for
    showing alerts for smartphones, you know \'cause millennials

[]{#Wes-Ketchum}

Wes Ketchum[¶](#Wes-Ketchum){.wiki-anchor}
------------------------------------------

[]{#Ron-Rechenmacher}

Ron Rechenmacher[¶](#Ron-Rechenmacher){.wiki-anchor}
----------------------------------------------------

[]{#Gennadiy-Lukhanin}

Gennadiy Lukhanin[¶](#Gennadiy-Lukhanin){.wiki-anchor}
------------------------------------------------------

[]{#Eric-Flumerfelt}

Eric Flumerfelt[¶](#Eric-Flumerfelt){.wiki-anchor}
--------------------------------------------------

[]{#JC-Freeman}

JC Freeman[¶](#JC-Freeman){.wiki-anchor}
----------------------------------------

[]{#Yun-Tse-Tsai}

Yun-Tse Tsai[¶](#Yun-Tse-Tsai){.wiki-anchor}
--------------------------------------------

[]{#Esteban-Cristaldo}

Esteban Cristaldo[¶](#Esteban-Cristaldo){.wiki-anchor}
------------------------------------------------------

[]{#Angela-Fava}

Angela Fava[¶](#Angela-Fava){.wiki-anchor}
------------------------------------------

[]{#Donatella-Torretta}

Donatella Torretta[¶](#Donatella-Torretta){.wiki-anchor}
--------------------------------------------------------

[]{#Steve-Hahn}

Steve Hahn[¶](#Steve-Hahn){.wiki-anchor}
----------------------------------------

[]{#Andy-Mastbaum}

Andy Mastbaum[¶](#Andy-Mastbaum){.wiki-anchor}
----------------------------------------------

For more comparative fun, here\'s the SNO+ run control, which uses
[Orca](http://orca.physics.unc.edu/~markhowe/Orca_Help/Home.html){.external}.

Main features:

-   The GUI is independent of the actual data taking process and can
    detach/reattach. (In fact we do this all the time, remote shift
    stations open up a local copy of the GUI when we hand off, to avoid
    VNC slowness)
-   Normally in \"operator mode\" with limited access. A
    password-protected expert mode unlocks most GUI features. For some
    features, you must also switch to a maintenance run (in contrast to
    a physics run)
-   Standard Run types (physics, maintenance, various calibrations)
    which define a complete set of detector settings are selectable from
    a drop down menu
-   GUI shows important state (e.g. trigger channels enabled, channels
    at HV) and where these differ from run nominal settings in a
    database (handy, but at every run we also diff the current detector
    configuration against the standard definition and alarm on it)
-   Control of trigger, front end, and HV is integrated into the same
    GUI as run control

![](/redmine/attachments/download/52854/snoprc.png)

In addition to run control the same GUI is used to configure & control
the trigger and front end electronics as well as the HV, shown here:

![](/redmine/attachments/download/52853/xl3hv.png)
