

# DIO test (2017)

In order to get to the specific machine in root

\[root\@sbnd-daq22 tools\]\#

1\) **whoami**\
2) **uname -a**

if in sbnd-test02 change to the computer to be used

3\) **klist** will tell you if you need to renew credentials again if
so, use **kinit**

4\) change to the computer you want using, for example,\
**ssh -X sbnd-daq25**

\*\
when in the computer you want do the following:

**cd sbnddaq-readout/projects/wr/wr-starting-kit/spec-sw/tools**

[To work at this point, switch to ROOT]{.ul}

to do this , type **\"ksu\"**

You must be here\
*\
for example, if working with machine 25*

\[root\@sbnd-daq25 tools\]\#

[**\
run this**]{.ul}

1root\@sbnd-daq25 tools\]\# ./spec-vuart -u 0xa0500

\[press **\"Cntl a\"** to exit\]

get to

wrc\#

[**Now we check the connection**]{.ul}

go to\
**gui**

must be in ./spec-vuart -u 0xa0500

Type **gui**

[Listing should include \"Link up\" and \"master\"]{.ul} to verify all
connections are good

WR PTP Core Sync Monitor v 1.0\
Esc = exit

TAI Time: Thu, Jan 1, 1970, 00:08:21

wru1: Link up (RX: 1132802, TX: 397870), mode: WR Off

PTP status: master

Sync info not valid

wrc\#

[**check \"init\" script**]{.ul}

wrc\#wrc\# init show\
ptp stop\
sfp detect\
sfp match\
mode slave\
ptp start

[**If in slave mode, change to master**]{.ul}\
wrc\#\
wrc\# mode master\
Locking PLL\...\
wrc\#\
wrc\# init erase\
wrc\#\
wrc\#\
wrc\# init show\
Empty init script\...\
wrc\#\
wrc\#\
wrc\# init add ptp stop\
OK.\
wrc\# init add sfp detect\
OK.\
wrc\# init add sfp match\
OK.\
wrc\# init add mode master\
OK.\
wrc\# init add ptp start\
OK.\
wrc\# init show\
ptp stop\
sfp detect\
sfp match\
mode master\
ptp start

type **\"init boot\"** to execute the changes

[**Now we check the connection**]{.ul}

go to\
**gui**

must be in ./spec-vuart -u 0xa0500

Type **gui**

[Listing should include \"Link up\" and \"master\"]{.ul} to verify all
connections are good

WR PTP Core Sync Monitor v 1.0\
Esc = exit

TAI Time: Thu, Jan 1, 1970, 00:08:21

wru1: Link up (RX: 1132802, TX: 397870), mode: WR Off

PTP status: master

Sync info not valid

wrc\#

**to exit from wrc, hit escape key** **\
to go back to the selected computer, type cntrl -a**

[**Check that we see the pps signal on channel 0**]{.ul}

\[root\@sbnd-daq25 tools\]\# ./wr-dio-cmd wr0 stamp 0

[**If functioning properly, a pulse is recorded and will look like
this**]{.ul}

ch 0, 822.000000000\
ch 0, 823.000000000\
ch 0, 824.000000000\
ch 0, 825.000000000

**[This may be checked at any time to verify there is a pulse. If no new
data is recorded there is a problem]{.ul}** **\
Do not run cable to channel 0. This is a special channel\
**+

\

+Set the channel mode as input

**\
\[root\@sbnd-daq25 tools\]\# ./wr-dio-cmd wr0 mode 1 I**

Set up Pulse generator at at period 100.00 Ampl 9.0 duty 0.01%

Oscilloscope should verify same

Line out ch 1 to oscilloscope T to computer channel selected.\
Oscilloscope will read less than generated as 1/2 current bypasses.

**[Set up is complete. to test channel 1 Remember the the actual
channels are 1 through 5, but the software see them as 0 through
4]{.ul}**

\[root\@sbnd-daq25 tools\]\# ./wr-dio-cmd wr0 stamp 1

readout of successful stamp should be like this

ch 1, 3364.541126608\
ch 1, 3364.641126152\
ch 1, 3364.741125696\
ch 1, 3364.841125232\
ch 1, 3364.941124776\
ch 1, 3365.041124320\
ch 1, 3365.141123864\
ch 1, 3365.241123408\
ch 1, 3365.341122952

ch 1, 3476.140615904\
ch 1, 3476.240615448\
ch 1, 3476.340614992\
ch 1, 3476.440614528\
ch 1, 3476.540614072\
ch 1, 3476.640613616\
ch 1, 3476.740613160\
ch 1, 3476.840612696\
ch 1, 3476.940612240\
ch 1, 3477.040611784\
ch 1, 3477.140611328

To move to another test channel, change this

\[root\@sbnd-daq25 tools\]\# ./wr-dio-cmd wr0 mode 2 I

Now change command to stamp the pulse time

Repeat

\[root\@sbnd-daq25 tools\]\# ./wr-dio-cmd wr0 stamp 2

Should give you something like this

ch 2, 4163.237469592\
ch 2, 4163.337469136\
ch 2, 4163.437468680./wr-dio-cmd wr0 stamp 0\
ch 2, 4163.537468216\
ch 2, 4163.637467760\
ch 2, 4163.737467304\
ch 2, 4163.837466848\
ch 2, 4163.937466384\
ch 2, 4164.037465928\
ch 2, 4164.137465472\
ch 2, 4164.237465016\
ch 2, 4164.337464552\
ch 2, 4164.437464096\
ch 2, 4164.537463640\
ch 2, 4164.637463184

To test the Input and Output of the channels, you will send an internal
pulse

\+

From the **\
\[root\@sbnd-daq25 tools\]\#**

Three things must be done. Select mode for the channel desired, label as
D ( this is output)

**./wr-dio-cmd wr0 mode 3 D**

Send an internal pulse

**./wr-dio-cmd wr0 pulse 3 .1 now**

Record the pulse on the channel selected

**./wr-dio-cmd wr0 stamp 3**

You will see proof of one recorded time, like this\...

ch 3, 181899.019170064

Test All channels in a similar fashion

**[At this point, move on to testing Output from a specified channel to
input received by another channel using the same machine.]{.ul}**

To do this, select the output ( in this case ch1)\
select the input ( ch 2 )

Attach the cable in the rear of the machine between ch 1,2

Be sure channel 1 is set to send a pulse in output, in mode 1 D

**./wr-dio-cmd wr0 mode 1 D**

channel 2 must be set to receive the signal

**./wr-dio-cmd wr0 mode 2 I**

Send a pulse

**./wr-dio-cmd wr0 pulse 1 .1 now**

Stamp it

**./wr-dio-cmd wr0 stamp 2**

ch 0, 189241.000000000\
ch 0, 189242.000000000\
ch 1, 189240.887746904\
ch 2, 189240.887746912

Disregard ch 0 information

July 5 test of this yielded this information

ch 1, 189240.887746904\
ch 2, 189240.887746912

ch 1, 190347.261607816\
ch 3, 190347.261607824

ch 1, 190520.220069960\
ch 4, 190520.220069968

sending from 2\
ch 1, 190795.465339104\
ch 2, 190795.465339096

ch 2, 190992.887333656\
ch 3, 190992.887333664

ch 2, 191065.190808008\
ch 4, 191065.190808016

sending from 3

ODD FINDINGS no difference in I and O times

sending from 4

ch 3, 191920.990925104\
ch 4, 191920.990925104

The findings for both daq 22 and 25 showed output from 3 or 4 to any
input showed no delay in the time stamp\
however, output sent from 1 or 2 and received by any other gave an
.000000008 second delay.

**July 6**++\
**Test of split signal from external pulse generator into sbnddaq25**\
data still showed a delay of 8 milliseconds, or occasional exact
correspondence\
Examples of all data are save in files\
example: test_dio_sbnddaq25_23 is a comparison of the input for channels
2 and 3

**July 6 Testing of input/ output for daq23**

Internal pulse\
output/ input

**Ch1/ Channels 2,3,4**

ch 1, 8573.441462024\
ch 2, 8573.441462032

ch 1, 8891.150002104\
ch 3, 8891.150002112

ch 1, 8961.068422664\
ch 4, 8961.068422672

**Ch2/ ch 1,3,4**

ch 1, 9126.314660768\
ch 2, 9126.314660760

ch 2, 9211.450177560\
ch 2, 9214.714201304\
ch 3, 9211.450177568\
ch 3, 9214.714201312

ch 2, 9298.457321912\
ch 4, 9298.457321920

Ch3 / ch 1,2,4

ch 1, 9532.071870272\
ch 3, 9532.071870272

ch 2, 9679.109627536\
ch 3, 9679.109627536

**The first pulse gave these results**

ch 3, 9758.868956944\
ch 4, 9758.868956952

**however, the next three attempts**

ch 3, 9796.772456992\
ch 4, 9796.772456992

ch 3, 9819.077251312\
ch 4, 9819.077251312

ch 3, 9929.684193552\
ch 4, 9929.684193560

CH 4/ ch 3,2,1

ch 3, 10846.458764496\
ch 4, 10846.458764496

ch 3, 10841.659657568\
ch 4, 10841.659657568

ch 3, 10824.090902464\
ch 4, 10824.090902464

ch 2, 11139.384069824\
ch 4, 11139.384069824

ch 2, 11152.983942640\
ch 4, 11152.983942640

ch 1, 11248.022830336\
ch 4, 11248.022830336

ch 1, 11240.231077280\
ch 4, 11240.231077280

Additionally, daq23 was tested using external pulse to two channels
simultaneously as had been done for daq25\
all data recorded in folders example: test_dio_sbnd23_24 representing
channels 2 and 4 for daq23

to write info directly to a file

**./wr-dio-cmd wr0 stamp \> test_dio_sbnddaq25_12**

July 11, 2017\
We will repeat the same tests with the DIO card on sbnd-daq22:\
an external pulse will be sent to two separate channels to compare time
stamps.\
\*All data for each individual test ( i.e. 1,2 2,3 ) will be saved and
complied in excel spreadsheet as before.

[**JULY 13/18**]{.ul}

At this point, we re trying to generate an external pulse and have it
return ( and stamped ) from two separate computers.

In this example, the pulse is split at the source ( PORT 1) , being sent
directly to the oscilloscope and to a computer ( the ruler)

The signal on the oscilloscope from the PPS should match the returning
signals from the two computers.

FOR THIS EXAMPLE

**daq23 ch1 is the ruler and receives the external pulse**.\
**daq23 ch 3 will be the local output ( back to oscilloscope)**\
and **daq25 ch 2 will be the remote.**

Step 1) PPS and OSCOPE set up\_\
a) split signal at port 1 of PPS. 1 line goes to OSCOPE, the other line
to daq23 ch 1\
b) cables should connect daq23 ch 3 to OSCOPE, and dq25 ch 2 to OSCOPE\
c) the settings on the PPS should be period= 100ms Ampl=9.0 Duty.010 %
Continuous pulse\
d) The OSCOPE should be set to 1 volt M=20us Trig\'d\
e) Signals will all look the same, but slightly delayed when in
operation.

