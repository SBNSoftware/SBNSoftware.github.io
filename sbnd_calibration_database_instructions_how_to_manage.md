**Author:** Marina Reggiani-Guzzo, PDRA at the University of Edinburgh (Last update: 24/May/2024)

Managing the database consists of 3 steps:

1. Set up environment to be able to run the necessary scripts
2. Create a schema in the database
3. Create a table in the database
4. Write values to the table in the database
5. Evaluate which tables you want to include in the next tag
6. Tag the latest update

This tutorial covers each of the steps described above.

A few of the steps above use scripts inherited from Minerva, so please clone the following repository to your working area:
```
exp/sbnd/data/users/mguzzo/calib_dbs/mnvcon_ups_6.6_modified
```

## Step 1 Set up environment

The first thing to do is to set up the environment to be able to run the necessary scripts inherited from Minerva:
```
ssh <username>@sbndgpvm01.fnal.gov
cd /exp/sbnd/data/users/<username>/calib_db/mnvcon_ups_6.6_modified/
source setup.sh
source /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh
setup sbndcode v09_82_02_01 -q e26:prof
```
Note that the scripts in the next steps do not seem to work for Python versions before `v3`.

## Step 2 Create a schema in the database

In case you want to create a new schema in the database, follow the steps below. However you will likely use an already existing schema, in this case you can simply skip this step.

In order to create a schema in the database, you should first access the database as follows (I suggest that you do it on a separate terminal):

```
# access sbndgpvm01
ssh <username>@sbndgpvm01.fnal.gov

# access gateway (if 'Permission Denied' ask William Badgett to add you to the sbnd .k5login file)
ssh -K sbnd@sbnd-gateway01.fnal.gov

# log into the database (if 'Permission Denied' talk to Olga Vlasova)
psql -U <username> -h <host> -p <port> -d <database_name> 
```

Find below the host/port/database values for accesing the development/production databases:

| Description | Host (-h) | Port (-p) | Database name (-d) |
| ----------- | --------- | --------- | ------------------ |
| Development Database | cdpgsdev | 5488 | sbndteststand |
| Production Database | ifdb09 | 5456 | sbnd_online_prd |

Once logged into the database, you can create a new schema by first setting its "role" and then creating it. Find below the commands used to create the schema for the "development database":

```
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

Your schema is now created. The command below displays the list of tables within the schema, so you can see that the schema is currently empty:

```
sbnteststand=> SELECT table_name FROM information_schema.tables WHERE table_schema='sbnd_calib_dev';
 table_name 
------------
(0 rows)
```

## Step 3 Create a table

In order to populate your schema, you should first create a table with the variables you want. To do so we use the script `mnvcon_ups_6.6_modified/bin/write_data.py` that is automated to create all the default Fermilab tables, as described in [Folders](https://github.com/mrguzzo/SBNSoftware_copy.github.io/blob/master/sbnd_calibration_database.md#folders). 

**Important!!!** This command creates an empty table _even if the table already exists_, in this case it gets overritten! So be careful! If you only want to **update** an existing table, go directly to the next step!

Ok, now that you've been warned, let's take a look at how to create a new/empty table, the command is:

```
python bin/create_table.py -c -t t -h <host> -p <port> -U <username> -w <password> -W <writer> -R <reader> -n <name> <database_name> <table_name> \ <var1>:<VAR1_TYPE> \ <var2>:<VAR2_TYPE>
```

Note: remember to [set up the environment](#step-1-set-up-environment) first and to run the command above from the sbndgpvm01 machine (not the gateway).

| Description | Password (-w) | Writer (-W) | Reader (-R) | Name (-n) |
| ----------- | ------------- | -- | -- | -- |
| Dev. Db. | Request pwd | sbnd_calib_writer | sbnd_calib_reader | sbnd_calib_dev |
| Prod. Db. | Request pwd | | | |

### Example of the process of creating a table

From an empty schema:

```
sbnteststand=> SELECT table_name FROM information_schema.tables WHERE table_schema='sbnd_calib_dev';
 table_name 
------------
(0 rows)
```

You can create the tables described in [Folders](https://github.com/mrguzzo/SBNSoftware_copy.github.io/blob/master/sbnd_calibration_database.md#folders) as follows:

```
sbndgpvm01$ python bin/create_table.py -c -t t -h cdpgsdev -p 5488 -U mguzzo -w <password> -W sbnd_calib_writer -R sbnd_calib_reader -n sbnd_calib_dev sbnteststand tpc_channelstatus_data \ wire_number:INTEGER \ flange:TEXT \ board:INTEGER \ localchannel:INTEGER \ status:INTEGER \ low:REAL \ high:REAL
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
And as a result the originally empty table will be populated with the following tables
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
Whose content is:
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
As mentioned above, the command `bin/create_table.py` simply creates the tables with the desired variables (in this example it is `wire_number`, `flange`, `board`, `localchannel`, `status`, `low` and `high`), however the tables are still empty (all of them have `0 rows` of entries). The next step will describe how to populate these tables.

## Step 4 Populate tables

This section describes how to populate the tables in your schema. Keep in mind that this process is also used if you want to **update** an already existing table, it will be more clear later in this section why this is the case, please bear with me!

