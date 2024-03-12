# ICARUS DAQ configuration
The purpose of this page is to collect and archive information of ICARUS DAQ configurations. Whenever you create a new configuration, please fill the following information in this page:

- Creation Date
- Your name/responsible name
- Configuration name
- Compatible boot file name
- Short description (e.g. based on configuration X with parameter Y changed from A to B)

When the configuration is no longer used, please move the information to another table, below

## Run3 Configurations
### Calibrations
| date | responsible | name | bootfile | description |
| ---- | ----------- | ---- | -------- | ----------- |
| 12Mar2024 | DT,MV | Calibration_MINBIAS_Standard_4Hz_WithTPCCompression_Run3_00001 |  boot_MinBias_VeryHighRate_multiple_art_processes.txt| with new FileNAmes, added artdaqFragWatcher, grafana reporting interval: 15s, fastCloning = false, Requires DAQ area DAQ_2024-02-29_REL_v1_09_02 or newer.  |
| 12Mar2024 | DT,MV | Calibration_MINBIAS_1Hz_RL75000_noTrgOverlap_WithTPCCompression_Run3_00002 |  boot_MinBias_VeryHighRate_multiple_art_processes.txt | 1Hz with new FileNames, added artdaqFragWatcher, grafana reporting interval: 15s, fastCloning= false,  stale_buffer_timeout_usec: 14000000 , Requires DAQ area DAQ_2024-02-29_REL_v1_09_02 or newer.  |
| 12Mar2024 | DT,MV | Calibration_MINBIAS_2Hz_RL75000_noTrgOverlap_WithTPCCompression_Run3_00002 |  boot_MinBias_VeryHighRate_multiple_art_processes.txt | 2Hz with new FileNames, added artdaqFragWatcher, grafana reporting interval: 15s, fastCloning= false,  stale_buffer_timeout_usec: 14000000 , Requires DAQ area DAQ_2024-02-29_REL_v1_09_02 or newer.  |

### Physics
| date | responsible | name | bootfile | description |
| 12Mar2024 | DT | Physics_ |  boot_Majority_moreEvb.txt | cloned from Physics_General_thr390_Majority_5_9_OverlappingWindow_wr_0_LockTemp_newpeds_win_10s_DAQTest00002 with updated Grafana metrics and pmt_standard.fcl changes by M. Vicenzi  |

## Presently used configurations
### Physics [ as on 10/06/2023 after retiring campaign] 

| date | responsible | name | bootfile | description |
| ---- | ----------- | ---- | -------- | ----------- |
| 09Nov2023 | DT,AA,AC | TriggerTest_MinBias_1Hz_RL75000_noEnable_oct2023_00003 |  boot_Majority_moreEvb.txt | TriggerTest_MinBias_1Hz_RL75000_noEnable_oct2023_00002 with  added artdaqFragWatcher, grafana reporting interval: 15s, fixed name of tpc_metric logfile. Requires DAQ area DAQ_2023-10-19_REL_v1_08_05 or newer.  |
| 06Nov2023 | AA,DT,AC | Physics_Standard00003 |  boot_Majority_moreEvb.txt | Physics_Standard00002 with added artdaqFragWatcher. Requires DAQ area DAQ_2023-10-19_REL_v1_08_05 or newer.|
| 06Nov2023 | AA,DT,AC,MV | Physics_Standard00002 |  boot_Majority_moreEvb.txt | Physics_Standard00001 with added bottom CRT, updated PMT pedestals, updated TPC metric filename, grafana reporting interval: 15s.  Requires DAQ area DAQ_2023-10-19_REL_v1_08_04 or newer.|
| 06Oct2023 | DT | Physics_Standard00001 |  boot_Majority_moreEvb.txt | cloned from Physics_General_thr390_Majority_5_9_OverlappingWindow_wr_0_LockTemp_newpeds_win_10s_DAQTest00002 with updated Grafana metrics and pmt_standard.fcl changes by M. Vicenzi  |
| 06Oct2023 | DT | Physics_Adders00001 |  boot_Majority_moreEvb.txt | cloned from Physics_General_thr390_Majority_5_9_OverlappingWindow_wr_0_LockTemp_newpeds_win_10s_Adders_Corner_DAQTest00001 with updated Grafana metrics and pmt_standard.fcl changes by M. Vicenzi  |
| 09Oct2023 | DT | TriggerTest_MinBias_1Hz_RL75000_noEnable_oct2023_00001 |  boot_Majority_moreEvb.txt | cloned from TriggerTest_MinBias_1Hz_RL75000_noEnable_feb2023_00003 with updated Grafana metrics and pmt_standard.fcl changes by M. Vicenzi; config for MinBias triggers and extended PMT readout window  |

### Calibration

