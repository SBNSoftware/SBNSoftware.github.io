

# **PMT HV Monitoring** ~~ ~~

::: 
[Edit this
section](PMT_HV_Monitoring/edit?section=2){.icon-only
.icon-edit}
:::



## **For Shifters**

This document contains useful information for the shifter monitoring the
PMT stability, a description of common anomalies, and a list of expert
contacts. This document stands as support to the PMT HV Monitoring ECL
form which has to be filled up **every hour**. Always remember to follow
the *shifter etiquette*: to ask the previous shifters about anomalies or
ongoing tests, to read the shifter bulletin, and to revise recent ECL
entries.\
~~\
~~

::: 
[Edit this
section](PMT_HV_Monitoring/edit?section=3){.icon-only
.icon-edit}
:::



### **Contact an Expert**

PMT experts can be notified on Slack using the *\@icarus_pmt_experts*
tag in Slack or by using the channel *\#pmt_experts*. Furthermore, an
expert on-call is always ready to answer any PMT-related questions or
issues. Expert contacts can be found
[here](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=15862),
while to know who is the expert on call, please refer to the shifter
page on the ECL.

::: 
[Edit this
section](PMT_HV_Monitoring/edit?section=4){.icon-only
.icon-edit}
:::



### **Standard conditions**

Once your shift begins you should find the window below open on the DCS
server;

!(/redmine/attachments/download/63088/shifter-gui.png)

If this is not the case, then you are encouraged to jump to the next
section of this document to learn how to bring back the main window or
notify an expert for help. The main window gives a general overview of
the status of the system; it is divided into two sub-windows, one for
the EAST and one for the WEST cryostat. Both should appear similar in
look and display similar values. The most relevant parts for the shifter
are:\
**1. Bertan Voltage monitors**: Accepted values are within *1995V* and
*2005 V*. Some fluctuations are expected, however, the box frame turns
orange and red when the reported values differ too much from the set
values. Make an ECL entry with a screenshot and notify an expert in case
such an event occurs.\
**2. Bertan Current monitors**: Accepted values are within *55uA* and
*65 uA*. Some fluctuations are expected, however, the box frame turns
orange and red when the reported values differ too much from the set
values. Make an ECL entry with a screenshot and notify an expert in case
such an event occurs.\
**3. Network**: the message should report *connected* at any time. The
window turns pink if some errors occur, for these events, it is
important to make an ECL entry with a screenshot and call an expert;\
**4. Epics server**: the message should report *running* at any time.
The window turns pink if some errors occur, for these events, it is
important to make an ECL entry with a screenshot and call an expert;\
**5. VME Crate monitor**: the message should report *ok* at any time. If
anything different is displayed, please call an expert. For these
events, it is important to make an ECL entry with a screenshot;\
**6. \*\"Monitor\" buttons**: by pushing these buttons it is possible to
access more detailed information about the status of individual PMTs.
The color of the button is expected to be **gray**, however, it will
turn out to **red** in case an alarm is on one or more PMTs. Regardless
of the color of the button, for now, the shifter is asked to push the
button and enter the individual channel monitors and check the status of
the individual PMTs.\
**7. Individual PMTs status**: by pushing the Monitor button it is
possible to access the overview of the status of all PMTs. The page
should look like below:

!(/redmine/attachments/download/61600/channel-monitor.png)

The monitor page has the following information Channels \#, PMT ID \#,
Nominal Voltage, Voltage Monitored(VMON), Status. Active PMTs will be
illuminated with a *bright green*. PMTs which are OFF will be colored in
*dim green*. The *VMON box will be colored in orange if the voltage is
between +/- 5 V from VSET*, and *in red if the voltage is between +/- 20
V from VSet*. In either case, post a screenshot on the ECL and notify an
expert. The status of an active PMT should be **ON**. Other possible
status messages might appear. Call an expert if a PMT shows one of the
following statuses: **OverCurrent**, **Undercurrent**, **Trip**. We have
three inactive PMTs showing status message **disconnected** ch 143 on
the west side and ch 253 and 290 on the east side. These can be safely
ignored. Other PMTS that are disconnected and grayed out can be ignored.

