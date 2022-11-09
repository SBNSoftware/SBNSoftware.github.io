---
layout: page
title: File Transfer System (FTS) in SBND
---

**This page is under development (Wes Ketchum and Daisy Kalra)**

**Introduction**
========================================================================================================================
File Transfer System (FTS) periodically transfers complete events built by Event Builder to computing system. 

**Step wise instructions to setup FTS in SBND**
========================================================================================================================

* login to sbnd-evb01 via gateway machines (Please follow https://github.com/SBNSoftware/SBNSoftware.github.io/blob/master/sbn_online_wiki/sbndaq_Wiki.md to get the DAQ accounts if you don't have)
* Install https://github.com/SBNSoftware/sbndaq-xporter/blob/develop/FTS_config/setup_system_for_fts.sh
* yum install osg-ca-scripts
* yum install xrootd-devel, xrootd-client-devel, libuuid-devel, openssl-devel, zlib-devel, g++
* pip install cmake

If you see a message to upgrade pip then follow the next step otherwise skip it.

* pip install --upgrade pip
* pip install skbuild
* python -m pip install -U pip
* pip install scikit-build
* Follow all the steps under installation from the following link - https://cdcvs.fnal.gov/redmine/projects/filetransferservice/wiki

After this step, a request should be made to have sbndrawuser on sbnd-evb machines / sbnd cluster along with the proxy and certificates
for sbndrawuser. Additionally, the responsible users (in this case, Wes and Daisy) need to be added to k5login to login and
get access in the sbndraw user. We opened a ticket and requested this to set this up in the same way as was done for ICARUS. 
Normally, this ticket gets assigned to SLAM team and we kept Bonnie King (bonniek@fnal.gov), Scott Reid (svreid@fnal.gov), Farhan Ahmad (fahmed@fnal.gov)
and Brandon White (bjwhite@fnal.gov). Brandon has set this up in mu2e and provides certificates for sbndrawuser.

* We requested certificates for sbndraw user in the similar way as has been setup for ICARUS and mentioned that ICARUS's 
certificates are specified as x509-client-key/certificate and are put in the /opt area
* For SBND, we requested to use the same service certificate for the Production role proxies and the Raw role proxies (similar
* to ICARUS) 
* 


