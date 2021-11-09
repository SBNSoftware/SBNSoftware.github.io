---
layout: page
title: SBND Trigger
---



SBND Trigger
============================================

**PMT Channel Mapping for APA 01** *Beam left APA*\
!(/redmine/attachments/download/54604/APA01_PMTMapping.png)

Channel numbers are assigned as shown in the attached images. This
information can be accessed in spreadsheet form\
here:
<https://docs.google.com/spreadsheets/d/1kI8WF8RoWlY-Mlga5AjhH72JrFG3PEZWJYm9_y1EvII/edit?usp=sharing>\
and here:
<https://docs.google.com/spreadsheets/d/15WJKhYOfIDmWfz2Lb58-w46xkHGvzrhZ_obu3TbIlFw/edit?usp=sharing>


PMT Hardware Trigger Simulation
-----------------------------------------------------------------------------

The PMT hardware trigger simulation is a LArSoft producer module that adds in variables indicating if a simulated event would have passed the PMT hardware trigger. The module can be found in ```sbndcode/Trigger```.

**Input:** 
  OpDet Waveforms (typically using Detsim files will have all these waveforms, reco 1 and 2 files may contain some filtered set of them)

**Output:** 
  std::vector<int> numPassed = number of pmt pairs above threshold, index = time during trigger window (usually beam spill)
  int maxPMTs = maximum number of pmt pairs above threshold during trigger window (usually beam spill)
  Optional: histograms for all included channels of every step of the hardware trigger logic for up to three configurable events
  
**Run the Simulation**

  ```bash
    lar -c run_pmttriggerproducer.fcl -s [DetSim root file]
  ```
**Change the Parameters**
  The fhicl file can be found in ```bash sbndcode/Trigger```. 
  
  The following parameters can be changed in the fhicl:
  
  _OpDetsToPlot:_ choice to include coated, uncoated, or all PMTs (default = all)
  _Threshold:_    individual PMT threshold, in ADC (default = 7960 ADC); should be _below_ baseline; simulated baseline = 8000 ADC, ideal single PE response: 1 PE                   ~8 ADC, test bench: 1 PE ~ 25 ADC
  _OVTHRWidth:_   over-threshold width (page 40 of hardware trigger manual), controls the number of extra ticks to stay high after a rising edge (trigger goes                       from 0 to 1) (default = 11)
  _Pair1:_        first set of paired PMT channel numbers
  _Pair2:_        second set of paired PMT channel numbers
    to pair two channels put them at the same index in Pair1 and Pair2
    i.e. to pair channel 14 and 15 -> Pair1:[x,x,x,14,x,...] and Pair2: [x,x,x,15,x,...]
  _Unpaired:_     set of unpaired PMT channel numbers
    (default = adjacent channel numbers -> PMTs reflected across x axis, last 8 channels unpaired)
  _WindowStart:_ start time of the trigger window, in us (default = 0.0)
  _WindowEnd:_   end time of the trigger window, in us (default = 1.6)
  _SaveHists:_   if true, saves the waveform histograms (default = true)
  _EvHists:_     if SaveHists=true, which event numbers to save the histograms for, max number of events = 3 (default = [1,2,3])
  
**Read the Products**
  The module outputs a pmttriggerproducer product, with object name sbnd::comm::pmtTrigger, that containes the numPassed and maxPMTs variables described above. An example of how to read these can be found in the commisioning hitdumper module (```bash  sbndcode/Commissioning/HitDumper_module.cc```). Below is the main code from this module.
  
  ```bash
      art::Handle<std::vector<sbnd::comm::pmtTrigger> > pmtTriggerListHandle;
      std::vector<art::Ptr<sbnd::comm::pmtTrigger> > pmttriggerlist;

    if (evt.getByLabel(fpmtTriggerModuleLabel, pmtTriggerListHandle)){
      art::fill_ptr_vector(pmttriggerlist, pmtTriggerListHandle);
      ResetPmtTriggerVars( (int)pmttriggerlist[0]->numPassed.size());

      for (int i=0; i < (int)pmttriggerlist[0]->numPassed.size(); i++){
        _pmtTrigger_npmtshigh[i] = pmttriggerlist[0]->numPassed[i];
      }
      _pmtTrigger_maxpassed = pmttriggerlist[0]->maxPMTs;
    }
  ```
_
  