::: 
[Edit this
section](PMT_HV_Monitoring/edit?section=5){.icon-only
.icon-edit}
:::



### **Navigate the windows**

Here are some simple commands and tips to navigate the PMT monitoring

1\. If this DCS monitor window appears, just press *PMT subsystem*.

!(/redmine/attachments/download/61601/dcs-overview.png)

2\. To access the pmt channel monitor just press the *Channel Monitor*
button.

3\. To go back to Bertan power supply GUI, click on the back button in
the upper-left corner of the GUI window.

!(/redmine/attachments/download/61602/go-back.png)

::: 
[Edit this
section](PMT_HV_Monitoring/edit?section=6){.icon-only
.icon-edit}
:::



## **For experts**

Werther you\'re are a well-navigated PMT expert or a newbie, these
instructions will provide a summary of the most common actions requested
to shifters and a fully comprehensive list of documents and reference
material to weasel one\'s way out of most uncomfortable situations. It
is important to follow the *shifter\'s etiquette* and post extensively
on the ECL any action taken and inform all relevant people. The Slack
tag *\@icarus_pmt_expert can be used to notify all PMT experts and Slack
channels \_\#pmt_experts* and *\#icarus-shift-operation* can be useful
for communication as well.

These instructions are *updated to November 2020*.

::: 
[Edit this
section](PMT_HV_Monitoring/edit?section=7){.icon-only
.icon-edit}
:::



### **Expert tutorial**

A tutorial for PMT experts has been held on Nov. 05th 2020. Relevant
documentation is archived on docdb for future reference. The material
below might be useful to refresh procedures and as a good starting point
for new shifters.

**1. Overview of the PMT system** (Gianluca Raselli):
<https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=19922>
([SSO
link](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=19922))\
**2. PMT slow control** (Niccolo\' Moggi):
<https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=19934>
([SSO
link](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=19934))

\[Add other relevant material?\]

::: 
[Edit this
section](PMT_HV_Monitoring/edit?section=8){.icon-only
.icon-edit}
:::



### **Ramping up and down voltage on PMTs**

Given a situation where all the PMTs are OFF and the Bertan power supply
is OFF as well:\
1) Make sure all the PMTs are OFF, that they hold their correct set
voltage, that Channel interlock shows *hv enabled*, and set ramp field
shows 200V\
2) Set 1000 V in the Bertan set Voltage field and press enter. Then
switch on the Bertan. The power will ramp up to 1000V. During this
operation, the PLC alarm will turn to *busy*.\
3) Once the voltage monitor shows 1000V and the *busy* alarm turns back
to *idle*, it is possible to turn on all the PMTs using the PMT on/off
button located over the channel monitor button. Wait 1-2 minutes for the
PMTs to ramp up. The PMT channel status should turn orange during
ramping up and turn red and display the error Under voltage, once the
ramping up to 1000V is terminated.\
4) Now increase the voltage in the Bertan in steps of 100V using the
jump to voltage button. Voltage will increase on the PMT channels too.\
5) Stop once 2000V is reached. The status of all PMTs should be ON and
display no message or alarms.

To ramp down the voltage and turn off the Bertan\
1) Ramp down the Bertan in steps of 100V using the Set voltage button
until 1000 V is reached.\
2) Now turn off the PMTs using the general switch and wait until ramp
down is completed.\
3) Once all PMTs are off and their status is correctly reported Off,
Shiwtch off the Bertan switch and wait until current and voltage ramp
down to 0.\
4) Restore the general DCS control GUI by pressing the back button at
the top left of the Power supplier GUI.

To modify the voltage on an individual PMT:\
1) Press on the **channel control** button to open the PMT control
button\
2) Set the voltage for your PMT in the Vset box and press ENTER\
3) Wait until Ramping up is completed. An error message *Overvoltage* or
*Undervoltage* might appear at the end of this procedure. Don\'t forget
to inform the shifter and post this action on the ECL.

