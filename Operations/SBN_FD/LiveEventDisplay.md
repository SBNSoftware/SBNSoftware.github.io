

# Using the TITUS Live Event Display

The ICARUS Control Room uses the TITUS Live Event Display (EVD) to view
events in the detector. The Online Monitor is set up to output a decoded
file that is viewable by the event display. A new file with event(s) to
view are output periodically. So, if the Online Monitor is running, then
there should be files to look at!

**Notes For Usage:**

1\. When you load up the event display, hit Update in the File Update
area to start it automatically scanning the most recent file every 3
minutes. This means you should see the event change every \~3 minutes.
To actually see the events, you will want to select the Raw Digit radio
button shown in Box 3 in the picture below. You\'ll then want to select
a subset of the canvases from Box 4 and change the color-axis ranges
that will be in the right hand side of Box 5. See [this ECL
entry](https://dbweb0.fnal.gov/ECL/sbnfd/E/show?e=16633) for
the suggested configuration for Shifter Runs.

2\. If you notice the event display isn\'t updating after some time then
you can check the following things:\
a) Is the OnMon still updating? If the TPC OnMon is `OFF` and/or the RMS
plots in the `Flange Overview` page haven\'t updated in some time then
restart the OnMon\
b) If OnMon is running, or you restarted it and the event still doesn\'t
update after several minutes, you can try to close and re-open the event
display

3\. During the shift changeover, either the outgoing shifter or the
incoming shifter should restart the Event Display. You can close the
Event Display and then double click on the icon shown below on the DAQ
VNC session. (We want to refresh the Event Display\'s memory usage on
about this time-scale, hence why we want it to be restarted during each
shift)

**NOTE on 10 DECEMBER 2020:** Really we want it to be restarting more
frequently than every 8 hours. Wes has set up the script to
automatically restart the event display every 2 hours instead. We
apologize for this inconvenience, but for now this really needs to
restart to clear out it\'s memory. It\'s important.

4\. If restarting the event display causes something to happen to the
DAQ VNC and/or the run, the shifter can contact the DAQ on-call expert.

~\
~

**TITUS Live Event Display:**

To launch the EVD, there is an icon in the Desktop folder of the DAQ VNC
session with the letters EVD and drawings of shower-like and a
track-like interactions. See the picture below

![Icon to launch the Event
Display.](/redmine/attachments/download/61134/launchEVD.png "Icon to launch the Event Display.")

Upon opening the EVD, you will see a blank canvas like this, on which
I\'ve written numbers and boxes to explain below:

![Annotated Event Display. The numbers are described in the
text.](/redmine/attachments/download/61135/evdAnnotated.png "Annotated Event Display. The numbers are described in the text.")

**A description of the items noted above:**

**1** This is what tells the EVD to look for the most recent file and
load in its event(s). It will attempt to load in a new file on a time
gap that is specified by \"Delay\"

**2** This is what tells you the current event you are looking at. If
you\'re looking at a recent file, it should have the same run number as
the current run, and an event number near the expected event number
(e.g. as reported by Grafana). Additionally, if the most recent file is
older than some threshold, a message will appear in the bottom of the
EVD where it currently says \"Message Bar\". When the file updates you
should see the event number update as well.

**3** This is what controls the drawing options. Generally you want to
click \"Raw Digit\" for the Live Event Dislpay.

**4** This is how you control what Cryostat/Views are being drawn. It
opens with all cryostats and all views by default, but this can be hard
to see well. You can select fewer views at a time to get each one to be
larger.

**5** This is where the event gets drawn! Wire number is on the x-axis
and time on the y-axis.

On the right are color scales that you can use to adjust the ranges
being drawn. When you enter a new value for the range, you should hit
**enter** or **return** to set that value for the canvas.

If you\'re using a mouse (recommended) you can right click and drag to
re-position the canvas. Left-clicking and dragging selects a region to
zoom in on. The center wheel zooms in and out. If you\'re not using a
mouse, you may only have access to the left-click feature.

**6** These are a set of drawing options.

If you click on the option to make a wire drawing and then left click in
one of the views, it will show you the waveform for that wire in that
event, and you can do things like make an FFT as well. This wire drawing
appears at the bottom and looks like this:

![This is what the wire drawing looks like before clicking on a
wire](/redmine/attachments/download/61136/blankWireDiagram.png "This is what the wire drawing looks like before clicking on a wire")

**NOTE** that when the event updates, this wire drawing seems to stay
the same. Click somewhere in the new canvas to get a wire drawing for
the current event\...

If you get to a drawing state that you don\'t like then you can go back
to the default ranges in the drawing by selecting then deselecting the
AutoRange button.

Scale Bar will put a useful scale bar on the event display to gauge
x-axis distances in terms of wire. Use cm turns that into centimeters.

Draw anode/cathode will draw lines in the time-axis for the anode and
cathode.

**7** Optical event display coming soon!
:::

Files (3)

::: {style="display: none;"}
::: {.attachments}
::: {.contextual}
[Edit attached
files](/redmine/attachments/wiki_pages/29405/edit "Edit attached files"){.icon-only
.icon-edit}
:::

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------- ---------------------------------------------- -----------------------------------------------------------------------------
  [launchEVD.png](/redmine/attachments/61134/launchEVD.png){.icon .icon-attachment} [(11 KB)]{.size} [launchEVD.png](/redmine/attachments/download/61134/launchEVD.png "Download"){.icon-only .icon-download}                                 Icon to launch the Event Display.                                    [Bruce Howard, 09/28/2020 08:36 PM]{.author}   [Delete](/redmine/attachments/61134 "Delete"){.delete .icon-only .icon-del}
  [evdAnnotated.png](/redmine/attachments/61135/evdAnnotated.png){.icon .icon-attachment} [(485 KB)]{.size} [evdAnnotated.png](/redmine/attachments/download/61135/evdAnnotated.png "Download"){.icon-only .icon-download}                    Annotated Event Display. The numbers are described in the text.      [Bruce Howard, 09/28/2020 08:40 PM]{.author}   [Delete](/redmine/attachments/61135 "Delete"){.delete .icon-only .icon-del}
  [blankWireDiagram.png](/redmine/attachments/61136/blankWireDiagram.png){.icon .icon-attachment} [(20.1 KB)]{.size} [blankWireDiagram.png](/redmine/attachments/download/61136/blankWireDiagram.png "Download"){.icon-only .icon-download}   This is what the wire drawing looks like before clicking on a wire   [Bruce Howard, 09/28/2020 08:40 PM]{.author}   [Delete](/redmine/attachments/61136 "Delete"){.delete .icon-only .icon-del}
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------- ---------------------------------------------- -----------------------------------------------------------------------------
:::

::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](LiveEventDisplay.pdf){.pdf}
[HTML](LiveEventDisplay.html){.html}
[TXT](LiveEventDisplay.txt){.txt}

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
