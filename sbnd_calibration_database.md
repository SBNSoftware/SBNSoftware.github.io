# SBND Calibration Database

Author: Marina Reggiani-Guzzo, PDRA at University of Edinburgh, mguzzo@ed.ac.uk

Last update: 21 May 2024

Hi there, this document contains all the information you need to know about the SBND calibration database. Please contact the author if you find any wrong/outdated information on this page.

**General comments**
- This page is under construction, this message will be removed when the displayed information is definite!
- If you are working on the SBND calibration, please check if the information for your calibration is listed below, otherwise please update [SBND Calibration Database Spreadsheet](https://docs.google.com/spreadsheets/d/1xbAhb6WnmxbwKxFc-4nnInjHdH8A50S6Zgh0mfZrSF4/edit#gid=217643219)

## Databases

There are two databases for SBND: **development database** and **production database**. The "development database" is an intermediate stage used to validate the values that will later on be uploaded to the "production database", which is the one accessed by analyser modules and simulations. That means that, every time the database needs to be updated (whether it is a value changing, or including/removing variables) it will be implemented in the "development database" first. The change should be validated by the person requesting the change, and once confirmed that everything looks ok, the changes will be pushed to the "production database".

| Description | Name |
| ----------- | ---- |
| Development database | sbnd_calib_dev |
| Production database | |

Each database is a set of multiple folders. Each folder contain the following 4 tables:
- **table_data**: contains information about channel number and all the desired columns
  - **__iov_id**: automatically created. integer representing the number of uploads was done, starting from 1, it matches with iov_id in table_tag_iovs
  - **channel**: automatically created. 
  - **variables**: list of variables included manually by us (find the list of these variables in [Folders](#folders))
- **table_iovs**: contains information about the moment when the table was filled via the bin/write_data.py script
  - **iov_id**: integer representing the number of uploads was done, starting from 1
  - **begin_time**: automatically filled when a table it uploaded to the database (format: YYYY-MM-DD HH:MM:SS)
  - **active**: boolean variable indicating if table is active (flag=t) or deactive (flag=f) in the database
- **table_tags**: contains a description of the uploaded data, automatically filled via the bin/tag_data.py script
  - **tag**: tag chosen by the user to refer to this entry, usually vXrY (eg. v1r1, v1r2)
  - **created**: format YYYY-MM-DD HH:MM:SS
  - **comments**: analougos to “commit” on GitHub, contains a brief description of the content in current version
- **table_tag_iovs**: contains information linking the tag variable in table_tags to the iov_id one in table_iovs

## Folders

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

## Managing the database

In order to manage the database, we use codes inherited from Minerva: `/sbnd/data/users/mguzzo/calib_dbs/mnvcon_ups_6.6_modified`. So please go ahead and create a copy of this repository on your working area. This section will cover how to create and upload values to the database, how to check the values on the database, as well as the details you should pay attention to when updating the database.

The first thing to do is to set up the environment to be able to run the necessary scripts from the folder above:
```
ssh <username>@sbndgpvm01.fnal.gov
cd /exp/sbnd/data/users/<username>/calib_dbs/mnvcon_ups_6.6_modified/
source setup.sh
source /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh
setup sbndcode v09_82_02_01 -q e26:prof
```
Note that the scripts in the next steps do not seem to work for Python versions before `v3`. Just for the record, I am currently using `v3.9.13`.

Managing the database consists of 3 steps: (1) create a table, (2) write table to database and (3) tag the latest update. Let's cover each step in details below.

**Create a table**

Important: This command should only be used once when you are creating the database for the first time. Otherwise it will create a new table and replace the existing one by the new empty one, and we do not usually want that. So be careful!
```
python bin/create_table.py -c -t t -h cdpgsdev -p 5488 -U <username> -w <password> -W sbnd_calib_writer -R sbnd_calib_reader -n sbnd_calib_dev sbnteststand <table_name> \ <var1>:<VAR1_TYPE> \ <var2>:<VAR2_TYPE>
```
Please note that the variable name is in lower case, whilst the variable type is in capital case.
