

# Shift bulletin board

## Run coordinators

Currently, the detector is still in commissioning mode. The reference
people for operations in this phase are listed below:

  |**Role**                          |  **Name**              |  **Until (Date)**        | **Email**             |  **Slack**           |  **Phone** |
  | Commissioning coordinator        |    **Angela Fava**     |   January 1st, 2021 8am  |  <afava@fnal.gov>     |    `@Angela Fava`    |    (xxx)-xxxxxxx |
  | Deputy commissioning Coordinator |  **Andrea Scarpelli**  |   January 1st, 2021 8am  |  <ascarpell@bnl.gov>  |  `@Andrea Scarpelli` |  +1 631 8971290 |

## Experts on call (Updated May 3rd)

Summary of the experts on call for the relevant ICARUS subsystems.
Experts on-call rotate weekly, in case of doubts, please refer also to
the [ELOG
shifts](https://dbweb8.fnal.gov:8443/ECL/sbnfd/C/show_month).
When available experts can be contacted using the appropriate Slack tag
in the `#icarus-shift-operations` channel or by typing the name of the
expert after the `@` symbol. The full list of ICARUS experts with all
contacts is available on docdb:
<https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=15862> .
Please, fill the [Expert
Contact](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=Expert+Contact)
checklist anytime you get in touch with an expert after some anomalies
during your shift. **If the expert on call does not answer:** you can
select one other expert contact from the list to call.

  |------------------- |------------------------------------------------------------- |--------------------- |------------------------|
  |**Expert team**     | **Names**                                                    | **Available**       | **Slack tag**           |
  |Shift help          | **Bruce Howard/Francesco Poppi/Wenqiang Gu/Wooyoung Jang**   | 00:00 - 23:59 CST   | `@icarus-shift-help`    |
  |DAQ expert          | **Antoni Aduszkiewicz**                                      | 00:00 - 23:59 CST   | `@sbn_daq_experts`      |
  |PMT expert          | **Andrea Scarpelli**                                         | 00:00 - 23:59 CST   | `@icarus_pmt_experts`   |
  |BEAM expert         | **Angela Fava/Andrea Scarpelli/Donatella Torretta**          | 00:00 - 23:59 CST   | `@icarus_beam_experts`  |
  |TPC PS expert       | **Justin Muller**                                            | 00:00 - 23:59 CST   | `@icarus_tpcps`         |
  |DCS expert          | **Geoffry Savage**                                           | 00:00 - 23:59 CST   | n/a                     |
  |Cathode HV expert   | **Hector Carranza**                                          | 00:00 - 23:59 CST   | n/a                     |
  |Cryo expert         | **Claudio Monatanari and cryogenic team**                    | 00:00 - 23:59 CST   | n/a                     |
  |------------------- |------------------------------------------------------------ |----------------------|-------------------------|


# General advice to the shifters

**Imprtant! New checklist**

Please fill in the [Impedance monitor
checklist](https://dbweb8.fnal.gov:8443/ECL/sbnfd/E/create_entry?f=Impedance+Monitoring+Form)
every four hours.

**Planned activities (commissioning)**\
Daily activities related to commissioning are now documented in a
dedicated
[spreadsheet](https://docs.google.com/spreadsheets/d/1mAIqQisijSycJ3KXdKVXtWVsGtC68NooJ1jRZeGfEZs/edit?usp=sharing).
Please, take a look at the planned activities at the beginning of your
shift. Shifter\'s beam run are normally taken overninght between 6pm and
8 am or when there are no planned activities. If a long run is in
progress, run conditions and relevant messages are posted in the
paragraph \"Run and beam condition\"

**What to do on shift**\
On the first day of your shift block, please make sure to refresh what
you have to do on shift. This is particularly important for new shifters
or shifters who have not been on shift for some months. Documentation
may be found here:
<https://cdcvs.fnal.govWhat_to_do_on_shift>

**Call Fermilab Main Control Room (MCR) at the beginning of your
shift**\
Shifters should resume calling the Fermilab main control room at **+1
630 840 3721** when they fill out their start shift form. The number to
call is in the Start Shift form. Please use the Google voice account to
perform this operation

**If you (the shifter) are called by the Main Control Room**\
Calls arrive on the GVoice account. Please check it regularly. Then
please write a general ECL entry logging the details of the call, and
send this ECL entry as an email to Angela Fava, Andrea Scarpelli, and
Donatella Torretta.


# Run and beam condition (Updated to 3rd May 2021)

## Run status

**NO RUN IS IN PROGRESS AT THIS TIME**.
<!--Daq configuration:
`@MINBIAS_NUMI_SPAW00005`, boot_split.txt. **All (PMT, TPC, CRT)
components are included** Please remember to start and stop the trigger
on the Desktop 2 workspace when restarting a run. Please use the version
of the daq in `sbndaq-v0_07_05testing` (which is the one currently open
on the VNC-DAQ desktop 1) in The fragment rate for both TPC and PMT
should remain around 0.6-0.8 Hz. The EventBuilder rate can vary and may
be temporarily zero.-->

<!--**DAQ commissioning checklist every hour**-->

<!--If a run is in progress and you start to see incomplete events, please
stop the run. If you stop the run (or found the run unexpectedly
stopped) please fill the ECL entry \"Run_stop\". Shifter can try to
restart a run using the instruction provided
[here](https://cdcvs.fnal.govBeamRuns#Beam-Runs-Work-in-progress).
Remember to stop and restart also the trigger LabVIEW code on workspace
two before attempting to restart the data acquisition. Please compile
the \"Run_start\" ecl entry if starting a new run. **Contact an expect
if issues arise at the moment of restarting the trigger**

<!--In case of doubts, the shifter is strongly encouraged to contact an
expert. For help, you may tag on Slack the `@icarus-shift_help` pr the
`@sbn_daq_expert`.-->

<!--Additionally, we are trying to debug recent issues with the
MessageViewer. If the MessageViewer appears to stop responding and go
into the \'solitaire\' mode with the display being cleared out, you can
start a new MessageViewer but please don\'t close the \'buggy\'
MessageViewer, and let the DAQ expert know via Slack. -->

## BNB status

**We are not using BNB beam at this time. BNB Checklist may be
suspended**

<!--BNB is operating nominal condition and we are correctly receiving it.
Proton intensity is a little inferior of 4E12 POT and Horn Current
between 170-180 kA. Please inform `@icarus_beam_experts` if called by
MCR about the status of BNB and post an entry to the ECL with what is
communicated.-->


## NuMi status

**We are not collecting NUMI data.**

<!--NuMi is operating in nominal conditions and we are correctly receiving
it. Shifters are not yet required to monitor the NuMI beam status. A
chart showing the status of NUMI is however available on the desktop 4
of the VNC-DAQ server-->

# Detector conditions (Updated to 3rd May 2021)

All subsystems are ON and working.

## Cryogenic system

**IFix Alarm**\
To check for alarms in the system, shifters should look at the Alarm
Summary in the top right of the iFix window as well. This shows two
types of alarms, regular and critical. For regular alarms the bottom box
turns red. For CRITICAL alarms, the top box turns red. On alerting cryo
experts:

**CRITICAL Alarms:** call cryo expert whenever this happens (any hour of
day or day of week)\
**Regular Alarms:** call cryo expert between the hours 08:00 and 17:00
Fermilab time. If your shift is overnight, pass word on to the next
shifters to call when it is again between these hours, so long as the
alarm doesn\'t become CRITICAL.

**Any time you see any alarm** make a separate post in the ECL about the
alarm noticed and any actions taken.

**Pressure expert contact**\
If **pressures are outside the OKAY ranges**, call a cryo expert any
time of day or day of the week! (**NOTE:** the instructions were
recently updated to call Claudio first in these situations)

**Venting**\
Cryostat venting is done regularly and may result in a loss of pressure.
In case you notice a sudden drop please check in the ECL if the
cryogenic team has performed a recent venting.
