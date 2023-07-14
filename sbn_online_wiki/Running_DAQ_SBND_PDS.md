# PMTV1730
Soft tools for PMT V1730 analysis

## Make new installation
https://github.com/SBNSoftware/SBNSoftware.github.io/blob/master/sbn_online_wiki/Installation.md

## Running DAQ instructions
* Log run: https://docs.google.com/spreadsheets/d/12Xh-T75SqMxmXBtwphE0coaSrnYqi3PyNd8eAU_GR_k/edit#gid=0
* ssh sbnd@sbnd-gateway01.fnal.gov
* ssh sbnd@sbnd-evb02.fnal.gov (open two terminals)
* Setup script (`pmtv1730_launchdaq.sh` in home area)
* In the first terminal open the monitoring. Command is just DAQInterface 
  * Have a look to the file https://github.com/SBNSoftware/sbndaq/blob/develop/sbn-nd/DAQInterface/boot.txt
  * Set the `evb` server and the partition in which we will run tha DAQ (we are currently using evb02 and p1)
  * Message people in the Slack channel #sbnd_daq about what server and partition we are using (also update this [spreadsheet](https://docs.google.com/spreadsheets/d/1xJb7Dge_ktMcXOaUkF0sAGDepLXewSUJwcNiCsHDAOA/edit#gid=0))
* Then we modified configs/standard/EventBuilder2.fcl:
   * These are the hicls to run the evnetbuilder. Tells what evbn server we are. 
   * We modified the path where the output goes (somewhere in /scratch/fnicolas/myfancydirectory)
* Then we have a look to these fhicls: pmtx01.fcl and  pmt_standard.fcl  (apparently we didn’t modify anything?)
* Other file we looked at: https://github.com/SBNSoftware/sbndaq/blob/develop/sbn-nd/DAQInterface/known_boardreaders_list
* Always run in the DAQInterface directory (for both monitoring and run)

