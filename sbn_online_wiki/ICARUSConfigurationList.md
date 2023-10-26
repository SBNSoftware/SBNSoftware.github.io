# ICARUS DAQ configuration
The purpose of this page is to collect and archive information of ICARUS DAQ configurations. Whenever you create a new configuration, please fill the following information in this page:

- Creation Date
- Your name/responsible name
- Configuration name
- Compatible boot file name
- Short description (e.g. based on configuration X with parameter Y changed from A to B)

When the configuration is no longer used, please move the information to another table, below

## Presently used configurations
### Physics [ as on 10/06/2023 after retiring campaign] 

| date | responsible | name | bootfile | description |
| ---- | ----------- | ---- | -------- | ----------- |
| 06Oct2023 | DT | Physics_Standard00001 |  boot_Majority_moreEvb.txt | cloned from Physics_General_thr390_Majority_5_9_OverlappingWindow_wr_0_LockTemp_newpeds_win_10s_DAQTest00002 with updated Grafana metrics and pmt_standard.fcl changes by M. Vicenzi  |
| 06Oct2023 | DT | Physics_Adders00001 |  boot_Majority_moreEvb.txt | cloned from Physics_General_thr390_Majority_5_9_OverlappingWindow_wr_0_LockTemp_newpeds_win_10s_Adders_Corner_DAQTest00001 with updated Grafana metrics and pmt_standard.fcl changes by M. Vicenzi  |
| 09Oct2023 | DT | TriggerTest_MinBias_1Hz_RL75000_noEnable_oct2023_00001 |  boot_Majority_moreEvb.txt | cloned from TriggerTest_MinBias_1Hz_RL75000_noEnable_feb2023_00003 with updated Grafana metrics and pmt_standard.fcl changes by M. Vicenzi; config for MinBias triggers and extended PMT readout window  |

### Calibration

| date | responsible | name | bootfile | description |
| ---- | ----------- | ---- | -------- | ----------- |
| 06Oct2023 | GAL/Antoni ? | Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_DAQTest00002 | boot_MinBias_VeryHighRate_multiple_art_processes.txt | OLD configuration to USE until new artdaq becomes the default |
| 26Oct2023 | AA/DT/MV | Calibration_MINBIAS_Standard00004 | boot_MinBias_VeryHighRate_multiple_art_processes.txt | Updated: grafana levels, grapha reporting_interval, added new changes to PMT levels, added CRT telescope and bottom CRT |
| 06Oct2023 | GAL/Antoni ? | Calibration_MINBIAS_Standard00002 | boot_MinBias_VeryHighRate_multiple_art_processes.txt | cloned from Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_GALTest00003 with updated Grafana metric levels and pmt_standatd.fcl changes by M.Vicenzi |
| 8Sep2023 | GAL | Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_GALTest00003 Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_DAQTest00005 Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_DAQTest00004 Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_DAQTest00003 Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_GALTest00002 Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_GALTest00001 |  boot_MinBias_VeryHighRate_multiple_art_processes.txt | Configurations for testing new organization of Grafana metric levels |
| 14Aug2023  | M. Vicenzi, D. Torretta |  PMTlaser00037  |  boot_MinBias_VeryHighRate_multiple_art_processes.txt   |  Configuration for PMT test runs with laser at 10Hz. Updated from PMTlaser00036 with newer `icaruspmt**.fcl` with latest settings of PMT thresholds and baselines |
| 30Aug2023  | M. Murphy | Calibration_withBottomCRT00003 | boot_MinBias_VeryHighRate_multiple_art_processes.txt | Standard bottom CRT calibration. Updated from 00002 to move one of the files referenced by icaruscrtbottom_standard.fcl to a more accessible location. |

### Testing
| date | responsible | name | bootfile | description |
| ---- | ----------- | ---- | -------- | ----------- |
| 18Sep2023 | M. Vicenzi | PMT_test_clk_TRIGOUT_only_ww03_phase00001-3 PMT_test_clk_TRIGOUT_only_ww00001-4 PMT_test_clk_TRIGOUT_all_true00001 PMT_test_clk_TRIGOUT_all_false00001-3 | boot_PMTlaser.txt | Configurations for testing PR #114 of sbndaq-artdaq. Motherboard clock or clock phase put in TRG-OUT. Never use for physics quality runs. |
| 23Oct2023 | M. Vicenzi | Test_PMTbaselines_nom00001 Test_PMTbaselines_nom00002 Test_PMTbaselines_m5_00001  Test_PMTbaselines_p5_00001  Test_PMTbaselines_m10_00001  Test_PMTbaselines_p10_00001 Test_PMTbaselines_m20_00001  Test_PMTbaselines_p20_00001 | boot_PMTlaser.txt | Configurations for PMT baseline scans with different DC offsets (+-5%, +-10%, +-20%). |
| 24Oct2023 | M. Vicenzi | Test_Physics_5_9_thr360_ExtendedGate00001 Test_Physics_5_9_thr390_ExtendedGate00001 Test_Physics_5_9_thr420_ExtendedGate00001 Test_Physics_5_8_thr360_ExtendedGate00001 Test_Physics_5_8_thr390_ExtendedGate00001 Test_Physics_5_8_thr420_ExtendedGate00001 Test_Physics_4_9_thr360_ExtendedGate00001 Test_Physics_4_9_thr390_ExtendedGate00001 Test_Physics_4_9_thr420_ExtendedGate00001 | boot_PMTlaser.txt | Configurations for trigger majorities and thresholds scan, using newly-calibrated baselines and BNB offbeam gate extended to 10.1us |

## No longer used configurations
### Physics
### Calibration
### Testing
