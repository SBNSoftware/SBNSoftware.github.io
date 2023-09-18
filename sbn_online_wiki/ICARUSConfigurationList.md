# ICARUS DAQ configuration
The purpose of this page is to collect and archive information of ICARUS DAQ configurations. Whenever you create a new configuration, please fill the following information in this page:

- Creation Date
- Your name/responsible name
- Configuration name
- Compatible boot file name
- Short description (e.g. based on configuration X with parameter Y changed from A to B)

When the configuration is no longer used, please move the information to another table, below

## Presently used configurations
### Physics

| date | responsible | name | bootfile | description |
| ---- | ----------- | ---- | -------- | ----------- |
| add  | information |  in  |   this   |  table      |

### Calibration

| date | responsible | name | bootfile | description |
| ---- | ----------- | ---- | -------- | ----------- |
| 8Sep2023 | GAL | Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_GALTest00003 Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_DAQTest00005 Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_DAQTest00004 Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_DAQTest00003 Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_GALTest00002 Calibration_MINBIAS_BNB_Thr400_Majority10_FixedWindow_4Hz_GALTest00001 |  boot_MinBias_VeryHighRate_multiple_art_processes.txt | Configurations for testing new organization of Grafana metric levels |
| 14Aug2023  | M. Vicenzi, D. Torretta |  PMTlaser00037  |  boot_MinBias_VeryHighRate_multiple_art_processes.txt   |  Configuration for PMT test runs with laser at 10Hz. Updated from PMTlaser00036 with newer `icaruspmt**.fcl` with latest settings of PMT thresholds and baselines |
| 30Aug2023  | M. Murphy | Calibration_withBottomCRT00003 | boot_MinBias_VeryHighRate_multiple_art_processes.txt | Standard bottom CRT calibration. Updated from 00002 to move one of the files referenced by icaruscrtbottom_standard.fcl to a more accessible location. |

### Testing
| date | responsible | name | bootfile | description |
| ---- | ----------- | ---- | -------- | ----------- |
| 18Sep2023 | M. Vicenzi | PMT_test_clk_TRIGOUT_only_ww03_phase00001-3 PMT_test_clk_TRIGOUT_only_ww00001-4 PMT_test_clk_TRIGOUT_all_true00001 PMT_test_clk_TRIGOUT_all_false00001-3 | boot_MinBias_VeryHighRate_multiple_art_processes.txt | Configurations for testing PR #114 of sbndaq-artdaq. Motherboard clock or clock phase put in TRG-OUT. Never use for physics quality runs. |

## No longer used configurations
### Physics
### Calibration
### Testing
