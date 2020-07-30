---
layout: page
title: Running at CERN
---



Running at CERN
==================================================

Code has been installed on both the \'upstairs\' (pcatlasst01/pc04-warp)
and \'downstairs\' (128.141.178.100) machines. Note the upstairs one is
an Ubuntu machine (for which we hack SLF6 installs to work), while the
downstairs one is CentOS7 (for which SLF7 works fine).



**\'Upstairs\' server**
----------------------------------------------------------



### Logging in

Login to the CERN network (lxplus.cern.ch) with your CERN username and
password

Loggin: ssh <icadaq@pcatlasst01.cern.ch>\
Password: same as username



### Remember to unplug the trigger from the SPEXI board (5th output from the top).



Setting up the software:
-------------------------------------------------------------------

Do:

    source artdaq_dev/setup_icartdaq.sh



Then we will run out of a development area:
---------------------------------------------------------------------------------------------------------

Do:

    cd artdaq_dev/sbndaq_Jan2019/
    source localProducts_sbndaq_v0_01_03_e15_prof/setup 
    mrbslp



Running the DAQ:
---------------------------------------------------

If everything has been setup you can run the DAQ in \"test-stand\" mode
with artdaqDriver:

    artdaqDriver -c srcs/sbndaq/cern50l/artdaqDriver/IcarusTPC_driver.fcl

Note: \'IcarusTPC_driver.fcl\' file is meant to run TPC board

Wait till you see the list of available boards with a status.\
Once the list appears, press \'TRIGGER\' button on the bottom pulse
generator.\
Then insert the trigger cable back to SPEXI (the same one you
disconnected before).



If you need to stop an ongoing run, you can do Ctrl-C, but also remember to kill any orphaned art threads:
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    killall -9 art 



Analyzing data:
-------------------------------------------------

TPC data are written here:\
/Data1/sbndaq_data/common

    art -c IcarusTPC_Anal.fcl -n -1 -S <file_list> -T <output_file>

Note: if you skip the \' -T \<output_file\>\' command the output_file
will have the same name as the \'fcl\' file, but with the \'root\'
extension.



### Setting up



**\'Downstairs\' server**
--------------------------------------------------------------



### Logging in

Login to the CERN network (lxplus.cern.ch) with your CERN username and
password

Loggin: ssh -p 7022 <icarus@128.141.178.100>\
Password: Traccione



Setting up the software
--------------------------------------------------------------------

Do:\

    source /software/products/setup
    setup mrb

Then we will run out of a development area:\

    cd sbndaq_dev
    source localProducts_sbndaq_*/setup
    mrbslp



Building the software
--------------------------------------------------------------

If you make a change to the code, you will need to rebuild and install
it. To do that:\

    cd $MRB_BUILDDIR
    mrbsetenv
    mrb i -j8

Check for any compilation errors. If everything is ok, you should see a
lot of lines saying \"Installing \<xxx\>\".



Running the DAQ
----------------------------------------------------

If everything has been setup you can just run the DAQ in \"test-stand\"
mode with artdaqDriver:

    artdaqDriver -c CAENV1730_driver.fcl

(where `CAENV1730_driver.fcl` is the name of the driver configuration
file).

Check the driver configuration file for:

-   number of events to run
-   run number to assign
-   trigger options
-   sleeping time between software triggers (\"GetNextSleep\", in us)
-   output file name/location!

If you need to stop an ongoing run, you can do `Ctrl-C`, but also
remember to kill any orphaned `art` threads:\

    killall -9 art

If you\'re running overnight, you can send the output to a log file, and
tell the program to continue even if you log out:

    nohup artdaqDriver -c CAENV1730_driver.fcl >& daq.log &



Analyzing data
--------------------------------------------------

There is a simple waveform analysis code located here:

`srcs/sbndaq-artdaq/sbndaq-artdaq/ArtModules/Common/CAENV1730WaveformAna_module.cc`

Feel free to make changes there! (Just remember to rebuild.)

To run that module:

    art -c CAENV1730_WaveformAna.fcl -n -1 -S <file_list> -T <output_file>

where \<file_list\> is a text file containing the list of artdaq output
ROOT files to process, and \<output_file\> is the output file for the
TTrees.

(If you browse around in the ROOT file, you\'ll find the trees/leaves.)
