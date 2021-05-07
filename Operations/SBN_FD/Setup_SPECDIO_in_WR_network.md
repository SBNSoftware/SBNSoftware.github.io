

# Setup SPEC+DIO in WR network

**Examples using SPEC/DIO on icarus-daq02**

Log into icarus-gateway01.fnal.gov

*ssh -X icarus-daq02*\
*cd
\~badgett/sbnddaq-readout/projects/wr/wr-starting-kit/spec-sw/tools/\
ksu*\
(**you MUST be ROOT to use the following WR commands**)

run *./wr-dio-cmd wr0 stamp* (this should show the PPS on CH 0)\
*\[root\@icarus-daq02 tools\]\# ./wr-dio-cmd wr0 stamp\
ch 0, 1609784430.000000000\
ch 0, 1609784431.000000000\
ch 0, 1609784432.000000000\
ch 0, 1609784433.000000000*

**If you don\'t see the PPS** , you can check that the WR node (in this
case the SPEC/DIO in icarus-daq02) is synchronized to the WR network
running *./spec-vuart* . IF the WR network is up and running, this
command will show the WR network parameters in a continuous loop as
shown in the following screenshots.\
To exit , press **Ctrl-a** anytime during the loop.

Example of two reading loops is shown here (more on this in Appendix)\
!(/redmine/attachments/download/62437/vuart_1.png)\
!(/redmine/attachments/download/62438/vuart_2.png){.wiki-class-width:700px}

IF the WR network has some issues (switch NOT initialized, SPEC/DIO in a
funny state) it may show something different, as like this:\
!(/redmine/attachments/download/63267/vuart_wr_off.png)

\*If this happens we have to \*

A\) reboot the WR switch\
B) reinitialize the SPEC/DIO card\
C) reinitialize the SPEXI/DIO card

**A) How to reboot the WR switch at FD**

The production WR switch in use at FD has IP address: 192.168.184.60

We can log into the WR switch via *ssh* or via a Web management tool
available via Firefox

**Direct SSH login** (this is the FASTEST way)

*-bash-4.2\$ ssh -X 192.168.184.60 -l root\
<root@192.168.184.60>\'s password:\
sh: /usr/bin/xauth: not found\
wrs-192.168.184.60\#\
wrs-192.168.184.60\#\
wrs-192.168.184.60\# reboot\
Connection to 192.168.184.60 closed.\
-bash-4.2\$\
*

At this point the WR switch will reboot. If you are on-site, go look at
the module: the STATUS light will turn orange and then ALL status lights
under each port will light up in sequence, starting from 1 to 18. The
reboot is done.

You can also \"ping\" the unit to see if its alive.

*-bash-4.2\$ ping 192.168.184.60\
PING 192.168.184.60 (192.168.184.60) 56(84) bytes of data.\
64 bytes from 192.168.184.60: icmp_seq=1 ttl=64 time=0.268 ms\
64 bytes from 192.168.184.60: icmp_seq=2 ttl=64 time=0.247 ms\
*

\*Using the Web management tool via Firefox \* (useful for
checking/change the WR switch settings, but also for reboot)

Log onto icarus-gateway01.fnal.gov and launch Firefox:\
*ssh -X icarus-gateway01.fnal.gov*\
firefox&

in a new tab type: 192.168.184.60/index.php\
this will bring you into the WR switch Web management screen which looks
like this:\
!(/redmine/attachments/download/63268/WR_switch_Web_management_tool.png)

This shows you also what porta are connected and synch\'ed to the switch
(the blue ones).

From here:\
click on \"login\" (NO password)\
select WR-PPSI setup\
!(/redmine/attachments/download/63269/WR_Switch_Web_management_tool_PPSI_page.png)

click on \"Change\" and then \"Save this configuration\".

At this point the Switch will reboot as described before , the page will
show a spinning wheel until done, then the page will reload.\
NOTE: we use this page mostly to change the switch mode from GrandMaster
(a switch connected to the GPS) , or Boundary clock (another switch in a
network that already has a GM) , or Free-Running Master (network with NO
GPS at all)

After the switch is rebooted, you may still need to re-synchronize the
cards (sometimes it is not necessary, sometimes it is)

B\) How to reset/re-synchronize SPEC/DIO cards

still logged into\
\_cd
\~badgett/sbnddaq-readout/projects/wr/wr-starting-kit/spec-sw/tools/\
ksu

**remove kernel modules**\
*rmmod spec*\
*rmmod wr_nic*\
*rmmod fmc*

**reload kernel modules and gateware file**\
*modprobe spec\
modprobe wr_nic gateware=fmc/wr_nic_dio.bin*

Type *dmesg* to check the kernel messages. You should see the following:

