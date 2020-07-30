---
lang: en
title: Wibtools
---

[]{#Wibtools}

Wibtools[¶](#Wibtools){.wiki-anchor}
====================================

[]{#Running-DAQInterface}

Running DAQInterface[¶](#Running-DAQInterface){.wiki-anchor}
------------------------------------------------------------

See instruction/documentation/etc. at the artdaq-daqinterface page:
<https://cdcvs.fnal.gov/redmine/projects/artdaq-utilities/wiki/Artdaq-daqinterface>.

To setup a develop area for sbndaq on your own account, follow these
steps:

1.  Login to a machine on the desired DAQ cluster. For example:

        ssh <username>@sbnd-daq00.fnal.gov

    \
    and then do:

         setup sbndaq v#_##_## -q e17:prof:s82

```{=html}
<!-- -->
```
1.  Make sure you have the `sbndaq` repository pulled down in your
    working area (for setting up a working area, see the [Installation
    Instructions](Installation_Instructions.html){.wiki-page})

```{=html}
<!-- -->
```
1.  Setup the common sbndaq local products area:

         source localProducts_sbndaq_v#_##_##_e17_prof_s82/setup

```{=html}
<!-- -->
```
1.  Setup the latest version of wibtools we are based:

         unsetup wibtools

    \
    and then do:

         setup wibtools v0_00_10 -q e17

```{=html}
<!-- -->
```
1.  To check the latest version of sbndaq you can do:

         cd build_slf7.x86_64

         mrb i -j8

         ups active

```{=html}
<!-- -->
```
1.  Go to the sbndaq repository pulled down in your working area by
    going up one directory:

         cd ..

```{=html}
<!-- -->
```
1.  To run the DAQInterface go to the correct directory:

         cd srcs/sbndaq/dab/DAQInterface

```{=html}
<!-- -->
```
1.  Now you will need to edit the following files.\
    a) edit the known_boardreaders_list file

         emacs known_boardreaders_list

    Make sure that the wib101 is included there and put it under
    `localhost`.\
    b) edit the boot.txt file

         emacs boot.txt

    Put the EventBuilder1, DataLogger1 and Dispatcher1 in `localhost`
    and comment out the two more EventBuilders and three more
    DataLoggers.\
    c) edit the MessageFacility.fcl file

         emacs MessageFacility.fcl

    and make sure that host is `localhost`. In the current git
    repository it is `sbnd-daq33-priv`.\
    d) edit the wib101.fcl file in the directory configs/standard

         emacs configs/standard/wib101.fcl

    and make sure that the WIB address is `sbnd-wib101` and WIB metrics
    dim IDName is `wib101`

```{=html}
<!-- -->
```
1.  At this point make sure that you are in the correct directory
    namely:

         srcs/sbndaq/dab/DAQInterface

```{=html}
<!-- -->
```
1.  Edit the run file

         emacs run

    and set the daqcomponents by adding

         setdaqcomps.sh wib101

    in the code and commenting out the all the other `setdaqcomps`. This
    identifies which fickle file it will be using.

```{=html}
<!-- -->
```
1.  At this point it is advisable to open up another terminal and login
    to the machine on the desired DAQ cluster. For example:

        ssh <username>@sbnd-daq00.fnal.gov

    we do this because the build environment is different than the run
    environment. For future references the old terminal you have been
    using for steps 1-10 will be called the first window and the new
    terminal will be called the second window.

```{=html}
<!-- -->
```
1.  In the second window go to the correct directory:

         cd <your_work_directory>/srcs/sbndaq/dab/DAQInterface

```{=html}
<!-- -->
```
1.  In both windows, do:

         source ./setup_daqinterface.sh

```{=html}
<!-- -->
```
1.  In the second window introduce the DAQInterface:

         DAQInterface &

    You should get a message like

         DAQInterface in partition 3 launched and now in "stopped" state, listening on port 13000

```{=html}
<!-- -->
```
1.  In the first window do:

         source ./run

    On running this command you should get a message in the first window
    like

        Nil
        booting
        botting

    and in the second window you should get a message like

        Sun Jul 28 18:36:24 CDT 2019: BOOT transition underway 

```{=html}
<!-- -->
```
1.  After the process is complete, in the first window you will get a
    message like

         Killing DAQInterface listening on partition 3

    and it will hang up. We expect it to crash because we have not
    finished converting the wibtools. You can Control+C it. In the
    second window if you scroll up a little you will find a message like

        localhost:13100; try checking logfile
        sbnd-daq00.fnal.gov:/daq/log/wib101-sbnd-daq00-13100/wib101-sbnd-daq00-13100-20190725133000-16383.log

    \
    You can open up the logfile and check for error messages. Sometimes
    there will be a lot of informational messages and sometimes the
    crash will not be obvious. We will stop here for now and will update
    this wiki page after wibtools have been updated.

```{=html}
<!-- -->
```
1.  To list all info messages created by the WIBReader_generator, search
    for **WIBReader** in the trace buffer:\

           tshow | grep WIBReader

    \
    Anything starting with TLOG in the Board Reader will be sent to the
    trace circular buffer. Prior to starting **DAQInterface** you should
    run the command **treset** to clear the trace buffer, to avoid
    confusion with previous runs.