More detailed instruction and debugging can be found
[here](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=19934)

::: 
[Edit this
section](PMT_HV_Monitoring/edit?section=9){.icon-only
.icon-edit}
:::



### **Common troubleshooting and FAQs**

This page is kept updated with feedbacks from other PMT experts and
shifters. Please, share your feedbacks within the pmt experts slack
group for improvements.

**1. Inactive channels**: We have three inactive PMTs: **ch 143** on the
west side and **ch 253** and **ch 290** on the east side. The alarm
message displayed for those channels is *disconnected*. This does not
mean the slow control does not measure the voltage values for these
PMTs, but they are not marked as relevant for the shifters to monitor.

**2. Fluctuating voltage**: During the past month (December 2020), we
have been observed voltage fluctuations on many PMTs. Now this problem
is in large part solved, but only PMT 224 results still fluctuating in
voltage. These fluctuations are sometimes up to +/- 20V from its set
voltage. For any new oscillating PMT, an expert should monitor said PMT
and lower the voltage to 1100V in case the oscillations frequently
surpass +/- 20V from the set voltage (frame box turns red when this
happens). The frequency of the fluctuations can be controlled on the
EPICS webpage of the OM. Sporadic oscillations can be ignored, but
frequent and large oscillations should be addressed.

**3 Trip and overcurrent alarms** PMTs who tripped or show the
overcurrent alarms should be brought back to 1100V and inspected on the
scope.

**4 Server down**: The server label will be *disconnected* and the box
will turn pink. This means that the server that provides communication
with Epics is down. Easy solution: restart the Epics IOC by pressing the
\"IOC restart\" button.

**5 Problem: lost network connection.** The network label will be
*disconnected* and the box will turn pink. When this happens, all
communications with the distributor are lost and the monitor will not
update, but the PMTs are (likely) ok. To issue a reset command, open the
expert control panel (button on top right of the standard shifter
interface) and press the \"Reset\" button on the right of the one
\"Network\" box that is \"disconnected\". Allow some time for the reset
to complete.

