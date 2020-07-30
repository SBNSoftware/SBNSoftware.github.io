---
lang: en
title: Running DAQInterface
---

[]{#Running-DAQInterface}

Running DAQInterface[¶](#Running-DAQInterface){.wiki-anchor}
============================================================

See instruction/documentation/etc. in the DAQInterface Manual:
<https://cdcvs.fnal.gov/redmine/projects/artdaq-utilities/wiki/Artdaq-daqinterface>.

**Note:** these instructions are for the **test stand at DAB**, so not
everything here applies to other locations.

The processes of the subcomponents are spawned on the private
subnetworks of the servers. You need to be able to access without a
password, currently we use ssh key exchange. Look at the relevant
instructions at [Setting up your account for ssh access to private
network
connections](Setting_up_your_account_for_ssh_access_to_private_network_connections.html){.wiki-page}

It is now easier and faster to start up and terminate using scripts
`./run` and `./stop`. The rest of the steps are kept down below for
reference and troubleshooting.

To run with a static version of pre-built code, do:

1.  Login to a machine on the desired cluster DAQ cluster. For example,
    for the cluster at DAB:

        ssh username@sbnd-daq33.fnal.gov

2.  Make sure you have the `sbndaq` repository pulled down in your
    working area (for setting up a working area, see the [Installation
    Instructions](Installation_Instructions.html){.wiki-page})

3.  Move to the appropriate DAQInterface directory for the cluster. For
    example, for the cluster at DAB:

        cd srcs/sbndaq/dab/DAQInterface/

4.  Do

        source ./setup_daqinterface.sh

    to set things up properly.

5.  Then do

        kill_daqinterface_on_partition.sh 0

    to kill any running DAQInterface program. Note the partition number
    you are using (here is zero).

6.  Start DAQInterface:

        DAQInterface &

7.  Start up the whole chain of commands with the convenient command

         ./run 

8.  Stop data taking with the script

         ./stop 

*The current status of develop is fairly stable running ptb+pmt+tpc, so
it no longer makes that much sense to keep the **itjustworks** branch up
to date and will be removed soon.*

For people that are only interested in a working version of the
repository there\'s a branch on the main repository with configurations
that work out of the box. For that do:\

    cd path_to/srcs/sbndaq
    git checkout -t origin/itjustworks

------------------------------------------------------------------------

[]{#If-instead-you-want-to-have-more-control-of-the-intermediate-steps-dont-use-run-and-proceed-with}

If instead you want to have more control of the intermediate steps don\'t use `./run` and proceed with:[¶](#If-instead-you-want-to-have-more-control-of-the-intermediate-steps-dont-use-run-and-proceed-with){.wiki-anchor}
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

1.  Pick the BoardReader components you would like to include in a run:

        setdaqcomps.sh pmt01

    To see the list of available components, look at
    `known_boardreaders_list` in the DAQInterface directory.

2.  Send the command to boot the system, which takes a boot text file as
    an input:

        send_transition.sh boot boot.txt

    There is an example in the directory there. Note the EventBuilders,
    DataLoggers, and Dispatchers are specified in this file, as well as
    a standard startup script to perform on all nodes to setup DAQ
    processes.

3.  Configure the system with

        send_transition.sh config standard

    where \'standard\' is the name of a configuration. Currently
    configuration files are kept in the `configs/` directory.

4.  Check to see when configuration is complete (the system is
    \'ready\') using the `status.sh` command.

5.  Start the data-taking run via

        send_transition.sh start

6.  Stop the data-taking run via

        send_transition.sh stop

7.  Stop all DAQ processes with a shutdown command:
    `send_transition.sh shutdown`

8.  Completely kill the system with the terminate command:
    `send_transition.sh terminate`

The location of output data is determined in the DataLogger
configurations (and should typically be sent to a /scratch directory
location). Logs are located in `/logs/`, and details on each run are
located in `/run_records/`.

Note, you may setup and run your own version of the code! To do so,
modify or make a different `setup_sbn_artdaq.sh` setup script that will
use your local area, perhaps something like this:\

    #!/usr/bin/env bash
    source /software/products/setup
    setup mrb
    source <dir_to_work_area>/localProducts_sbndaq_v*_e15_prof/setup
    setup sbndaq v0_01_01 -q e15:prof
    unsetup -j artdaq_daqinterface
    setup artdaq_daqinterface v3_03_01T111318

\
And use this file in the `setup_daqinterface.sh` script and the
`boot.txt` configuration file (or create your own versions of these
too). There are other DAQInterface user options in `user_sourcefile`
that can be modified (but, other than maybe the desired partition,
typically do not need to be).
