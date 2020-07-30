---
lang: en
title: Sending data to graphite and viewing it in grafana
---

[]{#Sending-data-to-graphite-and-viewing-it-in-grafana}

Sending data to graphite and viewing it in grafana[¶](#Sending-data-to-graphite-and-viewing-it-in-grafana){.wiki-anchor}
========================================================================================================================

[]{#DAQ-config-side}

DAQ config side[¶](#DAQ-config-side){.wiki-anchor}
--------------------------------------------------

We have a test setup for a graphite DB for metrics running at DAB on
sbn-daq02. To send artdaq metrics to it, you need the following fhicl
snippet:

    metrics:{

      graphite:{
        level: 5
        metricPluginType: "graphite" 
        reporting_interval: 1.0
        host: "sbn-daq02.fnal.gov" 
        port: 2003
        namespace: "artdaq." 
      }

    }

Namespace can be what you like, but the host and port should be that\...

[]{#Grafana-viewing}

Grafana viewing[¶](#Grafana-viewing){.wiki-anchor}
--------------------------------------------------

Log in to sbn-daq02 with port forwarding

    ssh -L 3000:localhost:3000 sbn-daq02.fnal.gov

Open your own browser and navigate to localhost:3000. You should be
greeted with a login screen. Ask Wes for details to log in.
