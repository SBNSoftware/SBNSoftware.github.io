---
layout: page
title: Running Nevis TPCs in SBND-DAQ
---

**Introduction**
========================================================================================================================
There exists various links that explain Nevis TPC hardware and software in the below webpage:
https://sbnsoftware.github.io/sbndaq_oldwiki/SBND_TPC_DAQ.html

The very first setup needed to run Nevis TPCs in SBND-DAQ is sbndaq installation following the instructions:
https://sbnsoftware.github.io/sbndaq_oldwiki/Installation_instructions.html
The repositories can be installed on sbnd-gateway01.
* **login to gateway machine as yourself ($USER)** For running DAQ tests without making any major changes to the code
* **login to gateway machine as sbnd user** For developing code, it is advisable to use the shared account "sbnd" and install
sbndaq under DAQ_DevAreas in home directory. Developing code under shared account makes debugging easier as others 
(artdaq-developers or your team members) have access to the code

Another, very useful link that one should be familiar with before running DAQ is DAQInterface wiki:
https://cdcvs.fnal.gov/redmine/projects/artdaq-utilities/wiki/Artdaq-daqinterface
We use DAQInterface (located in srcs/sbndaq/sbn-nd/DAQInterface/) to start and stop runs so it is useful to go through the above webpage and familiarize yourself

**Overview of Nevis TPC board reader and links to fcl file**
========================================================================================================================
The more detailed overview of Nevis system is found at:
https://sbnsoftware.github.io/sbndaq_oldwiki/SBND_TPC_DAQ.html
Here, a few things related to running Nevis TPc boardreader and running DAQ are outlined
Nevis TPC boardreader is:
https://cdcvs.fnal.gov/redmine/projects/sbndaq/repository/artdaq/revisions/master/entry/sbndaq-artdaq/Generators/SBND/NevisTPC/NevisTPC2StreamNUandSNXMIT_generator.cc
which reads out two parallel data streams-
* Neutrino (Triggered data stream): using GetFEMCrateData function in the code which retrieves data out from the electronics and 
write into disk. This function is being called in loop
* Supernova (continuous data stream): using GetSNData and WriteSNData functions in the code

The BR calls configuration recipee that configures the Nevis TPC electronics and various configuration classes that are being called in BR
are in: https://cdcvs.fnal.gov/redmine/projects/sbndaq/repository/artdaq/revisions/master/show/sbndaq-artdaq/Generators/SBND/NevisTPC/nevishwutils
There are various receipes defined in the Crate class which consolidates all the different modules required to configure the electronics.

Various fcl files to run Nevis TPC boardreader on servers in SBN-ND are in:
https://cdcvs.fnal.gov/redmine/projects/sbndaq/repository/revisions/master/show/sbn-nd/DAQInterface/configs/standard
Three sets of fcl files that are in place to run particular configuration recipe -
* fake_NevisTPC2StreamCALIB_driver.fcl and NevisTPC2StreamCALIB_driver.fcl to run with fake-data configuration and real-data respectively
using internally generated calibration triggers.
* fake_NevisTPC2StreamCTRL_driver.fcl and NevisTPC2StreamCTRL_driver.fcl to run with fake-data configuration and real-data respectively
using internally generated controller triggers.
* fake_NevisTPC2StreamEXT_driver.fcl and NevisTPC2StreamEXT_driver.fcl to run with fake-data configuration and real-data respectively
using external triggers for instance trigger from Penn Trigger Board (PTB) or from function generator.

**ToDo's before running TPCs in DAQ**
========================================================================================================================
* In DAQInterface directory, open boot.txt file and make sure that the host name for PMT (Process Management Tool ), Eventbuilder and Dispatcher
match the host on which DAQInterface will run for instance sbnd-tpc01-daq if running from tpc01 or sbnd-evb01-daq if running from evb01. 
It is important to have -daq alongwith server/hostname. Another important point is to have debug level >=4 (maximum is 10).
* In MessageFacility.fcl, use the correct hostname (on which DAQInterface will run e.g. sbnd-evb01-daq).
* In known_boardreaders_list, check if the subsystem that you want to run is present for instance tpc## (## varies from 0-11) alongwith the correct
server name with -daq as prefix
* In critical_process_list, check if the subsystem that you want to run is present for instance tpc## (## varies from 0-11).
* In user_settings, configure boardreader timeout to 1200 if running all TPCs with all FEMs otherwise run will crash with lock error. We can also
mention the sequence of how do we want to start and stop BRs for all the TPCs using board_reader_priorities_on_start and board_reader_priorities_on_stop 
respectively. Starting sequence should be tpc11 tpc10 ....tpc01 whereas, stopping sequence should be tpc01 tpc02......tpc11.
* In run script, mention the name of components that you want to run for instance to run all TPCs do- setdaqcomps.sh tpc11 tpc10 tpc09 tpc08 tpc07 tpc06 tpc05 tpc04 tpc03 tpc02 tpc01 

