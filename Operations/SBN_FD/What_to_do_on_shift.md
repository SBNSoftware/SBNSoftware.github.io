

# What to do while on shift

Collaborators are required to **check this page at least one week before
the start of their shift** and also on the day of the shift in case that
something changed.

Shifters are strongly advised to familiarise with the monitoring screen
layouts and with the shift procedures prior to their actual shift.
Therefore, a shifter might want to do the following **days ahead of the
shift** if

-   **Monitoring from home**: Contact the the current shifter via Slack
    or email to give this person a heads up about your intention to test
    the connections and get acquainted with what to do during the shift.
    If you think you might need help, ask the shifter if they can guide
    you through the steps and maybe even have a chat via the control
    room zoom. It might be possible that the shifter is unable to assist
    you at that moment, or that expert activity is scheduled. In that
    case, you might have to arrange another time for the test.
-   **Monitoring from Fermilab\'s ROC-West** (ROC-West is closed until
    further notice) Drop by ROC-West in advance to your shifts. Either
    the current shifter or other collaborator with previous experience
    will be happy to help you get up to speed. ROC-West is open 24/7 for
    everyone holding a Fermilab batch ID.

**How do I know who is on shift?**

-   Who is currently on shift? Check the ECL [Who is on shift
    now](https://dbweb6.fnal.gov:8443/ECL/sbnfd/C/show_cur_shifts)
    section . You can also visit the \#icarus-shift-operations channel
    in the SBN Slack to find out who the current shifter is by scrolling
    through the messages.
-   Who will or has been on shift? Check the ECL [Shifts
    Calendar](https://dbweb6.fnal.gov:8443/ECL/sbnfd/C/show_month)
    .

```{=html}
<!-- -->
```
-   **Table of contents**
-   [What to do while on shift]
    -   [Shift changeover]
        -   [From-home shift (from March 2020 until further
            notice)]
        -   [Using ROCs (in person)]
    -   [Phone calls on shift]
    -   [Before the start of your
        shift]
    -   [Throughout the shift]
        -   [Main ECL forms to be filled out during every
            shift]
            -   [Run EventBuilder PDU check script from the terminal in
                Slow Controls
                machine]
        -   [Recorded tutorials]
    -   [Good shifter practice]

~\
~

::: 
[Edit this
section](What_to_do_on_shift/edit?section=2){.icon-only
.icon-edit}
:::



## **Shift changeover**

::: 
[Edit this
section](What_to_do_on_shift/edit?section=3){.icon-only
.icon-edit}
:::



### **From-home shift (from March 2020 until further notice)**

The moment shift changeover happens mostly via 2 methods:

-   SBN Slack. Most of the shift changeover discussion happens in the
    \#icarus-shift-operations channel. This channel has the benefit of
    having experts nearby.
-   Zoom room. Useful if verbal communication at handover is preferred
    or necessary. The connection details are at the beginning of [DocDB
    15944](https://sbn-docdb.fnal.gov/cgi-bin/sso/RetrieveFile?docid=15944)
    (or in this [alternate
    link](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=15944))

**For the Incoming Shifter**

Shortly after taking over the shift, the Event Display should be
restarted. Close the Event Display that\'s open and relaunch it from the
launchEVD icon located on the screen (at time of writing it\'s an icon
on the left side of the screen and part way down\... you may have to
scroll down on the screen to see it). See the [Event Display
Wiki](LiveEventDisplay)
for more info.

**For the Outgoing Shifter**

When closing your sessions to sign out:

-   Please press the **DISCONNECT** button in the top right corner of
    the VNC sessions before closing the Web browser (e.g. Firefox) tabs.
    It is in the NoVNC menu on the left side of the screen (it may be
    just an arrow that you have to click to expand). The disconnect
    button is on the bottom, see the [NoVNC
    Wiki](NoVNC)
    for slightly more info as needed!

!(/redmine/attachments/download/61501/Disconnect_NewNoVNC.png)

-   For the **Cryogenics Remote Desktop (iFix) connection ONLY**, please
    **sign off of your logged in session** before closing your Remote
    Desktop connection.

~\
~

::: 
[Edit this
section](What_to_do_on_shift/edit?section=4){.icon-only
.icon-edit}
:::



### **Using ROCs (in person)**

The ROC-West computers use what\'s called the *three-point login* where
we used a shared computer account but authenticate against our
individual Kerberos credentials. The shared username is **sbn**, which
is the first step of logging in to the machines if they have just been
started. Following this, you will be prompted for your Kerberos
credentials. Type your **Kerberos password, THEN your Kerberos principal
(username)**. This will allow you to log into the machine, assuming you
are registered as a shifter. If the machines are already on but locked,
you just have to enter the two Kerberos portions of the three-point
login.

During the shift change-over, the procedure will differ a bit depending
on the location of the shifters.

**Assuming you are both shifting from onsite**:

1.  The previous shifter should lock the screens. Do this by clicking
    the power button at the very top of one of the monitors in each CR
    machine and clicking the lock symbol, as below.\
    ![How to lock the screens for the FNAL control
    room](/redmine/attachments/download/57717/LockScreen.png "How to lock the screens for the FNAL control room")
2.  The next shifter should then log in with their Kerberos credentials
    to begin taking the shift.

**Assuming one shifter is remote**:

1.  If the Fermilab shifter is leaving shift, they should lock the
    screens before leaving. If the Fermilab shifter is beginning shift,
    they should log in using their Kerberos credentials before the
    out-going shifter leaves.
2.  If the remote is leaving shift, they should close out of their
    windows and lock/log-out of the machines as per the protocol of
    their institution or defined by some collaboration specifications.
    (At the time of writing there are no remote control rooms, so we
    must be vague\...). If the remote shifter is beginning shift, they
    should bring up the screens as defined by protocol.

**If both shifters are remote**:

1.  Both shifters follow step 2 of the above procedure.

~\
~

::: 
[Edit this
section](What_to_do_on_shift/edit?section=5){.icon-only
.icon-edit}
:::



## **Phone calls on shift**

In order to make phone calls during the shift, the shifters are required
to log in to the Google Voice Shifter account
(<https://voice.google.com/about>).\
**Account name:** [<shifticarus@gmail.com>]{.ul}\
**Password:** See ECL\
**Shifter Telephone:** +1(631) 894-4173‬

Google Voice account works on US based calls only and it can be used
both for mobile and landline numbers. Phone numbers can be dialed via
the keypad provided by the application.\
Shifters in the US can use both mobile or browser app to make calls,
while Europe based shifters can only do that via browser application. If
authenticating via browser **make sure to enable voice and audio
permession** in order to make/receive calls.\
The shifters are required to be logged in throughout his/her shift in
order to be able to pick up calls. Multiple Google accounts can be used
at the same time in different tabs, hence shifters can use their
personal accounts for other Google products (Gmail, YouTube, etc\...).\
**Shifters are required to log off from the account once the following
shifter checked in in order to prevent possible calls mismanagement**
(e.g. picking up/rejecting a call for the shifter on duty).\
If the shifters need to call a US based expert (see +1 prefix before
their number in the Expert Contact List), please use the Google Voice
number; if the experts miss the call, once available they will know that
the shifter required help.\
If the experts are not US based, the current solution is to call them
using Whatsapp/Telegram or other applications that require WiFi/4G/5G in
order to minimize the costs.\
**IMPORTANT** For security reasons a 2 factors authorization is
sometimes required to log in into the Google Voice account. If you are
requested the pin, notify the current shifter of this and they will
communicate it to you. Pins are received as a text message or as a
notification on the shifter\'s Google voice phone number. Please ask
\@icarus_shift_help in case of problems.

::: 
[Edit this
section](What_to_do_on_shift/edit?section=6){.icon-only
.icon-edit}
:::



## **Before the start of your shift**

1.  Check that all screens are present and correct, and that there are
    no alarms.
2.  Talk to the outgoing shifter and find about any issues that occurred
    during the shift and anything else that you should be aware of
    during yours.
3.  Read the current running conditions in the *Shift bulletin board*
    and ECL entries for the last 24 hours, even if you were on shift on
    the previous day. Running conditions can change daily.
4.  Log in as yourself on any open ECL pages for speediness. This will
    save you time when filling the shift forms and reporting issues. You
    can of course also use your laptop to fill out ECL forms. Use your
    Fermilab **Services** password to log into the ECL.
5.  Log into the Shifter Google Voice account, call the main Fermilab
    control room (+1 630 840 3721) and let them know that the new ICARUS
    shifter has arrived.

~\
~

::: 
[Edit this
section](What_to_do_on_shift/edit?section=7){.icon-only
.icon-edit}
:::



## **Throughout the shift**

Below is a list of the ECL forms that you should fill out throughout
your shift. It is your responsibility to fill out all these forms during
every shift. There are also other forms that you should fill out in
certain situations and others that will be filled by experts. To fill up
a form:

1.  Log into the ICARUS ECL.
2.  Click on *New entry*, in the left vertical menu.
3.  A new window will pop up.
4.  Select a form from the *Form* menu.
5.  Fill up the fields. Some comments to help you complete the form are
    shown on the right of each field. You may need to make the form
    pop-up window larger to see these instructions/comments.

In addition, please make sure to make an ECL post regarding any activity
or issue you encounter while on shift. It is always preferred to have a
lot of information instead of none. If you contact an expert please fill
the *Expert Contact* form in ECL. Likewise, if you are an expert who has
been contacted and/or are working on solving an issue, please fill the
*Expert Activity* form.

~\
~

::: 
[Edit this
section](What_to_do_on_shift/edit?section=8){.icon-only
.icon-edit}
:::



### **Main ECL forms to be filled out during every shift**

  ------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------- ------------------------
  **When**                                                            **What Form**                                                                                                                                         **Where to find more info**                                                                                                                                                                          **Whom to contact?**   **Slack tag**
  Before the previous shifter leaves                                  [Shift check-in](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=Shift+Check-in)                                                   On the checklist                                                                                                                                                                                     Expert shift           `@icarus_shift-help`
  Immediately after shift check-in                                    [Start of shift](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=Start+Shift+Form)                                                 On the checklist                                                                                                                                                                                     Expert shift           `@icarus_shift-help`
  Once during your shift                                              EventBuilder PDU check                                                                                                                                See [paragraph below: \"Run EventBuilder PDU check script from the terminal in Slow Controls machine\"]   Expert shift           `@icarus_shift_help`
  Right after the start of day shift                                  [Daily ICARUS Access](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=Daily+ICARUS+Access)                                         On the checklist                                                                                                                                                                                     Expert shift           `@icarus_shift_help`
  Once every hour                                                     [PMT HV Stability](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=PMT+HV+Stability+Checklist)                                     [PMT HV Monitoring Wiki](PMT_HV_Monitoring)                                                                                                     PMT Expert             `@icarus_pmt_experts`
  Once every hour                                                     [Cryogenic Stability Checklist](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=Cryogenics+Stability+Checklist)                    [iFix tutorial for shifters](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=19190)                                                                                         Cryogenic experts      n/a
  Once every hour                                                     [Cathode HV Checklist](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=Cathode+HV+Checklist)                                       [Cathode HV Wiki](CathodeHVMonitoring)                                                                                                          Drift HV expert        n/a
  Every other hour (with a run ongoing)                               [DAQ Commissioning Checklist](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=DAQ+%28Commisioning%29+Checklist)                    On the checklist and/or shifter bulletin for run condition                                                                                                                                           DAQ Expert             `@sbn_daq_expert`
  Every other hour                                                    [TPC Commissioning monitoring checklist](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=TPC+Commissioning+Monitoring+Checklist)   On the checklist                                                                                                                                                                                     TPC PS Expert          `@icaus-tpcps`
  Every other hour                                                    [BNB simplified checklist](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=BNB+simplified+Checklist)                               [Beam overview Wiki](Beam_-_Overview)                                                                                                           Beam experts           `@icarus_beam_experts`
  Every four hours                                                    [Impedance monitor form](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=Impedance+Monitoring+Form)                                [Impedance monitor wiki](ImpedanceMonitoring)                                                                                                   Linda Bagby            n/a
  After the new shifter has arrived and you have handed things over   [Shift check-out](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=Shift+Check-out)                                                 On the checklist                                                                                                                                                                                     Expert shift           `@icarus_shift-help`
  ------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------- ------------------------

**During the Cooldown/Commissioning:** Make ECL entries every 2 hours on
the status of the run (\"DAQ Commisioning Form\") and another ECL entry
each for if the run is brought down (explaining why) and one when a new
run is started (Run_Start form). You may be asked to alter the schedule
at which you post these forms and/or told you can hold off on posting
this form during DAQ work/testing, but if not asked otherwise you should
go with this. Thanks!

**PURITY RUNS**\
The shifter has among his duties to take purity runs. This is in general
done by the swing shifter around 6 pm CST. In general, the shifter is
informed of when to take purity runs. The instruction can be found on
the dedicated
[wiki](TakingDataWithMoreComponents).
For the swing shifter, it is a good practice to confirm with the
commissioner or deputy commissioner when purity runs are due.

::: 
[Edit this
section](What_to_do_on_shift/edit?section=9){.icon-only
.icon-edit}
:::



#### **Run EventBuilder PDU check script from the terminal in Slow Controls machine**

**Instructions**\
From a terminal in the Slow Controls VNC, run the command

    /home/nfs/howard/pdu_check/runCheckEvbPdu.sh

and report its result in the ECL. A suggested title would be \"Event
Builder PDU Check\"

Specifically, you want to check the results of the lines **EVB rack, PDU
Bank 1:** and **EVB rack, PDU Bank 2:**

**If the value reported in the line for Bank 1 is \> 20 A or the value
reported in the line for Bank 2 \> 2 A**, then call and alert the
Commissioning Coordinator (Angela Fava) or Deputy (Andrea Scarpelli),
whose numbers can be found on the Expert Call List.

**Expert contact**\
In case of necessity, experts can be contacted in various ways: email,
Slack, and Google Voice. Please, make the [Expert contact
form](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=Expert+Contact)
anytime an expert is contacted. The list of experts on-call can be found
on the [ECL
Shift](https://dbweb8.fnal.gov:8443/ECL/sbnfd/C/show_month)
and on the [Shifter\'s
bulletin](Shift_bulletin_board).
A list of expert contacts is also available
<https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=15862>\
~\
~

::: 
[Edit this
section](What_to_do_on_shift/edit?section=10){.icon-only
.icon-edit}
:::



### **Recorded tutorials**

To see the tutorials, you should have accessed the SBN document database
(DocDB) as *icarus*.

-   **Cryogenics** An [iFix tutorial for
    shifters](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=19190)
    can be found in the SBN DocDB 19190. This video goes through the
    steps to connect to the iFix machine and it shows what to monitor
    during commissioning.

```{=html}
<!-- -->
```
-   **PMT** A [PMT tutorial for
    shifters](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=19441)
    can be found in the SBN DocDB 19441. This video goes through the
    steps to connect to the icarus evb 06, which currently runs the PMT
    EPICS. A video showing what to monitor during commissioning will
    also be uploaded soon.\
    ~\
    ~

::: 
[Edit this
section](What_to_do_on_shift/edit?section=11){.icon-only
.icon-edit}
:::



## **Good shifter practice**

-   Show up to your shift 15 minutes before the scheduled start. You are
    also expected to be able to stay 15 minutes beyond the scheduled end
    of your shift.
-   Remain in the control room at all times except for justified brief
    absences of less than 15 minutes or in case of emergency (fire
    alarms, tornado warnings, etc).
-   Add an ECL entry for all the activities and issues that arise during
    your shift.
-   Add clear explanations to the ECL entries and add screen shoots if
    possible.
-   Add the relevant tags to the ECL entries (do not forget to click
    both the *Add* and *Update* buttons). This makes it easier for the
    experts and run coordinators to identify subjects.
:::

Files (3)

::: {style="display: none;"}
::: {.attachments}
::: {.contextual}
[Edit attached
files](/redmine/attachments/wiki_pages/28128/edit "Edit attached files"){.icon-only
.icon-edit}
:::

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ --------------------------------------------------- ---------------------------------------------- -----------------------------------------------------------------------------
  [LockScreen.png](/redmine/attachments/57717/LockScreen.png){.icon .icon-attachment} [(10.1 KB)]{.size} [LockScreen.png](/redmine/attachments/download/57717/LockScreen.png "Download"){.icon-only .icon-download}                                      How to lock the screens for the FNAL control room   [Bruce Howard, 01/29/2020 01:42 PM]{.author}   [Delete](/redmine/attachments/57717 "Delete"){.delete .icon-only .icon-del}
  [DisconnectVNC.png](/redmine/attachments/61474/DisconnectVNC.png){.icon .icon-attachment} [(84.3 KB)]{.size} [DisconnectVNC.png](/redmine/attachments/download/61474/DisconnectVNC.png "Download"){.icon-only .icon-download}                                                                              [Bruce Howard, 10/23/2020 04:12 PM]{.author}   [Delete](/redmine/attachments/61474 "Delete"){.delete .icon-only .icon-del}
  [Disconnect_NewNoVNC.png](/redmine/attachments/61501/Disconnect_NewNoVNC.png){.icon .icon-attachment} [(172 KB)]{.size} [Disconnect_NewNoVNC.png](/redmine/attachments/download/61501/Disconnect_NewNoVNC.png "Download"){.icon-only .icon-download}                                                       [Bruce Howard, 10/26/2020 10:25 PM]{.author}   [Delete](/redmine/attachments/61501 "Delete"){.delete .icon-only .icon-del}
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ --------------------------------------------------- ---------------------------------------------- -----------------------------------------------------------------------------
:::

::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](What_to_do_on_shift.pdf){.pdf}
[HTML](What_to_do_on_shift.html){.html}
[TXT](What_to_do_on_shift.txt){.txt}

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
