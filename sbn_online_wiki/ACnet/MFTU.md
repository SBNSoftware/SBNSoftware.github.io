---
layout: page
title: Multi-Function Timing Unit (MFTU)
---

## The Multi-Function Timing Unit (MFTU)

The MFTU is the latest interface between the ACnet timing systems (TCLK or MIBS) and users of their timing and control signals.   The MFTU replaces the previous Internet Rack Monitor (IRM).   The unit decodes the incoming TCLK (or MIBS) event stream and converts them into simple TTL digital outputs with a programmable delays and widths.  The unit can also accept fast asynchronous signals and use the TCLK events to gate the fast signals in order to select a subset of those signals.  For example, if one wants only BES booster extraction signals that are going to BNB, you can gate the BES with $1D TCLK events.  Before configuring the MFTU, be sure to read the docementation at <https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=3578> (MFTU Documentation). Related documenation can be found at <https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=3701> (Presenation by the Designer) and <https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=19258> (Fiber to TTL Converter).

## Configuring the MFTU

The MFTU configuration is performed on page E35 of an ACnet console, SBN-ND tab, pages 3 and 4.   To open a console, ssh to either outland.fnal.gov or outback.fnal.gov ACnet gateway nodes and type "cnsrun".    If you are off-site without a good internet connection, we recommend launching the console on a VNC session.  Note that VNC sessions are not allowed on outland nor outback, you will need another VNC server host.  After typing "cnsrun" in a moment several new windows will appear, like this one below.

<img width="771" alt="E Menu Page" src="https://user-images.githubusercontent.com/25019296/139336810-e3daa1e2-244d-4788-9eaf-cf94c9a0c96a.png">

If the E menu is not shown, type the letter E in the upper left corner of the window and press return.   To display page E35, click on that entry in the list, or type E35, again in the upper left corner of the window and press return.    To select the correct pages, click on the SBN-ND tab (shown with a red rectangle) and enter page number 3 or 4 (shown with a red oval) and press return. Pages 1 and 2 configure the older IRM device, also available at SBN-ND and SBN-FD. 

<img width="752" alt="An MFTU control page" src="https://user-images.githubusercontent.com/25019296/139337240-76015d25-7d2b-45c9-aebe-656781c70389.png">

Each output has three parameters:  TCLK event, delay and vernier.  Vernier is not available on B channels (page 4).  By default, settings are disabled when you first connect to the ACnet console.  To enable settings temporarily, find the smaller "Utilities" window.    Click on "Settings" and choose a time -- choose the shortest time in which you can effectively do whatever work you need to do.   Note you must be connected from on site in order to enable settings. 

<img width="600" alt="Screen Shot 2021-10-28 at 4 28 18 PM" src="https://user-images.githubusercontent.com/25019296/139340926-d9e105b6-ad8b-4c38-ad50-f7efa4a88855.png">
<img width="600" alt="Settings Enabled" src="https://user-images.githubusercontent.com/25019296/139339453-525c1bff-f95d-46c9-973a-dc64781e6f9a.png">

The yellow columns show the last set value of the parameter.   The green numbers show the actual setting as read back from the device.   To change the setting, simply type over the yellow numbers and press return.  After a moment, the green column should show the new value when the setting was successful.   If you see another number in green or a red error code, the setting failed.  In case of failure, the reasons could be:  Settings are disabled in the Utilities window; you do not have privilege from your account to change these device sestting; or there could be a hardware fault.

When finished setting, be sure to disable Settings on the Utilities window.   When you are finished with your ACnet console session as a whole, be sure to log out by clicking "Shutdown Console" on the Utilities window.

Note that Clockodile, page D33, has a mode where you can get the event description text to learn what 1D, 74 and the like are

(wb)

## MFTU Channel Configuration

There are currently two MFTU(s) installed for SBN.  One at SBN-ND and one at SBN-FD.  The one at SBN-ND is MFTU-004 with an IP address of 10.200.5.14.  The one at SBN-FD is MFTU-005 with an IP address of 10.200.5.15.  These are both on the Controls Network using a special VLAN set up for the MFTU to communicate with Acnet.  An Erlang Frontend performs all direct communication with the MFTU.  The Frontend then communicates with Acnet to handle all requests.  This is done because the MFTU can only handle one communication request at a time.
 
The general premise of the MFTU is as follows. An arming signal comes along for a given channel (usually a Clock EVENT, up to 16 different Clock EVENTs could be chosen per channel).  A trigger then comes along after which the channel that was armed will start counting a specified number of counts (the quantity that is counted corresponds to the Clock EVENT that armed the channel, 16 different possible values).  Upon reaching the count, the channel will then fire an output high for a specified amount of time (currently defaulted to 1uS).  The cycle then repeats when another arming signal comes along.  This is a very simplified description and there are numerous options for every channel but this is the overall functionality of a given channel and sequence of timing that occurs with an MFTU.  All channels also have an independent enable/disable option.
 
