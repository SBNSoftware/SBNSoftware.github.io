

# Taking Data With More Components

This is a probably temporary Wiki, but explains the procedures for
taking data with many components in a single run. These instruct a
person to take essentially 2 runs sequentially, one with both the EW and
EE TPC together, and one with the WW + WE TPCs together including the
PMTs and some CRTs. **Because you will be switching around components,
it is imperative to pay good attention to the components listed for the
run you are taking!**

Remember as always to take notes in the ECL!

-   **Table of contents**
-   [Taking Data With More
    Components]
    -   [PROCEDURE]
    -   [COMPONENTS (updated 9
        November, 2020)]
        -   [East Side Run
            (lifetimeTPCEAST)]
        -   [West Side Run
            (lifetimeTPCWEST)]
    -   [AFTER COMPLETING THE RUNS]

::: 
[Edit this
section](TakingDataWithMoreComponents/edit?section=2){.icon-only
.icon-edit}
:::



## **PROCEDURE**

**1.** Whoever is taking the runs must first stop the run in progress
(`Stop` on the Run Control GUI followed by `Terminate` if the State
Diagram goes to READY and not STOPPED). Write a general ECL entry with
the \"Run Info\" tag noting the run that was stopped.

In case the Run Control GUI is for some reason not present, you can
relaunch it using the startRC icon in the appropriate folder. If you
need to restart the Run Control GUI, clicking \"Start DAQInterface\"
should start the session and allow you to click buttons in the Run
Control GUI. Sometimes the session doesn\'t quite start with the first
click. Try clicking Start DAQInterface again (up to a few times before
asking for help). When the session is active, the colored circle in the
bottom right of the State Diagram will turn from Red to Green and blink,
and the buttons in the Run Control GUI will be clickable.

**2.** When the State is in the STOPPED state, then one can load the
database configuration for the purity run. In order to do so, check the
\"Use database configuration option\" and click on the \"Database
configuration\" to load your preferred configuration. This is the same
procedure to follow that is also required for the usual shifter\'s run
which is explained
[here](Taking_data_from_the_Control_Room)
For purity, we are using `lifetimeTPCEast` or `lifetimeTPCWest` for
respectively the west or the east side purity run. You can use the
search bar to find the right components quicker. Most times the
components to use are the one that comes preselected with the
configuration.

**3.** For the runs described here, use **boot_split.txt** BOOT
configuration. See the picture below for help finding the
configurations.

!(/redmine/attachments/download/63087/run_startup.png)

**4.** If this is an East Side run, then you need to press play on the
Trigger program at this point. See the [Trigger Interface
Wiki](Trigger_Interface).

**5.** If this is an East Side run and the Trigger program is running as
per Point 4, or if this is a West Side (WE or WW) run, then you are okay
to hit `Run` in the Run Control GUI.

**6.** The run should make its way through the Boot, Configuration, and
Starting Run Phases, all the way to the RUNNING state within
approximately a few minutes.

**7.** Once the run is going and you check that Grafana is updating and
not reporting problems, fill out a Run Start ECL post. NOTE: A single
incomplete event is \"expected\" at the beginning of an East side run
and is OK.

Please write a title like: \"Run *\_ on \_*\" e.g. \"Run 5678 on EE + EW
TPC and some PMTs\" or \"Run 5679 on WE + WW TPC with PMTs, and some
CRTs\"

To get the information for the form:

-   Run number is visible in the lower right of the State Diagram. See
    the picture below.
-   Start time is visible in the Messages in the left of the Run Control
    GUI. You may need to scroll the window to the bottom to see it. See
    the picture below.
-   Partition number is visible in the lower left of the State Diagram.
    See the picture below.
-   Configurations are the two configurations you have selected. For
    these, it should be the database configuration that you have picked
    and boot_split.txt\"

If you are using one of the standard database configurations, report on
the run_start form what configuration are you using and the BOOT file of
your choice ( `boot_split.txt` for example). Please note down if you are
using different components from the one that comes as default with the
configuration.\
A comment field is also provided for additional details regarding any
further relevant condition of the run (eg. PMT HV off).