Step 2) daq25 ( the remote ) set up\
a) get to \*root\@sbnd-daq25 tools\]\# **\
b) To see if any agent history \*ps -eaf \| grep wr**\
c) IMPORTANT clear any of these that list as agent **kill -9 45738**
only use numbers to indicate what to end

f\) set the remote ch 2 in output mode\
./wr-dio-cmd wr0 mode 2 D

\[When the RULER is running, you will be able to stamp ch 2\]

d\) use command to designate it as agent\
./wr-dio-agent wr0 &

Step 3) daq23 ( the ruler ) set up\
a) get to \*root\@sbnd-daq25 tools\]\# **\
b) To see if any agent history \*ps -eaf \| grep wr**\
c) IMPORTANT clear any of these that list as agent **kill -9 45738**
only use numbers to indicate what to end

e\) set the IN ch as I: in this case it\'s ./wr-dio-cmd wr0 mode 1 I\
f) check that a stamp can be made: ./wr-dio-cmd wr0 stamp\
g) set the L(local) ch as output: in this case it will be ch 3
./wr-dio-cmd wr0 mode 3 D\
NOTE: without ruler running, you will see ch 0 and 1, but not ch 3

When the ruler starts, it will give you this info\.....\
\[root\@sbnd-daq23 tools\]\# ./wr-dio-ruler wr0 IN1 L3+0.0002 R2+0.0002
&\
\[1\] 17742\
\[root\@sbnd-daq23 tools\]\# ./wr-dio-ruler: configured for local
channel 3, delay 0.000200000\
./wr-dio-ruler: configured for remote channel 2, delay 0.000200000

