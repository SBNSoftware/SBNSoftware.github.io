

# Cathode Drift HV Monitoring

  --------------------- ------------------ --------------------- -------------------
  **Expert On-Call:**   Zachary Williams   **Contact Number:**   +1 (817) 863-6125
  **Back-Up Expert:**   Hector Carranza    **Contact Number:**   +1 (310) 426-0318
  --------------------- ------------------ --------------------- -------------------

The currently acceptable voltages and currents that should be referenced
are in the table below:

  ----------------------------- ------------------------ ------------------------------- -----------------
  **Typical Voltage Values:**   75161V, 75186V, 75212V   **Acceptable Voltage Range:**   74959V - 75311V
  **Typical Current Values:**   396uA, 397uA             **Acceptable Current Range:**   394uA - 398uA
  ----------------------------- ------------------------ ------------------------------- -----------------

**Shifters are asked to fill out the Cathode HV Checklist once every
hour during their shift.**

**EDIT 10/12/2020: DUE TO THE INSTABILITY OF THE CATHODE HV ONLINE
MONITORING PAGES, PLEASE USE THE CSS TOOL ON THE SLOW CONTROLS PAGE (THE
DCS VNC SERVER) AS PRIMARY TO MONITOR THE HV. PLEASE GO TO
<https://cdcvs.fnal.govICARUS_DCS_GUIs_for_Operations_>
FOR INSTRUCTIONS ON HOW TO OPEN THE GUI (IF IT IS NOT ALREADY OPEN) AND
PICTURE REFERENCES. THE EXP.OPI TAB IN THE GUI WILL TAKE THE PLACE OF
THE TABLE IN
<https://sbn-online.fnal.gov/cgi-bin/icarus-minargon/icarus-minargon.wsgi/epics/cathodehv>
AND THE CATHODEHV-PLOTS.PLT TAB WILL BE USED AS THE GRAPH FOR
MONITORING. WHEN FILLING OUT THE CHECKLIST, PAY ATTENTION TO THE BLUE
CIRCLED INFORMATION IN THE PHOTO BELOW!! DO NOT FILL THE CHECKLIST OUT
WITH THE SET VOLTAGE AND SET CURRENT!!**

!(/redmine/attachments/download/61408/ChecklistPhoto.png)

To fill out the checklist, Shifters will need to have this page open:
<https://sbn-online.fnal.gov/cgi-bin/icarus-minargon/icarus-minargon.wsgi/epics/cathodehv>\
This is the main webpage that shifters will be monitoring, and the main
variables that shifters will be paying attention to are the
icarus_cathodehv_monitor/volt variable and the
icarus_cathodehv_monitor/current variable, as well as the timestamps
next to these variables. This page will look something like this:\
!(/redmine/attachments/download/61129/ForExpertsOnly.png)\
The shifter will be asked if the timestamp is recent, which requires the
shifter to look and see if the time next to the
icarus_cathodehv_monitor/volt variable is within\
the past 10min. If not, the shifter should notify the on-call Drift HV
expert. **NOTE: The timestamps displayed on the page are for CST, make
sure to convert if you\'re in a different timezone!**

The shifter will also be asked to record the value of the monitor
voltage. On that same page, the shifter should look at the value
reported for the icarus_cathodehv_monitor/volt variable (**Typical
values seen are: 75161V, 75186V, and 75212V**).\
**If the voltage value is below 74959 V or above 75311 V, notify the on
duty Drift HV Expert immediately**. Check the plots on this page:
<https://sbn-online.fnal.gov/cgi-bin/icarus-minargon/icarus-minargon.wsgi/pv_single_stream/epics/163>.
If there was a sharp spike or dip, notify the on-call Drift HV expert
immediately!\
!(/redmine/attachments/download/61072/monitorvoltagepage.png)

The shifter will also be asked to record the value of the monitor
current. On the main page
(<https://sbn-online.fnal.gov/cgi-bin/icarus-minargon/icarus-minargon.wsgi/epics/cathodehv>),
the shifter should look at the value reported for the
icarus_cathodehv_monitor/current variable (**Typical values seen are:
396uA**).\
**If the current value is below 394 uA or above 398 uA, notify the on
duty Drift HV Expert immediately**. Check the plots at
<https://sbn-online.fnal.gov/cgi-bin/icarus-minargon/icarus-minargon.wsgi/pv_single_stream/epics/164>
for spikes or dips of about 2uA or more. If there was a spike or dip,
notify the on-call Drift HV expert immediately!\
!(/redmine/attachments/download/61073/monitorcurrentpage.png)
:::

Files (5)

::: {style="display: none;"}
::: {.attachments}
::: {.contextual}
[Edit attached
files](/redmine/attachments/wiki_pages/29278/edit "Edit attached files"){.icon-only
.icon-edit}
:::

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -- -------------------------------------------------- -----------------------------------------------------------------------------
  [cathodehvmonitoringexample.png](/redmine/attachments/61071/cathodehvmonitoringexample.png){.icon .icon-attachment} [(94.5 KB)]{.size} [cathodehvmonitoringexample.png](/redmine/attachments/download/61071/cathodehvmonitoringexample.png "Download"){.icon-only .icon-download}      [Zachary Williams, 09/21/2020 08:42 AM]{.author}   [Delete](/redmine/attachments/61071 "Delete"){.delete .icon-only .icon-del}
  [monitorvoltagepage.png](/redmine/attachments/61072/monitorvoltagepage.png){.icon .icon-attachment} [(118 KB)]{.size} [monitorvoltagepage.png](/redmine/attachments/download/61072/monitorvoltagepage.png "Download"){.icon-only .icon-download}                                       [Zachary Williams, 09/21/2020 08:51 AM]{.author}   [Delete](/redmine/attachments/61072 "Delete"){.delete .icon-only .icon-del}
  [monitorcurrentpage.png](/redmine/attachments/61073/monitorcurrentpage.png){.icon .icon-attachment} [(152 KB)]{.size} [monitorcurrentpage.png](/redmine/attachments/download/61073/monitorcurrentpage.png "Download"){.icon-only .icon-download}                                       [Zachary Williams, 09/21/2020 08:51 AM]{.author}   [Delete](/redmine/attachments/61073 "Delete"){.delete .icon-only .icon-del}
  [ForExpertsOnly.png](/redmine/attachments/61129/ForExpertsOnly.png){.icon .icon-attachment} [(215 KB)]{.size} [ForExpertsOnly.png](/redmine/attachments/download/61129/ForExpertsOnly.png "Download"){.icon-only .icon-download}                                                       [Zachary Williams, 09/28/2020 09:44 AM]{.author}   [Delete](/redmine/attachments/61129 "Delete"){.delete .icon-only .icon-del}
  [ChecklistPhoto.png](/redmine/attachments/61408/ChecklistPhoto.png){.icon .icon-attachment} [(43 KB)]{.size} [ChecklistPhoto.png](/redmine/attachments/download/61408/ChecklistPhoto.png "Download"){.icon-only .icon-download}                                                        [Zachary Williams, 10/19/2020 02:00 PM]{.author}   [Delete](/redmine/attachments/61408 "Delete"){.delete .icon-only .icon-del}
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -- -------------------------------------------------- -----------------------------------------------------------------------------
:::

::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](CathodeHVMonitoring.pdf){.pdf}
[HTML](CathodeHVMonitoring.html){.html}
[TXT](CathodeHVMonitoring.txt){.txt}

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