**Running Nevis TPC using DAQInterface**
========================================================================================================================
Before planning to test runs, it is always useful to inform other DAQ users. We usually do this by sending message in sbnd-daq slack channel.
This would avoid any clashes especially if two users are using same partition or running same subsystem. 
We use DAQInterface to start and stop the runs following these steps:
* Open two terminals and login to sbnd-evb01 server via sbnd-gateway machine. (We can also login to any of the 11 SBND TPC servers sbnd-tpc## (## varies from 01-11) and run TPCs from sbnd-tpc machines
to test tpc running.)
* Verify that ssh pub/priv key is enabled for the user account - kdestroy; ssh sbnd-evb01-daq
* Go to DAQInterface directory (srcs/sbndaq/sbn-nd/DAQInterface/ OR one can also create a link to DAQInterface in home directory where sbndaq in installed.
* Setup DAQInterface script in both terminals - source setup_daqinterface.sh
* Open run file and mention the subsystem we want to run (in our case tpc)
* Start DAQInterface in one terminal -  DAQInterface&
* Check if you are the only user running DAQInterface on specified partition - listdaqinterfaces.sh 
* By default, partition 1 is set and one can switch to a different partition (2/3/4) - cd DAQInterface; Open user_sourcefile and change partition number if needed using variable DAQINTERFACE_PARTITION_NUMBER
* Always useful to check the DAQ status - status.sh . Status should be in stopped stage. Sometimes, previous run don't end up in clean way that leaves DAQInterface in configure state.
* Start run in another terminal -  ./run

**Running TPCs in push and pull mode configuration**
========================================================================================================================
Before we look into how to run TPCs in push and pull mode, its important that we know what are these configurations-
* Push mode: When boardreader sends data fragments to EVB as soon as they arrive.
* Pull mode with window option: In pull mode, boardreader only sends data to EVB on request, based on given time window which is currently 5 ms.

TPC01 crate has trigger board and we want the data from all the crates to go to EVB whenever a trigger is issued by 
trigger board and therefore, we will run tpc01 in push mode and all the other tpc's (tpc02-tpc11) in pull mode. 

Pull mode configurtaion can be implemented in the fcl file that we want to run which are mentioned above and are found in 
https://cdcvs.fnal.gov/redmine/projects/sbndaq/repository/revisions/master/show/sbn-nd/DAQInterface/configs/standard
For pull mode, these line should be present in fragment_receiver in fcl file:

#pull mode configuration
 receive_requests: true
 request_address:       "227.128.11.129" #### "227.128.12.35"(icarus) # -- multicast request address
 multicast_interface_ip: "10.226.36.0"  ####"192.168.191.0"(icarus) # -- should match the private net
 request_port: 3001   ##3502   # UDP request port
 request_mode: sequence #match sequenceID of request
 data_buffer_depth_fragments: 100
 data_buffer_depth_mb: 10
 #stale_request_timeout: 100000000000 #100s #turn off to default to no timeout

Request_address and multicast_interface_ip should match the one defined in EventBuilder_standard.fcl file
https://cdcvs.fnal.gov/redmine/projects/sbndaq/repository/revisions/master/show/sbn-nd/DAQInterface/configs/standard

This configuration runs all tpc's in pull mode. To run tpc01 in push mode, the following lines should be implemented
in tpc01.fcl https://cdcvs.fnal.gov/redmine/projects/sbndaq/repository/revisions/master/show/sbn-nd/DAQInterface/configs/standard
daq.fragment_receiver.receive_requests: false
daq.fragment_receiver.request_mode: ignored

**Running TPCs using external trigger source**
========================================================================================================================
As mentioned above, these two config files should be used when triggering DAQ with external trigger source-fake_NevisTPC2StreamEXT_driver.fcl and NevisTPC2StreamEXT_driver.fcl to run with fake-data configuration and real-data respectively
using external triggers for instance trigger from Penn Trigger Board (PTB) or from function generator.
It's always recommended to use PTB as an external trigger source since we can control when to start and stop PTB within software using user_settings file in DAQInterface directory. In case, someone wants to trigger DAQ using a function generator, then trigger should be turned ON only after configuring hardware including Nevis trigger board and when DAQ is in running/starting state otherwise this configuration can result in backpressure on the event builders and can leave DAQ in a state where event builders are not able to collect data. 