When stamping is running well, data must be saved to files

Step 4) Taking the data and saving to a proper location

Make a directory ( a folder where files will be stored)

mkdir daq23_ruler_IN14_daq25_agent_R4 ( so this is for two files IN1
Local4 and Remote 4)

On computer daq23

./wr-dio-cmd wr0 stamp 2 \> test_dio_sbnd23_ruler_in1out2_daq25_agentR1

This file name tells that the output from ch 2 in daq23 will be compared
to output of ch 1 in daq25 ( agent R1)

JULY 20

Today a test of two equal length cables, pulse from external source,
into daq 24, all combinations of channels. ( i.e. 1 and 2, switch cables
called \"X\" and \"Z\" and run again.

12 possible combinations ( 1x2z, 1z2x, 1x3z, 1z3x\.....)

1\) Be in computer 24 \* \[root\@sbnd-daq24 tools\]\# \*

2\) Split cable at source after verifying a pulse from oscilloscope
Place \"X\" and \"Z\" into desired channels

3\) run **./fmc-tdc-tstamp 0x0c00**

4\) record 100 pulses and save to file

**5) All files may be located
sbnddaq-readout/projects/wr/startingkit/spec-sw/tools/**
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
[PDF](_DIO_test_1.pdf){.pdf}
[HTML](_DIO_test_1.html){.html}
[TXT](_DIO_test_1.txt){.txt}

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
