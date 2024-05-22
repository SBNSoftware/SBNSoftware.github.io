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

### Create schema in database

If you want to create a new schema in the database you can do it as follows:
```
# access sbndgpvm01
ssh <username>@sbndgpvm01.fnal.gov

# access gateway (if 'Permission Denied' ask William Badgett to add you to the sbnd .k5login file)
ssh -K sbnd@sbnd-gateway01.fnal.gov

# log into the database (if 'Permission Denied' talk to Olga Vlasova)
psql -U <username> -h cdpgsdev -p 5488 -d sbnteststand

# once in the database, create the schema
SET ROLE sbnd_calib_dev;
CREATE SCHEMA IF NOT EXISTS sbnd_calib_dev;
```

At this point you can display the list of schemas:
```
sbnteststand=> \dn
         List of schemas
      Name      |     Owner      
----------------+----------------
 alarms_dev     | badgett
 calib_dev      | calib_dev
 csu_gizmo      | postgres
 dcs_alarm      | ilepetic
 dcs_archiver   | dcs_admin
 public         | postgres
 runcon         | runcon
 sbnd_calib_dev | sbnd_calib_dev          <-------- see here the one created now
 ucon_dev       | ucon_admin
(9 rows)
```
Your schema is now created. You can check that the schema is currently empty:
```
sbnteststand=> SELECT table_name FROM information_schema.tables WHERE table_schema='sbnd_calib_dev';
 table_name 
------------
(0 rows)
```
The next sections will explain how to populate your schema.

### Create a table

