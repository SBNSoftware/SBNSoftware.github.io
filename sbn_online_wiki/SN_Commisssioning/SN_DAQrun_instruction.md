Procedure
---
1. Open Two Terminals.
2. From `sbnd-gateway`, connect to `sbnd-evb01` (or any server you want the daqrun to be running from).
```
cd /home/nfs/sbnd/DAQ_DevAreas/DAQ_2025-07-11_nevis_sn_production_dev_v1_10_07/DAQInterface

source setup_daqinterface.sh
```
3. On the first terminal, check that there is no current running DAQInterface with
```
listdaqinterfaces.sh
```
If running, communicate with other DAQ expert and kill it before running new instance with
```
DAQInterface &
```
Once run starts, this will open a GUI and write log to terminal.

4. From second terminal, start run with
```
./run opsFullTriggerMenuP3_ExtraMTCA5-5-
```

where `opsFullTriggerMenuP3_ExtraMTCA5-5-` is the config to run with


5. Stop run using `stop`, `fast-stop`, or `killdaq` following order if previous comment does not work. Specify partition DAQInterface is running on. This gets displayed in step 3.


Modifications
---
Configuration `opsFullTriggerMenuP3_ExtraMTCA5-5-` can be adjusted.

Current configuration is in
```
/home/nfs/sbnd/DAQ_DevAreas/DAQ_2025-07-11_nevis_sn_production_dev_v1_10_07/DAQInterface/configs/opsFullTriggerMenuP3_ExtraMTCA5-5-
```

Modify `tpc_standard_default.fcl` for run configuration. Current configuration is `fake_NevisTPC2StreamEXT_driver.fcl`.

In each `tpc{Number}.fcl`, modify
```
daq.fragment_receiver.nevis_crate.zero_suppression_params.config_file: "/home/nfs/sbnd/DAQ_DevAreas/DAQ_2025-07-11_nevis_sn_production_dev_v1_10_07/DAQInterface/configs/opsFullTriggerMenuP3_ExtraMTCA5-5-/crate3new.txt"
```
to set baseline and threshold per channel.

Add TPC components to run script for running multi-crate tests in `run`.

Currently, we use evb01-evb03 for event building and evb01 for process management and for running dispatcher. This can be edited in `boot.txt` file.

Once run starts, binary files get created on each `tpc` server (included in `run`) under `/data/SNCommissioning`