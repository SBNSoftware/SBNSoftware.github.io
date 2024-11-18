# SBND Calibration Database

Author: Marina Reggiani-Guzzo, PDRA at University of Edinburgh, mguzzo@ed.ac.uk

Last update: 23 May 2024

Hi there, this document contains all the information you need to know about the SBND calibration database. Please contact the author if you find any wrong/outdated information on this page.

**General comments**
- This page is under construction, this message will be removed when the displayed information is definite!
- If you are working on the SBND calibration, please check if the information for your calibration is listed below, otherwise please update [SBND Calibration Database Spreadsheet](https://docs.google.com/spreadsheets/d/1xbAhb6WnmxbwKxFc-4nnInjHdH8A50S6Zgh0mfZrSF4/edit#gid=217643219)

# Databases

There are two databases for SBND: **development database** and **production database**. The "development database" is an intermediate stage used to validate the values that will later on be uploaded to the "production database", which is the one accessed by analyser modules and simulations. That means that, every time the database needs to be updated (whether it is a value changing, or including/removing variables) it will be implemented in the "development database" first. The change should be validated by the person requesting the change, and once confirmed that everything looks ok, the changes will be pushed to the "production database".

# Folders

Each database is a set of multiple folders. Each folder contain the following 4 tables:
- **table_data**: contains information about channel number and all the desired columns
  - **__iov_id**: automatically created. integer representing the number of uploads was done, starting from 1, it matches with iov_id in table_tag_iovs
  - **channel**: automatically created. 
  - **variables**: list of variables included manually by us (find the list of these variables below)
- **table_iovs**: contains information about the moment when the table was filled via the bin/write_data.py script
  - **iov_id**: integer representing the number of uploads was done, starting from 1
  - **begin_time**: automatically filled when a table it uploaded to the database (format: YYYY-MM-DD HH:MM:SS)
  - **active**: boolean variable indicating if table is active (flag=t) or deactive (flag=f) in the database
- **table_tags**: contains a description of the uploaded data, automatically filled via the bin/tag_data.py script
  - **tag**: tag chosen by the user to refer to this entry, usually vXrY (eg. v1r1, v1r2)
  - **created**: format YYYY-MM-DD HH:MM:SS
  - **comments**: analougos to “commit” on GitHub, contains a brief description of the content in current version
- **table_tag_iovs**: contains information linking the tag variable in table_tags to the iov_id one in table_iovs

This section displays a list of the variables in the database, as well as their description and unit.

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

### pds_globalconstants
- Folder description: This folder contains non-channel specific information
- Channel number: No meaning
- Number of rows: 1
- URL with current values in Production Database:

| Variable Name | Type | Description | Unit |
| ------------- | ---- | ----------- | ---- |
| gauss_wc      | real | WC parameter for Gauss noise filter | GHz |
| gauss_w_wc_power | real | Power parameter for Gauss noise filter | N/A | 
| ophit_adc_deco_threshold | int | ADC threshold for selecting ophits on deconvolved signal | N/A | 
| 1spe_amp | real | Mean amplitude of SPE | ADC |

### What happens when a variable does not exist in an older version of the database?

In a scenario where a variable has to be added to the database later on, it has been decided that this variable will assume the value of `-999` for older version, and therefore should be defined manually by the user when doing analysis. For example, imagine that the first version of the database contains the variables `version1=['field_response','sce']`, but then a few months we learn that we should also include `diffusion`, so the second version of the database will contain the variables `version2=['field_response','sce','diffusion']`. So what happens when someone wants to perform an analysis with an older version of the database? It will lack the information about `diffusion` in this simple example. There are two possible solutions for this situation:
1. Either the latest value is assumed automatically, or
2. An "error/non-physical" value (such as `-999`) is set to the variable for older versions to indicate that the variable was not measured back then.
Option (1) is not ideal because the latest value might not be valid/true for an older version of the database, so we'd be risking making automated wrong assumptions. Option (2) is the one used for the SBND calibration database, which means that the analyser should make a decision of which value to use, and make sure that the assumptions taken are valid.

# Managing the database

Please find a detailed tutorial on how to manage the database here: [How to manage your database?](sbnd_calibration_database_instructions_how_to_manage.md)
