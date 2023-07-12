# Running DAQ for the SBND PDS

This documents contains instructions on how to setup and run the DAQ for the SBND Poton Detection System.

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

The following constains instruction on how to run the DAQ for the 8 V1730SB boards installed in the PMT crate (or PDS R0). A working `sbndaq` installation with the relevant fhicls can be found in the feature branch [feature/fnicolas_pmtv1730](https://github.com/SBNSoftware/sbndaq/tree/feature/fnicolas_pmtv1730).

Steps for running the DAQ:
* Login to the gateway: `ssh sbnd@sbnd-gateway01.fnal.gov`

* Login to the event builder machine: ssh sbnd@sbnd-evb02.fnal.gov 
  * Change `evb02` for the chosen event builder server. Bear in mind you should warn/coordinate with the rest of the people running the DAQ in the same day
* Setup your local area:
  ```
  cd DAQ_DevAreas/DAQ_23May2023PMTV1730/srcs/sbndaq/sbn-nd/DAQInterface
  source setup_daqinterface.sh
  ```
* Warn rest of the DAQ users about your running plans (spreadsheet or #sbnd_daq@Slack)

* For running the DAQ you will need <ins>two sessions</ins> (recommended using `tmux/screen`). Go to the `sbn-nd/DAQInterface` directory (`cd $DAQINTERFACE_USER_DIR``)
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



### Specific setup: running pedestal equalization

### Running CAEN wavedump

The previous set of instructions explaing how to run the V1730s using the `artdaq` software. An alternative way of reading the boards can be done using the software provided by `CAEN` (aka `caen wavedump`)
- Some instructions: [Running wavedump](https://github.com/SBNSoftware/SBNSoftware.github.io/blob/master/running_wvdump.md)
- Example file: `/home/nfs/sbnd/wavedump-3.9.0-trig/src/w1_testFeb23.txt`
- Important parameters:
  * `OPEN PCI 1 0 0`: first number must match the link we are using (in our case 0)
  * If using an external trigger, make sure we set up `EXTERNAL_TRIGGER  ACQUISITION_AND_TRGOUT` in the conf file


## Running analyzer instructions

* Purpose: get readable waveforms
* For ana we setup this environment: source ana_launchdaq.sh
* We run this [fhicl-file](https://github.com/SBNSoftware/sbndaq-artdaq/blob/develop/sbndaq-artdaq/ArtModules/Common/dump_CAENV1730.fcl)
* Correr en /sbnd/fnicolas (“HOME” area)

Notes on long data takings:
Cannot disconnect DAQInterface. Recommend running in tmux or screen so it's running in the background. If we close the monitor window, there's no way to get it back (not critical).
 There's an option in the EventBuilder to prescale the number of recorded events.




## Running the online monitoring
- Critical: we need `artdaq v3_11_02_01` (and artdaq_utilities v1_07_02_01`):
``setup artdaq v3_11_02_01 -q e20:s112:prof```
- Need to install sbndqm and sbndaq-online (develop branches work)
- In sbndaq-online add password (`sbndaq-online/redis-connect/RedisConnection.cc`):
`fRedisPassword = pset.get<std::string>("password", "B4730D6D9606E3EB37048EB017D4C69EFB56243CCC408E3BEC3BFDEEDF792876");`
- DQM tutorial: https://cdcvs.fnal.gov/redmine/projects/sbndqm/wiki/Sbndqm_Workshop_April_2023
- Monitoring webpage: https://sbn-online.fnal.gov/cgi-bin/minargon/minargon.wsgi/PMT
- Check database directory in sbndqm repository


## Additional content
### Instructions to reset the crate
- Make sure no one is running
- Log in sbnd-gateway02.fnal.gov
- telnet sbnd-vme01 8100 (change the name of the crate accordingly)
-  You should see a message like:
   *  `Connected to sbnd-vme01.fnal.gov (10.226.35.41).`
   *  `Escape character is '^]'.`
- The type the command `$CMD:SET,CH:8,PAR:SYSR`
  * More info about this command in: http://pen.phys.virginia.edu/daq/vme/vme8100_usersmanual.pdf
  * Section 8.4 (page 41)

### Change to external clock in the V1730

- Ground yourself, unscrew board, take out the board, switch button (red) in the side of the board
- Program: CAENUpgradeGUI (run in the sbnd-pds* server)
- Select clock we want to configure. The live in Clock in etc/CAEN…: v1730S_vcxo500_ref50_pll_out62_5.rbf
- Select board model: V1730S
- Change type of link. We are using optical links (OPLINK)
- Pay attention to the link number we want to upgrade
- Upgrade, do not interrupt it, reboot

      

### Some notes about TTL/NIM signals
- Random [screenshot](http://www.physics.mcgill.ca/~corriveau/projects/spark/nim2.html) I found useful when I had no idea about what a TTL/NIM signal was:
<img width="847" alt="Captura de pantalla 2023-03-23 a las 15 56 53" src="https://user-images.githubusercontent.com/66068208/227358526-c5c34dd2-b642-4fe4-8e37-c0b16f382e04.png">

- We can trigger the V1730s with both NIM and TTL signals. This is control by this [fhicl parameter](https://github.com/SBNSoftware/sbndaq/blob/develop/sbn-nd/DAQInterface/configs/standard/pmt_standard.fcl#L97).
 - All TRG IN, TRG OUT and S IN channels need to receive the same leevel signal. PTB uses TTL; so we need TTL signal fro triggering.
- V1730 Trigger signal: TTL signal (set to 3.3V)
- Inout V1730 channels: better use NIM signals
- Quad fanin-fanout: linear analagos, can use both
- 429A Logic fan-in/out: only NIM signal
- Pulse width reducer: only NIM

### Specifications for the LeCroy logic boards currently installed in the NIM crate:
- Fast logic module: https://prep.fnal.gov/catalog/hardware_info/lecroy/nim/429a.html
- Quad linear fanin-fanout: https://prep.fnal.gov/catalog/hardware_info/lecroy/nim/428f.html
- Octal discriminator: https://www.fnal.gov/projects/ckm/jlab/623b-spec.htm
 * Manual: https://web.physics.ucsb.edu/~phys128/experiments/muonphysics/Instrument%20manuals/LeCroy%20623B%20data%20sheet.pdf
- LeCroy 22 Dual Gate: https://groups.nscl.msu.edu/nscl_library/manuals/lecroy/222.pdf
- TTL/NIM translater: https://siliconpr0n.org/media/camac/CAMAC3/688al-spec.htm