*12467654.149114\] spec 0000:65:00.0: remove\
\[12467654.164025\] spec 0000:65:00.0: early irq 190, ignoring\
\[12467678.604034\] spec 0000:65:00.0: probe for device 0065:0000\
\[12467678.604663\] spec 0000:65:00.0: got file \"fmc/spec-init.bin\",
1484404 (0x16a674) bytes\
\[12467678.795708\] **spec 0000:65:00.0: FPGA programming successful**\
\[12467679.146429\] spec 0000:65:00.0: mezzanine 0\
\[12467679.146431\] Manufacturer: CERN\
\[12467679.146433\] Product name: FmcDio5cha\
\[12467685.485849\] spec 0000:65:00.0: Gateware file fmc/wr_nic_dio.bin\
\[12467685.485854\] spec 0000:65:00.0: reprogramming with
fmc/wr_nic_dio.bin\
\[12467685.677418\] **spec 0000:65:00.0: FPGA programming successful**\
\[12467685.677934\] spec 0000:65:00.0: Gateware fmc/wr_nic_dio.bin
successfully loaded\
\[12467685.888605\] wr_nic wr_nic.0: White Rabbit NIC driver\
\[12492318.324115\] Process accounting resumed\
*

If you don\'t, you may have to try again and sometimes reboot the server
as well.

**C)How to reinitialize the SPEXI card in the trigger laptop**

Currently , relaunching any LabVIEW .vi reloads the latest firmware into
the SPEXI board

Note: the latest firmware is available in the *connie_spexi_icarus.bin*
file residing into the /ni-rt/startup directory on the RT controller
disk\
To reach this directory, log into the trigger laptop, open a Desktop
window: in the Quick Access files list, there should be a \"data\".\
Click there and navigate to /ni-rt/startup directory \[add picture
here\]
:::

Files (5)

::: {style="display: none;"}
::: {.attachments}
::: {.contextual}
[Edit attached
files](/redmine/attachments/wiki_pages/29761/edit "Edit attached files"){.icon-only
.icon-edit}
:::

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -- ---------------------------------------------------- -----------------------------------------------------------------------------
  [vuart_1.png](/redmine/attachments/62437/vuart_1.png){.icon .icon-attachment} [(87.1 KB)]{.size} [vuart_1.png](/redmine/attachments/download/62437/vuart_1.png "Download"){.icon-only .icon-download}                                                                                                                                     [Donatella Torretta, 01/11/2021 02:44 PM]{.author}   [Delete](/redmine/attachments/62437 "Delete"){.delete .icon-only .icon-del}
  [vuart_2.png](/redmine/attachments/62438/vuart_2.png){.icon .icon-attachment} [(88.4 KB)]{.size} [vuart_2.png](/redmine/attachments/download/62438/vuart_2.png "Download"){.icon-only .icon-download}                                                                                                                                     [Donatella Torretta, 01/11/2021 02:44 PM]{.author}   [Delete](/redmine/attachments/62438 "Delete"){.delete .icon-only .icon-del}
  [vuart_wr_off.png](/redmine/attachments/63267/vuart_wr_off.png){.icon .icon-attachment} [(28.2 KB)]{.size} [vuart_wr_off.png](/redmine/attachments/download/63267/vuart_wr_off.png "Download"){.icon-only .icon-download}                                                                                                                 [Donatella Torretta, 03/10/2021 01:00 PM]{.author}   [Delete](/redmine/attachments/63267 "Delete"){.delete .icon-only .icon-del}
  [WR_switch_Web_management_tool.png](/redmine/attachments/63268/WR_switch_Web_management_tool.png){.icon .icon-attachment} [(139 KB)]{.size} [WR_switch_Web_management_tool.png](/redmine/attachments/download/63268/WR_switch_Web_management_tool.png "Download"){.icon-only .icon-download}                                              [Donatella Torretta, 03/10/2021 04:11 PM]{.author}   [Delete](/redmine/attachments/63268 "Delete"){.delete .icon-only .icon-del}
  [WR_Switch_Web_management_tool_PPSI_page.png](/redmine/attachments/63269/WR_Switch_Web_management_tool_PPSI_page.png){.icon .icon-attachment} [(108 KB)]{.size} [WR_Switch_Web_management_tool_PPSI_page.png](/redmine/attachments/download/63269/WR_Switch_Web_management_tool_PPSI_page.png "Download"){.icon-only .icon-download}      [Donatella Torretta, 03/10/2021 04:24 PM]{.author}   [Delete](/redmine/attachments/63269 "Delete"){.delete .icon-only .icon-del}
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -- ---------------------------------------------------- -----------------------------------------------------------------------------
:::

::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](Setup_SPECDIO_in_WR_network.pdf){.pdf}
[HTML](Setup_SPECDIO_in_WR_network.html){.html}
[TXT](Setup_SPECDIO_in_WR_network.txt){.txt}

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
