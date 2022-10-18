---
layout: page
title: SBND Grafana Tutorial
---



Opening grafana on the daq
========================================================================================================================
The grafana page is hosted on the machine you’re running from/your area is configured for (currently for the ND building this is almost always evb04).
If you change machines the page does not move with you.

You have to access the daq machines to see the page(s) so you need the same prerequisites (i.e. a daq account and/or to be added to the sbnd daq account,
be connected to the Fermilab network bia fgz or the vpn).



DAQ config side
--------------------------------------------------

To send artdaq metrics to it, you need the following fhicl
snippet:

    metrics:{

      graphite:{
        level: 5
        metricPluginType: "graphite" 
        reporting_interval: 1.0
        host: "sbn-evb04.fnal.gov" 
        port: 2003
        namespace: "artdaq.[name]" 
      }

    }

Namespace can be what you like, but the host and port should be that\...



Grafana viewing
--------------------------------------------------

Log in to sbn-daq02 with port forwarding

    ssh -L 3000:localhost:3000 sbn-daq02.fnal.gov

Open your own browser and navigate to localhost:3000. You should be
greeted with a login screen. Ask Wes for details to log in.

If the metric you want to display on Grafana is already monitored by a script running on evb machines then you only need to add a new panel on Grafana.
-	Login to Grafana as “admin” user (ask for the password)
-	Go to the page you want to edit
-	Click on “Add Panel” on the top right of the page:


![immagine](https://user-images.githubusercontent.com/97683442/176135913-9adc14ba-2d0a-4325-b1a8-10f65c893ac6.png)

-	Click on “Add an empty panel”

![immagine](https://user-images.githubusercontent.com/97683442/176136223-c6db09c8-6f74-43b4-9764-4251ec995872.png)

-	Modify the title and add a description in “Panel options” on the right
-	Go to select metric and select:
  -	  Icarus
  -   The machine or the component you want to monitor
  -   the partition you want to monitor
  -   the metric you are interested to monitor
-	Click on “Time series” on the the top right part of the page and select the type of visualization you want to use for the monitoring (Graph, Gauge, Table etc)

![immagine](https://user-images.githubusercontent.com/97683442/176136353-2e4a4b4c-942d-4476-b723-a84970614182.png)

-	Scroll down in the right part of the page and change properly the Units

![immagine](https://user-images.githubusercontent.com/97683442/176136441-56537b4d-7dff-4ce9-a74d-993a6cf36ba5.png)

-	Scroll down in the right part to set the threshold, the threshold vale and the color to apply, you can click on “add threshold” to add a new threshold

![immagine](https://user-images.githubusercontent.com/97683442/176136538-78b4804e-e4a8-419d-9688-850f51005bd7.png)

Click on the top right blue button “Apply” and then “Save” to save your changes.
