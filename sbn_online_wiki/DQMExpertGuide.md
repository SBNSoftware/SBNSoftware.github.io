---
layout: page
title: DQM Expert Guide
###subtitle: Specific Wiki for SBNDQM
description: Wiki documentation for SBNDQM
hero_height: is-small
toc: false
toc_title: SBNDQM Contents
---

## What is the DQM?
### Overview
The DQM refers to the Data Quality Monitoring system of SBND.

The basic structure for **Online Monitoring** is as follows:
- The DAQ sends fragments from each subsystem to the DQM via the Dispatcher packaged as (art::Event)s.
- The DQM analyzer modules read in the event fragments, run some very basic analysis on the fragment information, then send metrics to the redis database.
- The redis database sends the metrics to the front-end website (Minargon) and via the archiver to the PostgreSQL database.
- Website pages on Minargon are configured to display the different detector metrics
- Metrics are sent on the order of seconds during stable detector running.

I am less familiar with **Nearline Monitoring**. To the best of my understanding,
- The nearline monitor uses the Continuous Integration framework, displaying fast reconstruction information from data for the TPC, CRT, PMT.
- Currently has 50 metrics
- It updates every 24 hours.

See the CM presentation for overview and current status:
https://sbn-docdb.fnal.gov/cgi-bin/sso/RetrieveFile?docid=39173&filename=SBND_CM_Dec_2024_DQM.pdf&version=3

### DQM Back-End
### Overview
The DQM back-end code is given by this repository:
https://github.com/SBNSoftware/sbndqm

We are currently on release version 1_03_00 and are soon going to release 1_04_00. I will double-check, but I believe our current branch used is `release/v1_04_00`.

On the Fermilab computers, the DQM back-end code lives in `/home/nfs/`, so you can access it from the **gateway machines or evb machines**, for example. The DQM runs from the same machine that the DAQ is run from. This is almost always **sbnd-evb01**. 

**I recommend working on sbnd-evb01.** To login, first ssh into one of the gateway machines, then you can `ssh sbnd-evb01` from there.

Specifically, the sbnd and sbnddqm users have several DQM development areas which people have used to develop and test DQM code. You can find these in `/home/nfs/sbnddqm/DQM_DevAreas` or `/home/nfs/sbnd/DQM_DevAreas`

The area which is designed to run during shifter runs is:
`/home/nfs/sbnd/DQM/SHIFT-CURRENT`

The area which is actually currently running is: `/home/nfs/sbnd/DQM_DevAreas/18Nov2024_SBNDv1_04_00`

You can see which DQM area is currently connected to the shifter button in this file: `/home/nfs/sbnd/Desktop/runOM.sh`

### What's in the sbndqm code?
The two directories that are most immediately relevant are `/sbndqm/installations/sbn-nd` and `/sbndqm/sbndqm/dqmAnalysis`.

`/sbndqm/installations/sbn-nd` contains our fcl files that we use. Specifically, `online_analysis.fcl` is the fcl file we use to run all of the DQM subsystem modules at once when the DAQ is running.

`/sbndqm/sbndqm/dqmAnalysis` contains subfolders for each subsystem for which we have a DQM module. Feel free to take a look at the modules for different subsystems to get a sense of what's going on. For example, you could look at `/home/nfs/sbnd/DQM_DevAreas/18Nov2024_SBNDv1_04_00/srcs/sbndqm/sbndqm/dqmAnalysis/CRT/SBND` to find the module for the current running DQM for the CRT. the `fcl` subdirectory contains some factored fcl files: metric configuration as well as some different fcls for offline vs. online running.

Try looking at `/home/nfs/sbnd/DQM_DevAreas/18Nov2024_SBNDv1_04_00/srcs/sbndqm/sbndqm/dqmAnalysis/CRT/SBND/BernCRTdqmSBND_module.cc`. Inside it, the `sendMetric` function is what sends the metrics to the redis database. The configuration for each metric is given in the fcl file.

### Create a new DQM development area
First, `ksu sbnddqm` or `ksu sbnd` (I recommend the former when first starting out). Then `cd`.

