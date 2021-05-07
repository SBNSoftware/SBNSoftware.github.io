

# Troubleshooting

::: 
[Edit this
section](_Troubleshooting_/edit?section=2){.icon-only
.icon-edit}
:::



## General Problems FAQ

Below are some problems that may occur, with fixes:

**Q: The switch is on and connected by ethernet cable, but we cannot
ping it!**

A: Use a physical USB connection to the switch to manually. You can then
(on a Mac) type the following in a terminal window:

    screen /dev/tty.usbmodem14101

Once in the switch, go to /wr/etc. Check that the \"dot-config\" file
contains the network info you want with for example:

    less dot-config

This is usually a block that looks something like:

    #
    # Local Network Configuration
    #
    # CONFIG_ETH0_DHCP is not set
    # CONFIG_ETH0_DHCP_ONCE is not set
    CONFIG_ETH0_STATIC=y
    CONFIG_ETH0_IP="192.168.184.151" 
    CONFIG_ETH0_MASK="255.255.255.0" 
    CONFIG_ETH0_NETWORK="192.168.184.0" 
    CONFIG_ETH0_BROADCAST="192.168.184.255" 
    CONFIG_ETH0_GATEWAY="192.168.184.200" 
    CONFIG_ETH0_HOSTNAME="icarus-wrs01" 
    # CONFIG_HOSTNAME_DHCP is not set
    # CONFIG_HOSTNAME_STATIC is not set

To edit these values, DO NOT directly edit the dot-config file. Instead
you can type:

    wrs_menuconfig

Follow the instructions to edit the specific fields in the Setting Up
the Switch page on this Wiki (add link).

Once you have filled in the appropriate fields, reboot the switch.

**Q: When I try to ssh into the switch, I see a \"WARNING: REMOTE HOST
IDENTIFICATION HAS CHANGED!\" message block and Permission Denied.**\
A: The message should have a path to a file similar to this:
/home/nfs/user/.ssh/known_hosts. Edit this known_hosts file by deleting
the entire line that starts with the IP address you are trying to
connect to. (This message occurs when an ethernet cable has been
exchanged between switches, transferring over the IP address to a new
device, but the computer you are connecting with expects the first
device.)

**Q: The switch is connected and on, but not seeing any signals. (The
lights at the ports are not flashing at all.)**\
A: There may be a few different reasons for this (see section below on
SNMP monitoring for more in-depth debugging). If all cables are plugged
in, make sure that the version of the dot-config file in /wr/etc matches
the current firmware version of the switch.

::: 
[Edit this
section](_Troubleshooting_/edit?section=3){.icon-only
.icon-edit}
:::



## Debugging via SNMP monitoring

The White Rabbit system uses the Simple Network Management Protocol
(SNMP) to monitor general status objects relating the WR switch. One can
print out general status objects from their home directory while logged
into e.g. icarus-gateway01.

You must first copy over the proper MIB file into your directory. The
most current version can be found here:\
<https://ohwr.org/project/wr-switch-sw/blob/master/userspace/snmpd/WR-SWITCH-MIB.txt>

You can then print out general status objects using the command below
(with, for example, the wrsGeneralStatusGroup):\

    snmpwalk -v 2c -m ./WR-SWITCH-MIB.txt -c public icarus-wrs01 wrsGeneralStatusGroup

An example output is the below:

    WR-SWITCH-MIB::wrsMainSystemStatus.0 = INTEGER: error(2)
    WR-SWITCH-MIB::wrsOSStatus.0 = INTEGER: error(2)
    WR-SWITCH-MIB::wrsTimingStatus.0 = INTEGER: warning(3)
    WR-SWITCH-MIB::wrsNetworkingStatus.0 = INTEGER: error(2)

The descriptions of various objects and error flags, as well as
debugging suggestions, can be found in the \"White Rabbit Switch:
Failures and Diagnostics\" document of the respective switch firmware
version. The document for v5.0 (including v5.0.1) of the switch has been
attached below for convenience. The respective document for firmware
v4.2 can be found on the release page on the OHWR.org site.

::: 
[Edit this
section](_Troubleshooting_/edit?section=4){.icon-only
.icon-edit}
:::



## Upgrading the WR Switch Version

The switch is able to upgrade automatically. One can copy the new
release tarball into the /update directory as so:

    scp wr-switch-sw-v<X.X-YYYYMMDD>_binaries.tar root@<ip_address>:/update/wrs-firmware.tar

Note that the copied file MUST be renamed to \"wrs-firmware.tar\". Then
reboot the switch. The status light will not come on while it is
upgrading, which may take 5-10 minutes.

::: 
[Edit this
section](_Troubleshooting_/edit?section=5){.icon-only
.icon-edit}
:::



## Additional Resources

There is a forum on the Open Hardware Repository with a couple of
categories relating to WR:\
<https://forums.ohwr.org/categories>\
Feel free to use the search feature!
:::

Files (2)

::: {style="display: none;"}
::: {.attachments}
::: {.contextual}
[Edit attached
files](/redmine/attachments/wiki_pages/30075/edit "Edit attached files"){.icon-only
.icon-edit}
:::

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------- -------------------------------------------------- -----------------------------------------------------------------------------
  [cernWR.pdf](/redmine/attachments/63498/cernWR.pdf){.icon .icon-attachment} [(1.84 MB)]{.size} [cernWR.pdf](/redmine/attachments/download/63498/cernWR.pdf "Download"){.icon-only .icon-download}                                                  General intro to SNMP monitoring for WR              [Polina Abratenko, 04/02/2021 12:48 PM]{.author}   [Delete](/redmine/attachments/63498 "Delete"){.delete .icon-only .icon-del}
  [wrs-fail-diag-v5.0.pdf](/redmine/attachments/63500/wrs-fail-diag-v5.0.pdf){.icon .icon-attachment} [(782 KB)]{.size} [wrs-fail-diag-v5.0.pdf](/redmine/attachments/download/63500/wrs-fail-diag-v5.0.pdf "Download"){.icon-only .icon-download}   SNMP explanation of objects and debugging for v5.0   [Polina Abratenko, 04/02/2021 01:06 PM]{.author}   [Delete](/redmine/attachments/63500 "Delete"){.delete .icon-only .icon-del}
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------- -------------------------------------------------- -----------------------------------------------------------------------------
:::

::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](_Troubleshooting_.pdf){.pdf}
[HTML](_Troubleshooting_.html){.html}
[TXT](_Troubleshooting_.txt){.txt}

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