Likewise the previous section, we also use a script from `mnvcon_ups_6.6_modified` to populate the tables, so make sure you have correctly [set up the environment](#step-1-set-up-environment). The overall command is:

```
python bin/write_data.py -n <name> -h <host> -p <port> -U <username> -w <password> \<path_to_csv_file.csv> \<timestamp> \<database_name> <table_name> <var1>,<var2>,<var3>
```

Note that `<timestamp>` is a Unix Timestamp, and that `<path_to_csv_file.csv` points to the csv file containing the values you want to add to the table.

### Example of the process of populating tables

Let's see what happens to the schema when we run the command above. Take the following example (where the values have no physical meaning, it's just for example purposes):
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
sbndgpvm01$ python bin/write_data.py -n sbnd_calib_dev -h cdpgsdev -p 5488 -U mguzzo -w <password> \/sbnd/data/users/mguzzo/calib_dbs/update_tpc_channelstatus_data_1706793247.csv \1706793247 \sbnteststand tpc_channelstatus_data wire_number,flange,board,localchannel,status,low,high
opts =  [('-n', 'sbnd_calib_dev'), ('-h', 'cdpgsdev'), ('-p', '5488'), ('-U', 'mguzzo'), ('-w', '<password>')]
args =  ['/sbnd/data/users/mguzzo/calib_dbs/update_tpc_channelstatus_data_1706793247.csv', '1706793247', 'sbnteststand', 'tpc_channelstatus_data', 'wire_number,flange,board,localchannel,status,low,high']
[write_data.py] t =  1706793247
[write_data.py] tname =  tpc_channelstatus_data
[write_data.py] columns =  ['wire_number', 'flange', 'board', 'localchannel', 'status', 'low', 'high']
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
 tag | created | comments 
-----+---------+----------
(0 rows)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_tag_iovs;
 tag | iov_id 
-----+--------
(0 rows)
```
As you can see:
1. The numerical values filled the table `tpc_channel_status_data_data`, and got labelled as `__iov_id=1` since this is the first time the table is being populated
2. The table `tpc_channelstatus_data_iovs` got filled with the timestamp relative to `iov_id=1` as well as the tag `active=t` indicating that the `iov_id=1` is currently active in the database, which means that the values with `__iov_id=1` are the ones that will be available when accessing the database.

Take a look what happens if you run the `bin/write_data.py` once again:

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

See that the same values got added to the table (because we're still using the same csv file as input) right below the previous values, they are now associated to `iov_id=2` and both `iov_id=1 and 2` are `active=t`. So now you understand that the table will actually always contain all the information ever populated to it, however the accessible information is defined by which `iov_id` is set to active.

## Step 5 Evaluate active tables

The database has a structure where you can "tag" its versions so you can retrieve any specific configuration at any time (similar to the "commit" function in GitHub). Keep in mind that when you tag a version, it will include all the "active" `iov_id`. Therefore, before tagging any version, you should make sure that only the desired `iov_id` is set as `active=t`, the other ones should be set to `active=f` so they are not included in the tag you are about to create. You can switch the active status as:
```
UPDATE <schema>.<table> SET active=false WHERE iov_id=<id_desired>;
```

### Example of how to activate/de-activate tables

See below how this command looks like, starting from a situation where all `iov_id` are set to `active=t`
```
sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_iovs;
 iov_id |     begin_time      | active 
--------+---------------------+--------
      1 | 2024-02-01 07:14:07 | t
      2 | 2024-02-02 06:49:28 | t
(2 rows)
```
you can change the active status as follows:
```
sbnteststand=> UPDATE sbnd_calib_dev.tpc_channelstatus_data_iovs SET active=false WHERE iov_id=1;
UPDATE 1
sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_iovs;
 iov_id |     begin_time      | active 
--------+---------------------+--------
      2 | 2024-02-02 06:49:28 | t
      1 | 2024-02-01 07:14:07 | f
```
Where now only `iov_id=2` is set as active.

## Step 6 Tag a version

Once you are happy with the list of active `iov_id`, you can tag the version by using the command:
```
python bin/tag.py -h <host> -p <port> -U <username> -w <password> -n <name> -c "<commit_description>" <database_name> <table_name> "<tag_name>"
```

### Example of tagging versions

Let's see what happens when we tag a version with a single `iov_id` active, and then when there are multiple ones active.

1. Only one active iov_id: first check which are the active uploads:

```
sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_iovs;
 iov_id |     begin_time      | active 
--------+---------------------+--------
      2 | 2024-02-02 06:49:28 | t
      1 | 2024-02-01 07:14:07 | f
(2 rows)
```
Now, from the sbndgpvm, tag this version:
```
sbndgpvm01$ python bin/tag.py -h cdpgsdev -p 5488 -U <username> -w <password> -n sbnd_calib_dev -c "First commit" sbnteststand tpc_channelstatus_data "v1r1"
[tag.py] tag =  v1r1
[tag.py] comment =  First commit
{'iov_id': 'bigint', 'begin_time': 'timestamp without time zone', 'active': 'boolean'}
```
and the output will be:
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
      2 | 2024-02-02 06:49:28 | t
      1 | 2024-02-01 07:14:07 | f
(2 rows)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_tags;
 tag  |          created           |   comments    
------+----------------------------+---------------
 v1r1 | 2024-02-02 05:58:54.588726 | First commit
(1 rows)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_tag_iovs;
 tag  | iov_id 
------+--------
 v1r1 |      2
(1 rows)
```

2. However, if we had forgotten to de-activate `iov_id=1` before tagging, then the output would be:

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

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_tags;
 tag  |          created           |   comments    
------+----------------------------+---------------
 v1r1 | 2024-02-02 05:58:54.588726 | First commit
(1 rows)

sbnteststand=> SELECT * FROM sbnd_calib_dev.tpc_channelstatus_data_tag_iovs;
 tag  | iov_id 
------+--------
 v1r1 |      1
 v1r1 |      2
(1 rows)
```

The last table `_tag_iovs` gives the list of active iov_id per tag. Ideally you want to have only one per tag! The reason is very simple: the LArSoft modules read the database from the top to the bottom. So imagine you have 4 channels, like in the example above. If your tag has more than one active `iov_id`, then your module will always read the values related to the oldest `iov_id`, instead of the newest one.