Note that we are still working on tagged release `v1_03_00` though our working base branch is `feature/munjung-v1_04_00_deps`

```bash
cd DQM_DevAreas/
source /daq/software/products/setup
setup mrb
export MRB_PROJECT=sbndqm
mkdir your_dev_area
cd your_dev_area/
mrb newDev -v v1_03_00 -q e26:prof
source localProducts_sbndqm_v1_03_00_e26_prof/setup
cd srcs/
mrb g sbndaq_online@develop # or mrb g -t v1_01_00 sbndaq_online
mrb g sbndqm@feature/munjung-v1_04_00_deps #feature/SBND-v1_04_01
cd ../
cp /home/nfs/sbnd/DQM_DevAreas/SHIFTER/generate_redis_password_fcl.sh ./
source generate_redis_password_fcl.sh #Creates redis_connection.fcl with the password (password not on github)
cd $MRB_BUILDDIR
mrbsetenv
mrb i -j8
mrbslp
```

sbndcode is not necessary at compile time but it is necessary at runtime.
```
setup sbndcode -v v09_93_02_01 -q e26:prof #for evd
```

### Setup script for DQM development area
This usually lives directly in `your_dev_area` as `setup.sh`

```
source /daq/software/products/setup
setup mrb
source localProducts_sbndqm_1_03_00_e26_prof/setup
mrbsetenv
mrbsetenv
setup sbndcode -v v09_93_02_01 -q e26:prof
```
### How to run the DQM
**IMPORTANT!**
Procedure for testing the DQM (running any DQM that is not the shifter DQM) is as follows:
- Notify shifter and @sbnd-runco in the sbnd-shift-operations channel on Slack.
- Disable shifter DQM by doing ctrl-c on the terminal in the DAQ VNC
- AND going to the shifter DQM area on evb01 and `source clean.sh`
- Test your DQM

#### Shifter Button
During normal, happy, stable operations, the shifter clicks a button on the desktop of the DAQ VNC called "runOM.sh". Note that the DAQ VNC runs on sbnd-daq01, so this script ssh-hops to sbnd-evb01 and runs the DQM. Specifically, it runs the DQM in the current area `/home/nfs/sbnd/DQM_DevAreas/SHIFTER` by running `/home/nfs/sbnd/DQM_DevAreas/SHIFTER/startDQM.sh`. This is a wrapper script which runs the DQM online via the DAQConsumer, which you can read about below.
#### Manually
Many times when you are debugging or modifying the DQM, you will want to run it manually, either offline or online.
##### Running online vs. offline:
The DQM is designed to be able to run **offline** on previously-taken artroot events as well as **online** on events being sent by the dispatcher. You can run one subsystem at a time (fcls in dqmAnalysis) or in a combined fcl with multiple subsystems (fcl in installations)

To run **offline**, after you set up your DQM area, run
`lar -c your_offline_fcl.fcl your_data.root`
Where `your_data.root` is an artroot file containing events which have the data products relevant to your subsystem.

To run **online**, after you set up your DQM area, run
`lar -c your_online_fcl.fcl`

**Important Considerations when running online:**
- Make sure you are running from the **same machine** as the DAQ. Usually sbnd-evb01.
- Make sure that the **port number** agrees between your online fcl and between the currently running DAQ's `boot.txt` file. You do not need to be as concerned about this if you use the DAQConsumer method, but you do if you run it via a lar command.
- Make sure the DAQ is running with the **Dispatcher turned on**.

#### Using DAQConsumer
The DAQConsumer is a python script which lives in `sbndqm/DAQConsumer` folder as `sbndqm/DAQConsumer/daq_consumer.py`. The DAQConsumer is a way to run the DQM which will write log files to `/daq/log/DAQConsumer/` which are **very** helpful when debugging.

You can run the DAQConsumer via first activating a python virtual environment: `source /home/nfs/sbnddqm/sbndaq-minargon/env/bin/activate`
If that doesn't work, use this one:
`source /home/nfs/sbnddqm/env2/bin/activate`

