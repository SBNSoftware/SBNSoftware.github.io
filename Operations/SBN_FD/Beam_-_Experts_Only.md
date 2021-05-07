

# Beam - Experts Only

::: 
[Edit this
section](Beam_-_Experts_Only/edit?section=2){.icon-only
.icon-edit}
:::



## Run Coordinator Directions

::: 
[Edit this
section](Beam_-_Experts_Only/edit?section=3){.icon-only
.icon-edit}
:::



### Shifter reported IF Beam Database problem

[Check if IF Beam Database is recording
data?][Check if IF
Beam Database is recording data?]{#collapse-f7e74212-hide
.collapsible}

::: 
> 1\. See if BNB data is going into IF Beam Database and is updating:
> <http://dbweb8.fnal.gov:8080/ifbeam/app/BNBDash/index>
>
> -   If a device is stale, call IF Beam Database expert and let them
>     know.

> 2\. Check if collectors are running:
> <http://dbweb8.fnal.gov:8080/ifbeam/app/system_status>
>
> -   Look for current heartbeats reported for collect.mboone,
>     collect.BoosterNeutrinoBeam, and collect.BNBShortTerm
> -   If the heartbeats are stale, call IF Beam Database expert and let
>     them know.
:::

::: 
[Edit this
section](Beam_-_Experts_Only/edit?section=4){.icon-only
.icon-edit}
:::



### Shifter reported beamline concern

[How to determine if MCR is aware beam is
down?][How to
determine if MCR is aware beam is down?]{#collapse-aefaba97-hide
.collapsible}

::: 
> Look on page nicknamed \"Channel 13\":
> <http://www-bd.fnal.gov/notifyservlet/www>\
> Below is an example of what the page should look like if beam is off,
> complete with a comment of acknowledgement from the Main Control Room
> (MCR).
>
> -   If there is no MCR acknowledgement or phone call to shifters in
>     ROC West within [10 minutes]{style="color:red;"} of alarm, Run
>     Coordinator should call BNB Expert listed below. Let them know
>     that beam is off and there\'s no communicated acknowledgement from
>     MCR.\
>     !(https://cdcvs.fnal.gov/redmine/attachments/download/25958/accelerator_status.png)
:::

::: 
[Edit this
section](Beam_-_Experts_Only/edit?section=5){.icon-only
.icon-edit}
:::



## Links

[ACNET](http://www-bd.fnal.gov/controls/public/linux-console.html)\
[AD Controls - Timing and
Links](http://www-bd.fnal.gov/controls/hardware_vogel/index.html)\
[Channel 13 accelerator
status](http://www-bd.fnal.gov/notifyservlet/www)\
[IF Beam Database Dashboard
page](http://dbweb8.fnal.gov:8080/ifbeam/app/Dash/index)\
*(If this link does not work try going to the IFBEAM Data server
<https://dbweb9.fnal.gov:8443/ifbeam/app/event_monitor> and select
Dashboard from the top menu )*

::: 
[Edit this
section](Beam_-_Experts_Only/edit?section=6){.icon-only
.icon-edit}
:::



## Beam Contact List

  Realm of Duty             Availability   Name               Contact          Notes
  ------------------------- -------------- ------------------ ---------------- ----------------------------------------------------------
  IF Beam Database          24 hours       On call expert     1-844-343-2326   
  BNB Expert                24 hours       Tom Kobilarcik     1-630-802-5243   If no answer, wait 5 minutes, call again, else call MCR.
  Main Control Room (MCR)   24 hours       Operator on duty   1-630-840-3721   

::: 
[Edit this
section](Beam_-_Experts_Only/edit?section=7){.icon-only
.icon-edit}
:::



## Settings

::: 
[Edit this
section](Beam_-_Experts_Only/edit?section=8){.icon-only
.icon-edit}
:::



### Up-to-date settings on alarm ranges ( *NEEDS to be updated for ICARUS*):

  Device     min     max
  ---------- ------- -------
  E:HP875    -3.9    -2.9
  E:VP875    0.9     2.0
  E:THCURR   168.5   176.5
  E:HWTOUT   20      50
  E:BTH2T2   20      40
  E:BTJT2    25      98

-   When changing, notify both SlowMon expert in
    [Expert_call_list](Expert_call_list?parent=Beam_-_Experts_Only){.wiki-page
    .new} and the BNB Status Display page maintainer \"On call expert @
    1-844-343-2326 ( not sure why this one ?) \"
:::

Files (0)

::: {style="display: none;"}
::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](Beam_-_Experts_Only.pdf){.pdf}
[HTML](Beam_-_Experts_Only.html){.html}
[TXT](Beam_-_Experts_Only.txt){.txt}

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
