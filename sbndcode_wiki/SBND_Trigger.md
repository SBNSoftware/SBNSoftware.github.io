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

  OpDet Waveforms (typically Detsim files will have all these waveforms, reco 1 and 2 files may contain some filtered set of them)


**Output:** 

  ```std::vector<int> numPassed``` = number of pmt pairs above threshold, index = time during trigger window (usually beam spill)
  
  ```int maxPMTs``` = maximum number of pmt pairs above threshold during trigger window (usually beam spill)
  
  Optional: histograms for all included channels of every step of the hardware trigger logic for a configurable set of events
  
  
**Run the Simulation**

  ```bash
    lar -c run_pmttriggerproducer.fcl -s [DetSim root file]
  ```
  
**Change the Parameters**

  The fhicl file can be found in ```sbndcode/Trigger```. 
  
  The following parameters can be changed in the fhicl:
  
  _OpDetsToPlot:_ choice to include coated, uncoated, or all PMTs (default = all)
  
  _IndividualThresholds:_ if true, Threshold needs to be a 120 element array of each individual PMT ADC threshold in order of lowest to highest channel number (default = false)
  
  _Threshold:_    PMT threshold, in ADC, format: [coated, uncoated], unless IndividualThresholds is true, (default = [7960, 7976.0] ADC); should be _below_ baseline; simulated baseline = 8000 ADC, ideal single PE response: 1 PE ~ 8 ADC, test bench: 1 PE ~ 25 ADC
  
  _OVTHRWidth:_   over-threshold width (page 40 of hardware trigger manual), controls the number of extra ticks to stay high after a rising edge (trigger goes                       from 0 to 1) (default = 11)
  
  _Pair1:_        first set of paired PMT channel numbers
  
  _Pair2:_        second set of paired PMT channel numbers
  
    to pair two channels put them at the same index in Pair1 and Pair2
  
    i.e. to pair channel 14 and 15 -> Pair1:[x,x,x,14,x,...] and Pair2: [x,x,x,15,x,...]
  
  _Unpaired:_     set of unpaired PMT channel numbers
  
    (default = adjacent channel numbers -> PMTs reflected across x axis, last 8 channels unpaired)
    
  _PairLogic:_   logic for pairing PMTs, options are "OR" or "AND" (default = "OR")
  
  _WindowStart:_ start time of the trigger window, in us (default = 0.0)
  
  _WindowEnd:_   end time of the trigger window, in us (default = 1.8)
  
  _SaveHists:_   if true, saves the waveform histograms (default = false)
  
  _EvHists:_     if SaveHists=true, which event numbers to save the histograms for (default = [1]); if too many hists are saved, may have memory issues, try saving less events.
  
  _Verbose:_     if true, outputs text about the event (default = false)
  
  
**Read the Products**

  The module outputs a pmttriggerproducer product, with object name sbnd::comm::pmtTrigger, that containes the numPassed and maxPMTs variables described above. An example of how to read these can be found in the commisioning hitdumper module (```sbndcode/Commissioning/HitDumper_module.cc```). Below is the main code from this module.
  
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

CAEN1730 Fragment Simulation
-----------------------------------------------------------------------------  

The PMT fragment producer (```sbndcode/Trigger/pmtArtdaqFragmentProducer_module.cc```) converts simulated PMT waveforms into CAEN1730 artdaq::Fragment format. For each PMT hardware trigger, waveforms are saved for 5120 samples (~10us, 2ns sampling) from -1us to +9us around the trigger time. Sets of 8 fragments are created per trigger, each containing 15 PMT waveforms + beam signal and timestamps. Trigger time(s) are offset by 0.5 seconds to avoid negative times.

**Input:** 

  OpDet Waveforms ```raw::OpDetWaveform``` (Detsim stage or later)
  PMT Hardware trigger output ```sbnd::comm::pmtTrigger```

**Output:** 

  CAEN1730 Fragments ```std::vector<artdaq::Fragment>```. Set of 8 fragments are produced for each PMT hardware trigger. Each fragment contains 15 PMT waveforms, 5120 samples (~10us). First fragment of set contains binary beam signal (1 if waveform bin in time with beam, otherwise 0) in  16th channel. Fragment metadata also simulated -- fragment ID (0-7), number of channels, waveform length, trigger timestamp. 
  