Then from the appropriate folder in your Dev Area (`srcs/sbndqm`)
`python sbndqm/DAQConsumer/daq_consumer.py -f /home/nfs/sbnd/DQM_DevAreas/18Nov2024_SBNDv1_04_00/srcs/sbndqm/installations/sbn-nd/online_analysis.fcl -l /daq/log/DAQConsumer/`

The -f option is to specify the fcl file, and -l specifies the folder to put the log files.

To clear previous DQM processes (which in the past have had a nasty habit of hanging around after we killed them), as well as automatically restart the DQM if the DAQ has to restart, we often run the DAQConsumer python script via a wrapper shell script such as `/home/nfs/sbnd/DQM_DevAreas/SHIFTER/startDQM.sh`

You should be able to run `./startDQM.sh` right out of the box in a DQM area which has one of these scripts (or you can copy one from an area that has it).

#### Using AliveMonitor
`source /home/nfs/sbnddqm/sbndaq-minargon/env/bin/activate`
(If that doesn't work, use this one: `source /home/nfs/sbnddqm/env2/bin/activate`)

```python
python srcs/sbndqm/sbndqm/AliveMonitor/alive_monitor.py -s sbnd-db01.fnal.gov -p 6379 -pw <redis_password> -k DAQConsumer -c "./startDQM.sh"
``` 

Where <redis_password> is the password for the redis database found in `/home/nfs/sbnddqm/redis/redis_sbnd.conf`

### DQM Front-End
The other half of the Online Monitoring system is the front end, which is the website https://sbn-online.fnal.gov/cgi-bin/minargon/minargon.wsgi/introduction. 

#### Overview
The Minargon website's function is to query the redis database (and postgreSQL) for metrics as called for by the fcl files and the website code and display them in plots organized by subsystem. 

Minargon code uses the **Flask** framework. If you intend on doing any front-end debugging or development, I **highly** recommend working through the Flask tutorial, https://flask.palletsprojects.com/en/3.0.x/tutorial/factory/

The code for the website lives on this Github: `https://github.com/SBNSoftware/sbndaq-minargon/` on the `sbnd-deploy` branch. The actually running code lives on the **sbndgpvm** in `/web/sites/s/sbn-online.fnal.gov/`.

#### Views and Templates
The most relevant parts of the website code are the **views** and **templates** files. 

The views script: `/web/sites/s/sbn-online.fnal.gov/cgi-bin/minargon/minargon/views/sbnd/views.py` defines all of the web pages for the website. For each web page, it sends some parameters to a specified HTML template. The views script is also where we define alarm limits and some other global variables.

The templates: `/web/sites/s/sbn-online.fnal.gov/cgi-bin/minargon/minargon/templates/sbnd`  (SBND-specific) and `/web/sites/s/sbn-online.fnal.gov/cgi-bin/minargon/minargon/templates/common` (common to ICARUS and SBND) are html files which provide the backbone for each web page.

`layout.html` defines the base html page which every other html page extends. It creates the banner at the top of the page, which you may want to edit if you are adding a drop-down menu, e.g. for a new subsystem.
`introduction.html` defines the introduction page of Minargon. This is also where we implement the alarm limits, since we want to display alarms on the table on the introduction page.

Each subsystem has its own templates, and you can figure out which page uses which template by looking at the templates in `templates/sbnd` and `templates/common`.

When adding new features to the website, a frequent strategy is to copy over desirable features of existing pages and modifying them slightly.

#### Procedure for creating a development area and pushing Minargon code:
See attached documents.
### Common developing and debugging strategies
#### Monitor_streams
Monitor_streams is a very helpful tool to monitor the redis database **while running the DQM** to make sure the DQM modules are properly sending the metrics you want to the database.

You'll want to run monitor_streams in a separate terminal or tmux window from where you are running the DQM.

1. Set up the area. For example, source `/home/nfs/sbnd/DQM_DevAreas/18Nov2024_SBNDv1_04_00/setup.sh`
2. Activate the python venv: `source /home/nfs/sbnddqm/sbndaq-minargon/env/bin/activate`
3. `source /home/nfs/sbnddqm/env2/bin/activate` <- use this one
4. Query the database. In `srcs/sbndqm/sbndqm/DatabaseTools`
	1. For example, `python monitor_stream.py -s sbnd-db01.fnal.gov -p 6379 -pw <redis_password> -g <your_metric_group>`
		1. Where <redis_password> is the password for the redis database found in `/home/nfs/sbnddqm/redis/redis_sbnd.conf`
	2. Options are:
		1. -k key
		2. -g group
		3. -m metric
		4. -st stream
		5. -i instance

You can read `monitor_stream.py` to figure out exactly the structure of your query for your desired metrics. It takes a bit of playing around to get the syntax right.
#### Miscellaneous
- **Always** test your changes on the dev version of Minargon before pushing the changes to the live site. I've broken stuff this way. Also be careful not to push settings.conf from your local version to the online version or vice versa.
- Use **tmux** for ease of switching between multiple windows/files/environments.

## Main tasks as DQM Expert

### As shifter
As the DQM expert on call, you're responsible of keeping the monitoring system operational.  You'll be responding to pings from shifters and other collaborators about issues observed on the online monitoring website (Minargon). 

- If the ping is about a bad status (alarms on the Drift HV Status table / DAQ run status / Detector status): direct the alert to the relevant subsystem expert. If you're unsure who that is, loop in the run coordinator. 

- If the ping is about an alarm on the DQM Status table: alarms here are related to DQM database connectivity and management, and will not affect immediate monitoring functionality. Please notify munjung@uchicago.edu for any alarms in this section.

- If the ping is about "disconnected" on the Detector Status table, or event display not uploading, it is your job to restore it! Use the DQM logs to diagnose the problem. Check the most recent logs in `sbnd-gateway` or `sbnd-evb` machines:

```bash
ls -lsrt /daq/log/DAQConsumer
```

- `daq_consumer_master.log` logs the DAQ-DQM connection history
- `online_analysis_{port}_*.log` analyzer logs the DQM larsoft analyzer outputs

Start by checking the latest analyzer log to see how the last DQM process ended, or if it's still running.

**typical recovery by restart**

In most cases, the DQM process will have stopped due to a transient issue and can be restored by a simple restart. Instruct the shifter to click the runOM button (magnifying glass icon) on the shifter Desktop. Monitor the latest DQM analyzer log to check if the restart was successful -- if more than 10 events are analyzed without errors / stopping, you can assume success. Note that Minargon may take up to 10 minutes to reflect the new DQM run -- inform the shifter and ask to be pinged again if the status doesn't recover.

**notable failure modes**

- Init error, after 5 events

```bash
%MSG-s ArtException: TriggerResultInserter:TriggerResults@Construction 20-May-2025 02:18:16 CDT ModuleConstruction
cet::exception caught in art
---- Configuration BEGIN
FailedInputSource Configuration of main input source has failed
---- TransferWrapper BEGIN
First 5 events received did not include the "Init" event containing necessary info for art; exiting...
---- TransferWrapper END
---- Configuration END
%MSG
Art has completed and will exit with status 9.
```
Resolution: Restart DQM again

- EndofSubRun, after processing 8 events
This mode does *not* raise an error, but the analyzer exits after exactly 8 events, claiming that it's the `EndOfSubrun`

```bash
%MSG-i TransferWrapper: PostProcessEvent 04-Apr-2025 03:50:46 CDT run: 18389 subRun: 1 event: 2310 TransferWrapper.cc:145
Received 10-th event, seqID == 2311, type == 229 (EndOfSubrun)
%MSG

TrigReport ---------- Event summary -------------
TrigReport Events total = 8 passed = 8 failed = 0

TrigReport ---------- Modules in End-path ----------
TrigReport Run Success Error Name
TrigReport 8 8 0 Meta
TrigReport 8 8 0 OnlineAnalysis
...

TimeReport ---------- Time summary [sec] -------
TimeReport CPU = 243.097118 Real = 224.134430

MemReport ---------- Memory summary [base-10 MB] ------
MemReport VmPeak = 9981.33 VmHWM = 1481.17

%MSG-i TransferWrapper: PostEndJob 04-Apr-2025 03:50:50 CDT ModuleEndJob TransferWrapper.cc:385
Requesting that this monitor (SHIFTOM) be unregistered from the dispatcher aggregator
%MSG
%MSG-i TransferWrapper: PostEndJob 04-Apr-2025 03:50:50 CDT ModuleEndJob TransferWrapper.cc:390
Response from dispatcher is "Success"

%MSG
%MSG-i TransferWrapper: PostEndJob 04-Apr-2025 03:50:50 CDT ModuleEndJob TransferWrapper.cc:409
Successfully unregistered the monitor from the Dispatcher
%MSG
Art has completed and will exit with status 0.
```

Resolutino: This requires a full DAQ restart -- notify the run coordinator.

- Others
If you encounter a new/unfamiliar error, first attempt DQM restarts. If the same error persists and you cannnot reach other DQM experts for consult, notify the run coordinator that a DAQ restart may be required to get the DQM back.


### As developer
Additionally, as a DQM expert, part of the job involves developing new back-end modules and front-end modules based on what collaborators want to see in the DQM.

## Important Links and Directories
**On the gateway/evb machines:**
- Currently running DQM area: `/home/nfs/sbnd/DQM_DevAreas/SHIFTER/`
- DAQConsumer log files: `/daq/log/DAQConsumer/`

**On the gpvms:**
- Website code: `/web/sites/s/sbn-online.fnal.gov/cgi-bin/minargon`

**On the Internet:**
- Github for sbndqm: https://github.com/SBNSoftware/sbndqm
- Minargon website: https://sbn-online.fnal.gov/cgi-bin/minargon/minargon.wsgi/introduction
- Github for Minargon website code: `https://github.com/SBNSoftware/sbndaq-minargon/tree/sbnd-deploy`

## Your first tasks
### Read
For the back-end, check out `/sbndqm/installations/sbn-nd/online_analysis.fcl` and `/sbndqm/dqmAnalysis/CRT/SBND/BernCRTdqmSBND_module.cc` as a representative subset of the back-end DQM. You can find these files either in a development area on an sbnd-evb01 such as ``/home/nfs/sbnd/DQM_DevAreas/18Nov2024_SBNDv1_04_00/srcs/sbndqm`` or on Github: https://github.com/SBNSoftware/sbndqm/tree/release/v1_04_00

For the front-end, skim over `views.py`, `layout.html`, and one additional Minargon template.
### Practice
Your practice task is multifold:

**Back-end:** 
1.  Create a DQM development area in the sbnddqm user area.
2. Test that the dev area runs out of the box by either running online or on offline data. Make sure to notify the shifter and runco first and ask them to disable the current DQM.
3. Create your own feature branch for sbndqm
4. Add a new metric in one of the existing subsystem modules. The easiest to observe is probably CRT based on how to website is set up to read in metrics. You will need to change both the fcl and the module then recompile.
5. Run your DQM and verify using monitor streams that you see the metric in redis
6. Verify on Minargon that you see the metric.

**Front-end:**
1. Create a Minargon website development area.
2. Make sure you can run your development site and that it is the same as the current deployed version of the site.
3. Change the alarm limits for the HV system and see how that modifies the HV plot and alarm.

**Putting it all together:**
Your final project will consist of creating your own DQM module and web page with a dummy metric on your own feature branches for sbndqm and minargon. The dummy metric doesn't have to be tied to a particular subsystem, but it can if you want it to be.

Make sure:
- You create your own feature branch for sbndqm.
- Your module and fcl follow the same structure as the existing subsystem modules.
- When running, you see your metric sent to redis via monitor_streams
- Create your own feature branch for minargon.
- You modify `layout.html` to create a new heading on the Minargon banner which will link to your page.
- You modify `views.py` to create the web page.
- Your web page shows a time series and a time-based histogram for your metric.

Helpful:
- `/home/nfs/sbnddqm/DQM_DevAreas/MJ_27Mar2024/srcs/sbndqm/installations/sbn-nd/dummy_om.fcl`
- template `histogram.html`

## What I need to do for you
- Get you access to /web/sites/
- Get you access to sbnddqm user
- Get you access to sbnd user
