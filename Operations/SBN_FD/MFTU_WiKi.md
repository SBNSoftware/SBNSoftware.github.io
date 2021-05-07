

# MFTU WiKi

MFTU stands for Multi Functions Timing Unit, built by AD to distribute
beam signals throughout the site.

Starting information fro email by Mark Austin on 2/23/2021

There are currently two MFTU installed for SBN. One at SBN-ND and one at
SBN-FD. The one at SBN-ND is MFTU-004 with an IP address of 10.200.5.14.
The one at SBN-FD is MFTU-005 with an IP address of 10.200.5.15. These
are both on the Controls Network using a special VLAN set up for the
MFTU to communicate with Acnet. An Erlang Frontend performs all direct
communication with the MFTU. The Frontend then communicates with Acnet
to handle all requests. This is done because the MFTU can only handle
one communication request at a time.

The general premise of the MFTU is as follows. An arming signal comes
along for a given channel (usually a Clock EVENT, up to 16 different
Clock EVENTs could be chosen per channel). A trigger then comes along
after which the channel that was armed will start counting a specified
number of counts (the quantity that is counted corresponds to the Clock
EVENT that armed the channel, 16 different possible values). Upon
reaching the count, the channel will then fire an output high for a
specified amount of time (currently defaulted to 1uS). The cycle then
repeats when another arming signal comes along. This is a very
simplified description and there are numerous options for every channel
but this is the overall functionality of a given channel and sequence of
timing that occurs with an MFTU. All channels also have an independent
enable/disable option.

All channels are 50 Ohm TTL signals.

Both of the MFTU are configured the same way.\
The channels will be described as follows. Note: The \$FE EVENT is a
null setting. The \$FE EVENT will never occur on TCLK.

Channels A1 through A8\
Channel A1 is shown as an example in the table below. Currently all
these channels arm on a TCLK \$1D for the first possible EVENT.

Channel A1
:::
:::
:::
:::
:::
:::

Settings for 16 different EVENTs per channel

Arming EVENTs

\$1D

\$FE

\$FE

\$FE

\$FE

\$FE

\$FE

\$FE

\$FE

\$FE

\$FE

\$FE

  ------------------------------------- --- --- -- --- --- --- --- --- --- --- --- --- ---
  Delay Setting (count of RF Buckets)   0   0      0   0   0   0   0   0   0   0   0   0
  ------------------------------------- --- --- -- --- --- --- --- --- --- --- --- --- ---

  ------------------------------------- --- --- -- --- --- --- --- --- --- --- --- --- ---
  Vern Delay Setting (1nS increments)   0   0      0   0   0   0   0   0   0   0   0   0
  ------------------------------------- --- --- -- --- --- --- --- --- --- --- --- --- ---

When a TCLK \$1D is seen, the channel is armed. The Delay setting that
corresponds to the \$1D (in the same column) is then loaded into a
counter for that channel. When the trigger (BES) is received, the
channel will start counting the Delay Setting. These channels are set up
to count the BRF buckets as its clock source for the Delay Setting. Once
this value is counted, the Channel output will fire. The Vernier Delay
Setting that corresponds to the \$1D (in the same column) was also
loaded into a delay line chip that delays the output by the setting in
1nS increments.

All of Channels A1 through A8 function in this manner with the
possibility for independently different Arming EVENTs, Delay Settings,
and Vern Delay Settings.\
If a channel is armed and no trigger (BES) comes along, the channel is
cleared on a TCLK \$11, \$12, \$13, \$14, \$15, \$16, \$17, or \$1C.

Channels A9 through A14\
Channel A9 is shown as an example in the table below. Currently all
these channels arm on a TCLK \$1D for the first possible EVENT.

\|\_. Channel A9 \|\_. Settings for 16 different EVENTs per channel \|
\|\_. Arming and Triggering EVENTs \|\_. \$1D \|\_. \$FE \|\_. \$FE
\|\_. \$FE \|\_. \$FE \|\_. \$FE \|\_. \$FE \|\_. \$FE \|\_. \$FE \|\_.
\$FE \|\_. \$FE

Delay Setting (count of ticks synced to TCLK)\
0\
0\
0\
0\
0\
0\
0\
0\
0\
0\
0\
0

