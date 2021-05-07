

# How to setup a WR switch and nodes

::: 
[Edit this
section](_How_to_setup_a_WR_switch_and_nodes_/edit?section=2){.icon-only
.icon-edit}
:::



## SSH into the Switch

This can be done through a terminal window if you know the IP address of
the switch. Use the following command to ssh (there is no root password
for now):

    ssh -X 192.168.xxx.xxx -l root

::: 
[Edit this
section](_How_to_setup_a_WR_switch_and_nodes_/edit?section=3){.icon-only
.icon-edit}
:::



## Upgrading the WR Switch Version

The switch is able to upgrade automatically. One can copy the new
release tarball into the /update directory as so:

    scp wr-switch-sw-v<X.X-YYYYMMDD>_binaries.tar root@<ip_address>:/update/wrs-firmware.tar

Note that the copied file must be renamed to \"wrs-firmware.tar\". Then
reboot the switch. The status light will not come on while it is
upgrading, which may take 5-10 minutes.

::: 
[Edit this
section](_How_to_setup_a_WR_switch_and_nodes_/edit?section=4){.icon-only
.icon-edit}
:::



## Setting up the New Install

Below are the instructions for version 6.0 of the WR Switch firmware.

**Note:** With a fresh firmware install, the switch will NOT have the
network information, so will have to be connected to using a physical
USB cable. Once network information is configured (see \"Important
fields to configure\" section below), you can SSH onto the switch.

After connecting onto the switch, edit the configuration by running:

    wrs_menuconfig

What this does is save changes to the \"dot-config\" file in /wr/usr.
(Note: Do **not** edit the dot-config file by hand!)

You will see a window that looks like this:

!(/redmine/attachments/download/63651/wrs_menuconfig.png)

The navigation and editing instructions are straightforward and listed
at the top of the window.

::: 
[Edit this
section](_How_to_setup_a_WR_switch_and_nodes_/edit?section=5){.icon-only
.icon-edit}
:::



### Important fields to configure (especially after a fresh firmware install):

1). Source for a run-time replacement of dot-config: **Use local
dot-config**

In Local Network Configuration:

2). Management port configuration (eth0): **Static address**\
3). Management port (eth0) address: **Replace to look similar to below
(our setup for Icarus):**

!(/redmine/attachments/download/63875/icarus_network_config.png)

4). IP Address of local NTP server: **192.168.184.3** (as an example)

5). Timing Mode: **Grand-Master** (or whatever is needed)

This should be all the initial configuration needed.

::: 
[Edit this
section](_How_to_setup_a_WR_switch_and_nodes_/edit?section=6){.icon-only
.icon-edit}
:::



## General Monitoring

Port status and time information can be monitored using the following
command:

     wr_mon

!(/redmine/attachments/download/63877/wr_mon.png)
:::

Files (4)

::: {style="display: none;"}
::: {.attachments}
::: {.contextual}
[Edit attached
files](/redmine/attachments/wiki_pages/30120/edit "Edit attached files"){.icon-only
.icon-edit}
:::

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------------------------------------------------------------------------- -------------------------------------------------- -----------------------------------------------------------------------------
  [dot-config-v5-0-1](/redmine/attachments/63641/dot-config-v5-0-1){.icon .icon-attachment} [(4.74 KB)]{.size} [dot-config-v5-0-1](/redmine/attachments/download/63641/dot-config-v5-0-1 "Download"){.icon-only .icon-download}                                  dot-config file containing configuration setup from v5.0.1, for reference   [Polina Abratenko, 04/14/2021 03:17 PM]{.author}   [Delete](/redmine/attachments/63641 "Delete"){.delete .icon-only .icon-del}
  [wrs_menuconfig.png](/redmine/attachments/63651/wrs_menuconfig.png){.icon .icon-attachment} [(948 KB)]{.size} [wrs_menuconfig.png](/redmine/attachments/download/63651/wrs_menuconfig.png "Download"){.icon-only .icon-download}                                                                                                           [Polina Abratenko, 04/14/2021 03:22 PM]{.author}   [Delete](/redmine/attachments/63651 "Delete"){.delete .icon-only .icon-del}
  [icarus_network_config.png](/redmine/attachments/63875/icarus_network_config.png){.icon .icon-attachment} [(134 KB)]{.size} [icarus_network_config.png](/redmine/attachments/download/63875/icarus_network_config.png "Download"){.icon-only .icon-download}                                                                               [Polina Abratenko, 04/30/2021 12:49 PM]{.author}   [Delete](/redmine/attachments/63875 "Delete"){.delete .icon-only .icon-del}
  [wr_mon.png](/redmine/attachments/63877/wr_mon.png){.icon .icon-attachment} [(866 KB)]{.size} [wr_mon.png](/redmine/attachments/download/63877/wr_mon.png "Download"){.icon-only .icon-download}                                                                                                                                           [Polina Abratenko, 04/30/2021 01:07 PM]{.author}   [Delete](/redmine/attachments/63877 "Delete"){.delete .icon-only .icon-del}
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------------------------------------------------------------------------- -------------------------------------------------- -----------------------------------------------------------------------------
:::

::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](_How_to_setup_a_WR_switch_and_nodes_.pdf){.pdf}
[HTML](_How_to_setup_a_WR_switch_and_nodes_.html){.html}
[TXT](_How_to_setup_a_WR_switch_and_nodes_.txt){.txt}

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
