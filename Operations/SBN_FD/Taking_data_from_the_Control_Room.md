

# Taking data from the Control Room

-   **Table of contents**
-   [Taking data from the Control
    Room]
    -   [Starting the Run Control GUI]
    -   [Starting DAQInterface and a
        Run]
    -   [Ending a Run and/or
        DAQInterface]
    -   [What to do when the run is done or a restart \"from scratch\"
        is
        needed?]
    -   [Posting to the ECL]

**NOTE: if your run requires you to interface with the Trigger system,
there is a [Wiki
page](Trigger_Interface)
on interfacing with that from the DAQ VNC session.**

This page walks a shifter through how to keep data flowing in for
ICARUS, from the steps required to launch the daq, or to start/stop runs
as may be needed at various points. While the SBN DAQ documentation
linked from the main Wiki page has lots of documentation, the main
purpose of this page describes how to get a run started assuming you
have the DAQ VNC session up, but no instance of a running daq.

If the shifter is having trouble with starting or stopping a run, they
should call the relevant DAQ expert to remedy the situation. The expert
list lives in doc-db
(<https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=15862>)
and a copy should be also be available on the DAQ VNC session (in the
ExpertsOnCall folder on the Desktop area). When conducting in-person
shifts, a printed copy should be available in ROC-West.

