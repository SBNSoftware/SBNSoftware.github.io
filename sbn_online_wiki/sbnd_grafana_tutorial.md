---
layout: page
title: SBND Grafana Tutorial
---



Opening grafana on the daq
========================================================================================================================
The grafana page is hosted on the machine you’re running from/your area is configured for (currently for the ND building this is almost always evb04).
If you change machines the page does not move with you.

You have to access the daq machines to see the page(s) so you need the same prerequisites (i.e. [a daq account](https://sbnsoftware.github.io/sbn_online_wiki/Getting_a_DAQ_account.html) and/or to be added to the sbnd daq account, and
be connected to the Fermilab network via fgz or the vpn).

[basic instructions, username, password for "shifter" account (read-only mode)](https://docs.google.com/document/d/1mY7KaxYovwkJVUsrGSySnFWvQB85bZmpXOT_wONjcEc/edit?usp=sharing)
these instructions (also shown below) are to use your own browser. You could also use a VNC session on the daq machine if it is setup (not currently working).

1. Connect to fgz or the vpn
2. kinit -f (if haven’t already that day)
3. Tunnel to the daq machine hosting the page (has to go through gateway so 2 tunnels needed).
    
    In a terminal: 
    
    ssh -KL localhost:10089:localhost:10080 sbnd@sbnd-gateway01.fnal.gov 'ssh -KL localhost:10080:localhost:10080 sbnd@sbnd-evb04.fnal.gov'

if for some reason you are not added to the sbnd k5login but do have a daq account then try replacing sbnd@ with your username@ instead
the terminal running this may say “Pseudo-terminal will not be allocated because stdin is not a terminal.” This is fine and you can ignore it. 

If someone else is also forwarding this it may have a different message to say something about the port not being available or “already in use”. You can ignore this too.

The terminal is now going to just hang, you can not use it, close it, put your computer to sleep, leave internet/the vpn, etc. or the connection will drop (at which point you just need to do the tunnel command again to reconnect).
To exit use Ctrl-C.


4. Open a browser and go to http://localhost:10089 
    The username and password for read-only (“shifter”) mode is in the google doc linked earlier
    
5. Pick the page you want

And now you’re there! When a run is happening the information will be all filled in. You can click on the arrows to collapse/expand sections, view a larger version of a graph, inspect/export data points, etc. Feel free to play around, in read-only mode you won’t hurt anything.

Making your own page
--------------------------------------------------

If you already have some metrics you want to output (e.g. about the EventBuilder you are using, or you just want a big display of your run number (partition dependent) or you want different pages for the CRT teststand vs CRT## setup, or you followed the steps after this to make your own already, etc.)
All steps up to the login are the same as before. But now we need to login as an admin with write-privileges.

1. Logout. This will take you back to the login page. Ask someone for the admin username and password if you don’t know it and log back in with that. **It will ask you if you want to change the password. PRESS SKIP (bottom left). Please do not change the password.**
2. Make a new page. To start from a copy of an exisisting page go to the page and navigate to the settings. Click the “Save As…” button on the side. Pick a name for your new dashboard and click save. It will automatically take you to the new page.


Adding a new graph
--------------------------------------------------
1. Click “add panel” (upper right next to save button).
2. You can add a new panel, look through pre-made ones, or add a new row (the categories the panels are grouped into). Pick "add a new panel".

![image](https://user-images.githubusercontent.com/29582622/198715540-968cd492-2818-491b-be0d-9d277821b32b.png)

3. Choose the metric. It will be nested within a path (set in the fcl, see below). The name is set by the piece of code outputting the metric (see below). You can also click the pencil and just type the metric out (as opposed to the drop down menus), which lets you more easily add wildcards to show this metric for multiple boardreaders or eventbuilders for example. ![image](https://user-images.githubusercontent.com/29582622/198716084-6f2333e8-2e95-4863-9780-be4712a5e773.png)

4. Click the top right corner to choose a graph type. There are many different types, try going through to find what you think fits the data/purpose of the graph best. ![image](https://user-images.githubusercontent.com/29582622/198716250-4619ebb2-e05b-4203-9e60-7dad34ee2902.png)

5. The right panel has a bunch of options on formatting, coloring, units, title, legend, etc. Scroll down and play with things to get the information to look how you want.

**Note:** Sometimes the metric does not show up on the plot (for example when it’s from a new boardreader or it’s a new metric you just made). 
The data is being sent but the the metric graphing needs to be turned on in the “Transform” tab. Make sure there is a check next to both “Time” (if the graph uses time) and all the metrics you want from all the sources you want it from. 
![image](https://user-images.githubusercontent.com/29582622/198716765-22ded138-20b4-42c5-9bc5-b7f26dbf89d6.png)

6. When done click “Apply” and “Save”. Click “Discard” to leave the panel editor without saving your changes.
7. The new graph will be at the top of the page, click the top of the panel and drag to move it into place. If you want to move it to a “row” lower on the page it’s typically easiest to collapse rows above that one and then drag it where you want within the row. Resize the panel using the bottom right corner.


You can also easily make a graph from an existing graph by using “duplicate”(under "More" in the grpah drop down menu) and then editing the duplicate. This will put the new duplicate right next to/above/below the current one instead of at the top of the page.


8. Save the page using the “save dashboard” button in the upper right corner.

Sending metrics to grafana
--------------------------------------------------

Metrics can be sent from any piece of code being run by the daq (a boardreader, an eventbuilder, a producer, filter, or analyzer module being run on the built events in the daq, etc.)
If there are already metrics in the code being run (or you are just preparing to add some), setup graphite in the fcl to send to grafana.
typically done in the \*\*\_standard.fcl. Look at some of the other fcls in /configs/standard directory for examples.


To send artdaq metrics to grafana, you need the following fhicl
snippet:

    metrics:{

      graphite:{
        level: 10
        metricPluginType: "graphite" 
        reporting_interval: 10.0
        host: "10.226.36.34" 
        port: 2003
        namespace: "artdaq.[name]" 
      }

    }

Namespace can be what you like, but the host and port should be that for sbnd-evb04.

Change the namespace in your actual running fcl so you know where the metric comes from
otherwise every system using \*\*\_standard.fcl will be named the same thing and it will be hard/impossible to tell which is which. 
Try to pick a short but clear name that you don’t plan on changing (so try to avoid temporary ones and just settle on a final naming scheme, e.g. the crt is crt\[plane\]\[boardreader-number\]). Example: crt2x2upstr.fcl ![image](https://user-images.githubusercontent.com/29582622/198718362-d153eedd-f215-438a-98b9-b7ce53767d09.png)



Making a new metric
--------------------------------------------------

1. Decide where the metric should be. 
    - For example, if you want to monitor something about one piece of hardware regardless of pull windows, eventbuilder settings, downstream filters, etc. then consider putting the metric in the boardreader code where it is set/read/added to a fragment. For an event level metric (aka only want the information being pulled or need multiple subsystems info) use a downstream producer/analyzer/filter.

2. Calculate the metric (just like any normal variable).
3. Make sure the code has the metric manager included
    - should have #include "artdaq/DAQdata/Globals.hh" and using artdaq::MetricMode; or an equivalent
    - typically boardreaders and things already have this all set up. Use one as an example if needed. I have an example of a producer and a filter with it (for the trigger) if anyone wants to setup a producer/analyzer/filter and needs an example.

4. Send out the metric.
    - need to check that metric manger is on so no errors occur if it gets turned off in the fcl or on standalone tests, put code in if statement: if(metricMan != nullptr) 
    - code: metricMan->sendMetric(“\[name_of_metric\]”, \[variable being sent\], “\[units of metric\]”, \[level\], \[mode of variable to send, see [MetricData.hh](https://cdcvs.fnal.gov/redmine/projects/artdaq-utilities/repository/revisions/stable/entry/artdaq-utilities/Plugins/MetricData.hh)\]); 
    - Example from CRTMetricProducer_module.cc: ![image](https://user-images.githubusercontent.com/29582622/198718969-03ac7f7b-f0e0-4b5c-a4d4-ff038f9d2351.png)

5. Recompile your daq area (make sure no one is using it).
6. Make sure the code you made is set up to run and send out grafana metrics by editing the fcl as shown earlier if necessary (if you need to run a new producer/filter/analyzer module in the daq and don’t know how then feel free to ask someone or use the software filter setup as an example).
7. Start a run. If you’re running the code with the new metrics then they should now show up in grafana and you can follow the earlier steps to add a new panel for it.
8. You’re done! Enjoy your new monitoring tool.



