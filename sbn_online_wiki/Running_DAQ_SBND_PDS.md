# Running DAQ for the SBND PDS

This document contains instructions on how to setup and run the DAQ for the SBND Poton Detection System.

## Prerequisites
For running the DAQ you will need:
- Access to the SBND DAQ machines (with user `sbnd`).
- Acess to the Fermilab net (`fgz`)/VPN

The relevant servers are:
  - General purpose servers: `sbnd-gateway01.fnal.gov`, `sbnd-gateway02.fnal.gov`
  - PDS servers (to which the V1730SB boards are connected to): `sbnd-pds0*.fnal.gov` (1-5)
  - Event builder servers: `sbnd-evb0*.fnal.gov` (1-4)

Additionally, to run the online monitoring we need acceess to the servers as `sbndqm`.

For running the DAQ we will need to create a developement area. Instructions on how to do it can be found in the following link:
- https://github.com/SBNSoftware/SBNSoftware.github.io/blob/master/sbn_online_wiki/Installation.md

## Checking the V1730 status

To check the status of the boards connected to a given server:
- Login to the gateways: `ssh sbnd-gateway01.fnal.gov`
- Login to the PDS server (eg pds01): `sbnd-pds01.fnal.gov`
- Run `caen` command

The following output will be displayed on the screen:

```
Lnk Model
0   VX1730SB Serial 166
      04.23 - Build 4B06
      00.02 - Build 4922 202
      AMode:0 CLK:1  PLL:1  RUN:1  DRDY:0  FULL:0  RDY:1
1   VX1730SB Serial 161
      04.23 - Build 4B06
      00.02 - Build 4922 202
      AMode:0 CLK:1  PLL:1  RUN:1  DRDY:0  FULL:0  RDY:1
2   VX1730SB Serial 156
      04.23 - Build 4B06
      00.02 - Build 4922 202
      AMode:0 CLK:1  PLL:1  RUN:1  DRDY:0  FULL:0  RDY:1
3   VX1730SB Serial 168
      04.23 - Build 4B06
      00.02 - Build 4922 202
      AMode:0 CLK:1  PLL:1  RUN:1  DRDY:0  FULL:0  RDY:1
4   *** [Open,-1]
5   *** [Open,-1]
6   *** [Open,-1]
7   *** [Open,-1]
``````

- Optical link (0-7), board model (V1730SB), firmware release
- Board status:
  - CLK: 1->board expects external clock, 0->board using the internal clock
  - PLL: if 1, the clock board is properly setup (either internal or external). Check the PPL LED light in the board is also turned on (green)
  - RUN: 1 if the board is currently running
  - DRDY: data is ready in the output buffer
  - RDY: board properly configured, ready to start the run
      


## Running the DAQ

The following constains instruction on how to run the DAQ for the 8 V1730SB boards installed in the PMT crate (or PDS R0). A working `sbndaq` installation with the relevant fhicls can be found in the feature branch [feature/fnicolas_pmtv1730](https://github.com/SBNSoftware/sbndaq/tree/feature/fnicolas_pmtv1730) (local area in `/home/nfs/sbnd/DAQ_DevAreas/DAQ_23May2023PMTV1730/`).
Steps for running the DAQ:
* Login to the gateway: `ssh sbnd@sbnd-gateway01.fnal.gov`

* Login to one of the event builder machines. E.g `ssh sbnd@sbnd-evb02.fnal.gov `
  * Change `evb02` for the chosen event builder server. Bear in mind you should warn/coordinate with the rest of the people running the DAQ in the same day
* Setup your local area:
  ```
  cd DAQ_DevAreas/DAQ_YOURLOCALAREA/srcs/sbndaq/sbn-nd/DAQInterface
  source setup_daqinterface.sh
  ```
* Warn rest of the DAQ users about your running plans (spreadsheet or #sbnd_daq@Slack)

* For running the DAQ you will need <ins>two sessions</ins> (recommended using `tmux/screen`). Go to the `sbn-nd/DAQInterface` directory (`cd $DAQINTERFACE_USER_DIR`)
    - In the first session, open the DAQ interface: `DAQInterface` 
    - In the second session, source the DAQ run script: `./run`
  
* The message viewer should pop up. Check the board configuration went smoothly and that events/fragments are being created.
  * If in person, make sure the RUN (green), TRG and DRDY (green flashing) are turned on while running.

* To stop the DAQ run, use `./stop`.

* Check the output. Instructions on how to use an `art::Analyzer` to obtain human-readable data from the artdaq fragments will be discussed next.

### Digging into the details of the DAQ setup

This section summarises the different files (all in the `sbndaq` repository) you'll need to modify in order to run the DAQ for the PDS.

* First we have to specify the event builder server we are going to use. Go to [sbndaq/sbn-nd/DAQInterface/boot.txt](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/boot.txt)
  - Specify the event builder server and configuration fhicl name (from `config/standard/`). In this case we are using `sbnd-evb02-daq` and [sbndaq/sbn-nd/config/standard/EventBuilder2.fcl](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/configs/standard/EventBuilder2.fcl)
    ```
    EventBuilder host: sbnd-evb02-daq
    EventBuilder label: EventBuilder2
    ```
  - Specify the partition (coordinate with the rest of the DAQ users to not use same server/partition):
    ```
    Subsystem id: 1
    ```
  - If running also the online monitoring, specify the dispacher port, host and fhicl:
    ```
    Dispatcher host: sbnd-evb02-daq
    Dispatcher label: Dispatcher1
    Dispatcher port: 6020
    ```
* Specify the output directory in the EventBuilder fhicl (make sure the output directory exists). In [sbndaq/sbn-nd/config/standard/EventBuilder2.fcl](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/configs/standard/EventBuilder2.fcl)
  ```
  outputs.normalOutput.fileName: "/scratch/pmtv1730_test/data_evb02_run%R_%#_%to.root"
  ```

* Next we need fhicls to run the V1730s.
  * Example fhicls for the 8 boards in PDS R0 (connected to `sbnd-pds01` and `sbnd-pds02`) can be found in the directory [sbn-nd/DAQInterface/configs/standard/RunPDSR0](https://github.com/SBNSoftware/sbndaq/tree/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/configs/standard/RunPDSR0).
  * They all inherit a base [boardreader](https://github.com/SBNSoftware/sbndaq-artdaq/blob/v1_06_00/sbndaq-artdaq/Generators/Common/CAENV1730Readout_generator.cc) configuration from a parent fhicl: [sbndaq/sbn-nd/DAQInterface/configs/standard/pmt_standard.fcl](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/configs/standard/pmt_standard.fcl).
  * For each of the fhicls, specify the board/fragment IDs and the optical link the board is connected to. For instance, we can configure the first board connected to link 0 in `sbnd-pds01` as (see [pmtx_pdsR0_01.fcl](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/configs/standard/RunPDSR0/pmtx_pdsR0_01.fcl)):

    ```
    #include "pmt_standard.fcl"

    daq.fragment_receiver.link: 0
    daq.fragment_receiver.boardId: 10
    daq.fragment_receiver.fragment_id: 10
    ``````

