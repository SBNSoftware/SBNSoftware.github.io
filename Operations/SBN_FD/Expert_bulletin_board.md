

# **Expert** bulletin board

::: 
[Edit this
section](Expert_bulletin_board/edit?section=2){.icon-only
.icon-edit}
:::



## Don\'t forget to read both the TEMPORARY and PERMANENT conditions

::: 
[Edit this
section](Expert_bulletin_board/edit?section=3){.icon-only
.icon-edit}
:::



## Colour guide for this page

  -------------------------------- -------------------------- ---------------------------------- ---------------
  **Current Running Conditions**   **Temporary Conditions**   **New and Permanent Conditions**   **Attention**
  -------------------------------- -------------------------- ---------------------------------- ---------------

::: 
[Edit this
section](Expert_bulletin_board/edit?section=4){.icon-only
.icon-edit}
:::



## General comments from the Run Coordinators

  --------------------- ------------------ ------------------
  **Run Coordinator**   **Until (Date)**   **Phone Number**
  **Name Surname**      January 1st, 8am   \(xxx\) xxx-xxx
  --------------------- ------------------ ------------------

~\
~

**Trigger Conditions (Updated 17 January 2020)**

**Originally in Shift Bulletin Board, copied to this location on 8
December 2020**

The Tektronics Pulser AFG3252C is being used to simultaneously send a
pulse to the TPC and PMT racks. Channels A (TPC) and B (PMT) are
synchronized. The settings for both are:

TPC:

-   Freq 5 hz
-   Delay 0 ns
-   High 3 V
-   Low 0 V
-   Offset 1.5 V
-   Width 2 micro seconds.
-   Leading 9 ns, trailing 9 ns

PMTs:

-   Freq 5 hz
-   Delay 0 ns
-   High 5 V
-   Low 0 V
-   Offset 2.4 V
-   Width 2 micro seconds.
-   Leading 9 ns, trailing 9 ns

Howard B. previously pointed out (before December 26) that having the
AFG3252 pulser (old SBND borrowed pulser) with a 200 micro seconds
window caused the TTLink signal to be 63 Hz after power cycling, which
is not right as it should be 10 Hz. However, having the new pulser at 2
micro seconds fixed the problem.

**N.B. (31 January 2020)** four crates (WE minicrates) still use this
configuration and four (EW minicrates) use the trigger crate signals for
testing purposes (see the \"Connected Mini-Crates\" above)

**N.B. (28 September 2020)** mostly copied from a bulletin board entry
that is now deleted, but with a few fixes/updates: \"The West crates are
still hooked up to receive triggers using the pulser to generate a
TTLink signal, however for testing the trigger board, the East crates
are getting the TTLink from the trigger board via the east-side fanout.
See the related ECL entry
<http://dbweb0.fnal.gov/ECL/sbnfd/E/show?e=1071>

The TTLink out from the trigger crate (WE05) is currently not being sent
to the oscilloscope before going to the TTLink fan-out modules. See ECL
entry 1107.

For now, running generally includes either West components OR East
components.\"

~\
~

~\
~

~\
~

::: 
[Edit this
section](Expert_bulletin_board/edit?section=5){.icon-only
.icon-edit}
:::



# **PAGE NEEDS UPDATING**

~\
~

~\
~

**If MsgViewer does not print messages to screen during a run! (Added 16
December, 2019)**

**NOTE - this was on the Shift Bulletin Board and moved to the Expert
bulletin board on 29 June 2020**

The MsgViewer does not like when the DAQ has been run on one machine and
then switched to running on another. Exit out of the DAQInterface
session and kill the MsgViewer (hit the X button). Then rm the
MessageFacility.fcl file that has been created in the DAQInterface
directory. Then, when you start the run again, it should hopefully open
and start printing messages to the MsgViewer.

**Data taking during the cool down and filling (Updated 6 March, 2020)**

We\'re now piloting pseudo-continuous running of the DAQ. Experts who
wish to do work/testing with the DAQ that could affect the shifter\'s
data-taking should coordinate with the shifters before doing said
activities. **Write everything in the ECL**\
More information about data taking during these periods is posted in the
[shift bulletin
board](Shift_bulletin_board)

**Reduced amount of data being permanently stored (Updated March 6th
2020)**\
The DAQ run configuration has been **temporary** modified to allow for
longer runs without overflowing the storage space during the filling
period, while TPC and PMT noise measurements are being taken:

-   All the data is being sent to /data/test_daq.
-   Only 1/50 events are being sent to /data/daq in icarus-evb01. This
    is the data being automatically pulled to tape.
-   The totality of the events are being sent to the dispatcher for the
    online monitoring.

Remember that we should switch this back to keeping most of the data
when we are in full operation mode (\~summer 2020)\
See ECL entry <http://dbweb6.fnal.gov:8080/ECL/sbnfd/E/show?e=2126> for
more details.

**PMT added to Grafana (Updated 28 February 2020)**\
The Grafana metrics have been added to the pmt_standard fcl file. The
namespace for each individual PMT should be updated to not use the
default namespace. Currently PMT EW TOP01, as used in the SPEXI trigger
studies, should be set up correctly. The other PMTs will have to follow
the same procedure.

See ECL entry <http://dbweb6.fnal.gov:8080/ECL/sbnfd/E/show?e=1789>
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
[PDF](Expert_bulletin_board.pdf){.pdf}
[HTML](Expert_bulletin_board.html){.html}
[TXT](Expert_bulletin_board.txt){.txt}

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
