---
lang: en
title: List of systems and components
---

[]{#List-of-SBN-online-systems-and-components}

List of SBN online systems and components[¶](#List-of-SBN-online-systems-and-components){.wiki-anchor}
======================================================================================================

-   **Table of contents**
-   [List of SBN online systems and
    components](#List-of-SBN-online-systems-and-components)
-   [SBN-ND (SBND) detector hall](#SBN-ND-SBND-detector-hall)
    -   [Central Server](#Central-Server)
-   [SBN-FD (ICARUS) detector hall](#SBN-FD-ICARUS-detector-hall)
    -   [Central Servers](#Central-Servers)
    -   [Vertical Slice Test Stand](#Vertical-Slice-Test-Stand)
    -   [TPC computer servers](#TPC-computer-servers)
    -   [PMT computer servers](#PMT-computer-servers)
    -   [CRT computer servers](#CRT-computer-servers)
    -   [Naming convention](#Naming-convention)
-   [Wideband](#Wideband)
-   [DAB Test Stand Cluster](#DAB-Test-Stand-Cluster)
    -   [Annex Room 313](#Annex-Room-313)

[]{#SBN-ND-SBND-detector-hall}

SBN-ND (SBND) detector hall[¶](#SBN-ND-SBND-detector-hall){.wiki-anchor}
========================================================================

Note the network setup at SBN-ND is temporary, until the production
equipment arrives and installation commences in \~ April 202

[]{#Central-Server}

Central Server[¶](#Central-Server){.wiki-anchor}
------------------------------------------------

-   sbnd-gateway01, sbnd-gateway02 : path into the SBND online computing
    cluster and for general purpose work
-   sbnd-nfs01, sbnd-nfs02 : file server for SBND online cluster and hot
    backup
-   sbnd-db01, sbnd-db02 : databases server for SBND and hot backup
-   sbnd-tpc01 \... sbnd-tpc12 : TPC readout servers, have readout PCIe
    cards installed

More to come!!!

[]{#SBN-FD-ICARUS-detector-hall}

SBN-FD (ICARUS) detector hall[¶](#SBN-FD-ICARUS-detector-hall){.wiki-anchor}
============================================================================

The network is divided into three segments - Fermilab, DAQ, and
DCS/management.

-   Fermi - 131.225.250.0/25 - SBN-FD-Public
-   DAQ - 192.168.191.0/26 - SBN-FD-DAQ-Private - Vlan 2048
-   DCS - 192.168.184.0/23 - SBN-FD-DCS-Private - Vlan 2041

Only two icarus servers at the SBN-FD building are accessible directly
from the Fermilab public network - icarus-gateway01 and
icarus-gateway02. You must login to one of these two computers to access
the other computers on the SBN-FD network.

[]{#Central-Servers}

Central Servers[¶](#Central-Servers){.wiki-anchor}
--------------------------------------------------

-   icarus-gateway01, icarus-gateway02 : Path into the ICARUS online
    computing cluster
    -   icarus-gateway01-dcs
    -   icarus-gateway02-dcs
-   icarus-db01 : main ICARUS online database
    -   icarus-db01-daq
-   icarus-db02 : backup ICARUS online database
    -   icarus-db02-daq
-   icarus-nfs01 : backup ICARUS general purpose file server
-   icarus-nfs02 : main ICARUS general purpose file server

[]{#Vertical-Slice-Test-Stand}

Vertical Slice Test Stand[¶](#Vertical-Slice-Test-Stand){.wiki-anchor}
----------------------------------------------------------------------

-   icarus-vst01: TPC readout testing
    -   icarus-vst01-dcs
-   icarus-vst02: PMT readout testing
    -   icarus-vst02-dcs
    -   vst02 has been rebooted three times in the last month. There is
        probably a hardware issue. 11-Nov-2019.

[]{#TPC-computer-servers}

TPC computer servers[¶](#TPC-computer-servers){.wiki-anchor}
------------------------------------------------------------

-   icarus-tpc01
    -   icarus-tpc01-daq
-   icarus-tpc02
    -   icarus-tpc02-dcs

[]{#PMT-computer-servers}

PMT computer servers[¶](#PMT-computer-servers){.wiki-anchor}
------------------------------------------------------------

-   icarus-pmt01
    -   icarus-pmt01-daq

[]{#CRT-computer-servers}

CRT computer servers[¶](#CRT-computer-servers){.wiki-anchor}
------------------------------------------------------------

-   icarus-crt01
-   icarus-crt02 is still at Wideband, to be moved to FD by the end of
    2019 or beginning of 2020
-   icarus-crt03-11 : OS installation ongoing (10/2019)

[]{#Naming-convention}

Naming convention[¶](#Naming-convention){.wiki-anchor}
------------------------------------------------------

All computer servers have a Fermilab network connection (131.225.250.0)
with dns name icarus-xxxyy.\
The systems are divided by functionality. The values of xxx so far are.

-   evb - event builder
-   tpc - TPC readout, A3818 cards installed
-   pmt - PMT readout, A3818 cards installed
-   crt - CRT readout
-   clk - Timing readout
-   dcs - detector control system
-   pdu - power distribution units
-   ipmi - connections to management ports on the computer servers

[]{#Wideband}

Wideband[¶](#Wideband){.wiki-anchor}
====================================

-   icarus-crt02

[]{#DAB-Test-Stand-Cluster}

DAB Test Stand Cluster[¶](#DAB-Test-Stand-Cluster){.wiki-anchor}
================================================================

sbn-daq01,02,03,04? (private-network hostnames have \"-priv\" appended)

[]{#Annex-Room-313}

Annex Room 313[¶](#Annex-Room-313){.wiki-anchor}
------------------------------------------------

-   sbnd-daq32 : NFS disk volume
    -   Has two extra NICs for CRT Bern box readout
-   sbnd-daq33: CAENV1730 (\"PMT\") readout
    -   Contains one CAEN A3818 PCIe card
    -   Associated components: pmt01, pmt02, pmt03, pmt04
    -   With external triggers: pmtx01, pmtx02, pmtx03, pmtx04
-   sbnd-daq34: ICARUS TPC readout
    -   Contains one CAEN A3818 PCIe card
-   sbnd-test02 : Desktop and EPICS development
-   sbnd-test01 : Desktop and access to private network