# Files we needed to modify to run PMT DAQ
* Using `sbndaq v01_05_00`
* sbndaq/sbn-nd/DAQInterface/boot.txt
  * ~~PMT host: sbnd-evb04-daq~~
  * PMT host: sbnd-evb02-daq
  * ~EventBuilder host: sbnd-evb04-daq~
  * ~EventBuilder label: EventBuilder4~
  * EventBuilder host: sbnd-evb02-daq
  * EventBuilder label: EventBuilder2
  * ~Dispatcher host: sbnd-evb04-daq~
  * Dispatcher host: sbnd-evb02-daq
  
  * This file contains the info of the event builder machine (evb) we are use to make our run. We need to make sure anyone else is running on the same machine. There is a [spreadsheet](https://docs.google.com/spreadsheets/d/1xJb7Dge_ktMcXOaUkF0sAGDepLXewSUJwcNiCsHDAOA/edit#gid=0) for that. Modify the event builder machine we are using. Eventually we will want to change the partition in the evb machine we are using (`Subsystem id: 1`)

* sbndaq/sbn-nd/DAQInterface/configs/standard/EventBuilder2.fcl
  * ~outputs.normalOutput.fileName: "/scratch/data/data_evb02_run%R_%#_%to.root"~
  * outputs.normalOutput.fileName: "/scratch/pmtv1730_fnicolas/noiseonly/data_evb02_run%R_%#_%to.root"
  
  * There are 4 `EventBuildeer` fhicls, one per evb server. We need to modify the fhicl corresponding to the server we'll use. Change the output path (where the eveents will be recorded). Make sure to create the directory in the server before running.
  
  

*sbndaq/sbn-nd/DAQInterface/configs/standard/pmtx01.fcl
  * Added `daq.fragment_receiver.fragment_id: 15`
   * Conversion then is: ChannelNumber = fragment_id*NChannels
  * We need to spedify a name for the board we are using (arbitrary I think): 
   * `daq.fragment_receiver.boardId: 10`
  * Important: specify link the board is connected to (from 0 to 3)
   * `daq.fragment_receiver.link: 0`

 
  
  
  * This is the fhicl that will call the DAQ generator/producer. It's what we call from the `run` script

*sbndaq/sbn-nd/DAQInterface/run
  * ~-setdaqcomps.sh pmtx03 crt01PULL spectdc ptb01PULL~
  * setdaqcomps.sh pmtx01
  
  * Scrit to start the DAQ. We specify the fhicl with our DAQ configuration. In our case is `pmtx01.fcl`.


## Board reader notes
- Fhicl configuration parameters for the board reader: https://github.com/SBNSoftware/sbndaq-artdaq/blob/v1_06_00/sbndaq-artdaq/Generators/Common/CAENConfiguration.hh
- To change pedestal (DC offsets): change pedestal, not basline parameters

## Running analyzer instructions
Once you have take the data, you'll need to analyze it! A dedicated `art::Analyzer` that reads the V1730 fragments and stores the data in a TTree can fe found in this feature branch: [feature/fnicolas_pmtv1730ana](https://github.com/SBNSoftware/sbndaq-artdaq/tree/feature/fnicolas_pmtv1730ana). In particular we will be running the analyzer: [sbndaq-artdaq/ArtModules/SBND/SBNDPMTV1730Ana_module.cc](https://github.com/SBNSoftware/sbndaq-artdaq/blob/feature/fnicolas_pmtv1730ana/sbndaq-artdaq/ArtModules/SBND/SBNDPMTV1730Ana_module.cc)
Two fhicls that run the analyzer:
- Saves waveforms into TTree: [ArtModules/SBND/run_anaPMTV1730_wWf.fcl](https://github.com/SBNSoftware/sbndaq-artdaq/blob/feature/fnicolas_pmtv1730ana/sbndaq-artdaq/ArtModules/SBND/run_anaPMTV1730_wWf.fcl)
- Saves waveform/channel statistics into TTree: [ArtModules/SBND/run_anaPMTV1730.fcl](https://github.com/SBNSoftware/sbndaq-artdaq/blob/feature/fnicolas_pmtv1730ana/sbndaq-artdaq/ArtModules/SBND/run_anaPMTV1730.fcl)

You can run just as `lar -c run_anaPMTV1730.fcl -s inputDAQfile.root`. You can analyze the TTree with ROOT/python plotting macros. You will need a local installation of the `sbndaq-artdaq` repository.


## Running CAEN wavedump

- Instructions: [Running wavedump](https://github.com/SBNSoftware/SBNSoftware.github.io/blob/master/running_wvdump.md)
- Useful commands: `caen` will show info about the connected boards
- In the V1730: make sure both RUN (gren) and TRG (green flashing) are turned one when running
- We are using this file: `/home/nfs/sbnd/wavedump-3.9.0-trig/src/w1_testFeb23.txt`
- Important parameters:
 - `OPEN PCI 1 0 0`: first number must match the link we are using (in our case 0)
 - If using an external trigger, make sure we set up `EXTERNAL_TRIGGER  ACQUISITION_AND_TRGOUT` in the conf file


## LeCrow fan-in/fan-out specifications
- Fast logic module: https://prep.fnal.gov/catalog/hardware_info/lecroy/nim/429a.html
- Quad linear fanin-fanout: https://prep.fnal.gov/catalog/hardware_info/lecroy/nim/428f.html
- Octal discriminator: https://www.fnal.gov/projects/ckm/jlab/623b-spec.htm
 * Manual: https://web.physics.ucsb.edu/~phys128/experiments/muonphysics/Instrument%20manuals/LeCroy%20623B%20data%20sheet.pdf
- LeCroy 22 Dual Gate: https://groups.nscl.msu.edu/nscl_library/manuals/lecroy/222.pdf
- TTL/NIM translater: https://siliconpr0n.org/media/camac/CAMAC3/688al-spec.htm

## Instructions to reset the crate
- Make sure no one is running
- Log in sbnd-gateway02.fnal.gov
- telnet sbnd-vme01 8100 (change the name of the crate accordingly)
-  You should see a message like:
   *  `Connected to sbnd-vme01.fnal.gov (10.226.35.41).`
   *  `Escape character is '^]'.`
- The type the command `$CMD:SET,CH:8,PAR:SYSR`
  * More info about this command in: http://pen.phys.virginia.edu/daq/vme/vme8100_usersmanual.pdf
  * Section 8.4 (page 41)


## Notes about signals
- Convention about signals:
<img width="847" alt="Captura de pantalla 2023-03-23 a las 15 56 53" src="https://user-images.githubusercontent.com/66068208/227358526-c5c34dd2-b642-4fe4-8e37-c0b16f382e04.png">

- We can trigger the V1730s with both NIM and TTL signals. This is control by this [fhicl parameter](https://github.com/SBNSoftware/sbndaq/blob/develop/sbn-nd/DAQInterface/configs/standard/pmt_standard.fcl#L97).
 - All TRG IN, TRG OUT and S IN channels need to receive the same leevel signal. PTB uses TTL; so we need TTL signal fro triggering.
- V1730 Trigger signal: TTL signal (set to 3.3V)
- Inout V1730 channels: better use NIM signals
- Quad fanin-fanout: linear analagos, can use both
- 429A Logic fan-in/out: only NIM signal
- Pulse width reducer: only NIM


## Change to external clock in the V1730

- Ground yourself, unscrew board, take out the board, switch button (red) in the side of the board
- Program: CAENUpgradeGUI (run in the sbnd-pds* server)
- Select clock we want to configure. The live in Clock in etc/CAEN…: v1730S_vcxo500_ref50_pll_out62_5.rbf
- Select board model: V1730S
- Change type of link. We are using optical links (OPLINK)
- Pay attention to the link number we want to upgrade
- Upgrade, do not interrupt it, reboot


# Board we are using
- Connected to sbnd-pds03 trhough link

```
Lnk Model
0   VX1730SB Serial 164
      04.23 - Build 4B06
      00.02 - Build 4922 202
      AMode:0 CLK:1  PLL:1  RUN:0  DRDY:0  FULL:0  RDY:1
```

Legend:
- CLK: if 1, means the board is expecting an external clock
- PLL: if 1, the clock board is properly setup (either internal or external). Same applies here for the LED (should be green) in the board
      
      
## Running DQM instructions
- Critical: we need `artdaq v3_11_02_01` (and artdaq_utilities v1_07_02_01`):
``setup artdaq v3_11_02_01 -q e20:s112:prof```
- Need to install sbndqm and sbndaq-online (develop branches work)
- In sbndaq-online add password (`sbndaq-online/redis-connect/RedisConnection.cc`):
`fRedisPassword = pset.get<std::string>("password", "B4730D6D9606E3EB37048EB017D4C69EFB56243CCC408E3BEC3BFDEEDF792876");`
- DQM tutorial: https://cdcvs.fnal.gov/redmine/projects/sbndqm/wiki/Sbndqm_Workshop_April_2023
- Monitoring webpage: https://sbn-online.fnal.gov/cgi-bin/minargon/minargon.wsgi/PMT
- Check database directory in sbndqm repository

