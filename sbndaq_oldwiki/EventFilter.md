

branch:  feature/sbnd_eventfilter. as user sbnd
   - last commit - never
directory:  /home/nfs/sbnd/DAQ_DevAreas/DAQ_6Aug2022_MS
repos:    sbndaq_artdaq,sbndaq_artdaq_core
new files:  sbndaq-artdaq/ArtModules/SBND/softwaretrigger/
             sbndaq-artdaq/ArtModules/SBND/MetricProducer_module.cc
             sbndaq-artdaq-core/Obj/SBND/CRTmetric.h
             sbndaq-artdaq-core/Obj/SBND/CRTmetric.cc
setup script: ~sbnd/launchdaq_softwaretrig.sh
             
status: code created Aug 7, 2022.  Needs to be tested on CRT## data by putting producer in front of analysis module in fcl,
         set verbose to true and see that hit counts are sensible.
         
         Aug 7, 2022: does not build
         Aug 8, 2022: Now builds! needs to be tested.
         Aug 9, 2022: Added to sbndcode (branch feature/eyandel_trigger) and tested/debugged. Now running smoothly on both simulated and real CRT## data. Analyzer and/or filter to look at metrics needed.

