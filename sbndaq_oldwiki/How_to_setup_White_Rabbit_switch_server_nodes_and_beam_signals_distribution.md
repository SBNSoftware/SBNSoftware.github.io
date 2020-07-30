---
layout: page
title: How to setup White Rabbit switch server nodes and beam signals
  distribution
---



How to setup White Rabbit server nodes and beam signals distribution
============================================================================================================================================================

Production setup

White Rabbit switch (update this the WRS has moved to West mezzanine)\
Switch is installed on the ICARUS building ground floor, just below the
GPS (see Fig.1)

Switch node name is : icarus-wrs00.fnal.gov (192/168.191.60)\
You can \"ssh\" into the switch from the icarus-gateway00.fnal.gov node\
OR you can connect via a Web Interface:\
launch Firefox\" on icarus-gateway00.fnal.gov, enter the IP address into
a tab:\
you get the Web interface screen: login as root (no password)\
when there you can change the switch configuration to run in \" Free
Running\" mode, or GrandMaster (GM)

White Rabbit nodes

We have installed two WR nodes (Linux server + SPEC/DIO card) to
distribute the DBN and NuMI signals:

The two servers are behind the AD firewall and you need to login into
the AD gateway, outland.fnal.gov, to be able to see the nodes.\
If you need n accounting outland, you can open a ServiceDesk ticket to
the AD Controls to request one.\
\@MI-60 : sbn-mi60.fnal.gov\
\@MI-12 : sbn-mi12.fnal.gov

So,\
**ssh -X outland.fnal.gov**

**ssh -X sbn-mi60.fnal.gov** or **ssh -X sbn-mi12.fnal.gov**

cd
\~\~badgett/sbnddaq-readout/projects/wr/wr-starting-kit/spec-sw/tools/\
ksu

To check that the SPEC/DIO is synch\'ed to the WR switch do:

./spec-vuart

this will show a GUI like Fig. 2\
You need to check that it says\
\"wru1: Link up (RX: 1853905, TX: 632264), mode: WR Slave Locked
Calibrated\
IPv4: BOOTP running \"

anything else is not right and you may need to re-initialize the drivers
in the SPEC carrier (see \"Initialize SPEC driver\" )

If the board is synch\'ed, you can check that PPS are outputted on ch 0
(if you are distributing other signals on other channels, you should see
them too\]

For example:\
\[root\@sbn-mi12 tools\]\# ./wr-dio-cmd wr0 stamp\
ch 0, 1580330661.000000000\
ch 0, 1580330662.000000000\
ch 4, 1580330660.368607032\
ch 4, 1580330660.435266336\
ch 4, 1580330660.501925504\
ch 4, 1580330660.568583848

Initialize SPEC drivers

After a server power down or reboot, or if the SPEC card loosed
synchronization, you will have to reload SPEC drivers into the kernel.

The SPEC drivers are available in

/lib/modules/\<kernel\>/extra

for example, on icarus-daq02 they are available in

To initialize the card, it is always preferable to \"remove\" the module
from the kernel, and then reload them. So please do\
rmmod spec\
rmmod wr_nic\
rmmod dmc

mod probe spec\
modprobe wr_nic gateware=fmc/wr_nic_dio.bin-2014-02-14

check dmesg to see that all has been properly initialized. you should
see something like this:\
\[ 102.334809\] spec 0000:0c:00.0: probe for device 000c:0000\
\[ 102.398397\] spec 0000:0c:00.0: got file \"fmc/spec-init.bin\",
1484404 (0x16a674) bytes\
\[ 102.589883\] spec 0000:0c:00.0: FPGA programming successful\
\[ 102.944752\] spec 0000:0c:00.0: mezzanine 0\
\[ 102.944757\] Manufacturer: CERN\
\[ 102.944758\] Product name: FmcDio5cha\
\[ 114.152466\] spec 0000:0c:00.0: Gateware file fmc/wr_nic_dio.bin\
\[ 114.152474\] spec 0000:0c:00.0: reprogramming with
fmc/wr_nic_dio.bin-2014-02-14\
\[ 114.385585\] spec 0000:0c:00.0: FPGA programming successful\
\[ 114.386126\] spec 0000:0c:00.0: Gateware fmc/wr_nic_dio.bin
successfully loaded\
\[ 114.597489\] wr_nic wr_nic.0: White Rabbit NIC driver

if you see anything different, or errors, you need to try again.

If you see this, then you can check that the SPEC?DIO is synched to the
WR switch running\
./spec-vuart again

At this point, you can set the DIO channels 1-4 as Input or Output
mode.\
Ch 0 is SPECIA and is used to send out a PPS signal

you need to se a channel as input, if you are sending in a signal via a
LEMO cable into that channel\
you need to set a channel as output if you want to check what is being
sent out on the channel

./wr-dio-cmd wr0 mode 1 I \"I\" will set ch 1 as Input\
./wr-dio-cmd wr0 mode 1 i \"i\"will set ch 1 as Input with a 50 Ohm
impedence (this is typically what you want to use)

for output mode\
./wr-dio-cmd wr0 mode 1 D \"D\" will set ch 1 as Output\
./wr-dio-cmd wr0 mode 1 d \"d\" will set ch 1 as Output with a 50 Ohm
impedance load

so:\
./wr-dio-cmd wr0 mode 3 d\
./wr-dio-cmd wr0 mode 4 d

./wr-dio-pps wr0 3 will output a PPS on CH 3\
./wr-dio-pps wr0 4 will output a PPS on CH 4

to see these signals, again type\
./wr-dio-cmd wr0 stamp

In the next section we\'ll describe how to send a signal (eg a beam
signal) from a node on the WR network and receive it on another node

Beam signal distribution

We have installed a WR server node at MI-12 to distribute the BNB early
warning signal and a WR server node at MI-60 to distribute the NuMI
early warning .

The node names are:\
\@MI-12 sbn-mi12.fnal.gov\
\@MI-60 sbn-mi60.fnal.gov

Each server is equipped with a SPEC/DIO card\
\@MI-12 we have inserted a LEMO with the gated-BES signal in CH 2 of the
DIO\
\@MI-60 we have inserted a LEMO with the MIBS 74 signal in ch 3 of the
DIO

To distribute these signals on the network, we are using software made
by CERN and downloaded from the WR repository .\
Please see document for more details.\
In short, the programs to use are:\
./wr-dio-agent on the receiving node\
./wr-dio-ruler on the sending node

First you need to configure the Receiving node: in our case that will be
icarus-daq02.fnal.gov (debugging server node) OR the SPEXI card (in
final Trigger setup)

define the DIO channel that will receive the signal, as Output channel\
./wr-dio-cmd wr0 mode 2 d

then starts the \"agent\" software that waits for the incoming packets
from the sender

./wr-dio-agent wr0 &

Then you need to setup the sender node (for example sbn-mi12.fnal.gov)\
./wr-dio-cmd wr0 mode 4 i (define the channel with the LEMO cable as
input mode, here we are using CH 4)\
start the sender software\
./wr-dio-ruler wr0 IN4 L2+0.001 R2+0.001 & (which sends the signal in
IN4 to Local (L2) CH 2 (so you can check that signals are actually being
sent) and Remote (R) CH 2 (which will be the channel on the DIO on the
receiving node, as above)
