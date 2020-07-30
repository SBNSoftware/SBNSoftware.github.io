---
lang: en
title: Running PTB in Standalone Mode
---

[]{#Running-the-PTB-in-Standalone-Mode}

[Running the PTB in Standalone Mode](Running_the_PTB_in_Standalone_Mode.html){.wiki-page}[¶](#Running-the-PTB-in-Standalone-Mode){.wiki-anchor}
===============================================================================================================================================

[]{#The-PTB-is-only-set-up-to-talk-to-sbnd-test02-for-now}

The PTB is only set up to talk to sbnd-test02 for now:[¶](#The-PTB-is-only-set-up-to-talk-to-sbnd-test02-for-now){.wiki-anchor}
-------------------------------------------------------------------------------------------------------------------------------

1\) `ssh sbnd@sbnd-test02`

2\) Check if any of the standalone clients are running: netstat -avp \|&
grep 8992\
(the PTB communicates with sbnd-test02 through port 8992).

If it is running then you will see something like:

    bash-4.2$ netstat -avp |& grep 8992
     tcp        0      0 0.0.0.0:8992            0.0.0.0:*               LISTEN      16021/./standalone_ 
     tcp        0      0 192.168.230.32:8992     sbnd-ptbmk2-01:47412    ESTABLISHED 16021/./standalone_

If you get nothing from the netstat command then the board is not
running.

3\) If you need to run it, then check if a screen session is active:
screen -ls\
The screen session that I set up is called \"standalone_ptb\" but
generally, it will have \"ptb\" in the name.

If a screen session is already running and is detached (i.e. someone
else is not already using it):

4\) `screen -r ptb`

The screen session should be sitting in the following directory:
/home/nfs/sbnd/work.drivera/srcs/ptbreader/standalone_clients/ . It
should be either running in which case you should see a scrolling
printout of timestamps, it could also be in the stopped state in which
case you would see the 4-option menu below, or it might not be running
at all in which case you\'ll have to get it running again by running:\
5)
`./standalone_run -c test_configs/ptbmk2_v3.5.1.json -d sbnd-ptbmk2-01:8991`

    The standard, standalone_run script has a 4-option menu i.e.: 
        1. Init
        2. Start
        3. Stop 
        4. Quit

6\) if the board is sending triggers then you will see a scrolling
printout of timestamps and trigger words, and if you want to stop it do:
3 and hit Enter otherwise skip this step.

7\) Initialize the PTB before starting the run: Hit 1 then Enter (this
will configure the registers in the PTB firmware)

8\) Start the run: Hit 2 then Enter

If everything goes well you should get a scrolling printout of
timestamps on the screen, otherwise, you will get an error, probably
about the configuration in which case contact me
\<<davidriv@sas.upenn.edu>\>\
9) If you want to stop the run: hit 3 then Enter, but most likely you
will want to leave it running so skip to step 10

10\) Once done you can detach from the screen session (Ctrl-a + d)

When screen session is not running:

11\) `ssh sbnd@sbnd-test02`\
12) `cd ~/work.drivera/srcs/`\
13) `source setup_ptb_daq.sh (just need to set up root and boost 1.66)`\
14) `cd ptbreader/standalone_clients/`\
15)
`./standalone_run -c test_configs/ptbmk2_v3.5.1.json -d sbnd-ptbmk2-01:8991`

    The run menu will pop up: 
        1. Init
        2. Start
        3. Stop 
        4. Quit

Once running, jump back to step 7) and go from there

[]{#Advanced-operations}

Advanced operations:[¶](#Advanced-operations){.wiki-anchor}
-----------------------------------------------------------

A few standard configurations can be found in the test_configs
subdirectory of the standalone_clients directory:\
**ptbmk2_v3.5.1_BNB_emulator_only.json** - On-Spill BNB emulation
triggers only\
**ptbmk2_v3.5.1_dab_fake_BNB_plus_10Hz_random_533ms_gate.json** -
On-Spill BNB emulation + 10Hz of Off-Spill randoms (very nearly periodic
at this frequency and lower, more random at higher frequency)\
**ptbmk2_v3.5.1_dab_10Hz_random_full_gate.json** - 10Hz of random
triggers, and no BNB emulation/structure (very nearly periodic at this
frequency and lower, more random at higher frequency)\
various configurations with different frequencies for random_full_gate
and dab_fake_BNB_XHz_random

[]{#Change-the-configuration}

### Change the configuration:[¶](#Change-the-configuration){.wiki-anchor}

If you have questions feel free to drop me an email or a message on the
SBND slack (username: David Rivera). I have yet to fully document the
configuration parameters, so only change the parameters that you are
100% sure about.

Make a copy of the original configuration (or most up to date/highest
version number) in the test_configs directory:\
\*1.
`cd  /home/nfs/sbnd/work.drivera/srcs/ptbreader/standalone_clients/test_configs/`\
\*2.
`cp ptbmk2_v3.5.1.json <your_username_and_or_useful_description>_ptbmk2_v3.5.1.json `\
\*3. `cd -`\
\*4. run the client and pass it the new configuration:\
`./standalone_run -c test_configs/<your_username_and_or_useful_description>_ptbmk2_v3.5.1.json -d sbnd-ptbmk2-01:8991`
