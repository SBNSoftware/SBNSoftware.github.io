---
lang: en
title: Software distribution content
---

[]{#Software-distribution-content}

Software distribution content[¶](#Software-distribution-content){.wiki-anchor}
==============================================================================

This page tries to keep track of the content of the two main software
distribution UPS areas: FermiApp and CVMFS.\
Of the two, CVMFS is the future, while FermiApp is slowly being chopped
away.

The final goal is to have both areas deliver the same content.\
The script `setup_sbnd.sh`, present in both areas, should take care of
setting up the UPS area. It will prefer CVMFS if available.

> **[20170913: This table is not complete (at
> all).]{style="color: red;"}**

  ---------------------------------------------------------------------- --------------------------------
  CVMFS                                                                  FermiApp
  /`cvmfs/sbnd.opensciencegrid.org/products/sbnd`                        `/grid/fermiapp/products/sbnd`
  [Software distribution content](#LArSoft-software-stack){.wiki-page}   
  ---------------------------------------------------------------------- --------------------------------

[]{#LArSoft-software-stack}

LArSoft software stack[¶](#LArSoft-software-stack){.wiki-anchor}
----------------------------------------------------------------

The \"stack\" is the complete suite of software distributed with a
single LArSoft version. It includes *art* stack for that version, plus
*nutools* and LArSoft specific products. LArSoft releases versions at a
fast pace (roughly once per week).

The update is mostly automated by the standard `pullProducts` script
provided by Fermilab SSI.

> TODO: document/link how to pull it.
