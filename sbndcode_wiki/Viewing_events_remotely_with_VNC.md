---
layout: page
title: Viewing events remotely with VNC
toc: true
---



Viewing events remotely with VNC
====================================================================================

(Taken and adapted from Dom Brailsford DUNE wiki Instructions)

VNC provides you with a remote window to easily view GUIs from a remote
machine with very little delayed response.

The new instructions require a little bit more setup than the old
instructions (linked at the bottom of the page) but the setting up only
needs doing once. If you get stuck, feel free to contact me (Dom
Brailsford: <d.brailsford@lancaster.ac.uk>).

You need to do a few things prior to following the rest of the
instructions:

1.  Pick a number for your VNC server (Pick any number between 0 and 99
    \-- in this example I\'m going to use 22)
2.  Pick a sbndgpvm that you like to work on (I\'m going to use
    sbndgpvm01 in this example)
3.  Install a VNC viewer on your local machine (Macs come with one
    already installed, an example of how to use it is shown at the
    bottom)



On your chosen sbndgpvm (i.e. ssh to it) 
------------------------------------------------------------------------------------------------

Firstly, check whether your chosen VNC server number is available. Run
the following on the command line (change the 22 to the number you
picked - **do not forget the -localhost option. If you do, then your VNC
session will be automatically killed by a cron job set up to detect
these.):**\

    vncserver :22 -localhost -bs

\
It will tell you if the VNC server already exists; pick a different
number in that case and test again. If the specific server does not
exist then it will be created (it may ask you to pick a password,
remember it for later).

Add the following snippet to the bottom of your \$HOME/.profile or
\$HOME/.bash\_profile (open either in a text editor). Again, change the
22 to your VNC server number.\

    #VNC stuff
    VNCNUM=22 #CHANGE THIS NUMBER TO WHATEVER VNC SERVER NUMBER YOU PICKED
    if [[ `hostname` == *"gpvm"* ]] #only start VNC servers on the gpvms (i.e. not on the build machines)
    then
      export DISPLAY=localhost:$VNCNUM #Export the display to point to the VNC server
      if [ `lsof -i -P -n | grep $(expr 5900 + ${VNCNUM}) | wc -l` -eq 0 -o `lsof -i -P -n | grep $(expr 6000 + ${VNCNUM}) | wc -l` -eq 0 ]
      then
        echo "vncserver :$VNCNUM not running.  Starting now...." 
        vncserver :$VNCNUM -localhost -bs    #Check if the VNC server is running and start it if not (-localhost mandatory!)
      else
        echo "vncserver :$VNCNUM already running (hopefully owned by you).  Not attempting to start the vncserver..." 
      fi
    fi



On your local machine (i.e. open a new terminal window and do not ssh anywhere) 
------------------------------------------------------------------------------------

Add the following snippet to the bottom of your \$HOME/.ssh/config.
Change dbrailsf to your own kerberos principal, change the two
occurrences of sbndgpvm01 to whatever sbndgpvm you chose at the start
and change the 22 to your VNC server number (if your VNC number is
between 0 and 9 then include a preceding 0 e.g. 00, 01, 02 etc.)\

    Host sbndgpvm01
      HostName sbndgpvm01.fnal.gov
      User dbrailsf
      ForwardAgent yes
      ForwardX11 yes
      ForwardX11Trusted yes
      GSSAPIAuthentication yes
      GSSAPIDelegateCredentials yes
      LocalForward 5901 localhost:5922

This snippet does a couple of things. Firstly, it allows you to connect
to your chosen sbndgpvm without specifying your kerberos principal or
the full address of the gpvm. In the case of the above snippet, the
following ssh command connects me to sbndgpvm01\

     ssh -Y sbndgpvm01 

\
Secondly, and more importantly, it automatically forwards the remote
port used by the VNC server on the sbndgpvm to a specific port (5901 in
the example above - you do not need to change this number) on your local
machine.

**You should now be permanently setup to use VNC.**



How to use your VNC server 
------------------------------------------------------------------------

ssh to your chosen dunegpvm using its new shortened name e.g.\

     ssh sbndgpvm01 

\
The ssh connection should automatically handle the port forwarding for
you in the background. Now fire up root and open a TBrowser as a test.\

    source /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh
    setup root v6_18_04d -q e19:prof
    root

\
and once the root prompt appears\

     new TBrowser 

On your local machine (open a new terminal window and do not ssh
anywhere), open your vnc viewer software and point it towards
localhost:5901. On a mac, the command is:\

    open vnc://localhost:5901

\
If you set a password when originally creating the VNC server on the
sbndgpvm, you will be prompted for it. Hopefully you now see the
TBrowser.

**To use VNC from now on, you should only need an active ssh connection
to your chosen sbndgpvm (e.g. when you\'re working on it) and a VNC
viewer open and pointing to localhost:5901 on your local machine.**

------------------------------------------------------------------------



Old (ancient) instructions
----------------------------------------------------------------------

(Adapted from the 35 ton tutorials by Karl Warburton)



### Generate some events to view 

1.  [Setup your
    directory](How_to_setup_your_directory_and_launch_your_first_job.html).

2.  Go to your data area and create an area for this work.\

        cd /sbnd/data/users/< username >/
        mkdir workspace
        cd workspace

3.  Generate 10 single muon events.\

        lar -c prodsingle_sbnd.fcl -n 10

4.  Run GEANT4 on the output (\... = \"Tab\").\

        lar -c standard_g4_sbnd.fcl -s prodsingle...

5.  Run the detector simulation on the output.\

        lar -c standard_detsim_sbnd.fcl -s prodsingle..._...

6.  Run the reconstruction on the output.\

        lar -c standard_reco_sbnd_basic.fcl -s prodsingle..._..._...



### Viewing events with VNC 

Running GUIs (e.g. TBrowser, Event display) on the gpmvs can be very
slow, using a VNC server speeds things up significantly.

1.  To configure this we will need two terminals open. **Terminal 1** =
    terminal logged in to one of the sbnd gpvms. **Terminal 2** =
    terminal on your local machine.

2.  **Terminal 1**: Start the VNC server (replace X with a number, must
    be different for everyone working on the same gpvm).\

        vncserver :X -localhost 

3.  **Terminal 1**: Choose a password.

4.  **Terminal 1**: Push the output of a remote terminal to the VNC
    desktop.\

        export DISPLAY=localhost:X 

5.  **Terminal 2**: Tunnel the VNC through ssh to keep it encrypted (if
    X\<10 add a zero to the front).\

        ssh -L 59X:localhost:59X -N -f -l < username > < gpvmaddress > # e.g. ssh -L 5908:localhost:5908 -N -f -l tbrooks sbndgpvm01.fnal.gov # 

6.  **Terminal 2**: Open the window locally.
    -   On mac the command is.\

            open vnc://localhost:59X 

    -   On linux/ubuntu we will use vinagre but you might need to
        download it first.\

            sudo apt-get install vinagre
            vinagre vnc://localhost:59X 

    -   A desktop window should open up.

7.  **Terminal 1**: Open the event display.\

        lar -c evd_sbnd.fcl prodsingle..._..._..._... 

    -   The event display should appear in the desktop window.
