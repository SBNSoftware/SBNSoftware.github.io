

# Grafana For Shifters

Grafana is currently being used as a DAQ monitoring system to check on
the health and status of runs. It has many panels with expert-level
information, there is a page with information specifically aimed for the
shifters. This page will very briefly describe this monitoring tool for
the shifters. The way to load into Grafana is described in the ROC Doc
(<https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=15944>,
ICARUS doc-db login), and for users at ROC-West, there is also the
ability to use the button on CR01 below the VNC buttons. This button
still needs some stability testing, but seems to work and will do in a
pinch.

(**For remote shifts, see instead the [Remote Connections
page](RemoteShift)
for ways to connect to Grafana.**)

Shifters should use this to monitor the health and status of runs, and
they are asked about info from this page in the **DAQ (Commisioning)
Checklist**.

The panel for shifters is called **Shifter DAQ Status** and looks
something like the following (see below image for details!):

!(/redmine/attachments/download/62324/Grafana_ShiftersPage_New.png)

~\
~

~\
~

~\
~

At the top right, you will see a refresh button and a drop down menu.
You should make sure 5s is selected to ensure the page will continue
updating. It *should* be set by default to go to 5s.

The top left will print out the last run number (if a run is going this
should be the current run number). As of 6 March 2020, there is a known
bug where the run number may be behind if a run is started from the
READY state, but shifters should be starting from the STOPPED state.

To the right of this are several speed meter like displays with the
heading **Total Event Rates**. This panel describes the rates of
data-taking. TPC (East, West) Avg Fragment Rate tells you at what rate
we are taking data from TPC mini-crates (typically 5Hz at the moment).
PMT Avg Fragment Rate does the same for the PMTs. EventBuilder Event
Rate and Dispatcher Event Rate describe the rates that the fragments are
being built and dispatched, respectively. If running is at 5 Hz, the
EventBuilder rate is expected to be about 5 Hz. The Dispatcher handles
sending events to the Online Monitor. This rate will be lower than the
Fragment or EventBuilder rates if there is pre-scaling on what is sent
through the Dispatcher. These dials may vary up or down a little but
should generally be close to the expected values.

Below the Total Event Rates panel is a set of event counters. On the
left are the summed total of events released to *art* during the run.
There are three columns, one for each artdaq process handling events
(Event Builder, Data Logger, and Dispatcher). Currently DataLoggers
aren\'t used, so these are expected to be empty. To the right are the
set of **incomplete events** that have been released to *art* during the
run. This means that the event didn\'t contain the full set of
information. For example, say there are 4 mini-crates and only 3
reported their data for the event: this would be marked incomplete. If
you see incomplete events, make note of it in the ECL. If all the new
events are coming in incomplete, then you should bring down the run and
start over.

Below this are a few \"alarms\" (TPC BoardReaders Busy and Circular
Buffer Occupancy) \-- these are meant to turn red when there is an
issue, and the current numbers should be added to the \"every 2 hours\"
run stability ECL post.

The one on the left reports when boards are seen to be \"busy\" and not
passing off the data when it comes in like it should be. A typical
mini-crate has 9 boards, so the number 9 could indicate that an entire
mini-crate has gone \"busy.\" Anything over 0 should trip this field to
turn red. If this stays at a number \>0 for a short bit (1 minute or
so), then this is a reason to restart the run and make note of this
condition in the ECL. Feel free to add screenshots!

The other alarm that is included at the moment is monitoring the
circular buffer status of mini-crates. This reports the highest value
given for buffer occupancy. Each buffer has something like 250MB, so
this alarm is set to trip red at 150MB. It is typically around 1.7MB or
so, nearly a factor of 100 below the threshold to trip red. If this
number starts to climb, take note in the ECL. In any case, this is
something we ask for on the \"every 2 hours\" run stability ECL entry.

The **data disk usage** is in the dials to the right of these. These
should be \< 95%. If they go above 95%, then please call Wes K, who can
be found on the Experts On Call document.

The bottom row has **CRT** plots. If you notice sudden changes in this
rate, please make a General post on the ECL and attach a screenshot and
words with what you noticed! Send the ECL form as an email to Antoni
Aduszkewicz, Tyler Boone, and Biswaranjan Behera. This is possible by
using the \"Email new entry to\" box. Type part or all of a name and
click their name and \"add -\>\" to add each person to the form.
:::

Files (5)

::: {style="display: none;"}
::: {.attachments}
::: {.contextual}
[Edit attached
files](/redmine/attachments/wiki_pages/28507/edit "Edit attached files"){.icon-only
.icon-edit}
:::

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------- ---------------------------------------------- -----------------------------------------------------------------------------
  [Grafana_Shifters_Page.png](/redmine/attachments/58635/Grafana_Shifters_Page.png){.icon .icon-attachment} [(345 KB)]{.size} [Grafana_Shifters_Page.png](/redmine/attachments/download/58635/Grafana_Shifters_Page.png "Download"){.icon-only .icon-download}               Grafana Shifter Panel   [Bruce Howard, 03/06/2020 02:45 PM]{.author}   [Delete](/redmine/attachments/58635 "Delete"){.delete .icon-only .icon-del}
  [SampleRunStabilityForm.png](/redmine/attachments/58636/SampleRunStabilityForm.png){.icon .icon-attachment} [(49.4 KB)]{.size} [SampleRunStabilityForm.png](/redmine/attachments/download/58636/SampleRunStabilityForm.png "Download"){.icon-only .icon-download}                                  [Bruce Howard, 03/06/2020 03:18 PM]{.author}   [Delete](/redmine/attachments/58636 "Delete"){.delete .icon-only .icon-del}
  [OnlineMonitoringPage_On.png](/redmine/attachments/58637/OnlineMonitoringPage_On.png){.icon .icon-attachment} [(78.6 KB)]{.size} [OnlineMonitoringPage_On.png](/redmine/attachments/download/58637/OnlineMonitoringPage_On.png "Download"){.icon-only .icon-download}                              [Bruce Howard, 03/06/2020 04:35 PM]{.author}   [Delete](/redmine/attachments/58637 "Delete"){.delete .icon-only .icon-del}
  [DAQ_Commissioning_Form.png](/redmine/attachments/58699/DAQ_Commissioning_Form.png){.icon .icon-attachment} [(91.3 KB)]{.size} [DAQ_Commissioning_Form.png](/redmine/attachments/download/58699/DAQ_Commissioning_Form.png "Download"){.icon-only .icon-download}                                  [Bruce Howard, 03/14/2020 01:08 AM]{.author}   [Delete](/redmine/attachments/58699 "Delete"){.delete .icon-only .icon-del}
  [Grafana_ShiftersPage_New.png](/redmine/attachments/62324/Grafana_ShiftersPage_New.png){.icon .icon-attachment} [(581 KB)]{.size} [Grafana_ShiftersPage_New.png](/redmine/attachments/download/62324/Grafana_ShiftersPage_New.png "Download"){.icon-only .icon-download}                           [Bruce Howard, 12/06/2020 09:56 PM]{.author}   [Delete](/redmine/attachments/62324 "Delete"){.delete .icon-only .icon-del}
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------- ---------------------------------------------- -----------------------------------------------------------------------------
:::

::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](Grafana_For_Shifters.pdf){.pdf}
[HTML](Grafana_For_Shifters.html){.html}
[TXT](Grafana_For_Shifters.txt){.txt}

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
