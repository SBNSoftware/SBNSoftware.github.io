

# Beam Runs (Work in progress)

-   **Table of contents**
-   [Beam Runs (Work in progress)]
    -   [General information]
    -   [How to start/stop a run with
        trigger]
        -   [Start/stop the trigger]
        -   [Start/stop the run control]
    -   [How to monitor the run
        progress]
        -   [Grafana]
        -   [Online Monitor]
        -   [Live Event display (WORK IN
            PROGRESS)]
    -   [What do I do if \...]
        -   [..my run does not start]
        -   [..I see a lot of incomplete
            events]
        -   [..MCR calls reporting issues with the
            beam]
        -   [..There is no beam]
        -   [..There are some unexpected problems or I am unsure about
            anything]
    -   [Expert section]
        -   [Locate the LabVIEW codes for the
            trigger]
        -   [Configurations and triggers]

::: 
[Edit this
section](BeamRuns/edit?section=2){.icon-only
.icon-edit}
:::



## General information

Running with BNB or NuMi beams is the new standard running mode for the
shifter until the shutdowns around the end of June 2021. Beam runs are
regularly done during the night, between 18:00 CST and 8:00 CST of the
following day. Commissioning and run coordination are responsible to
decide what type of beam run to start for the night and at what time
depending on the planned activities. Please verify the run and detector
status on the shifter\'s bulletin at the beginning of your shift.
Shifter are requested to monitor the beam runs, report anomalies, and
restart a new run when necessary. The following guide is intended to
provide both shifters and experts with all the information necessary
regarding beam runs. Note that also calibration run including all
detector may require the same approach.

The usual procedure consists of:

1\) Start the trigger\
2) Start the run using the artdaqRun control GUI\
3) Once the run has started fill the
[Run_start](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=Run_Start)
ecl entry\
4) .. run is now going, monitor it as explained before and filling the
[DAQ (commissioning)
checklist](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=DAQ+(Commisioning)+Checklist)
until issues arises or you\'re asked to stop.\
5) Stop the run using the artdaqRun control GUI\
6) Stop the trigger\
7) While the run is stopping fill the
[Run_stop](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=Run_stop)
ecl entry

::: 
[Edit this
section](BeamRuns/edit?section=3){.icon-only
.icon-edit}
:::



## How to start/stop a run with trigger

Starting or stopping a run requires in general two steps:
starting/stopping the trigger Labview code on the trigger laptop and
starting/stopping the DAQ run control GUI. Please note that failing to
one of the steps may results in not starting the run correctly or not
having trouble while restarting.

::: 
[Edit this
section](BeamRuns/edit?section=4){.icon-only
.icon-edit}
:::



### Start/stop the trigger

To start a beam run requires starting the specific trigger LabView
project associated with the configuration code. Shifters are not
expected to change this, but only to operate on the project left open
for them. The DAQ-VNC is remotely connected to a Windows laptop, the
trigger laptop, through Remmina, located on Desktop 2 (\# 1 in the
picture) If the remote connecton to the trigger laptop is not on the
desktop already, one can open it by clicking on `Applications` on the
top left, finding `Internet` and then `Remmina`. The item listed as
\"trigger laptop\" is how one connects to the Windows machine with the
trigger program. Simply double click this to launch the Windows
connection! Please inform \@icarus_shift_help if this operation doesn\'t
work. before starting a new connection instance, you should verify if
the trigger laptop tab is already open in the top panel.

The trigger laptop connection view looks in general like in the picture
below.

!(/redmine/attachments/download/63438/trigger_laptop.png)

