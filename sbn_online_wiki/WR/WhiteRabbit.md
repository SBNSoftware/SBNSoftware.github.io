---
layout: page
title: White Rabbit Timing Systems
toc: true
---

SBN White Rabbit Timing Systems
h1. White Rabbit System 


1) *WR installation at Fermilab for the SBN program*

This figure  illustrates the final deployment of WR Network at Fermilab for the SBN program 

!{width:900px}WR_installation.png!



2) *WR installation at beam locations: BNB (MI-12) and NuMI (MI-60)*

A WR node ( Linux server ) has been deployed at each of the two beam locations. Each server mounts a SPEC/DIO card with the function of broadcasting the beam signals onto the WR Network.

The server name at MI-12 is  : sbn-mi12.fnal.gov 
The server name at MI-60 is : sbn-mi60.fnal.gov

These servers are _behind_ the AD Network firewall. They are reachable ONLY by logging onto the AD gateway node _outland.fnal.gov_. To be able to login on those nodes a user needs  an account on outland.fnal.gov. At the moment ONLY SLAM group members (who manage those WR servers) AND afava,  badgett and torretta have an account on _outland_.

Fig 2a shows the SPEC/DIO card installed in the server at MI-12. The LEMO input cables carry the following beam signals:  the LEMO cable in DIO input 5 ( software Channel 4)  is the "gatedBES" signal which provides the BNB early warning ; the cable in DIO input 2 ( software channel 1) is the $1D ; the cable in DIO input channel 4 (software channel 3) is the BNB RWM.

!{width:500px}spec-dio-mi12-labels.png!

Fig 2b shows the SPEC/DIO card installed in the server at MI-60. The beam signals cables entering the DIO are:  MIBS $74 in DIO input 5 (software channel 4) which is the MI to NuMI extraction signal ; $AE in DIO input 2 (software channel 1)  which is the equivalent of the BNB $1D.

!{width:500px}spec-dio-mi60-labels.png!

See point 5) below to see the current beam signals implementation at MI12 and MI60.

3) *WR installation at ICARUS*

AT ICARUS we have two WR nodes:
a) a Linux server,  _icarus-daq02_,  with a SPEC/DIO card. The server is installed in the Timing rack on the West Mezzanine Alcove #1.

b) a SPEXI /DIO  card pair mounted inside the national Instrument (NI) crate installed in the  Trigger rack on the East Mezzanine.

4) For *{color:Green}CURRENT STATUS of WR hardware installation at  various LAB locations and spares*  see here: [[Hardware installation/availability]]

h2. How to synchronize a SPEC/DIO in the WR network

Read here [[Setup SPEC/DIO in WR network]] for how to synchronize a SPEC/DIO.

When the DIO is synchronized, then you can use it to broadcast signals on the WR network (see next section)


4) *How to send/receive  beam signals on the  WR network*

At both sending and receiving nodes we use software developed by the CERN WR group and provided by the vendor , in our case SevenSolutions, Granada, Spain ( web:  sevensols.com ).
See this page  [[ How to send and receive  beam signals on the  WR network]]  for instructions.


5) *Current Beam signals settings at MI-12 and MI-60 (as Feb 22,2021)*
See this page  [[ Current beam signals settings ]]  for details


6) How to setup a WR switch and nodes 
See here [[ How to setup a WR switch and nodes ]] for info.

7) *Troubleshooting*
See this page  [[ Troubleshooting ]]  for info


*APPENDIX: find here various technical information on WR hardware and installation and tests performed at DAB test stands (2017)*
* [[White Rabbit]]
** [[White Rabbit]] device driver and software installation
** [[SPEC Cards]] Configuration
** [[SPEC DIO]] How to set up
*** [[ DIO test (2017)]] timeline of DIO tests sbnd-daq25 
** [[SPEC TDC]] How to setup  the TDC and run ~tools programs
** [[SPEC Fine-Delay]] How to setup the FineDelay and run ~tools programs 