![Help finding details needed for the Run Start
form](/redmine/attachments/download/61146/runStartHelpBetter.png "Help finding details needed for the Run Start form")

**8.** During the run, the shifter should watch the Grafana page to see
that the counters continue to generally increase (though note the point
in the next paragraph\...), and importantly that the run is not filling
with incomplete events, and that other alarms are not being raised.

Note that temporary glitches may cause not all components to report
events to Grafana at a given time. So sometimes you might see the event
counts dropping for a moment or in any case, not at their expected
level. If you look for several seconds, after a few refreshes it should
ultimately show the full count expected again, at least for brief
periods of time.

**9.** The goal is to take the data run for approximately 30 minutes
before stopping. Approximately 9000 triggers or so are expected in the
Event Builder stage (top row) of Grafana at the end of the run.

Before stopping the run, take note of the triggers in the Event Builder
(top) row of the counters in Grafana and the rough time at which you hit
Stop in the Run Control GUI and make a comment on your Run Start Form
with this info!

The person performing the tasks should stop and terminate the run as
described in Point 1 above. If the run is an EAST Side run such that the
Trigger interface is running, then remember to press the big STOP button
in the Trigger Interface, below the iteration counter, when the run is
in READY state before hitting Terminate in the Run Control. For more
details, see the [Trigger Interface
Wiki](Trigger_Interface).

The person performing the tasks can then proceed to follow the steps
again to take data on the next section as needed. Upon completion of the
three runs outlined here, the shifter can restart a Shifter Run as
described in the \"AFTER COMPLETING THE RUNS\" section below.

~\
~

::: 
[Edit this
section](TakingDataWithMoreComponents/edit?section=3){.icon-only
.icon-edit}
:::



## **COMPONENTS (updated 9 November, 2020)**

We provide here below the list of the standard components for the purity
runs. Normally, these should be components selected automatically from
the configuration databsase:

::: 
[Edit this
section](TakingDataWithMoreComponents/edit?section=4){.icon-only
.icon-edit}
:::



### East Side Run (lifetimeTPCEAST)

Remember the East side will require use of the Trigger Interface.

For the East Side run, include the following components:

-   All EE TPC mini-crates, i.e. components starting `icarustpcee`
-   All EW TPC mini-crates, i.e. components starting `icarustpcew`
-   All EE PMT, i.e. components starting `icaruspmtee`
-   All EW PMT, i.e. components starting `icaruspmtew`
-   Trigger component. i.e. `icarustrigger`

::: 
[Edit this
section](TakingDataWithMoreComponents/edit?section=5){.icon-only
.icon-edit}
:::



### West Side Run (lifetimeTPCWEST)

For the West run, include the following components:

-   All WE TPC mini-crates, i.e. components starting `icarustpcwe`
-   All WW TPC mini-crates, i.e. components starting `icarustpcww`
-   All WE PMT, i.e. components starting `icaruspmtwe`
-   All WW PMT, i.e. components starting `icaruspmtww`
-   For now, the West Purity Run should use all CRT components listed

~\
~

::: 
[Edit this
section](TakingDataWithMoreComponents/edit?section=6){.icon-only
.icon-edit}
:::



## **AFTER COMPLETING THE RUNS**

After completing the runs, unless differently instructed, start a
shifter run. The shifter run components and configurations are described
on the dedicated
[wiki](Taking_data_from_the_Control_Room).
Check also the shifter\'s bulletin in case some different run conditions
are specified.
:::

Files (8)