| date | responsible | name | bootfile | description |
| ---- | ----------- | ---- | -------- | ----------- |
| 09Oct2023 | AA,DT,AC | Calibration_MINBIAS_Standard00006 | boot_MinBias_VeryHighRate_multiple_art_processes.txt | Calibration_MINBIAS_Standard00005 with added artdaqFragWatcher. Requires DAQ area DAQ_2023-10-19_REL_v1_08_05 or newer. |
| 09Nov2023  | AA,DT,AC |  PMT_Laser_Standard00002  |  boot_MinBias_VeryHighRate_multiple_art_processes.txt   | PMT_Laser_Standard00001 with added artdaqFragWatcher. Requires DAQ area DAQ_2023-10-19_REL_v1_08_05 or newer. |
| 06Nov2023  | AA,DT,AC,MV |  PMT_Laser_Standard00001  |  boot_MinBias_VeryHighRate_multiple_art_processes.txt   |  PMTlaser00037 with updated PMT pedestals, updated grafana settings, removed dataloggers, cleaned up filename comments. Requires DAQ area DAQ_2023-10-19_REL_v1_08_04 or newer. |
| 06Oct2023 | GAL/Antoni ? | Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_DAQTest00002 | boot_MinBias_VeryHighRate_multiple_art_processes.txt | OLD configuration to USE until new artdaq becomes the default |
| 27Oct2023 | AA | Calibration_MINBIAS_Standard00005 | boot_MinBias_VeryHighRate_multiple_art_processes.txt | Updated Calibration_MINBIAS_Standard00004 with missing files for CRT telescope. Requires DAQ area DAQ_2023-10-19_REL_v1_08_04 or newer. |
| 8Sep2023 | GAL | Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_GALTest00003 Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_DAQTest00005 Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_DAQTest00004 Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_DAQTest00003 Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_GALTest00002 Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_GALTest00001 |  boot_MinBias_VeryHighRate_multiple_art_processes.txt | Configurations for testing new organization of Grafana metric levels |
| 14Aug2023  | M. Vicenzi, D. Torretta |  PMTlaser00037  |  boot_MinBias_VeryHighRate_multiple_art_processes.txt   |  Configuration for PMT test runs with laser at 10Hz. Updated from PMTlaser00036 with newer `icaruspmt**.fcl` with latest settings of PMT thresholds and baselines |
| 30Aug2023  | M. Murphy | Calibration_withBottomCRT00003 | boot_MinBias_VeryHighRate_multiple_art_processes.txt | Standard bottom CRT calibration. Updated from 00002 to move one of the files referenced by icaruscrtbottom_standard.fcl to a more accessible location. |

### Testing

| date | responsible | name | bootfile | description |
| ---- | ----------- | ---- | -------- | ----------- |
| 28Nov2023 | AA | Calibration_MINBIAS_Standard_testFileNames00003 Physics_Standard_testFileNames00001 PMT_Laser_Standard_testFileNames00001 | - | configurations based on Calibration_MINBIAS_Standard00006, Physics_Standard00003, and PMT_Laser_Standard00002, with new ${app_name} field in the name, ready for testing |
| 21Nov2023 | AA | Calibration_MINBIAS_Standard_testFileNames00002 | boot_MinBias_VeryHighRate_multiple_art_processes.txt |  Based on testFileNames_MINBIAS_Standard00003, test of new artROOT file names  |
| 18Sep2023 | M. Vicenzi | PMT_test_clk_TRIGOUT_only_ww03_phase00001-3 PMT_test_clk_TRIGOUT_only_ww00001-4 PMT_test_clk_TRIGOUT_all_true00001 PMT_test_clk_TRIGOUT_all_false00001-3 | boot_PMTlaser.txt |  Configurations for testing PR #114 of sbndaq-artdaq. Motherboard clock or clock phase put in TRG-OUT. Never use for physics quality runs. |
| 23Oct2023 | M. Vicenzi | Test_PMTbaselines_nom00001 Test_PMTbaselines_nom00002 Test_PMTbaselines_m5_00001  Test_PMTbaselines_p5_00001  Test_PMTbaselines_m10_00001  Test_PMTbaselines_p10_00001 Test_PMTbaselines_m20_00001 Test_PMTbaselines_p20_00001 | boot_PMTlaser.txt | Configurations for PMT baseline scans with different DC offsets (+-5%, +-10%, +-20%). |
| 24Oct2023 | M. Vicenzi | Test_Physics_5_9_thr360_ExtendedGate00001 Test_Physics_5_9_thr390_ExtendedGate00001 Test_Physics_5_9_thr420_ExtendedGate00001 Test_Physics_5_8_thr360_ExtendedGate00001 Test_Physics_5_8_thr390_ExtendedGate00001 Test_Physics_5_8_thr420_ExtendedGate00001 Test_Physics_4_9_thr360_ExtendedGate00001 Test_Physics_4_9_thr390_ExtendedGate00001 Test_Physics_4_9_thr420_ExtendedGate00001 | boot_Majority_moreEvb.txt | Configurations for trigger majorities and thresholds scan using newly-calibrated baselines and BNB offbeam gate extended to 10.1us |

## No longer used configurations
### Physics
### Calibration
| date | responsible | name | bootfile | description |
| ---- | ----------- | ---- | -------- | ----------- |
| 16Nov2023 | AA | testFileNames_MINBIAS_Standard00001 testFileNames_MINBIAS_Standard00002 testFileNames_MINBIAS_Standard00003 | boot_MinBias_VeryHighRate_multiple_art_processes.txt |  Based on Calibration_MINBIAS_Standard00006, tests of new artROOT file names, and disabling file cloning  |
| 14Nov2023 | AA/DT/AM | Test_Calibration_MAJORITY_BNB_4Hz_00002 | ? | Based on Calibration_MINBIAS_Standard00006, with MAJORITY instead of MINBIAS |
| 26Oct2023 | AA/DT/MV | Calibration_MINBIAS_Standard00004 | boot_MinBias_VeryHighRate_multiple_art_processes.txt | Updated: grafana levels, grapha reporting_interval, added new changes to PMT levels, added CRT telescope and bottom CRT |
| 06Oct2023 | GAL/Antoni ? | Calibration_MINBIAS_Standard00002 | boot_MinBias_VeryHighRate_multiple_art_processes.txt | cloned from Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_GALTest00003 with updated Grafana metric levels and pmt_standatd.fcl changes by M.Vicenzi |

### Testing