**To start the trigger LabVIEW code** press on the White arrow (\# 2 in
the picture) located at the top left of the trigger interface. This will
start executing the code. The arrow will turn black and the background
of the interface will turn solid green. Please note that the trigger
counter (\# 3 in the picture) may not start immediately, but it usually
waits for the DAQ to be ready. Please inform \@icarus_shift_help, if
something unusual occurs during this process or if you are insecure
about the operation to perform.

**To stop the trigger** ( after the run is already in \"stopping\" mode
) just press on the big `STOP` button (\# 4 in the picture). The counter
will stop and the background of the interface will get again the
\"notebook\" motive. Please allow some time delay for the command to the
executed due to the possible lag of the remote connection. Please inform
\@icarus_shift_help, if something unusual occurs during this process or
if you are insecure about the operation to perform.

::: 
[Edit this
section](BeamRuns/edit?section=5){.icon-only
.icon-edit}
:::



### Start/stop the run control

!(/redmine/attachments/download/63440/run_start.png)

To control the start/stop of run the shifter may use the artdaqRun
control GUI located on Desktop 1 of the DAQ-VNC server (\# 1).

**TO START A RUN**\
1) You should always see the runControl GUI ready with a configuration
loaded, as in the picture. If this is not the case please inform
\@icarus_shift-help on Slack or contact the commissioner/deupty
commissioner and/or the run coordinator. Then, just press RUN (\# 2).
The run should make its way through the Boot, Configuration, and
Starting Run Phases, all the way to the RUNNING state within
approximately a few minutes.\
2) Once the run is going and you check that Grafana is updating and not
reporting problems, fill out a
[Run_Start](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=Run_Start)
ECL post, with all the relevant information: partition (\# 4), run
number (\# 5), Start time in CST (\# 6). For the configuration and
components info, you can just re-use the same information given for the
previous run.

**TO STOP A RUN**\
If asked or if the conditions to stop a run appears please just:\
1) Press `Stop` on the Run Control GUI followed by `Terminate` (\# 3) if
the State Diagram goes to READY and not STOPPED.\
2) Find and fill the
[Run_stop](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=Run_stop)
ECL checklist for the logbook.

::: 
[Edit this
section](BeamRuns/edit?section=6){.icon-only
.icon-edit}
:::



## How to monitor the run progress

Beam run should be checked regularly, once per hour and fill the
appropriate [DAQ (commissioning)
checklist](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=DAQ+(Commisioning)+Checklist).
It is important to observe Grafana, the Online Monitor, and the Live
Event Display

::: 
[Edit this
section](BeamRuns/edit?section=7){.icon-only
.icon-edit}
:::



### Grafana

The Grafana page is open on Desktop 4 of the DAQ-VNC server. You may
also have the page open on your personal web browser. In any case, it
should look like in the picture below.

!(/redmine/attachments/download/63415/beam_grafana.png)

**Fragment rates**:In normal conditions, the West and East fragments TPC
and the PMT fragments should follow the repetition Rate of the BNB Beam.
The EventBuilders rate should be similar in magnitude but less constant.
The dispatcher rate is roughly a factor 15 lower than the EventBuilders
rate. It may also be temporary 0. Please alert on Slack a
`@sbn-daq-expert` if something anomalous is noticed with the rates. Note
also that, depending on the type of test ongoing it may be that only
east or west side TPC fragments are present.

**Disk usage**: Disk usage for any the EVB machines should never surpass
95%. Please alert immediately Wes Ketchum or Jacob Zettlemoyer if this
occurs and stop the run.

**Events released to art from EventBuilder**: it is the number of
triggers saved in the data files. It should slowly, but steadily
increase with time. Please alert a DAQ expert if this is not happening.

**Events released to art from Dispatcher**: it is the number of triggers
consumed by the Online Monitor. It should slowly, but steadily increase
with time and be lower than the *Events released to art from
EventBuilder*. Please alert an Expert if this number is not increasing.
This may be a cause for the online monitor not working.

The other quantities to be monitored are described in the [DAQ
(commissioning)
checklist](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=DAQ+(Commisioning)+Checklist)

::: 
[Edit this
section](BeamRuns/edit?section=8){.icon-only
.icon-edit}
:::



### Online Monitor

The Online Monitor is open in a browser tab on Desktop 4 of the DAQ-VNC
server (next to grafana). You may also have it opened on your web
browser at this \"address\": (VPN required). All the quantities on the
main page should be ON.

**If the TPC or PMT online operation are OFF:** you can restart the
Online Monitor. In order to do so, you can go to the Desktop 1 of the
DAQ VNC, localize the Online Monitor terminal, and close it. Then you
can make double-click on the Desktop icon with a magnifier glass
reporting `StartOMwithPMT` ( See picture ). Please allow some time for
the process to start. If after few attempts of restarting the OM, it is
still not updating please verify if the number of events sent to the
dispatcher is increasing and contact an expert. Please, don\'t stop a
run to restart the OM unless this is requested by an expert.

!(/redmine/attachments/download/63414/restart_om.png)

**If the archiver status is OLD:** Allow some time to catch up if a new
run just started or the OM has been restarted. If this does not change
the situation, please notify Justin Muller on slack.

::: 
[Edit this
section](BeamRuns/edit?section=9){.icon-only
.icon-edit}
:::



### Live Event display (WORK IN PROGRESS)

!(/redmine/attachments/download/63463/Live_EVD.png)

The live Event Display (EVD) is located on Desktop 3 of the DAQ-VNC
server (\# 1). The shifter should look at it to make sure it is updating
and as a quick control of the data quality. The event display is
updating when the event number and the run number ( \# 2 ) are
increasing correctly. The File update ( \# 3 ) option should also be set
( While the Update event one can be also False. ). Please note that if
the OM is not working, also the EVD will not work.

The EVD should resume automatically any time a new run is started. Allow
some time for the process to catch up and the new events to be read. If
necessary you can also restart the EVD using the Event display icon ( \#
4 ) located on the desktop. Please, close the current EVD terminal ( \#
5 ) before starting a new one.

\- LINK TO A SPECIFIC PAGE ON THE EVD -

::: 
[Edit this
section](BeamRuns/edit?section=10){.icon-only
.icon-edit}
:::



## What do I do if \...

::: 
[Edit this
section](BeamRuns/edit?section=11){.icon-only
.icon-edit}
:::



### ..my run does not start

Please make sure the trigger is correctly initialized. In general when
the window background is solid gray when the trigger is running. Notice
also if the right configuration is used and the trigger component is
included. If still unsuccessful, ask an expert for help.

::: 
[Edit this
section](BeamRuns/edit?section=12){.icon-only
.icon-edit}
:::



### ..I see a lot of incomplete events

Please make a screenshot of grafana, make an ECl entry and stop the run.
Please, notify an expert. You may attempt to restart a new run. Wait for
expert guidance in case of repeated attempts at starting a run shows
incomplete events.

::: 
[Edit this
section](BeamRuns/edit?section=13){.icon-only
.icon-edit}
:::



### ..MCR calls reporting issues with the beam

Please post to the ECL what has been said. Inform on Slack the
commissioner coordinator, the deputy commissioner coordinator and/or the
run coordinator (if the role is defined). Please don\'t stop the run
unless you\'re asked to do so.

::: 
[Edit this
section](BeamRuns/edit?section=14){.icon-only
.icon-edit}
:::



### ..There is no beam

Please wait some time ( up to 20 minutes ) to see if the beam comes
back. If not make an ECL entry and inform on slack
`@icarus-beam_experts`. Don\'t stop the run, unless you\'re asked to do
so.

::: 
[Edit this
section](BeamRuns/edit?section=15){.icon-only
.icon-edit}
:::



### ..There are some unexpected problems or I am unsure about anything

You can contact over slack \@icaurs-shift-help, \@sbn-daq-experts,
\@icarus-beam-experts, or directly the commissioner/deputy commissioner
and/or the run coordinator (if the role is defined)

::: 
[Edit this
section](BeamRuns/edit?section=16){.icon-only
.icon-edit}
:::



## Expert section

This section aims to give experts some more details on how to start
these kinds of runs

::: 
[Edit this
section](BeamRuns/edit?section=17){.icon-only
.icon-edit}
:::



### Locate the LabVIEW codes for the trigger

The location of all the triggers used by shifters is inside the folder
Project_for_shifter on the Desktop of the trigger laptop. Here select
the project `Trigger_for_shifter_project.lvproj` and open it. Now go to
the RT controller named `RT PXI Target with SPEXI DIO` and do a
right-click with your mouse. Select \"connect\" from the drop-out menu.
See the little light on the icon turning bright red, showing the
completed connection. Now if you expand the list of element associated
to the `RT PXI` controller you can find the various `.vi` files with the
LabView projects for the shifters.

!(/redmine/attachments/download/63464/rtcontroller.png)

::: 
[Edit this
section](BeamRuns/edit?section=18){.icon-only
.icon-edit}
:::



### Configurations and triggers

Each configuration has a Labview code associated that provides the
correct trigger. The table below gives a non-exhaustive list of possible
configurations and the corresponding use.

  ------------------------ ------------------------------ ------------------------------- ---------------------------------------------------------
  **Configuration name**   **Components**                 **Trigger Labview code name**   Project name
  `MinBias_BNB_SPAW`       All PMTs, all CRTs, all TPCs   `minbias_spaw.vi` in            Trigger_for_shifters/Trigger_for_shifter_project.lvproj
  `ZeroBias`               All PMTs, all CRTs, all TPCs   `zerobias.vi`                   Trigger_for_shifters/Trigger_for_shifter_project.lvproj
  ------------------------ ------------------------------ ------------------------------- ---------------------------------------------------------

For more information please ask Andrea Scarpelli or Donatella Torretta
:::

Files (8)

::: {style="display: none;"}
::: {.attachments}
::: {.contextual}
[Edit attached
files](/redmine/attachments/wiki_pages/30046/edit "Edit attached files"){.icon-only
.icon-edit}
:::

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -- -------------------------------------------------- -----------------------------------------------------------------------------
  [restart_om.png](/redmine/attachments/63413/restart_om.png){.icon .icon-attachment} [(400 KB)]{.size} [restart_om.png](/redmine/attachments/download/63413/restart_om.png "Download"){.icon-only .icon-download}                      [Andrea Scarpelli, 03/27/2021 07:41 PM]{.author}   [Delete](/redmine/attachments/63413 "Delete"){.delete .icon-only .icon-del}
  [restart_om.png](/redmine/attachments/63414/restart_om.png){.icon .icon-attachment} [(400 KB)]{.size} [restart_om.png](/redmine/attachments/download/63414/restart_om.png "Download"){.icon-only .icon-download}                      [Andrea Scarpelli, 03/27/2021 07:42 PM]{.author}   [Delete](/redmine/attachments/63414 "Delete"){.delete .icon-only .icon-del}
  [beam_grafana.png](/redmine/attachments/63415/beam_grafana.png){.icon .icon-attachment} [(220 KB)]{.size} [beam_grafana.png](/redmine/attachments/download/63415/beam_grafana.png "Download"){.icon-only .icon-download}              [Andrea Scarpelli, 03/27/2021 07:45 PM]{.author}   [Delete](/redmine/attachments/63415 "Delete"){.delete .icon-only .icon-del}
  [trigger_laptop.png](/redmine/attachments/63438/trigger_laptop.png){.icon .icon-attachment} [(303 KB)]{.size} [trigger_laptop.png](/redmine/attachments/download/63438/trigger_laptop.png "Download"){.icon-only .icon-download}      [Andrea Scarpelli, 03/28/2021 07:55 PM]{.author}   [Delete](/redmine/attachments/63438 "Delete"){.delete .icon-only .icon-del}
  [run_startup.png](/redmine/attachments/63439/run_startup.png){.icon .icon-attachment} [(174 KB)]{.size} [run_startup.png](/redmine/attachments/download/63439/run_startup.png "Download"){.icon-only .icon-download}                  [Andrea Scarpelli, 03/28/2021 08:28 PM]{.author}   [Delete](/redmine/attachments/63439 "Delete"){.delete .icon-only .icon-del}
  [run_start.png](/redmine/attachments/63440/run_start.png){.icon .icon-attachment} [(286 KB)]{.size} [run_start.png](/redmine/attachments/download/63440/run_start.png "Download"){.icon-only .icon-download}                          [Andrea Scarpelli, 03/28/2021 08:36 PM]{.author}   [Delete](/redmine/attachments/63440 "Delete"){.delete .icon-only .icon-del}
  [Live_EVD.png](/redmine/attachments/63463/Live_EVD.png){.icon .icon-attachment} [(525 KB)]{.size} [Live_EVD.png](/redmine/attachments/download/63463/Live_EVD.png "Download"){.icon-only .icon-download}                              [Andrea Scarpelli, 03/29/2021 04:08 PM]{.author}   [Delete](/redmine/attachments/63463 "Delete"){.delete .icon-only .icon-del}
  [rtcontroller.png](/redmine/attachments/63464/rtcontroller.png){.icon .icon-attachment} [(89.9 KB)]{.size} [rtcontroller.png](/redmine/attachments/download/63464/rtcontroller.png "Download"){.icon-only .icon-download}             [Andrea Scarpelli, 03/29/2021 04:45 PM]{.author}   [Delete](/redmine/attachments/63464 "Delete"){.delete .icon-only .icon-del}
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -- -------------------------------------------------- -----------------------------------------------------------------------------
:::

::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](BeamRuns.pdf){.pdf}
[HTML](BeamRuns.html){.html}
[TXT](BeamRuns.txt){.txt}

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
