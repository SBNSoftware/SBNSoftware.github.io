

# Trigger Interface

The ICARUS trigger right now is set up to use a Windows interface. There
is a Remote Desktop connection available on the DAQ VNC to connect to
the Windows session.

::: 
[Edit this
section](Trigger_Interface/edit?section=2){.icon-only
.icon-edit}
:::



## Start the Remote Desktop Session

The Remote Desktop connection to the Windows machine uses Remmina. The
Remmina window on the VNC looks like this:

![Remmina
window](/redmine/attachments/download/61113/RemminaRedacted.png "Remmina window")

If this is not open on the desktop already, one can open it by clicking
on `Applications` on the top left, finding `Internet` and then
`Remmina`. The item listed as \"trigger laptop\" is how one connects to
the Windows machine with the trigger program. Simply double click this
to launch the Windows connection! Please inform \@icarus_shift_help if
this operation doesn\'t work. before starting a new connection instance,
you should verify if the trigger laptop tab is already open in the top
panel.

**The preferred way to disconnect from the trigger interface is via the
\"Disconnect\" button. Click the Windows button in the bottom left, then
the Power button to get the list of sign-out options. Click
DISCONNECT.**

Once the run has started and you see the counter advancing, it\'s
advised to do the disconnect to prevent it from signing you out due to
inactivity. You can sign back in when it\'s time to stop the triggers.

If the Windows connection is open but looks like you\'re logged off,
it\'s probably due to inactivity. In this case, you might have to use
the X button to get out of the page and relaunch the Windows connection
by double clicking on the \"trigger laptop\" item in Remmina. Note this
method of disconnecting is NOT PREFERRED.

::: 
[Edit this
section](Trigger_Interface/edit?section=3){.icon-only
.icon-edit}
:::



## Trigger program

The trigger program should be left open but stopped when a run isn\'t
going. If for some reason it is closed though, it can be re-opened from
the project. The project is `Trigger_for_shifter_project.lvproj`. The
program has the name `Trigger_for_shifters.vi`.

When opened, it should look like this:

!(/redmine/attachments/download/62778/TriggerVi.png)

Once the components are selected (for example all EW TPC mini-crates and
PMT EW TOP 01) but before starting the run, simply hit the Play button
on the VI. Once this is ON you\'ll notice the play button turns into a
black arrow and the background of the program goes from boxed gray to
solid gray. Then you can hit START on the run. When the run has started
and is in the RUNNING status, you will shortly see the Iterations start
to increase.

::: 
[Edit this
section](Trigger_Interface/edit?section=4){.icon-only
.icon-edit}
:::



## Stopping the run

When ready to stop the run, first hit STOP on the Run Control GUI. Wait
for it to go to READY or STOPPED state. If it goes straight to the
STOPPED state then go ahead and click the STOP button on the trigger
program and proceed.

If it goes back to the READY state, then click the STOP button on the
trigger program followed by the TERMINATE button on the Run Control GUI.

In either case, once you\'ve hit STOP on the trigger program, you should
see the iterations stop increasing and it should go back to having a
boxed gray background. The play button will go from the black arrow back
into the way it looked when you first hit play.

::: 
[Edit this
section](Trigger_Interface/edit?section=5){.icon-only
.icon-edit}
:::



## Note about CRT components with this setup

For the time being, do **NOT** run CRT components with this setup.
:::

Files (3)

::: {style="display: none;"}
::: {.attachments}
::: {.contextual}
[Edit attached
files](/redmine/attachments/wiki_pages/29385/edit "Edit attached files"){.icon-only
.icon-edit}
:::

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------- -------------------------------------------------- -----------------------------------------------------------------------------
  [RemminaRedacted.png](/redmine/attachments/61113/RemminaRedacted.png){.icon .icon-attachment} [(116 KB)]{.size} [RemminaRedacted.png](/redmine/attachments/download/61113/RemminaRedacted.png "Download"){.icon-only .icon-download}           Remmina window                                        [Bruce Howard, 09/23/2020 08:01 PM]{.author}       [Delete](/redmine/attachments/61113 "Delete"){.delete .icon-only .icon-del}
  [TriggerVIwithText.png](/redmine/attachments/61115/TriggerVIwithText.png){.icon .icon-attachment} [(939 KB)]{.size} [TriggerVIwithText.png](/redmine/attachments/download/61115/TriggerVIwithText.png "Download"){.icon-only .icon-download}   Trigger program. It looks like this after stopping.   [Bruce Howard, 09/23/2020 08:26 PM]{.author}       [Delete](/redmine/attachments/61115 "Delete"){.delete .icon-only .icon-del}
  [TriggerVi.png](/redmine/attachments/62778/TriggerVi.png){.icon .icon-attachment} [(930 KB)]{.size} [TriggerVi.png](/redmine/attachments/download/62778/TriggerVi.png "Download"){.icon-only .icon-download}                                                                                         [Andrea Scarpelli, 02/14/2021 08:29 AM]{.author}   [Delete](/redmine/attachments/62778 "Delete"){.delete .icon-only .icon-del}
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------- -------------------------------------------------- -----------------------------------------------------------------------------
:::

::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](Trigger_Interface.pdf){.pdf}
[HTML](Trigger_Interface.html){.html}
[TXT](Trigger_Interface.txt){.txt}

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
