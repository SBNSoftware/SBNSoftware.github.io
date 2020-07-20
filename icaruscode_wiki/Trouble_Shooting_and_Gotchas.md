---
lang: en
title: Trouble Shooting and Gotchas
---



Trouble Shooting and Gotchas
============================================================================



Table of Contents
======================================================

-   **Table of contents**
-   [Trouble Shooting and Gotchas]
-   [Table of Contents]
    -   [Submitting grid jobs for SBND (ICARUS) with an user of ICARUS
        (SBND)]
    -   [LogicError..]
    -   [How to checkout tagged version of
        icaruscode]



Submitting grid jobs for SBND (ICARUS) with an user of ICARUS (SBND)
--------------------------------------------------------------------------------------------------------------------------------------------------------

-   Errors of this type have the form of

<!-- -->

    Traceback (most recent call last):

      File "/cvmfs/larsoft.opensciencegrid.org/products/larbatch/v01_51_11/bin/project.py", line 4416, in <module>

        sys.exit(main(sys.argv))

      File "/cvmfs/larsoft.opensciencegrid.org/products/larbatch/v01_51_11/bin/project.py", line 4181, in main

        dosubmit(project, stage, makeup, stage.recur)

      File "/cvmfs/larsoft.opensciencegrid.org/products/larbatch/v01_51_11/bin/project.py", line 3373, in dosubmit

        jobid = dojobsub(project, stage, makeup, recur)

      File "/cvmfs/larsoft.opensciencegrid.org/products/larbatch/v01_51_11/bin/project.py", line 3272, in dojobsub

        raise JobsubError(command, rc, jobout, joberr)

    project_modules.jobsuberror.JobsubError:

    Command:  jobsub_submit --group=sbnd --role=Analysis -f /pnfs/icarus/scratch/users/bbehera/project/muon/PAC/nd/v08_37_00/gen/sbnd_trgng_muon/work/setup_experiment.sh -f /pnfs/icarus/scratch/users/bbehera/project/muon/PAC/nd/v08_37_00/gen/sbnd_trgng_muon/work/work114f616f264adc105e0f5e52111b1a52.tar --resource-provides=usage_model=DEDICATED,OPPORTUNISTIC --OS=SL6 -N 1 --memory=300 --expected-lifetime=1h --append_condor_requirements='(TARGET.HAS_CVMFS_sbnd_opensciencegrid_org==true)' file:///tmp/tmpvmKkHP/gen-sbnd_trgng_muon-v08_37_00.sh  --group sbnd  -g  -c wrapper.fcl  --ups sbndcode  -r v08_37_00  -b e17:prof  --workdir /pnfs/icarus/scratch/users/bbehera/project/muon/PAC/nd/v08_37_00/gen/sbnd_trgng_muon/work  --outdir /pnfs/icarus/scratch/users/bbehera/project/muon/PAC/nd/v08_37_00/gen/sbnd_trgng_muon/out  --logdir /pnfs/icarus/scratch/users/bbehera/project/muon/PAC/nd/v08_37_00/gen/sbnd_trgng_muon/log  --os SL6  -n 10  --njobs 1 --data_file_type root

    Status: 1

    Output: ERROR:

    User authorization has failed: Error authenticating DN='/DC=org/DC=cilogon/C=US/O=Fermi National Accelerator Laboratory/OU=People/CN=Biswaranjan Behera/CN=UID:bbehera/CN=633718598' for AcctGroup='sbnd'Error:

    JOBSUB SERVER CONTACTED     : https://jobsub02.fnal.gov:8443

    JOBSUB SERVER RESPONDED     : UNKNOWN

    JOBSUB SERVER RESPONSE CODE : 401 (Failed)

    JOBSUB SERVER SERVICED IN   : 1.90606594086 sec

    JOBSUB CLIENT FQDN          : icarusgpvm01.fnal.gov

    JOBSUB CLIENT SERVICED TIME : 25/Feb/2020 09:15:30

This error is telling us there is a VO mismatch between SBND and
ICARUS.\
If you are a ICARUS user and trying to submit grid job for SBND you need
a right computing access for VO.\
we don\'t have a SBN VO group (i.e. grid group), but there is a SBN UNIX
group, that is shared among SBND and ICARUS users, so they can share
files/data.\
for the request, you can start from here:\
<https://fermi.service-now.com/wp>\
in the search box, enter Experiment/Project/Collaboration Computing
Account, from the list the entry that matches that string is the one you
need.\
the direct URL is:
<https://fermi.service-now.com/wp?id=evg_sc_cat_item&sys_id=d361073881218500bea3634b5c987c4c>\
after the ticket is in and the approval is granted, you should get SBND
computing privileges within a business day.



LogicError..
------------------------------------------

-   The following type of error message:\

         %MSG-s ArtException:   ThroughgoingmuonAnalyzer:SBNDHitEfficiencyGauss@Construction  23-Dec-2019 11:27:05 CST ModuleConstruction

            cet::exception caught in art

            ---- LogicError BEGIN

              checkDictionaries: Retrieving list of base classes for type  'art::Assns<sbnd::crt::CRTHit,sbnd::crt::CRTData,void>' returned a nullptr.

            ---- LogicError END

            %MSG

you need to simply setup sbndcode. for example.\

    $ setup sbndcode v08_31_01 -qe17:prof



How to checkout tagged version of icaruscode
------------------------------------------------------------------------------------------------------------

for example\...\

    $ mrb g -t v08_37_00 icaruscode