When a TCLK \$1D is seen, the channel is armed and triggered at the same
time. The Delay setting that corresponds to the \$1D (in the same
column) is counted immediately. These channels are set up to count the
number of ticks with a clock synced to TCLK for the Delay Setting. Since
it is synced to TCLK, this results in each tick being 1 uS. Once this
value is counted, the Channel output will fire.

All of Channels A9 through A14 function in this manner with the
possibility for independently different Arming EVENTs and Delay
Settings.

Channel A15\
This channel is an output of the BES signal.

Channel A16\
This channel is a TTL output of the BRF signal.

Channels B1 through B8\
Channel B1 is shown as an example in the table below. Currently all
these channels arm on a MBS \$74 for the first possible EVENT.

Channel B1\
Settings for 16 different EVENTs per channel\
Arming and Triggering EVENTs\
\$74\
\$FE\
\$FE\
\$FE\
\$FE\
\$FE\
\$FE\
\$FE\
\$FE\
\$FE\
\$FE\
\$FE\
Delay Setting (count of ticks synced to MIBS)\
0\
0\
0\
0\
0\
0\
0\
0\
0\
0\
0\
0

When a MIBS \$74 is seen, the channel is armed and triggered at the same
time. The Delay setting that corresponds to the \$74 (in the same
column) is counted immediately. These channels are set up to count the
number of ticks with a clock synced to MIBS for the Delay Setting. Since
it is synced to MIBS, this results in each tick being in sync with the
LLRF divided by 7 value of approximately 7.5MHz frequency or about
132nS. Once this value is counted, the Channel output will fire.

All of Channels B1 through B8 function in this manner with the
possibility for independently different Arming EVENTs and Delay
Settings.

Channels B9 through B16\
Channel B9 is shown as an example in the table below. Currently all
these channels arm on a TCLK \$1D for the first possible EVENT.

Channel B9\
Settings for 16 different EVENTs per channel\
Arming and Triggering EVENTs\
\$1D\
\$FE\
\$FE\
\$FE\
\$FE\
\$FE\
\$FE\
\$FE\
\$FE\
\$FE\
\$FE\
\$FE\
Delay Setting (count of ticks synced to TCLK)\
0\
0\
0\
0\
0\
0\
0\
0\
0\
0\
0\
0

When a TCLK \$1D is seen, the channel is armed and triggered at the same
time. The Delay setting that corresponds to the \$1D (in the same
column) is counted immediately. These channels are set up to count the
number of ticks with a clock synced to TCLK for the Delay Setting. Since
it is synced to TCLK, this results in each tick being 1 uS. Once this
value is counted, the Channel output will fire.

All of Channels B9 through B16 function in this manner with the
possibility for independently different Arming EVENTs and Delay
Settings.

After all this is digested, it now needs to be decided what channels and
how many EVENT settings per channel you want available in Acnet and what
names you would like. More can always be added later with no disruption.
The Frontend will read all the data from the MFTU, it just needs to be
decided what you want visible and settable in Acnet.

Some examples of device names could be as follows:\
If you know you are only going to be using the first EVENT in the list
of 16 per channel, then there is no reason to create an Acnet device for
the other possible EVENTs if they won't ever be used.\
E:SBNA1D channel A1 Delay Setting as well as enable disable
functionality.\
E:SBNA1E channel A1 EVENT value\
E:SBNA1V or E:SBNA1F channel A1 Vernier Delay Setting or fine tuning.

These could also be set up as arrays if you were going to have multiple
EVENTs with different delays.\
E:SBNA1D^[0]^\
E:SBNA1D^[1]^....etc.\
E:SBNA1E^[0]^\
E:SBNA1E^[1]^....etc.\
E:SBNA1V^[0]^\
E:SBNA1V^[1]^....etc.

However, I don't think you will be necessarily utilizing that
functionality. If you decide you will, it can easily be added to a
device in Acnet later.

I cc'd Dennis on this and he will set up the devices for you.

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
[PDF](MFTU_WiKi.pdf){.pdf}
[HTML](MFTU_WiKi.html){.html}
[TXT](MFTU_WiKi.txt){.txt}

::: {style="clear:both;"}
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
