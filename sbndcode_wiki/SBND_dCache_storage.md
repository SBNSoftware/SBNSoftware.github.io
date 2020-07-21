---
layout: page
title: SBND dCache storage
---



SBND dCache storage
==========================================================

-   **Table of contents**
-   [SBND dCache storage]
    -   [Remote access to dCache areas]
        -   [Use XRootD to access dCache ROOT
            files]

dCache area consists of a huge data space, made of tapes and disks.\
SBND owns one of each of two types of dCache areas. Each of them has
room for areas owned by a single user:

-   scratch (`/pnfs/sbnd/scratch/users/${USER}`): files in this area can
    be deleted automatically; you can store a grid job result there
    waiting to transfer it into a safe place, but don\'t rely on leaving
    your important stuff there for long
-   persistent (`/pnfs/sbnd/persistent/users/${USER}`): files in this
    area will not be deleted

We have a limited quota of space as well, so fill it responsibly.

  ------------------------- ---------------------
  `/pnfs/sbnd/persistent`   37.6 TiB (20170915)
  `/pnfs/sbnd/scratch`      81.3 TiB (20171001)
  ------------------------- ---------------------

([check the persistent space
monitoring\...](https://fifemon.fnal.gov/monitor/dashboard/db/dcache-persistent-usage-by-vo?orgId=1&var-VO=sbnd){.external})\
More details are in [FIFE
wiki](Understanding_storage_volumes.html).



Remote access to dCache areas
------------------------------------------------------------------------------

While dCache areas may happen to be available on some local nodes (e.g.,
[SBND
GPVM\'s](Computing_resources.html#Where-to-work-interactive-nodes-GPVM)),
in general the area is not directly reachable.\
We use a tool called [IFDH](.html) to fetch files from
wherever they are. Also some code uses IFDH to fetch files: among them,
LArSoft modules `CORSIKAGen` and `GENIEGen`.

IFDH sometimes requires the user to be *authenticated*, which is usually
achieved by a certificate.\
This is the [same procedure](Get_a_certificate_proxy.html)
as for getting credentials to submit jobs.



### Use XRootD to access dCache ROOT files

Even where `/pnfs` directory structure is actually visible, it is
usually a bad idea to access ROOT files from there directly. A better
practice is using, when possible, access via XRootD:

1.  have a grid proxy available
2.  use a XRoodD URL instead of a `/pnfs` path; a script to perform such
    a conversion is provided in LArSoft as `pnfsToXRootD`
    ([larsoft:source:bin/pnfsToXRootD](/redmine/projects/larsoft/repository/entry/bin/pnfsToXRootD){.source},
    installed in the system `PATH` and in `${LARSOFT_DIR}/bin`)

For example, instead of:

    $ lar -c standard_g4_sbnd.fcl -s /pnfs/sbnd/persistent/sbndpro/SBNWorkshop1017/v06_53_00_SBNWorkshop1017/prodsingle_mu_bnblike/gen/546347_0/prodsingle_sbnd_SinglesGen-20171018T115050_3cc94721-f58b-401f-806c-5fe63cf2bba8.root

one can go:

    $ pnfsToXRootD /pnfs/sbnd/persistent/sbndpro/SBNWorkshop1017/v06_53_00_SBNWorkshop1017/prodsingle_mu_bnblike/gen/546347_0/prodsingle_sbnd_SinglesGen-20171018T115050_3cc94721-f58b-401f-806c-5fe63cf2bba8.root
    root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/sbnd/persistent/sbndpro/SBNWorkshop1017/v06_53_00_SBNWorkshop1017/prodsingle_mu_bnblike/gen/546347_0/prodsingle_sbnd_SinglesGen-20171018T115050_3cc94721-f58b-401f-806c-5fe63cf2bba8.root
    $ lar -c standard_g4_sbnd.fcl -s root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/sbnd/persistent/sbndpro/SBNWorkshop1017/v06_53_00_SBNWorkshop1017/prodsingle_mu_bnblike/gen/546347_0/prodsingle_sbnd_SinglesGen-20171018T115050_3cc94721-f58b-401f-806c-5fe63cf2bba8.root

or, in one line:

    $ lar -c standard_g4_sbnd.fcl -s "$(pnfsToXRootD /pnfs/sbnd/persistent/sbndpro/SBNWorkshop1017/v06_53_00_SBNWorkshop1017/prodsingle_mu_bnblike/gen/546347_0/prodsingle_sbnd_SinglesGen-20171018T115050_3cc94721-f58b-401f-806c-5fe63cf2bba8.root)"