**Run the Simulation**

  ```bash
    lar -c run_pmtArtdaqFragmentProducer.fcl -s [PMT hardware trigger root file]
  ```
  
**Change the Parameters**

  The fhicl file can be found in ```sbndcode/Trigger```. 
  
  The following parameters can be changed in the fhicl:    
  
  _InputModuleNameWvfm_:  input opdet waveforms module name, default "opdaq"
  
  _InputModuleNameTrigger_: input pmt hardware trigger module name, default "pmttriggerproducer"
  
  _Baseline_: PMT baseline used when extending/combining waveforms if full 3ms is not simulated, default 8000 ADC
  
  _MultiplicityThreshold_: PMT-pair multiplicity threshold to pass hardware trigger, default 10 pairs
  
  _BeamWindowLength_: beam window length, default 1.8 us (extended by 0.2us to account for delayed signals)
  
  _Verbose_: verbose output for debugging 
  
  
 PMT Software Trigger Simulation
-----------------------------------------------------------------------------

The PMT software trigger producer (```sbndcode/Trigger/pmtSoftwareTriggerProducer_module.cc```) extracts PMT waveforms from CAEN1730 artdaq::Fragment format, determines which set of fragments is in time with the beam spill, runs desired software trigger metric algorithms and creates ```sbnd::trigger::pmtSoftwareTrigger``` object to store results. Filter module(s) can then be run using these metrics.

Metrics available: 

**Input:** 

  CAEN1730 Fragments ```std::vector<artdaq::Fragment>``` created by the fragment simulation producer module.

**Output:** 

  PMT software trigger metrics ```sbnd::trigger::pmtSoftwareTrigger```.
  
  The following metrics are contained in the above data product:
  
  _foundBeamTrigger_: boolean, whether the beam trigger fragment was found 
  
  _nAboveThreshold_: number of total PMTs (# ranges from 0-120) above a ADC threshold (set in fcl) during the beam window (set in fcl, default 1.8 us) 
  
  _triggerTimestamp_: trigger time in ns with respect to the beam spill 
  
  _promptPE_: prompt light; total photoelectron count from all PMTs 100 ns after the triggerTimestamp
  
  _prelimPE_: preliminiary light; total photoelectron count from all PMTs during the beam spill, before the triggerTimestamp
  
  _pmtInfoVec_: data product ```std::vector<sbnd::trigger::pmtInfo> pmtInfoVec;```, which contains the channel # for every PMT, baseline info for every PMT, and a vector of pulse information if you run the producer with the pulse algorithm turned on. However, this data product is currently not accessed when reading the metrics in the hitdumpertree. 

  
 **Run the Simulation**

  ```bash
    lar -c run_pmtsoftwaretriggerproducer.fcl -s [PMT fragment simulation root file]
  ```
  
**Change the Parameters**

  The fhicl file can be found in ```sbndcode/Trigger```. 
  
  The following parameters can be changed in the fhicl:    
  
  _is_persistable_:  controls whether trigger metrics object is written to output root file, default "true"
  
  _TriggerTimeOffset_: trigger time offset, must match offset used in fragment producer, default 0.5s
  
  _BeamWindowLength_: beam window length, default 1.8 us (extended by 0.2us to account for delayed signals)
  
  _WvfmLength_: waveform length, default 5120 samples (could also determine from fragments)
  
  _Verbose_: verbose output for debugging
  
  _SaveHists_: boolean, whether or not to save the 10 us waveforms in histograms for the first few events 
  
  _BaselineAlgo_: input a string corresponding to the algorithm for calculating the baseline. Current options: "constant" or "estimate." If choosing "estimate," the mean and standard deviation of the first 500 ns (250 entries) of each waveform is calculated. If the standard deviation is above 3 ADC, the mean and stddev of the last 500 ns of each waveform is used instead. 
    
  _InputBaseline_: input baseline for ```BaselineAlgo: "constant"```; default 8000 ADC 
  
  _InputBaselineSigma_: input baseline stddev for ```BaselineAlgo: "constant```; default 2.0 ADC 
  
  _ADCThreshold_: ADC threshold to calculate ```nAboveThreshold```, default 7960 ADC 
  
  _FindPulses_: boolean, whether or not to use the crude pulse finder (more computational); default False
  
 _PEArea_: Conversion between ADCxns to photoelectrons when using the crude pulse finder 