All channels are 50 Ohm TTL signals.
 
Both of the MFTU(s) are configured the same way. 
The channels will be described as follows.  Note: The $FE EVENT is a null setting.  The $FE EVENT will never occur on TCLK.

**Channels A1 through A8**

Trigger: BES (\$1F)

Channel A1 is shown as an example in the table below.  Currently all these channels arm on a TCLK $1D for the first possible EVENT.


             
| Channel A1 | Set|ting|s fo|r 16| dif|fere|nt E|VENT|s p|er |cha|nnel|
|------------|---|---|---|---|---|---|---|---|---|---|---|---|
| Arming EVENTs | \$1D | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE |
| Delay Setting (count of RF Buckets) | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| Vern Delay Setting (1nS increments) | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 

When a TCLK \$1D is seen, the channel is armed.  The Delay setting that corresponds to the $1D (in the same column) is then loaded into a counter for that channel.  When the trigger (BES) is received, the channel will start counting the Delay Setting.  These channels are set up to count the BRF buckets as its clock source for the Delay Setting.  Once this value is counted, the Channel output will fire.  The Vernier Delay Setting that corresponds to the $1D (in the same column) was also loaded into a delay line chip that delays the output by the setting in 1nS increments. 
 
All of Channels A1 through A8 function in this manner with the possibility for independently different Arming EVENTs, Delay Settings, and Vern Delay Settings.
If a channel is armed and no trigger (BES) comes along, the channel is cleared on a TCLK $11, $12, $13, $14, $15, $16, $17, or $1C.


**Channels A9 through A14**

Trigger: \$1D

Channel A9 is shown as an example in the table below.  Currently all these channels arm on a TCLK $1D for the first possible EVENT.

Settings for 16 different EVENTs per channel

| Channel A9 | | | | | | | | | | | | |
|------------|---|---|---|---|---|---|---|---|---|---|---|---|
| Arming and Triggering EVENTs | \$1D | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE |
| Delay Setting (count of ticks synced to TCLK) | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |

When a TCLK \\$1D is seen, the channel is armed and triggered at the same time.  The Delay setting that corresponds to the \$1D (in the same column) is counted immediately.  These channels are set up to count the number of ticks with a clock synced to TCLK for the Delay Setting.  Since it is synced to TCLK, this results in each tick being 1 uS.  Once this value is counted, the Channel output will fire.
 
All of Channels A9 through A14 function in this manner with the possibility for independently different Arming EVENTs and Delay Settings.


**Channel A15**

This channel is an output of the BES signal.

**Channel A16**

This channel is a TTL output of the BRF signal.

**Channels B1 through B8**

Trigger: \$74

Channel B1 is shown as an example in the table below.  Currently all these channels arm on a MBS $74 for the first possible EVENT.

Settings for 16 different EVENTs per channel

| Channel B1 | | | | | | | | | | | | |
|------------|---|---|---|---|---|---|---|---|---|---|---|---|
| Arming and Triggering EVENTs | \$74 | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE |
| Delay Setting (count of ticks synced to MIBS) | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |

When a MIBS \$74 is seen, the channel is armed and triggered at the same time.  The Delay setting that corresponds to the \$74 (in the same column) is counted immediately.  These channels are set up to count the number of ticks with a clock synced to MIBS for the Delay Setting.  Since it is synced to MIBS, this results in each tick being in sync with the LLRF divided by 7 value of approximately 7.5MHz frequency or about 132nS.  Once this value is counted, the Channel output will fire. 
 
All of Channels B1 through B8 function in this manner with the possibility for independently different Arming EVENTs and Delay Settings.



**Channels B9 through B16**

Trigger: \$1D

Channel B9 is shown as an example in the table below.  Currently all these channels arm on a TCLK $1D for the first possible EVENT.

Settings for 16 different EVENTs per channel

| Channel B9 | | | | | | | | | | | | |
|------------|---|---|---|---|---|---|---|---|---|---|---|---|
| Arming and Triggering EVENTs | \$1D | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE | \$FE |
| Delay Setting (count of ticks synced to TCLK) | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |

When a TCLK \$1D is seen, the channel is armed and triggered at the same time.  The Delay setting that corresponds to the \$1D (in the same column) is counted immediately.  These channels are set up to count the number of ticks with a clock synced to TCLK for the Delay Setting.  Since it is synced to TCLK, this results in each tick being 1 uS.  Once this value is counted, the Channel output will fire.
 
All of Channels B9 through B16 function in this manner with the possibility for independently different Arming EVENTs and Delay Settings.





