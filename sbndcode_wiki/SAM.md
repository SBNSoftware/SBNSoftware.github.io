---
lang: en
title: SAM
---



SAM for SBND
============================================

-   **Table of contents**
-   [SAM for SBND]
    -   [SAM queries]
    -   [Administration]

This page collects information about the use, setting and administration
of the SAM service for SBND.



SAM queries
------------------------------------------

The SAM client is called `samweb`, distributed as UPS product, available
for example from the Fermilab CVMFS common repository. It can be set up
as:

    source /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh
    setup sam_web_client

\
The experiment name is `sbnd`, but the setup script should have already
set a `SAM_EXPERIMENT` environment variable accordingly, so there should
be no need to specify `--experiment=sbnd`. For example:\

    $ samweb server-info
    SAMWeb API for sbnd
    SAMWeb version: 3.0.1
    Connected to: http://samweb.fnal.gov:8480/sam/sbnd/api

    Cherrypy version: 11.1.0
    HTTP User-Agent: SAMWebClient/v2_0 (samweb) python/2.7.5

    User information:
      Untrusted identity: USER@HOST
      Unauthenticated
      Roles: None



Administration
------------------------------------------------

An interface for listing users can be accessed at:
<https://samweb.fnal.gov:8483/sam/sbnd/admin/users>. It requires
[CILogon](Computing_resources.html#Accessing-resources-via-certificates)
authentication.