In order to populate your schema, you should first create a table with the variables you want. The command to create a table is (Important: This command should only be used once when you are creating the database for the first time. Otherwise it will create a new table and replace the existing one by the new empty one, and we do not usually want that. So be careful!):
```
python bin/create_table.py -c -t t -h cdpgsdev -p 5488 -U <username> -w <password> -W sbnd_calib_writer -R sbnd_calib_reader -n sbnd_calib_dev sbnteststand <table_name> \ <var1>:<VAR1_TYPE> \ <var2>:<VAR2_TYPE>
```
Please note that the variable name is in lower case, whilst the variable type is in capital case. See below an example of the process of creating a table:
```
sbndgpvm01$ python bin/create_table.py -c -t t -h cdpgsdev -p 5488 -U <username> -w <password> -W sbnd_calib_writer -R sbnd_calib_reader -n sbnd_calib_dev sbnteststand tpc_channelstatus_data \ wire_number:INTEGER \ flange:TEXT \ board:INTEGER \ localchannel:INTEGER \ status:INTEGER \ low:REAL \ high:REAL
time_type = t
Creating folder tpc_channelstatus_data in namespace sbnd_calib_dev with columns:
     wire_number : INTEGER
     flange : TEXT
     board : INTEGER
     localchannel : INTEGER
     status : INTEGER
     low : REAL
     high : REAL
Will drop existing folder
timestamp without time zone

                create table tpc_channelstatus_data_iovs (
                    iov_id      bigserial   primary key,
                    begin_time  timestamp without time zone,
                    active      boolean    default 'true');
                create index tpc_channelstatus_data_iovs_begin_time_inx on tpc_channelstatus_data_iovs(begin_time);

                create table tpc_channelstatus_data_tags (
                    tag         text    primary key,
                    created     timestamp,
                    comments    text
                );

                create table tpc_channelstatus_data_tag_iovs (
                    tag     text    references tpc_channelstatus_data_tags(tag) on delete cascade,
                    iov_id  bigint  references tpc_channelstatus_data_iovs(iov_id) on delete cascade,
                    primary key (tag, iov_id)
                );

                create table tpc_channelstatus_data_data (
                    __iov_id  bigint  references tpc_channelstatus_data_iovs(iov_id) on delete cascade,
                    channel bigint default 0, 
                     wire_number INTEGER, flange TEXT, board INTEGER, localchannel INTEGER, status INTEGER, low REAL, high REAL,
                    primary key(__iov_id, channel)); 
{'iov_id': 'bigint', 'begin_time': 'timestamp without time zone', 'active': 'boolean'}
Folder created
```
Output:
```
sbnteststand=> SELECT table_name FROM information_schema.tables WHERE table_schema='sbnd_calib_dev';
           table_name            
---------------------------------
 tpc_channelstatus_data_data
 tpc_channelstatus_data_iovs
 tpc_channelstatus_data_tags
 tpc_channelstatus_data_tag_iovs
(4 rows)
```
As you can see, the script automatically creates the four tables described in [Folders](#folders). The recently created tables are empty:
```
sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_data;
 __iov_id | channel | wire_number | flange | board | localchannel | status | low | high 
----------+---------+-------------+--------+-------+--------------+--------+-----+------
(0 rows)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_iovs;
 iov_id | begin_time | active 
--------+------------+--------
(0 rows)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_tags;
 tag | created | comments 
-----+---------+----------
(0 rows)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_tag_iovs;
 tag | iov_id 
-----+--------
(0 rows)
```
See next section to understand how to fill the tables.

### Write table to database

In order to write valued on your tables, you should provide them as a `.csv` file. Take the following example (where the values have no physical meaning, it's just for example purposes):
```
sbndgpvm01$ cat /sbnd/data/users/mguzzo/calib_dbs/update_tpc_channelstatus_data_1706793247.csv
0,0,EE01M,0,63,4,0.0,0.0
1,1,EE01M,0,62,4,0.0,0.0
2,2,EE01M,0,61,4,0.0,0.0
3,3,EE01M,0,60,4,0.0,0.0
```
Where the columns represent `channel number`, `wire number`, `flange`, `board`, `localchannel`, `status`, `low`, `high` (which is `channel number` followed by the variables listed in the `python bin/create_table.py` command).
The following command writes the values from this file to the tables in the database:
```
sbndgpvm01$ python bin/write_data.py -n sbnd_calib_dev -h cdpgsdev -p 5488 -U <username> -w <password> \/sbnd/data/users/mguzzo/calib_dbs/update_tpc_channelstatus_data_1706793247.csv \1706793247 \sbnteststand tpc_channelstatus_data wire_number,flange,board,localchannel,status,low,high
opts =  [('-n', 'sbnd_calib_dev'), ('-h', 'cdpgsdev'), ('-p', '5488'), ('-U', '<username>'), ('-w', '<password>')]
args =  ['/sbnd/data/users/mguzzo/calib_dbs/update_tpc_channelstatus_data_1706793247.csv', '1706793247', 'sbnteststand', 'tpc_channelstatus_data', 'wire_number,flange,board,localchannel,status,low,high']
[write_data.py] t =  1706793247
[write_data.py] tname =  tpc_channelstatus_data
[write_data.py] columns =  ['wire_number', 'flange', 'board', 'localchannel', 'status', 'low', 'high']
{'iov_id': 'bigint', 'begin_time': 'timestamp without time zone', 'active': 'boolean'}
```
Note that the entry `\1706793247` is a Unix Timestamp. The output of this command is:
```
sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_data;
 __iov_id | channel | wire_number | flange | board | localchannel | status | low | high 
----------+---------+-------------+--------+-------+--------------+--------+-----+------
        1 |       0 |           0 | EE01M  |     0 |           63 |      4 |   0 |    0
        1 |       1 |           1 | EE01M  |     0 |           62 |      4 |   0 |    0
        1 |       2 |           2 | EE01M  |     0 |           61 |      4 |   0 |    0
        1 |       3 |           3 | EE01M  |     0 |           60 |      4 |   0 |    0
(4 rows)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_iovs;
 iov_id |     begin_time      | active 
--------+---------------------+--------
      1 | 2024-02-01 07:14:07 | t
(1 row)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_tags;
 tag | created | comments 
-----+---------+----------
(0 rows)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_tag_iovs;
 tag | iov_id 
-----+--------
(0 rows)
```
As you can see, the numerical values filled the table `tpc_channel_status_data_data`; the table `tpc_channelstatus_data_iovs` got filled with the timestamp relative to `iov_id=1` as well as the tag `active=t` indicating that the `iov_id=1` is currently active in the database, which means that the values with `__iov_id=1` are the ones that will be available when accessing the database.

### Tag the table

Similarly to the "commit" command in GitHub, it is possible to tag the uploads to the database, making it easier to identify what got changed/updated. To tag a table, use the following command:
```
sbndgpvm01$ python bin/tag.py -h cdpgsdev -p 5488 -U <username> -w <password> -n sbnd_calib_dev -c "First commit" sbnteststand tpc_channelstatus_data "v1r1"
[tag.py] tag =  v1r1
[tag.py] comment =  First commit
{'iov_id': 'bigint', 'begin_time': 'timestamp without time zone', 'active': 'boolean'}
```
The output of this command is:
```
sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_data;
 __iov_id | channel | wire_number | flange | board | localchannel | status | low | high 
----------+---------+-------------+--------+-------+--------------+--------+-----+------
        1 |       0 |           0 | EE01M  |     0 |           63 |      4 |   0 |    0
        1 |       1 |           1 | EE01M  |     0 |           62 |      4 |   0 |    0
        1 |       2 |           2 | EE01M  |     0 |           61 |      4 |   0 |    0
        1 |       3 |           3 | EE01M  |     0 |           60 |      4 |   0 |    0
(4 rows)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_iovs;
 iov_id |     begin_time      | active 
--------+---------------------+--------
      1 | 2024-02-01 07:14:07 | t
(1 row)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_tags;
 tag  |          created           |   comments   
------+----------------------------+--------------
 v1r1 | 2024-02-02 05:58:54.588726 | First commit
(1 row)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_tag_iovs;
 tag  | iov_id 
------+--------
 v1r1 |      1
(1 row)
```
As you can see, only tables `tpc_channelstatus_data_tags` and `tpc_channelstatus_data_tag_iovs` got affected. 

**Important**: Please keep in mind that the tag is linked to all **active** tables! Let me give you an example of what happens when we start updating the table. Ok, so if we run `bin/write_data.py` again, we are going to have the following output:
```
sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_data;
 __iov_id | channel | wire_number | flange | board | localchannel | status | low | high 
----------+---------+-------------+--------+-------+--------------+--------+-----+------
        1 |       0 |           0 | EE01M  |     0 |           63 |      4 |   0 |    0
        1 |       1 |           1 | EE01M  |     0 |           62 |      4 |   0 |    0
        1 |       2 |           2 | EE01M  |     0 |           61 |      4 |   0 |    0
        1 |       3 |           3 | EE01M  |     0 |           60 |      4 |   0 |    0
        2 |       0 |           0 | EE01M  |     0 |           63 |      4 |   0 |    0
        2 |       1 |           1 | EE01M  |     0 |           62 |      4 |   0 |    0
        2 |       2 |           2 | EE01M  |     0 |           61 |      4 |   0 |    0
        2 |       3 |           3 | EE01M  |     0 |           60 |      4 |   0 |    0
(9 rows)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_iovs;
 iov_id |     begin_time      | active 
--------+---------------------+--------
      1 | 2024-02-01 07:14:07 | t
      2 | 2024-02-02 06:49:28 | t
(2 rows)
```
Note that the new values simply got added at the bottom of the current table, however they are now linked to `__iov_id=2`. At this stage both `iov_id=1` and `iov_id=2` are set as `active=t`. So what happens if we tag this table as is? Well, 
```
sbndgpvm01$ python bin/tag.py -h cdpgsdev -p 5488 -U <username> -w <password> -n sbnd_calib_dev -c "Second commit" sbnteststand tpc_channelstatus_data "v1r2"
[tag.py] tag =  v1r2
[tag.py] comment =  Second commit
{'iov_id': 'bigint', 'begin_time': 'timestamp without time zone', 'active': 'boolean'}
```
The output will be:
```
sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_tags;
 tag  |          created           |   comments    
------+----------------------------+---------------
 v1r1 | 2024-02-02 05:58:54.588726 | First commit
 v1r2 | 2024-02-02 06:50:18.531701 | Second commit
(3 rows)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_tag_iovs;
 tag  | iov_id 
------+--------
 v1r1 |      1      <---- from "First commit"
 v1r2 |      1      <---- from "Second commit" linked to iov_id 1 and 2
 v1r2 |      2      <---- from "Second commit" linked to iov_id 1 and 2
(3 rows)
```
As you can see, if we now try to retrieve the table based on its `tag=v1r2` it will give us _all_ the entries relative to `__iov_id=1` and `__iov_id=2`. But this is not what we want because ideally each `tag` should be linked to a separate set of data. Therefore, to avoid the situation above, you should make sure to only have the desired `iov_id` (in `tpc_channelstatus_data_iov`) set as `active=t`, whilst the rest should be set to `active=f`. In order to de-activate the not desired `iov` before each tag, please run the command from inside the database:
```
UPDATE sbnd_calib_dev.tpc_channelstatus_data_iovs SET active=false WHERE iov_id=1;
```
See below how it looks like when we first de-activate the iovs and then tag the database:
```
sbnteststand=> UPDATE sbnd_calib_dev.tpc_channelstatus_data_iovs SET active=false WHERE iov_id=1;
UPDATE 1
sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_iovs;
 iov_id |     begin_time      | active 
--------+---------------------+--------
      2 | 2024-02-02 06:49:28 | t
      1 | 2024-02-01 07:14:07 | f
```
from the sbndgpvm01:
```
sbndgpvm01$ python bin/tag.py -h cdpgsdev -p 5488 -U <username> -w <password> -n sbnd_calib_dev -c "De-activating iovs 1" sbnteststand tpc_channelstatus_data "v1r3"
[tag.py] tag =  v1r3
[tag.py] comment =  De-activating iovs 1
{'iov_id': 'bigint', 'begin_time': 'timestamp without time zone', 'active': 'boolean'}

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_data;
 __iov_id | channel | wire_number | flange | board | localchannel | status | low | high 
----------+---------+-------------+--------+-------+--------------+--------+-----+------
        1 |       0 |           0 | EE01M  |     0 |           63 |      4 |   0 |    0
        1 |       1 |           1 | EE01M  |     0 |           62 |      4 |   0 |    0
        1 |       2 |           2 | EE01M  |     0 |           61 |      4 |   0 |    0
        1 |       3 |           3 | EE01M  |     0 |           60 |      4 |   0 |    0
        2 |       0 |           0 | EE01M  |     0 |           63 |      4 |   0 |    0
        2 |       1 |           1 | EE01M  |     0 |           62 |      4 |   0 |    0
        2 |       2 |           2 | EE01M  |     0 |           61 |      4 |   0 |    0
        2 |       3 |           3 | EE01M  |     0 |           60 |      4 |   0 |    0
(9 rows)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_iovs;
 iov_id |     begin_time      | active 
--------+---------------------+--------
      2 | 2024-02-02 06:49:28 | t
      1 | 2024-02-01 07:14:07 | f
(2 rows)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_tags;
 tag  |          created           |          comments          
------+----------------------------+----------------------------
 v1r1 | 2024-02-02 05:58:54.588726 | First commit
 v1r2 | 2024-02-02 06:50:18.531701 | Second commit
 v1r3 | 2024-02-05 07:36:30.512834 | De-activating iovs 1
(3 rows)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_tag_iovs;
 tag  | iov_id 
------+--------
 v1r1 |      1
 v1r2 |      1
 v1r2 |      2
 v1r3 |      2   <---- now this tag only contain the most recently added table, iov_id=2
(4 rows)
```

### Selecting specific iovs

If you want to select a specific `iovs`, first you should check under `_tags` which tag you want, and then under `_tag_iovs` which iovs it's associated with.
For instance, let's consider we want to see the most up-to-date table, where iovs 1 is deactivated (tag=v1r3), this is iov_id=2 so you can select it by running:
```
sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_data WHERE __iov_id=2;
 __iov_id | channel | wire_number | flange | board | localchannel | status | low | high 
----------+---------+-------------+--------+-------+--------------+--------+-----+------
        2 |       0 |           0 | EE01M  |     0 |           63 |      4 |   0 |    0
        2 |       1 |           1 | EE01M  |     0 |           62 |      4 |   0 |    0
        2 |       2 |           2 | EE01M  |     0 |           61 |      4 |   0 |    0
        2 |       3 |           3 | EE01M  |     0 |           60 |      4 |   0 |    0
(4 rows)
```