::: {style="display: none;"}
::: {.attachments}
::: {.contextual}
[Edit attached
files](/redmine/attachments/wiki_pages/29408/edit "Edit attached files"){.icon-only
.icon-edit}
:::

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------- -------------------------------------------------- -----------------------------------------------------------------------------
  [ShifterRunConfiguration.png](/redmine/attachments/61141/ShifterRunConfiguration.png){.icon .icon-attachment} [(231 KB)]{.size} [ShifterRunConfiguration.png](/redmine/attachments/download/61141/ShifterRunConfiguration.png "Download"){.icon-only .icon-download}   Pertinent information for starting the Shifter run after completing these runs   [Bruce Howard, 09/29/2020 10:56 AM]{.author}       [Delete](/redmine/attachments/61141 "Delete"){.delete .icon-only .icon-del}
  [runStartHelpBetter.png](/redmine/attachments/61146/runStartHelpBetter.png){.icon .icon-attachment} [(547 KB)]{.size} [runStartHelpBetter.png](/redmine/attachments/download/61146/runStartHelpBetter.png "Download"){.icon-only .icon-download}                       Help finding details needed for the Run Start form                               [Bruce Howard, 09/29/2020 12:36 PM]{.author}       [Delete](/redmine/attachments/61146 "Delete"){.delete .icon-only .icon-del}
  [configurationComponents.png](/redmine/attachments/61147/configurationComponents.png){.icon .icon-attachment} [(572 KB)]{.size} [configurationComponents.png](/redmine/attachments/download/61147/configurationComponents.png "Download"){.icon-only .icon-download}   Help finding the components and configurations in Run Control GUI                [Bruce Howard, 09/29/2020 12:41 PM]{.author}       [Delete](/redmine/attachments/61147 "Delete"){.delete .icon-only .icon-del}
  [ShifterRunDetails.png](/redmine/attachments/61479/ShifterRunDetails.png){.icon .icon-attachment} [(230 KB)]{.size} [ShifterRunDetails.png](/redmine/attachments/download/61479/ShifterRunDetails.png "Download"){.icon-only .icon-download}                                                                                                            [Bruce Howard, 10/23/2020 04:43 PM]{.author}       [Delete](/redmine/attachments/61479 "Delete"){.delete .icon-only .icon-del}
  [ShifterRun_20nov.png](/redmine/attachments/62222/ShifterRun_20nov.png){.icon .icon-attachment} [(216 KB)]{.size} [ShifterRun_20nov.png](/redmine/attachments/download/62222/ShifterRun_20nov.png "Download"){.icon-only .icon-download}                                                                                                                [Bruce Howard, 11/20/2020 04:52 PM]{.author}       [Delete](/redmine/attachments/62222 "Delete"){.delete .icon-only .icon-del}
  [CurrentDAQConfig_10Dec.png](/redmine/attachments/62338/CurrentDAQConfig_10Dec.png){.icon .icon-attachment} [(219 KB)]{.size} [CurrentDAQConfig_10Dec.png](/redmine/attachments/download/62338/CurrentDAQConfig_10Dec.png "Download"){.icon-only .icon-download}                                                                                        [Bruce Howard, 12/10/2020 10:07 PM]{.author}       [Delete](/redmine/attachments/62338 "Delete"){.delete .icon-only .icon-del}
  [CurrentDAQConfig_14Jan.png](/redmine/attachments/62461/CurrentDAQConfig_14Jan.png){.icon .icon-attachment} [(123 KB)]{.size} [CurrentDAQConfig_14Jan.png](/redmine/attachments/download/62461/CurrentDAQConfig_14Jan.png "Download"){.icon-only .icon-download}                                                                                        [Andrea Scarpelli, 01/15/2021 10:53 AM]{.author}   [Delete](/redmine/attachments/62461 "Delete"){.delete .icon-only .icon-del}
  [run_startup.png](/redmine/attachments/63087/run_startup.png){.icon .icon-attachment} [(209 KB)]{.size} [run_startup.png](/redmine/attachments/download/63087/run_startup.png "Download"){.icon-only .icon-download}                                                                                                                                    [Andrea Scarpelli, 02/26/2021 04:47 PM]{.author}   [Delete](/redmine/attachments/63087 "Delete"){.delete .icon-only .icon-del}
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------- -------------------------------------------------- -----------------------------------------------------------------------------
:::

::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](TakingDataWithMoreComponents.pdf){.pdf}
[HTML](TakingDataWithMoreComponents.html){.html}
[TXT](TakingDataWithMoreComponents.txt){.txt}

::: {style="clear:both;"}
:::
:::
:::
:::

::: 
Loading\...
:::

::: 
:::

::: 
::: {.bgl}
::: {.bgr}
Powered by [Redmine](https://www.redmine.org/) © 2006-2019 Jean-Philippe
Lang
:::
:::
:::
:::
:::