Make posts in the logbook
([ECL](http://dbweb0.fnal.gov/ECL/sbnfd/E/index)) when runs
are started or stopped, and the reason for such action and conditions
related to the run (this is especially captured in the Run Start form.
If a run has crashed, the shifter should note this in the logbook, and
if there is some obvious message in the messages in the Run Control GUI
or the shifter sees something interesting in Grafana, etc., they should
note this in the logbook, and ideally post a screenshot.

**Additional note while taking shift from ROC-West**

This procedure will have you open terminals at points. To do this, click
on Applications on the screen where that is an option. There is one for
the CR machine at the very top of one of the monitors. For the VNC
session, there is also an Applications bar inside of Firefox browser
window. The terminal is opened from this location as in the screenshot
below.

![Location from which to launch a terminal
session](/redmine/attachments/download/57715/StartTerminal.png "Location from which to launch a terminal session")

::: 
[Edit this
section](Taking_data_from_the_Control_Room/edit?section=2){.icon-only
.icon-edit}
:::



## Starting the Run Control GUI

**Additional note while taking shift from ROC-West**

The first thing to understand is if the VNC session to the evb01 machine
(where we will be taking data) is already up. **If the VNC is there,
skip the next few paragraphs to \"Running the DAQ uses..\".**

**If no VNC is up to the Event Builder machine (evb01)**, the first
thing to check is: is the tunnel to the machine established? We do this
via an **ssh -L** type command tunneling through the gateway01 machine.
So, is there a terminal somewhere on the CR01 screens that is connecting
to a port on gateway01?

**If yes:** simply open Firefox and type in the VNC password as your
session password. See the Projects tab -\> Configurations page in the
ECL if you do not already know this information. You may have to expand
the window to see the whole DAQ VNC screen.\
**If no:** open a terminal and do the following\

    cd ~/bin/
    ./setup_tunnel

\
Then open Firefox and type in the ICARUS doc-db password as your session
password. You will likely have to expand the window to take up 2 screens
(vertically).

Even if the VNC has been closed, it\'s possible the run is still going.
If a run is still going and you weren\'t meant to restart a run, then
congrats, you\'re ready to go! If a run is not going and there should
be, then you will have to start a run. This wiki article just covers the
DAQ running. Monitoring for run conditions and detector conditions are
described at the moment with some information
[elsewhere](Starting_the_Online_Monitoring_(from_the_Shifter's_Perspective)).

~\
~

**Away from ROC-West**

If you are not in ROC-West then you likely already have the DAQ VNC
session in a browser tab. See the [Remote Connections
page](RemoteShift)
for more details on this connection.

~\
~

**No matter where you are:**

Running the DAQ uses the Run Control graphical user interface (GUI)
which interfaces with the artdaq DAQInterface but which takes the place
of using the command line, and as we move forward will be especially
useful with configuration databases to run using large sets of
components or specific subsets, etc. At the moment, we\'re using an
intermediate solution which is better than terminal commands but perhaps
a few more button presses than the configuration database. The basic
procedure would be to open a terminal and change directory to the DAQ
release area, set up the DAQInterface, and then run the GUI. This has
been simplified into simply double-clicking an icon on the evb01 VNC
session, which executes a shell script. The location of the icon in a
steady state should be the Desktop folder.

The icon is called **startRC** and has the icon with the ship steering
wheel. **To figure out where the icon is, see the Shift Bulletin
Board\'s \"New and Permanent Conditions\" section. This may be the
desktop, or it may be a folder on the desktop.**

![icons to launch run control GUI and online monitoring processes on
evb01](/redmine/attachments/download/57791/evb1-icons.png "icons to launch run control GUI and online monitoring processes on evb01")

The other icon is for the online monitoring process, which is explained
with some information
[elsewhere](Starting_the_Online_Monitoring_(from_the_Shifter's_Perspective)).

This will launch the Run Control GUI and a run State Diagram, as below

![Run Control GUI upon
start-up](/redmine/attachments/download/57696/RCGUI_1.png "Run Control GUI upon start-up")

::: 
[Edit this
section](Taking_data_from_the_Control_Room/edit?section=3){.icon-only
.icon-edit}
:::



## Starting DAQInterface and a Run

To start a run from here:

1.  To launch the DAQInterface, click on **Start DAQInterface**
2.  Some of the gray buttons will now show black font and allow
    interaction. You should now check the \"Use database configuration\"
    and press the button \"Database configurations\" to open the list of
    all the possible configurations available.
3.  Select the **standardTPCWest** configuration for standard shifter
    runs. You can type \"standard\" in the filter box to help find the
    right one. There will be a version number after the config name:
    usually, there should only be one valid configuration with that name
    that is visible, but if there are multiple ones use the
    latest-numbered one. Most times the components to be included for
    the run are pre-selected in the configuration, but crosscheck the
    [Shift Bulletin
    Board](Shift_bulletin_board)
    in case some specific settings are required.
4.  Use the **boot_split.txt** boot file
5.  At this stage, the DAQ is ready to run. The situation will look
    something like the picture below. Click on **RUN** to undergo the
    booting, configuring, and starting the run all in one go.\
    !(/redmine/attachments/download/63085/run_startup.png)
6.  While the system tries to start, keep an eye on the state diagram.
    You should see the current stage of the process highlighting. It
    will go through a BOOT sequence, a CONFIGURE sequence, and then
    starting the run followed by RUNNING. If for some reason it starts
    to do one step and then fall back to the previous step or STOPPED,
    something has gone wrong.
7.  During this sequence, a messaging service (Msg Viewer) will pop up.
    Put it somewhere where it is visible along with the other pieces.
    This will give you run info and print status, warning, and/or error
    messages as the case may be.

When the system is running, things should basically look like they do in
the figure below.\
![Run Control GUI and related screens with a run in
progress](/redmine/attachments/download/57698/RCGUI_5.png "Run Control GUI and related screens with a run in progress")

::: 
[Edit this
section](Taking_data_from_the_Control_Room/edit?section=4){.icon-only
.icon-edit}
:::



## Ending a Run and/or DAQInterface

If you need to bring down a run for some reason, there is a **STOP**
button, and you will see the status (in the state diagram) go to
STOPPING RUN, followed either by READY (which allows for the possibility
of restarting a run straight from there) or STOPPED. If you want to end
the session, and it\'s in the READY state then you will have to
**TERMINATE** to get back to the STOPPED state. To exit the DAQInterface
session click on **End Session** in the bottom left of the GUI. You will
be asked if you want to close the session, as in the picture below.\
![The pop up asking to end the DAQInterface
session](/redmine/attachments/download/57699/RCGUI_EndSession.png "The pop up asking to end the DAQInterface session")

Click yes. Once it\'s done closing out the session, you can click the
**X** in the top right corner of the Run Control GUI, State Diagram,
MsgViewer, and terminal to exit out.

::: 
[Edit this
section](Taking_data_from_the_Control_Room/edit?section=5){.icon-only
.icon-edit}
:::



## What to do when the run is done or a restart \"from scratch\" is needed?

When the run is done or a restart \"from scratch\" is needed (e.g.
components are going to be changed), you should go through the procedure
above using the **TERMINATE** button after **STOP** to get back to the
STOPPED state. At this point, if you have to change components you can
do that. When ready to start a new run, click **RUN**.

If Online Monitoring doesn\'t restart well on the next run, you may need
to close the Online Monitoring terminal and double click on the Online
Monitoring icon to restart the monitoring.

::: 
[Edit this
section](Taking_data_from_the_Control_Room/edit?section=6){.icon-only
.icon-edit}
:::



## Posting to the ECL

Remember to post to the ECL when runs are started, stopped, etc. to keep
track of the run conditions!

If you are new to ECL, there is another [wiki
page](Help!_I'm_on_shift_and_I'm_trying_to#-make-ECL-entries)
describing that.
:::

Files (8)

::: {style="display: none;"}
::: {.attachments}
::: {.contextual}
[Edit attached
files](/redmine/attachments/wiki_pages/28306/edit "Edit attached files"){.icon-only
.icon-edit}
:::

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------------------------------------------------------------------------------- -------------------------------------------------- -----------------------------------------------------------------------------
  [RCGUI_1.png](/redmine/attachments/57696/RCGUI_1.png){.icon .icon-attachment} [(194 KB)]{.size} [RCGUI_1.png](/redmine/attachments/download/57696/RCGUI_1.png "Download"){.icon-only .icon-download}                                        Run Control GUI upon start-up                                                     [Bruce Howard, 01/28/2020 02:48 PM]{.author}       [Delete](/redmine/attachments/57696 "Delete"){.delete .icon-only .icon-del}
  [RCGUI_3.png](/redmine/attachments/57697/RCGUI_3.png){.icon .icon-attachment} [(329 KB)]{.size} [RCGUI_3.png](/redmine/attachments/download/57697/RCGUI_3.png "Download"){.icon-only .icon-download}                                        Run Control GUI and State Diagram after selecting components and configurations   [Bruce Howard, 01/28/2020 04:12 PM]{.author}       [Delete](/redmine/attachments/57697 "Delete"){.delete .icon-only .icon-del}
  [RCGUI_5.png](/redmine/attachments/57698/RCGUI_5.png){.icon .icon-attachment} [(1.27 MB)]{.size} [RCGUI_5.png](/redmine/attachments/download/57698/RCGUI_5.png "Download"){.icon-only .icon-download}                                       Run Control GUI and related screens with a run in progress                        [Bruce Howard, 01/28/2020 04:16 PM]{.author}       [Delete](/redmine/attachments/57698 "Delete"){.delete .icon-only .icon-del}
  [RCGUI_EndSession.png](/redmine/attachments/57699/RCGUI_EndSession.png){.icon .icon-attachment} [(33.6 KB)]{.size} [RCGUI_EndSession.png](/redmine/attachments/download/57699/RCGUI_EndSession.png "Download"){.icon-only .icon-download}   The pop up asking to end the DAQInterface session                                 [Bruce Howard, 01/28/2020 04:21 PM]{.author}       [Delete](/redmine/attachments/57699 "Delete"){.delete .icon-only .icon-del}
  [StartTerminal.png](/redmine/attachments/57715/StartTerminal.png){.icon .icon-attachment} [(94.6 KB)]{.size} [StartTerminal.png](/redmine/attachments/download/57715/StartTerminal.png "Download"){.icon-only .icon-download}               Location from which to launch a terminal session                                  [Bruce Howard, 01/29/2020 12:08 PM]{.author}       [Delete](/redmine/attachments/57715 "Delete"){.delete .icon-only .icon-del}
  [evb1-icons.png](/redmine/attachments/57791/evb1-icons.png){.icon .icon-attachment} [(98.4 KB)]{.size} [evb1-icons.png](/redmine/attachments/download/57791/evb1-icons.png "Download"){.icon-only .icon-download}                           icons to launch run control GUI and online monitoring processes on evb01          [Bruce Howard, 02/04/2020 05:42 PM]{.author}       [Delete](/redmine/attachments/57791 "Delete"){.delete .icon-only .icon-del}
  [ECL_for_Runs.png](/redmine/attachments/57954/ECL_for_Runs.png){.icon .icon-attachment} [(13.7 KB)]{.size} [ECL_for_Runs.png](/redmine/attachments/download/57954/ECL_for_Runs.png "Download"){.icon-only .icon-download}                                                                                                     [Bruce Howard, 02/21/2020 07:37 PM]{.author}       [Delete](/redmine/attachments/57954 "Delete"){.delete .icon-only .icon-del}
  [run_startup.png](/redmine/attachments/63085/run_startup.png){.icon .icon-attachment} [(209 KB)]{.size} [run_startup.png](/redmine/attachments/download/63085/run_startup.png "Download"){.icon-only .icon-download}                                                                                                          [Andrea Scarpelli, 02/26/2021 04:28 PM]{.author}   [Delete](/redmine/attachments/63085 "Delete"){.delete .icon-only .icon-del}
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------------------------------------------------------------------------------- -------------------------------------------------- -----------------------------------------------------------------------------
:::

::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](Taking_data_from_the_Control_Room.pdf){.pdf}
[HTML](Taking_data_from_the_Control_Room.html){.html}
[TXT](Taking_data_from_the_Control_Room.txt){.txt}

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
