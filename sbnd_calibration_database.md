# SBND Calibration Database

Author: Marina Reggiani-Guzzo, PDRA at University of Edinburgh, mguzzo@ed.ac.uk

Last update: 21 May 2024

Hi there, this document contains all the information you need to know about the SBND calibration database. Please contact the author if you find any wrong/outdated information on this page.

**General comments**
- This page is under construction, this message will be removed when the displayed information is definite!
- If you are working on the SBND calibration, please check if the information for your calibration is listed below, otherwise please update [SBND Calibration Database Spreadsheet](https://docs.google.com/spreadsheets/d/1xbAhb6WnmxbwKxFc-4nnInjHdH8A50S6Zgh0mfZrSF4/edit#gid=217643219)

## Folders

### tpc_channelstatus
- Folder description: This folder contains wire-channel specific variable information
- Channel number: Represents "wire channel"
- Number of rows: 11,264 (one for each wire channel)
- URL with current values in Production Database:

| Variable Name | Type | Description | Unit |
| ------------- | ---- | ----------- | ---- |
| status | integer | 0=Dead, 1=Alive, 2=Abnormal | N/A |
| eresponse_gain | real | Pre-amplifier response parameter (voltage ←→ charge) * | mV/fC |
| eresponse_timing | real | Pre-amplifier shaping time * | us |
| eresponse_k3 | real | 1st pole term in numerator * | N/A |
| eresponse_k4 | real | 2nd pole term in numerator * | N/A |
| eresponse_k5 | real | 1st pole term in denominator * | N/A |
| eresponse_k6 | real | 2nd pole term in denominator * | N/A |


\* More information on DocDB 35489 (slide 13).

### tpc_globalconstants
- Folder description: This folder contains non-channel specific information
- Channel number: No meaning
- Number of rows: 1
- URL with current values in Production Database:

| Variable Name | Type | Description | Unit |
| ------------- | ---- | ----------- | ---- |
| field_response | text | | |
| sce | text | | |
| e_lifetime_cosmic_etpc | real | Electron lifetime measured with muons, East TPC | ms |
| e_lifetime_cosmic_etpc_err | real | Electron lifetime error measured with muons, East TPC | ms |
| e_lifetime_cosmic_wtpc | real | Electron lifetime measured with muons, West TPC | ms |
| e_lifetime_cosmic_wtpc_err | real | Electron lifetime error measured with muons, West TPC | ms |
| e_lifetime_prm_inline | real | Electron lifetime measured with long inline purity monitor * | ms |
| e_lifetime_prm_inline_err | real | Electron lifetime error measured with long inline purity monitor * | ms |
| e_lifetime_prm_short | real | Electron lifetime measured with cryostat short internal purity monitor * | ms |
| e_lifetime_prm_short_err | real | Electron lifetime error measured with cryostat short internal purity monitors * | ms |
| e_lifetime_prm_long | real | Electron lifetime measured with cryostat long internal purity monitors * | ms |
| e_lifetime_prm_long_err | real | Electron lifetime error measured with cryostat long internal purity monitors * | ms |
| egain_i1_wtpc | real | Electronics gain measured with cosmic muons (assumes recombination value) for Induction 1 plane, West TPC | ADC/e- |
| egain_i2_wtpc | real | Electronics gain measured with cosmic muons (assumes recombination value) for Induction 2 plane, West TPC | ADC/e- |
| egain_c_wtpc | real | Electronics gain measured with cosmic muons (assumes recombination value) for Collection plane, West TPC | ADC/e- |
| egain_i1_etpc | real | Electronics gain measured with cosmic muons (assumes recombination value) for Induction 1 plane, East TPC | ADC/e- |
| egain_i2_etpc | real | Electronics gain measured with cosmic muons (assumes recombination value) for Induction 2 plane, East TPC | ACD/e- |
| egain_c_etpc | real | Electronics gain measured with cosmic muons (assumes recombination value) for Collection plane, East TPC | ADC/e- |
| diffusion_l | real | Longitudinal diffusion constant | cm2/s |
| diffusion_t | real | Transverse diffusion constant | cm2/s |

\* More information on DocDB 33432.

### tpc_yz_correction
- Folder description: This folder contains the non-uniformity map for the YZ plane. The map is a 2D histogram of Y=4m and Z=5m with a bin width of 5 cm on both directions. Therefore 400/5=80 bins along Y direction, and 500/5=100 bins along Z direction
- Channel number: The channel number has no physical meaning. This table is better described by the bin number/edges for each entry
- Number of rows: 2 (2 TPCs) x 80 (bins along Y) x 100 (bins along Z) = 16,000
- URL with current values in Production Database:

| Variable Name | Type | Description | Unit |
| ------------- | ---- | ----------- | ---- |
| tpc | text | W = west TPC, E = east TPC | N/A |
| ybin | integer | Bin number in Y direction, from 0 to 79 | N/A |
| zbin | integer | Bin number in Z direction, from 0 to 99 | N/A |
| ylow | real | Low-edge bin position in Y direction | cm |
| yhigh | real | High-edge bin position in Y direction | cm |
| zlow | real | Low-edge bin position in Z direction | cm |
| zhigh | real | High-edge bin position in Z direction | cm |
| scale | real | Non-uniformity scale for a point on the YZ plane | N/A |

### tpc_x_correction
- Folder description: This folder contains the non-uniformity map for the X direction. The map is a 1D histogram of X=4m with a bin width of 10 cm. Therefore 400/10=40 bins along X direction
- Channel number: The channel number has no physical meaning. This table is better described by the bin number/edges for each entry
- Number of rows: 2 (2 TPCs) x 40 (bins along X) = 80
- URL with current values in Production Database:

| Variable Name | Type | Description | Unit |
| ------------- | ---- | ----------- | ---- |
| tpc | text | W = west TPC, E = east TPC | N/A |
| xbin | integer | Bin number in X direction, from 0 to 79 | N/A |
| xlow | real | Low-edge bin position in X direction | cm |
| xhigh | real | High-edge bin position in X direction | cm |
| scale | real | Non-uniformity scale along X direction | N/A |
