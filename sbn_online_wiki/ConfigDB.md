---
layout: page
title: SBN DAQ Configuration DB Instructions
hero_height: is-small
---

Some useful resource for instructions is located on the [artdaq wiki conftool.py instruction page](https://cdcvs.fnal.gov/redmine/projects/artdaq-utilities/wiki/Artdaq-config-conftool).

Useful note: `conftool.py` commands have tab completion, and you can even tab complete configuration names in the conftool.py functions. 

## Basic operations

As a basic description, here's a step-by-step guide for making a new configuration:

(1) Setup database software

`source ~/DAQ_DevAreas/DAQ_SHIFTER_CURRENT/DAQInterface/setup_daqinterface.sh`
 
(2) Makes/move yourself into a clean work directory. There's a special function setup for that:

`configdb_make_work_dir`

(3) Pull down the a configuration to start from.

To see the full list of configurations, you can do

`conftool.py getListOfAvailableRunConfigurations`

Then, find one that you want to use as a base (generally recent working ones). Note you don't need to list the version number at the end if you want the default, which is the most recent/latest version. Then, issue the command:

`conftool.py exportConfiguration <config_name>`

Note "export" means you are exporting _from_ the configuration database _to_ your local area.
 
(4) Make your changes.

The previous command will setup a directory that has the configuration files in them. Modify what you would like there. There are a few things to note:
 * The run control will list/automatically select the components you include in your FCL files here (assuming they are also in the `known_boardreaders_list`). It's best to include only the components that are needed for your configuration here. It is always possible to remove components from the RC GUI, but it is not possible to add new ones if they are not part of the configuration.
 * Only fcl files that fit a matching schema are recognized by the configuration database. If you are adding new types of files, then it may be necessary to add those files to the `schema.fcl` files (in your config working area). You will get an error on importing configurations if there is a file for which the schema does not fit.
 * You may pull in configurations from other locations/other exported configs, as needed, but please make sure when you do the import of the final configuration that there is only one folder located in your working area, otherwise there will be the potential for cross-configurations.
 

(5) Import your configuration back to the database

From the top level of your working area (that you made in step 2), you should "import" _into_ the configuration database from your working area the configuration. When doing so, you should assign a name to the config -- the configuration DB will automatically append a version number to the name you give (picking 00001 for a new config, or incrementing from the previous if this is the same prefix name)

`conftool.py importConfiguration testConfigName`
 
 Note that it should start lowercase, with upper-case letters for starts of new words. If the configuration name must end in a number, add a hyphen as the last part of the config name (so, `testConfigThreshold200-`).
 
## Additional operations

There is a concept of marking configurations as _active_ and _inactive_ -- _inactive_ configurations will not be displayed in the RC GUI and cannot be run. Typically we want to label any configuration that should not longer be used as _inactive_: configurations that are outdated, or no longer valid, or just no longer needed.

`sbndaq` has some additional DB utility functions defined that make declaring configurations active or inactive easier. With sbndaq setup (_and_ `artdaq_database` setup ... so likely do `source setup_daqinterface.sh` in the current DAQInterface area to be sure to pick it up), you can issue from the commandline:

`markConfigInactive.py <config_name>`

to mark a configuration inactive, and 

`markConfigActive.py <config_name>`

to make a configuration active again.

To mark all 'older' versions of configurations inactive (generally a good idea), you can issue the command:

`markOlderConfigsInactive.py`.
