

# How to send and receive beam signals on the WR network

On ALL server nodes (sbn-mi12, sbn-mi60, icarus-daq02) the software you
need is in this directory

    ~badgett/sbnddaq-readout/projects/wr/wr-starting-kit/spec-sw/tools/

The code is also in the artDAQ repository \[find out where!!!\]

When you list the files ik the directory, \"green\" are the executables.

To run any of these exe, type \" *./name-of-program \<parameters\>* \"\
To find out the syntax , type \"\_./name-of-program \--help\_ \"

Useful commands:

**to set a channel mode** in Input \[i or I\] or output \[d or D: \"
*./wr-dio-cmd wr0 mode 2 I* \" or \" *./wr-dio-cmd wr0 mode 3 D* \"

**to see signals timestamps** : \" *./wr-dio-cmd wr0 stamp* \"

**To broadcast a signal on the WR Network.**\
YOU NEED A SENDER NODE and (at least) A RECEIVER NODE

WE SEND beam signals FROM MI2 and MI60, so *sbn-mi12.fnal.gov* and
*sbn-mi60.fnal.gov* ARE SENDER nodes\
WE RECEIVE signals at ICARUS, on WR server *icarus-daq02.fnal.gov* and
on the SPEXI/DIO board in the NI crate in the trigger rack. So these are
destination nodes.

**What to do on a SENDER node ( ie sbn-mi12 or sbn-mi60 servers).**\
(see also section 6) whit the actual final implementation)

Suppose you have an input beam signal in DIO channel 4 (as on MI-12
DIO)\
a) first you have to set this channels to be an INPUT channel (to get
the signal from the LEMO cable INTO the DIO ): this is done with

*./wr-dio-cmd wr0 mode 4 I*

b\) to broadcast a signal you need to use the \"\_ wr-dio-ruler\_ \"
program with the following syntax (as example):

*./wr-dio-ruler wr0 IN4 L2+0.001 R4+0.000335 &*

this tells you that you are:\
setting up channel 4 as the INPUT (IN4)\
setting up a LOCAL channel L2 to \"spy/monitor\" the signal you are
sending\
sending the signal to a REMOTE channel R4 with a DELAY of .000320
microseconds

when you execute the \"ruler\" command, you get this message\
*\[root\@sbn-mi12 tools\]\# ./wr-dio-ruler wr0 IN4 L2+0.001 R4+0.000335
&\
\[1\] 117183\
\[root\@sbn-mi12 tools\]\# ./wr-dio-ruler: configured for local channel
2, delay 0.001000000\
./wr-dio-ruler: configured for remote channel 4, delay 0.000320000\
*

At this point (and each time you want to check the status of the signals
you are sending on the Network) you can run the \"wr-dio-cmd stamp\"
command to see that indeed you are getting a signal. So in this case if
you type *./wr-dio-cmd wr0 stamp* you get the output shown above .\
YOU WON\'T SEE \"ch 4 \" input anymore because is now \"sent\" to R4.\
That is why we make a copy on local \"ch 2 \" of the beam signals coming
IN on ch 4

At this point, when you type *./wr-dio-cmd wr0 stamp*, this is what you
see: PPS on ch 0, and a signal on Local ch 2.

\_\[root\@sbn-mi12 tools\]\# ./wr-dio-cmd wr0 stamp\
ch 0, 1610402323.000000000\
ch 0, 1610402324.000000000\
ch 0, 1610402325.000000000\
ch 2, 1610402322.360131928\
ch 2, 1610402322.426784024\
ch 2, 1610402322.493436336\
ch 2, 1610402323.493223992\
ch 2, 1610402323.559877624\
ch 2, 1610402323.626528728\
ch 2, 1610402323.693180928\
ch 2, 1610402324.692954648\
ch 2, 1610402324.759606416\
ch 2, 1610402324.826256424\
ch 2, 1610402324.892905632\
\[root\@sbn-mi12 tools\]\# \_

**WHAT to do on a RECEIVER node with a SPEC/DIO card ( for example , on
icarus-daq02.fnal.gov)**

On the receiver node, to see the incoming signals, you need to start the
\" *wr-dio-agent* \" program as follows BEFORE starting the ruler on the
sending node

*./wr-dio-agent wr0 &*

After this is started , you can check the signals coming in with the
usual *./wr-dio-cmd wr0 stamp*

\_\[root\@icarus-daq02 tools\]\# ./wr-dio-cmd wr0 stamp\
ch 0, 1609790990.000000000\
ch 0, 1609790991.000000000\
ch 0, 1609790992.000000000\
ch 0, 1609790993.000000000\
ch 4, 1609790990.305289880\
ch 4, 1609790990.505355808\
ch 4, 1609790990.572045752\
ch 4, 1609790990.772113592\
ch 4, 1609790990.838803048\
ch 4, 1609790991.705761040\
ch 4, 1609790991.905831048\
ch 4, 1609790991.972520320\
ch 4, 1609790992.172590288\
ch 4, 1609790992.239281368\
ch 4, 1609790993.106244328\
ch 4, 1609790993.306313704\
ch 4, 1609790993.373002912\
ch 4, 1609790993.573071512\
ch 4, 1609790993.639762752\
ch 3, 1609790990.000000000\
ch 3, 1609790991.000000000\
ch 3, 1609790992.000000000\
ch 3, 1609790993.000000000\
\[root\@icarus-daq02 tools\]\# \_

::: 
[Edit this
section](_How_to_send_and_receive_beam_signals_on_the_WR_network/edit?section=2){.icon-only
.icon-edit}
:::



## OTHER USEFUL INFORMATION

A DIO card has 5 channels, numbered 0-4. Channel 0 is special and is
used ONLY for outputting the WR PPS. Channels 1-4 can be set as Input
\[i or I\] or Output \[d or D\], where upper case denotes a 50 Ohm
termination.

To set a channels in Input or output mode you use the *wrs-cmd-mode* .

For example:\
*./wr-cmd-mode wr0 1 I* sets Ch 1 in Input mode with 50 Ohm termination\
*./wr-cmd-mode wr0 4 D* sets Ch 4 as Output mode with 50 Ohm termination

It is also possible to use more channels to output the PPS, setting them
as \"output\" and using the *wr-cmd-pps* command as in the following
example:

*./wr-dio-cmd wr0 mode 3 D*\
*./wr-dio-pps 3*

\_\[root\@icarus-daq02 tools\]\# ./wr-dio-pps wr0 3\
./wr-dio-pps: Using interface \"wr0\" and channel 3 for pps output\
\[root\@icarus-daq02 tools\]\#

\[root\@icarus-daq02 tools\]\# ./wr-dio-cmd wr0 stamp\
ch 0, 1609790898.000000000\
ch 0, 1609790899.000000000\
ch 0, 1609790900.000000000\
ch 0, 1609790901.000000000\
ch 0, 1609790902.000000000\
ch 3, 1609790898.000000000\
ch 3, 1609790899.000000000\
ch 3, 1609790900.000000000\
ch 3, 1609790901.000000000\
ch 3, 1609790902.000000000\
\[root\@icarus-daq02 tools\]\#\
\_
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
[PDF](_How_to_send_and_receive_beam_signals_on_the_WR_network.pdf){.pdf}
[HTML](_How_to_send_and_receive_beam_signals_on_the_WR_network.html){.html}
[TXT](_How_to_send_and_receive_beam_signals_on_the_WR_network.txt){.txt}

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