-  Some relevant parameters in [pmt_standard.fcl](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/configs/standard/pmt_standard.fcl):

    * `LockTempCalibration: false`: 
    * `AdcCalibration: false`
    * `maxTempCelsius: 75`: print warning if reaching this temperature threshold is 
    * `recordLength: 5000`: set the length of the recorded waveform (in 2 ns ticks)
    * `UseTimeTagForTimeStamp: true`: for PPS configuration
    * `channelPedestal*:  32768`: set the pedestal, replace * with the desired channel number (0-15)
    * `SWTrigger: false`
    * `SelfTriggerMode: 0`
    * Fhicl parameters for the board reader: [sbndaq-artdaq/Generators/Common/CAENConfiguration.hh](https://github.com/SBNSoftware/sbndaq-artdaq/blob/v1_06_00/sbndaq-artdaq/Generators/Common/CAENConfiguration.hh)


- If running multiple boards at the same time, we will need one of the boards "pushing" and the others "pulling" the fragments. For that we need to "include" the PULL mode parameters (see [configs/standard/RunPDSR0/pmt_standard_pull.fcl](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/configs/standard/RunPDSR0/pmt_standard_pull.fcl)):
  ```
  ## Pull mode parameters
  daq.fragment_receiver.receive_requests: true
  daq.fragment_receiver.request_address:        "227.128.11.129" # -- multicast request address
  daq.fragment_receiver.multicast_interface_ip: "10.226.36.0" # -- should match the private net
  daq.fragment_receiver.request_port: 3001   # UDP request port
  daq.fragment_receiver.request_mode: window # pull mode
  #daq.fragment_receiver.request_window_width: #400000000 #400ms for dummy gen
  #daq.fragment_receiver.request_window_offset: #200000000 #200ms  for dummy gen
  daq.fragment_receiver.request_window_width: 50000000 #50ms window
  daq.fragment_receiver.request_window_offset: 25000000 #25ms offset
  daq.fragment_receiver.request_windows_are_unique: false #true
  daq.fragment_receiver.stale_request_timeout:   3000000
  daq.fragment_receiver.window_close_timeout_us: 1500000 #1.5s
  daq.fragment_receiver.buffer_mode_keep_latest: true
  daq.fragment_receiver.circular_buffer_mode: false
  daq.fragment_receiver.missing_request_window_timeout_us: 2000000 #2s
  daq.fragment_receiver.hardware_poll_interval_us: 30000000 #30s
  daq.fragment_receiver.stale_fragment_timeout: 20000000000 #20s
  daq.fragment_receiver.separate_monitoring_thread: true
  daq.fragment_receiver.separate_data_thread: true
  ```

* For e.g. configure a second board in "PULL" mode:
  * First declare the fhicl for the second board (in this case connected to link 1). Example file (see [RunPDSR0/pmtx_pdsR0_02.fcl](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/configs/standard/RunPDSR0/pmtx_pdsR0_02.fcl)):
  
    ```
    #include "pmt_standard.fcl"

    daq.fragment_receiver.link: 1
    daq.fragment_receiver.boardId: 11
    daq.fragment_receiver.fragment_id: 11
    ```

  * Secondly, we create the PULL mode fhicl (see [configs/standard/RunPDSR0/pmtx_pdsR0_02PULL.fcl](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/configs/standard/RunPDSR0/pmtx_pdsR0_02PULL.fcl)) as:
    ```
    #include "pmtx_pdsR0_02.fcl"
    #include "pmt_standard_pull.fcl"
    ```

* We next have to modify the [sbndaq/sbn-nd/DAQInterface/known_boardreaders_list](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/known_boardreaders_list) file. Declare every fhicl you are going to run and the server the hardware is connected to. In our case:
  ```
  ## Board1  in push mode
  pmtx_pdsR0_01 sbnd-pds01-daq -1 1 0-15

  ## All 8 boards in pull mode
  pmtx_pdsR0_02PULL sbnd-pds01-daq -1 1 0-15
  pmtx_pdsR0_03PULL sbnd-pds01-daq -1 1 0-15
  pmtx_pdsR0_04PULL sbnd-pds01-daq -1 1 0-15
  pmtx_pdsR0_05PULL sbnd-pds02-daq -1 1 0-15
  [...]
  ```

* Finally, edit the [DAQInterface/run](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/run) script and specify all the board reader fhicls you'd like to run. The example below runs the first board in PUSH mode and the remaning 7 in PULL mode:
  ```
  # runs for PDSR0 (rely on external trigger source)
  #setdaqcomps.sh  pmtx_pdsR0_01 pmtx_pdsR0_02PULL pmtx_pdsR0_03PULL pmtx_pdsR0_04PULL pmtx_pdsR0_05PULL pmtx_pdsR0_06PULL pmtx_pdsR0_07PULL pmtx_pdsR0_08PULL
  ```


#### Adding PTB to the setup
In this subsection we include the relevant fhicl required to use the PTB to provide external random triggers to the CAEN boards.
* Base PTB fhicl: [configs/standard/ptb01.fcl](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/configs/standard/ptb01.fcl)
* We will be running the PTB in PULL mode. The relevant fhicl for that is: [configs/standard/RunPDSR0/ptb01PMTTriggerPULL.fcl](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/configs/standard/RunPDSR0/ptb01PMTTriggerPULL.fcl)
* The configuration parameters to run the PTB in "external trigger mode" can be found in [ptbmk2_nd_pmt_trigger_1hz.fcl](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/configs/standard/RunPDSR0/ptbmk2_nd_pmt_trigger_1hz.fcl)
  * To change the trigger frequency, modify the `"period":50000000,` in 
    ```
    "randomtrigger_1":{
      "description":"Random trigger that can optionally be set to fire only during beam spill",
      "enable":true,
      "fixed_freq":true,
      "beam_mode":false,
      "period":50000000,
      "period_old":3333333,
      "seed":"0xACE2ACE1",
      "thresh_lo":"0x00000001",
      "thresh_hi":"0x000F00FF"
    },
    ```
    It's in 20 ns units, e.g. `"period":50000000` corresponds to 1 Hz.

* Add PTB to the [known_boardreaders_list](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/known_boardreaders_list)

  ```
  ## PTB in trigger mode
  ptb01PMTTriggerPULL sbnd-ptb01-daq -1 1
  ```

  and [critical_process_list](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/critical_process_list):
  ```
  ptb01PMTTriggerPULL
  ```

* Edit the `.run` script accordintly to also run PTB, e.g:
  ```
  # runs for PDSR0 + PTB providing triggers
  #setdaqcomps.sh ptb01PMTTriggerPULL pmtx_pdsR0_01 pmtx_pdsR0_02PULL pmtx_pdsR0_03PULL pmtx_pdsR0_04PULL pmtx_pdsR0_05PULL pmtx_pdsR0_06PULL pmtx_pdsR0_07PULL pmtx_pdsR0_08PULL
  ``````

#### Running pedestal equalization

In this section we describe the setup used to run the baseline equalization for the V1730s. The relevant files can be found in [sbn-nd/DAQInterface/configs/standard/V1730PedestalEqualization](https://github.com/SBNSoftware/sbndaq/tree/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/configs/standard/V1730PedestalEqualization).

- The 8 fhicl files `pmtx_pdsR0_0*_PedestalEqualization.fcl` setup the board reader for each board. They depend on the configuration fhicls defined previosuly ([sbn-nd/DAQInterface/configs/standard/RunPDSR0](https://github.com/SBNSoftware/sbndaq/tree/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/configs/standard/RunPDSR0).).

- 2 additional fhicls are used to set up the pedestal:
  * [V1730PedestalEqualization/PMTV1730_DCOffset.fcl](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/configs/standard/V1730PedestalEqualization/PMTV1730_DCOffset.fcl) defines the DC offset we are going to apply
    ```
    ped_equal: {DCoffset: 2621 }
    ```

  * [V1730PedestalEqualization/PMTV1730_setpedestal.fcl](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/configs/standard/V1730PedestalEqualization/PMTV1730_setpedestal.fcl) sets the DC offset defined in the previous fhicl to the 16 channels of the board

    ```
    #include "PMTV1730_DCOffset.fcl"

    daq.fragment_receiver.channelPedestal0:  @local::ped_equal.DCoffset
    daq.fragment_receiver.channelPedestal1:  @local::ped_equal.DCoffset
    daq.fragment_receiver.channelPedestal2:  @local::ped_equal.DCoffset
    daq.fragment_receiver.channelPedestal3:  @local::ped_equal.DCoffset
    daq.fragment_receiver.channelPedestal4:  @local::ped_equal.DCoffset
    daq.fragment_receiver.channelPedestal5:  @local::ped_equal.DCoffset
    daq.fragment_receiver.channelPedestal6:  @local::ped_equal.DCoffset
    daq.fragment_receiver.channelPedestal7:  @local::ped_equal.DCoffset
    daq.fragment_receiver.channelPedestal8:  @local::ped_equal.DCoffset
    daq.fragment_receiver.channelPedestal9:  @local::ped_equal.DCoffset
    daq.fragment_receiver.channelPedestal10:  @local::ped_equal.DCoffset
    daq.fragment_receiver.channelPedestal11:  @local::ped_equal.DCoffset
    daq.fragment_receiver.channelPedestal12:  @local::ped_equal.DCoffset
    daq.fragment_receiver.channelPedestal13:  @local::ped_equal.DCoffset
    daq.fragment_receiver.channelPedestal14:  @local::ped_equal.DCoffset
    daq.fragment_receiver.channelPedestal15:  @local::ped_equal.DCoffset
    ```
* Edit the `.run` script to run the `pmtx_pdsR0_0*_PedestalEqualization.fcl` fhicls:
    ```
    # run setup for pedestal equalization + PTB triggers
    setdaqcomps.sh ptb01PMTTriggerPULL pmtx_pdsR0_01_PedestalEqualization pmtx_pdsR0_02_PedestalEqualization pmtx_pdsR0_03_PedestalEqualization pmtx_pdsR0_04_PedestalEqualization pmtx_pdsR0_05_PedestalEqualization pmtx_pdsR0_06_PedestalEqualization pmtx_pdsR0_07_PedestalEqualization pmtx_pdsR0_08_PedestalEqualization
    ```

* The pedestal equalization process involves performing short runs of the Data Acquisition (DAQ) system, with each run modifying the DC offset applied to the board channels. This is done using a dedicated "run-sleep-stop" script ([sbn-nd/DAQInterface/run_V1730PedEqualization_DCOffset_scan.sh](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/run_V1730PedEqualization_DCOffset_scan.sh)):

  ```
  #!/bin/bash
  # Script to run V1730 pedestal equalization (written by Fran Nicolas @fjnicolas@ugr.es)

  # Define start, end, and step values for the pedestal equalization range
  fStart=90
  fEnd=96
  fStep=2

  # Define data taking period for each DCOffset (in s)
  fRunTime=60

  # Define max DAC value for the SCOffset
  fMaxDAC=65535

  # File path to the fhicl with the DCOffset parameter
  DCOffset_filepath="configs/standard/V1730PedestalEqualization/PMTV1730_DCOffset.fcl"

  # Log file path
  logfile="./runlog_V1730_pedestalequal.log"

  #for eps in $DACList
  for ((i=fStart;i<=fEnd;i+=fStep));
  do
      c="0.${i}"

      # Clean the file with the DCOffset parameter
      > "${DCOffset_filepath}"
          
      # Calculate the DCOffset
      DC=$(bc <<< "$fMaxDAC - $c * $fMaxDAC" )

      echo "DCoffset: ${DC}"
      
      # Convert to integer
      DC=${DC/\.*/}

      # Write to file the selected DCOffset
      echo "ped_equal: {DCoffset: ${DC} }" >> "${DCOffset_filepath}"
      echo "ped_equal: {DCoffset: ${DC} }"

      # print to log file
      echo "DCoffset set to ${DC}" >> "${logfile}"

      # start the DAQ
      date >> "${logfile}"
      (./run | tee /dev/tty | grep "run") >> ./runlog_V1730_pedestalequal.log

      # take data for certain time
      sleep "$fRunTime"

      # stop the DAQ
      ./stop
    
      # info about the run to the log file
      echo "Ending the run...." >>"${logfile}"
      date >> "${logfile}"
      echo " " >> "${logfile}"
  done
  ```

* The script carries out the following steps:

  * Modify the DC offset parameter in [V1730PedestalEqualization/PMTV1730_DCOffset.fcl](https://github.com/SBNSoftware/sbndaq/blob/feature/fnicolas_pmtv1730/sbn-nd/DAQInterface/configs/standard/V1730PedestalEqualization/PMTV1730_DCOffset.fcl) (inherited by all the configuration fhicls).

  * Initiating the DAQ by executing the standard `.run` script.

  * Collecting data for a specified duration by utilizing the `sleep` command.

  * Stopping the ongoing DAQ run and reconfiguring the board.

* The configuration parameters are:
  * `fRunTime=60`: define the running time (time) for each of the subruns
  * The board's DC offset is regulated by a 16-bit Digital-to-Analog Converter (DAC). The extent of the DC offset parameter's scan range is determined by the `fStart` and `fEnd`` parameters, specified as a percentage relative to the maximum dynamic range. The scan operation progresses in increments defined by the `fStep` parameter.
  * The relative path to the fhicl file setting the DC offset value is specified by `DCOffset_filepath`
  * Output log file is specified in the `logfile` variable

### Running CAEN wavedump

The previous set of instructions explaing how to run the V1730s using the `artdaq` software. An alternative way of reading the boards can be done using the software provided by `CAEN` (aka `caen wavedump`)
- Some instructions: [Running wavedump](https://github.com/SBNSoftware/SBNSoftware.github.io/blob/master/running_wvdump.md)
- Example file: `/home/nfs/sbnd/wavedump-3.9.0-trig/src/w1_testFeb23.txt`
- Important parameters:
  * `OPEN PCI 1 0 0`: first number must match the link we are using (in our case 0)
  * If using an external trigger, make sure we set up `EXTERNAL_TRIGGER  ACQUISITION_AND_TRGOUT` in the conf file


## Running analyzer instructions
Once you have take the data, you'll need to analyze it! A dedicated `art::Analyzer` that reads the V1730 fragments and stores the data in a TTree can fe found in this feature branch: [feature/fnicolas_pmtv1730ana](https://github.com/SBNSoftware/sbndaq-artdaq/tree/feature/fnicolas_pmtv1730ana). In particular we will be running the analyzer: [sbndaq-artdaq/ArtModules/SBND/SBNDPMTV1730Ana_module.cc](https://github.com/SBNSoftware/sbndaq-artdaq/blob/feature/fnicolas_pmtv1730ana/sbndaq-artdaq/ArtModules/SBND/SBNDPMTV1730Ana_module.cc)
Two fhicls that run the analyzer:
- Saves waveforms into TTree: [ArtModules/SBND/run_anaPMTV1730_wWf.fcl](https://github.com/SBNSoftware/sbndaq-artdaq/blob/feature/fnicolas_pmtv1730ana/sbndaq-artdaq/ArtModules/SBND/run_anaPMTV1730_wWf.fcl)
- Saves waveform/channel statistics into TTree: [ArtModules/SBND/run_anaPMTV1730.fcl](https://github.com/SBNSoftware/sbndaq-artdaq/blob/feature/fnicolas_pmtv1730ana/sbndaq-artdaq/ArtModules/SBND/run_anaPMTV1730.fcl)

You can run just as `lar -c run_anaPMTV1730.fcl -s inputDAQfile.root`. You can analyze the TTree with ROOT/python plotting macros. You will need a local installation of the `sbndaq-artdaq` repository.


## Running the online monitoring
This section describe how to setup and launch the online monitoring for the SBND PDS.

- Login to the gateways as `sbnddqm`:
  ```
  ssh sbnddqm@sbnd-gateway01.fnal.gov
  ```
- Connect to the event builder server in which you will be running the DAQ, e.g.,
  ```
  ssh sbnd-evb02
  ```
- You will need a local installation of the `sbndqm` and `sbndaq-online` repositories. A working development area can be found in `/home/nfs/sbnddqm/DQM_DevAreas/DQM_04Apr2023/` with the following set of feature branches:
    - sbndqm: [feature/fnicolas_sbndpmtonline](https://github.com/SBNSoftware/sbndqm/tree/feature/fnicolas_sbndpmtonline)
    - sbndaq_online: [feature/fnicolas_sbndpmtonline](https://github.com/SBNSoftware/sbndaq-online/tree/feature/fnicolas_sbndpmtonline)
- Setup script
  ```
  export dqmarea=DQM_04Apr2023
  cd ~/DQM_DevAreas/${dqmarea}
  source /daq/software/products/setup
  setup mrb
  setup artdaq v3_11_02_01 -q e20:s112:prof
  source ./localProducts*/setup
  mrbsetenv
  ```
- Start the online monitoring by
  ```
  source $SBNDQM_DIR/installations/sbn-nd/startDQM_PMTOnly.sh
  ```
- Start the DAQ run
- Have a look to the monitoring webpage: https://sbn-online.fnal.gov/cgi-bin/minargon/minargon.wsgi/PMT

- Relevant files:
  * Decoder: [sbndqm/Decode/PMT/SBND/DaqDecoderSBNDPMT_module.cc](https://github.com/SBNSoftware/sbndqm/blob/feature/fnicolas_sbndpmtonline/sbndqm/Decode/PMT/SBND/DaqDecoderSBNDPMT_module.cc)
  * Analyzer: [sbndqm/dqmAnalysis/PMT/SBND/CAENV1730StreamsSBND_module.cc](https://github.com/SBNSoftware/sbndqm/blob/feature/fnicolas_sbndpmtonline/sbndqm/dqmAnalysis/PMT/SBND/CAENV1730StreamsSBND_module.cc)
  * Start PMT DQM script: [installations/sbn-nd/startDQM_PMTOnly.sh](https://github.com/SBNSoftware/sbndqm/blob/feature/fnicolas_sbndpmtonline/installations/sbn-nd/startDQM_PMTOnly.sh)
  * Fhicl with the decoder+analyzer workflow for the PMT DQM: [installations/sbn-nd/SBND_OnlineMonitor_PMTOnly.fcl](https://github.com/SBNSoftware/sbndqm/blob/feature/fnicolas_sbndpmtonline/installations/sbn-nd/SBND_OnlineMonitor_PMTOnly.fcl)
- References/tutorials:
  - DQM tutorial: https://cdcvs.fnal.gov/redmine/projects/sbndqm/wiki/Sbndqm_Workshop_April_2023
  - Monitoring webpage: https://sbn-online.fnal.gov/cgi-bin/minargon/minargon.wsgi/PMT
- Note: workflow only works with `artdaq v3_11_02_01` (and artdaq_utilities v1_07_02_01`):

## Additional content
### Instructions to manually reset the crate
- Log in sbnd-gateway02.fnal.gov
- `telnet sbnd-vme01 8100`` (change the name of the crate accordingly)
-  You should see a message like:
   *  `Connected to sbnd-vme01.fnal.gov (10.226.35.41).`
   *  `Escape character is '^]'.`
- The type the command `$CMD:SET,CH:8,PAR:SYSR`
  * More info about this command in: http://pen.phys.virginia.edu/daq/vme/vme8100_usersmanual.pdf
  * Section 8.4 (page 41)

### Switch to the internal clock in the V1730

- Ground yourself, unscrew board, take out the board, switch button (red) in the side of the board
- Program: CAENUpgradeGUI (run in the sbnd-pds* server)
- Select clock we want to configure. They live in Clock in etc/CAEN…: v1730S_vcxo500_ref50_pll_out62_5.rbf
- Select board model: V1730S
- Change type of link. We are using optical links (OPLINK)
- Pay attention to the link number we want to upgrade
- Upgrade, do not interrupt it, reboot

      

### Some notes about TTL/NIM signals
- Random [screenshot](http://www.physics.mcgill.ca/~corriveau/projects/spark/nim2.html) I found useful when I had no idea about what a TTL/NIM signal was:
<img width="847" alt="Captura de pantalla 2023-03-23 a las 15 56 53" src="https://user-images.githubusercontent.com/66068208/227358526-c5c34dd2-b642-4fe4-8e37-c0b16f382e04.png">

- We can trigger the V1730s with both NIM and TTL signals. This is control by this [fhicl parameter](https://github.com/SBNSoftware/sbndaq/blob/develop/sbn-nd/DAQInterface/configs/standard/pmt_standard.fcl#L97).
  - All TRG IN, TRG OUT and S IN channels need to receive the same leevel signal. PTB uses TTL; so we need TTL signal fro triggering.


### Specifications for the LeCroy logic boards currently installed in the NIM crate:
- Fast logic module: https://prep.fnal.gov/catalog/hardware_info/lecroy/nim/429a.html
- Quad linear fanin-fanout: https://prep.fnal.gov/catalog/hardware_info/lecroy/nim/428f.html
- Octal discriminator: https://www.fnal.gov/projects/ckm/jlab/623b-spec.htm
 * Manual: https://web.physics.ucsb.edu/~phys128/experiments/muonphysics/Instrument%20manuals/LeCroy%20623B%20data%20sheet.pdf
- LeCroy 22 Dual Gate: https://groups.nscl.msu.edu/nscl_library/manuals/lecroy/222.pdf
- TTL/NIM translater: https://siliconpr0n.org/media/camac/CAMAC3/688al-spec.htm