**6 Re-open CSS-Studio with the PMT GUI**: if the CSS studio window
where the HV monitoring is located is closed, one can simpy type
\`csspmt\` in a fresh terminal on the DCS machine to recover it.

**7 Impossible to connect to the DCS server**: this might happen, but it
is not strictly related to the PMT subsystem. If you\'re informed of
this problem by the shifter or happens to yourself it is probably
necessary to report to the shift experts on-call or
*\@icarus_shift_expert* on Slack.

**8 Irresponsive GUI or command line controls**: a full list of command
lines to be used in case the PMT GUI becomes irresponsive. For this, you
must connect to the \`icarus-dcs01\` machine. If outside the Fermilab
network you must first ssh to the gateway as the \`icarusdcs\` user. for
example:


    ssh -K icarusdcs@icarus-gateway02.fnal.gov

    ssh icarus-dcs01

A list of the most important command lines to control and find
information about the PMT system can be found
[here](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=19934)

::: 
[Edit this
section](PMT_HV_Monitoring/edit?section=10){.icon-only
.icon-edit}
:::



## **Legacy expert information**

    Login ssh -KL 5443:icarus-evb05.fnal.gov:443 icarus@icarus-gateway02.fnal.gov

    Login through browser  https://localhost:5443

There are also icons/scripts for the other monitoring tools in the
SBN_CR package on GitHub. Right now these are available from the feature
branch fb-pmtmon
(<https://github.com/brucehoward-physics/SBN_CR/tree/fb-pmtmon>)\
1. **On-off Switch :** An ON switch points to the sign ON and it is
colored in bright green. An OFF switch points to off and it is colored
in dark green. The switch should be **ON**, please call an expert if
this is not the case.\
3. **Voltage Monitor :** Voltage values within the blue box (Voltage
meter) should be (2000+/- 10) Volt. If the value recorded is 50 V more
or less than VSet, then the box frame will turn orange. If it is 100 V
more or less than VSet, the box will turn red. In either case, post a
screenshot of the GUI on the ECL and send an email to <ANC238@pitt.edu>
or <ascarpell@bnl.gov> and <niccolo.moggi@bo.infn.it>.\
4. **Current Monitor** : The expected value for 180 PMTs powered up
should be between 60 mA. If the value recorded is within +/-10 mA around
the nominal value, then the box frame will turn orange. If it is +/- 20
mA around the nominal, the box will turn red. In either case please
notify an expert\
5. The **PLC** text box shows the status of the plc that controls the
power supply. It is usually in **idle** except when the plc is working
to ramp up/down the voltage: during this timelapse, it shows **busy:
wait!** (over yellow background) to indicate that no other operation
should be done before it returns to the idle state. Should it not go
back into idle after about 10 minutes, call an expert.\
6. The **Channel Interlock** text box shows **HV enabled**. This tells
the power supply is on and distributing voltage. **For experts** when
the channel interlock is HV enabled you may turn on the power supply. If
it shows HV inhibited (red frame) this means that one or more HV channel
is on and the Bertan primary power supply cannot be turned on. Actions:
1) turn off the Bertan power supply; 2) turn off all channels in the HV
Distributor panel; 3) finally turn on the Bertan primary power supply.\
8. **Do NOT Click on the Jump to Set Voltage option (for Experts
Only)**\
9. **Channel monitor** button: click on this button to open the HV
distributor monitoring ( to monitor status for each PMT tube ).If during
you see this button colored red please notify an expert.\
10. **Network**: should be \"Connected\". If the SY1527 distributor
becomes not reachable anymore over the network, the text will change to
**disconnected** and framed red. Please email to an expert and to
<niccolo.moggi@bo.infn.it>. While the network is disconnected the GUI
will not be updated but if there are no other problems the pmt will
continue to be powered.\
11. **Server** : should be \"running\". If the SY1527 server crashes,
the text changes to **down** and the channels monitor will not update
anymore. How to react: 1) ask an expert if available during his daytime,
or 2) try press the \"IOC restart\" button: the GUI will show
\'disconnected\' for about one minute and then should be back. If there
is any problem send an email to <niccolo.moggi@bo.infn.it>\
12. **HV Configuration Files**: to be used by experts for calibrations.
The file selector allows to pick a file with the voltage configuration;
the Load button will move this file into the Epics SY1527/db folder so
that the IOC will read it at first restart. **This is for experts
only**\
13. **PMT Digitizer**: the \"Crate Monitor\" button will open the
VME_monitor panel where all the internal voltages of the digitizer vme
crates are shown. If any of such values is different than nominal value
the button will become red and the text box will go into **alarm!**:
please call an expert.\_
:::

Files (25)

::: {style="display: none;"}
::: {.attachments}
::: {.contextual}
[Edit attached
files](/redmine/attachments/wiki_pages/29011/edit "Edit attached files"){.icon-only
.icon-edit}
:::

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -- ---------------------------------------------------- -----------------------------------------------------------------------------
  [Screenshot from 2020-06-26 15-35-33.png](/redmine/attachments/59971/Screenshot%20from%202020-06-26%2015-35-33.png){.icon .icon-attachment} [(248 KB)]{.size} [Screenshot from 2020-06-26 15-35-33.png](/redmine/attachments/download/59971/Screenshot%20from%202020-06-26%2015-35-33.png "Download"){.icon-only .icon-download}                          [Animesh Chatterjee, 06/29/2020 05:42 PM]{.author}   [Delete](/redmine/attachments/59971 "Delete"){.delete .icon-only .icon-del}
  [Screenshot from 2020-06-26 15-35-33 (1).png](/redmine/attachments/59972/Screenshot%20from%202020-06-26%2015-35-33%20(1).png){.icon .icon-attachment} [(248 KB)]{.size} [Screenshot from 2020-06-26 15-35-33 (1).png](/redmine/attachments/download/59972/Screenshot%20from%202020-06-26%2015-35-33%20(1).png "Download"){.icon-only .icon-download}      [Animesh Chatterjee, 06/30/2020 09:07 AM]{.author}   [Delete](/redmine/attachments/59972 "Delete"){.delete .icon-only .icon-del}
  [Screenshot from 2020-06-26 15-35-33.png](/redmine/attachments/59973/Screenshot%20from%202020-06-26%2015-35-33.png){.icon .icon-attachment} [(248 KB)]{.size} [Screenshot from 2020-06-26 15-35-33.png](/redmine/attachments/download/59973/Screenshot%20from%202020-06-26%2015-35-33.png "Download"){.icon-only .icon-download}                          [Animesh Chatterjee, 06/30/2020 09:13 AM]{.author}   [Delete](/redmine/attachments/59973 "Delete"){.delete .icon-only .icon-del}
  [Screenshot from 2020-06-26 15-35-33.png](/redmine/attachments/59974/Screenshot%20from%202020-06-26%2015-35-33.png){.icon .icon-attachment} [(248 KB)]{.size} [Screenshot from 2020-06-26 15-35-33.png](/redmine/attachments/download/59974/Screenshot%20from%202020-06-26%2015-35-33.png "Download"){.icon-only .icon-download}                          [Animesh Chatterjee, 06/30/2020 09:14 AM]{.author}   [Delete](/redmine/attachments/59974 "Delete"){.delete .icon-only .icon-del}
  [Screenshot from 2020-06-26 15-35-33.png](/redmine/attachments/60005/Screenshot%20from%202020-06-26%2015-35-33.png){.icon .icon-attachment} [(248 KB)]{.size} [Screenshot from 2020-06-26 15-35-33.png](/redmine/attachments/download/60005/Screenshot%20from%202020-06-26%2015-35-33.png "Download"){.icon-only .icon-download}                          [Animesh Chatterjee, 07/06/2020 04:11 PM]{.author}   [Delete](/redmine/attachments/60005 "Delete"){.delete .icon-only .icon-del}
  [test00.png](/redmine/attachments/60006/test00.png){.icon .icon-attachment} [(539 KB)]{.size} [test00.png](/redmine/attachments/download/60006/test00.png "Download"){.icon-only .icon-download}                                                                                                                                                          [Animesh Chatterjee, 07/06/2020 04:16 PM]{.author}   [Delete](/redmine/attachments/60006 "Delete"){.delete .icon-only .icon-del}
  [Bertan_HV.png](/redmine/attachments/60007/Bertan_HV.png){.icon .icon-attachment} [(199 KB)]{.size} [Bertan_HV.png](/redmine/attachments/download/60007/Bertan_HV.png "Download"){.icon-only .icon-download}                                                                                                                                              [Animesh Chatterjee, 07/06/2020 04:20 PM]{.author}   [Delete](/redmine/attachments/60007 "Delete"){.delete .icon-only .icon-del}
  [Channel_Monitor.png](/redmine/attachments/60008/Channel_Monitor.png){.icon .icon-attachment} [(437 KB)]{.size} [Channel_Monitor.png](/redmine/attachments/download/60008/Channel_Monitor.png "Download"){.icon-only .icon-download}                                                                                                                      [Animesh Chatterjee, 07/06/2020 04:24 PM]{.author}   [Delete](/redmine/attachments/60008 "Delete"){.delete .icon-only .icon-del}
  [pmt_monitor.opi.png](/redmine/attachments/60045/pmt_monitor.opi.png){.icon .icon-attachment} [(218 KB)]{.size} [pmt_monitor.opi.png](/redmine/attachments/download/60045/pmt_monitor.opi.png "Download"){.icon-only .icon-download}                                                                                                                      [Niccolo Moggi, 07/09/2020 03:04 PM]{.author}        [Delete](/redmine/attachments/60045 "Delete"){.delete .icon-only .icon-del}
  [pmt_hv_channels.png](/redmine/attachments/60046/pmt_hv_channels.png){.icon .icon-attachment} [(302 KB)]{.size} [pmt_hv_channels.png](/redmine/attachments/download/60046/pmt_hv_channels.png "Download"){.icon-only .icon-download}                                                                                                                      [Niccolo Moggi, 07/09/2020 03:06 PM]{.author}        [Delete](/redmine/attachments/60046 "Delete"){.delete .icon-only .icon-del}
  [dcs_monitor.png](/redmine/attachments/60055/dcs_monitor.png){.icon .icon-attachment} [(69.5 KB)]{.size} [dcs_monitor.png](/redmine/attachments/download/60055/dcs_monitor.png "Download"){.icon-only .icon-download}                                                                                                                                     [Andrea Scarpelli, 07/10/2020 06:00 PM]{.author}     [Delete](/redmine/attachments/60055 "Delete"){.delete .icon-only .icon-del}
  [pmt_monitor_new.png](/redmine/attachments/60057/pmt_monitor_new.png){.icon .icon-attachment} [(139 KB)]{.size} [pmt_monitor_new.png](/redmine/attachments/download/60057/pmt_monitor_new.png "Download"){.icon-only .icon-download}                                                                                                                      [Andrea Scarpelli, 07/10/2020 06:30 PM]{.author}     [Delete](/redmine/attachments/60057 "Delete"){.delete .icon-only .icon-del}
  [return_back.png](/redmine/attachments/60059/return_back.png){.icon .icon-attachment} [(55.7 KB)]{.size} [return_back.png](/redmine/attachments/download/60059/return_back.png "Download"){.icon-only .icon-download}                                                                                                                                     [Andrea Scarpelli, 07/10/2020 06:34 PM]{.author}     [Delete](/redmine/attachments/60059 "Delete"){.delete .icon-only .icon-del}
  [return_back.png](/redmine/attachments/60060/return_back.png){.icon .icon-attachment} [(82.5 KB)]{.size} [return_back.png](/redmine/attachments/download/60060/return_back.png "Download"){.icon-only .icon-download}                                                                                                                                     [Andrea Scarpelli, 07/10/2020 07:03 PM]{.author}     [Delete](/redmine/attachments/60060 "Delete"){.delete .icon-only .icon-del}
  [pmt_monitor_new2.png](/redmine/attachments/60176/pmt_monitor_new2.png){.icon .icon-attachment} [(185 KB)]{.size} [pmt_monitor_new2.png](/redmine/attachments/download/60176/pmt_monitor_new2.png "Download"){.icon-only .icon-download}                                                                                                                  [Niccolo Moggi, 07/29/2020 01:34 AM]{.author}        [Delete](/redmine/attachments/60176 "Delete"){.delete .icon-only .icon-del}
  [pmt-gui-sept2020.png](/redmine/attachments/61108/pmt-gui-sept2020.png){.icon .icon-attachment} [(182 KB)]{.size} [pmt-gui-sept2020.png](/redmine/attachments/download/61108/pmt-gui-sept2020.png "Download"){.icon-only .icon-download}                                                                                                                  [Niccolo Moggi, 09/23/2020 11:44 AM]{.author}        [Delete](/redmine/attachments/61108 "Delete"){.delete .icon-only .icon-del}
  [pmt-gui-oct2020.png](/redmine/attachments/61158/pmt-gui-oct2020.png){.icon .icon-attachment} [(172 KB)]{.size} [pmt-gui-oct2020.png](/redmine/attachments/download/61158/pmt-gui-oct2020.png "Download"){.icon-only .icon-download}                                                                                                                      [Niccolo Moggi, 10/01/2020 04:04 AM]{.author}        [Delete](/redmine/attachments/61158 "Delete"){.delete .icon-only .icon-del}
  [pmt-gui-standard.png](/redmine/attachments/61552/pmt-gui-standard.png){.icon .icon-attachment} [(133 KB)]{.size} [pmt-gui-standard.png](/redmine/attachments/download/61552/pmt-gui-standard.png "Download"){.icon-only .icon-download}                                                                                                                  [Andrea Scarpelli, 11/02/2020 07:18 PM]{.author}     [Delete](/redmine/attachments/61552 "Delete"){.delete .icon-only .icon-del}
  [pmt_hv_channels.png](/redmine/attachments/61553/pmt_hv_channels.png){.icon .icon-attachment} [(336 KB)]{.size} [pmt_hv_channels.png](/redmine/attachments/download/61553/pmt_hv_channels.png "Download"){.icon-only .icon-download}                                                                                                                      [Andrea Scarpelli, 11/02/2020 07:19 PM]{.author}     [Delete](/redmine/attachments/61553 "Delete"){.delete .icon-only .icon-del}
  [non-working.png](/redmine/attachments/61562/non-working.png){.icon .icon-attachment} [(12.8 KB)]{.size} [non-working.png](/redmine/attachments/download/61562/non-working.png "Download"){.icon-only .icon-download}                                                                                                                                     [Andrea Scarpelli, 11/03/2020 06:54 AM]{.author}     [Delete](/redmine/attachments/61562 "Delete"){.delete .icon-only .icon-del}
  [shifter-gui.png](/redmine/attachments/61599/shifter-gui.png){.icon .icon-attachment} [(141 KB)]{.size} [shifter-gui.png](/redmine/attachments/download/61599/shifter-gui.png "Download"){.icon-only .icon-download}                                                                                                                                      [Andrea Scarpelli, 11/10/2020 03:23 PM]{.author}     [Delete](/redmine/attachments/61599 "Delete"){.delete .icon-only .icon-del}
  [channel-monitor.png](/redmine/attachments/61600/channel-monitor.png){.icon .icon-attachment} [(117 KB)]{.size} [channel-monitor.png](/redmine/attachments/download/61600/channel-monitor.png "Download"){.icon-only .icon-download}                                                                                                                      [Andrea Scarpelli, 11/10/2020 03:29 PM]{.author}     [Delete](/redmine/attachments/61600 "Delete"){.delete .icon-only .icon-del}
  [dcs-overview.png](/redmine/attachments/61601/dcs-overview.png){.icon .icon-attachment} [(21.4 KB)]{.size} [dcs-overview.png](/redmine/attachments/download/61601/dcs-overview.png "Download"){.icon-only .icon-download}                                                                                                                                 [Andrea Scarpelli, 11/10/2020 03:29 PM]{.author}     [Delete](/redmine/attachments/61601 "Delete"){.delete .icon-only .icon-del}
  [go-back.png](/redmine/attachments/61602/go-back.png){.icon .icon-attachment} [(5.98 KB)]{.size} [go-back.png](/redmine/attachments/download/61602/go-back.png "Download"){.icon-only .icon-download}                                                                                                                                                     [Andrea Scarpelli, 11/10/2020 03:29 PM]{.author}     [Delete](/redmine/attachments/61602 "Delete"){.delete .icon-only .icon-del}
  [shifter-gui.png](/redmine/attachments/63088/shifter-gui.png){.icon .icon-attachment} [(65.6 KB)]{.size} [shifter-gui.png](/redmine/attachments/download/63088/shifter-gui.png "Download"){.icon-only .icon-download}                                                                                                                                     [Andrea Scarpelli, 02/26/2021 05:10 PM]{.author}     [Delete](/redmine/attachments/63088 "Delete"){.delete .icon-only .icon-del}
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -- ---------------------------------------------------- -----------------------------------------------------------------------------
:::

::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](PMT_HV_Monitoring.pdf){.pdf}
[HTML](PMT_HV_Monitoring.html){.html}
[TXT](PMT_HV_Monitoring.txt){.txt}

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
