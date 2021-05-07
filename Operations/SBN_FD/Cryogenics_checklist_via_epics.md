

# Cryogenics checklist via EPICS

The Cryogenics status of the ICARUS internal temperature and level
probes is monitored via EPICS and the information is displayed on the
leftmost upper row monitor in ROC West. A screenshot of such monitor is
shown in the following figure:

!(/redmine/attachments/download/57801/Cryogenics_checklist_via_EPICS.png)

A\) During cooldown:

> I. Cooling is a low process, so do not expect any rapid variation of
> the temperature. If this event occurs, please notify the Technical
> Coordinator or his deputy

> II\. **Check** the internal temperature of the East and West modules
> **at least once per hour** (all temperatures are displayed in K)( see
> green boxes in picture)

> III\. **If the temperature difference between any two probes *inside
> the same module* reaches 47K,** the shifter has to call the cryogenic
> expert on call and ask to stop the cooling

> a\) The call and the request to stop the cooling procedure MUST be
> recorded in the e-log

> b\) When the temperature difference of ALL the probes inside *both
> modules* goes below 35K (this will take several hours), the shifter
> will call the Cryogenic expert on call to tell him the cooling process
> can be restarted.

B\) During filling:

> I. The levels of the liquid argon in both modules are displayed on the
> cryogenic status page as the parameters circled in orange, for both
> Tank 1W and Tank 2E

> II\. The levels displayed in the internal probes display screen will
> turn on only at the very end of the filling process.

> III\. During the filling, before the lowest of the internal probes
> turns on in any of the modules, the shifter is ONLY required to check
> the internal level probes and the internal temperature probes every
> hour. Anomalies in the readings need to be reported timely to the
> Technical Coordinator or his Deputy and registered in the e-log.

> IV\. As soon as the first internal level probe (at -6cm position )
> alarm starts, the shifter MUST notify both Technical Coordinator and
> the Cryogenic expert on call and record the event in the e-log.

> V. From the time point IV occurs, the shifter must register in the
> e-log the status of the lever meters every hour by taking a snapshot
> of the monitor and posting it to the e-log. There are 4 sets of 5
> internal level probes in each module. Each set is positioned in
> correspondence of one of the top corners of a module. The filling is
> complete when the alarms from all +0cm level probes are set.

> VI\. The shifter calls the Cryogenic expert on call as soon as the
> first +0cm level probe alarm starts to notify that the filling in that
> module needs to be stopped in a short time. The shifter calls the
> Cryogenics expert on call when the alarm from all +0cm level probes is
> set, to notify that the level in a module has been reached and to stop
> the filling in that module.

> VII\. The time of the alarm of all internal level probes MUST be
> recorded in the e-log

Appendix: **How to connect/start iFIX** \[excerpt from \"ROC Master
Document\" manual
(<https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=15944>)\]\
The cryogenics status is monitored through iFix graphical display. The
computer is located in ROC West behind the NOvA station. iFIX should
always be up and running. If not, please see instructions below on how
to restart it . This requires a Fermi Domain account and password.
Please contact Diana Mendez and Bruce Howard to be granted access to the
PPD-iFix2 server from a remote location.

iFix uses a Remote Microsoft Desktop.\
On Ubuntu, the default is Remmina. For Mac OSX, the Microsoft Remote
Desktop application can be used. Follow the instructions in this link.\
Once the remote access has been granted and you have a Remote Microsoft
Desktop application:\
1. Open the Remote Microsoft Desktop and click on Add PC.\
2. In PC name, type ppd-ifix2.fnal.gov\
3. use your Fermi Domain account and password for the next steps. 4.
Click on the iFix icon in located in the Microsoft Desktop.\
5. Select SBN from the list of experiments\
6. Select ICARUS

If the iFIX node is off or has issues, please see the experts checklist.
There should be a hard copy in your control room, or check here:
<https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=15862>
:::

Files (1)

::: {style="display: none;"}
::: {.attachments}
::: {.contextual}
[Edit attached
files](/redmine/attachments/wiki_pages/28361/edit "Edit attached files"){.icon-only
.icon-edit}
:::

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -- ---------------------------------------------------- -----------------------------------------------------------------------------
  [Cryogenics_checklist_via_EPICS.png](/redmine/attachments/57801/Cryogenics_checklist_via_EPICS.png){.icon .icon-attachment} [(125 KB)]{.size} [Cryogenics_checklist_via_EPICS.png](/redmine/attachments/download/57801/Cryogenics_checklist_via_EPICS.png "Download"){.icon-only .icon-download}      [Donatella Torretta, 02/06/2020 05:57 PM]{.author}   [Delete](/redmine/attachments/57801 "Delete"){.delete .icon-only .icon-del}
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -- ---------------------------------------------------- -----------------------------------------------------------------------------
:::

::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](Cryogenics_checklist_via_epics.pdf){.pdf}
[HTML](Cryogenics_checklist_via_epics.html){.html}
[TXT](Cryogenics_checklist_via_epics.txt){.txt}

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
