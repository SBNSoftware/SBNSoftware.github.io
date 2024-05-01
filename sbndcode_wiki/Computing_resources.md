---
layout: page
title: Computing resources
description: Computing resources summary and guidance for SBND
toc: true
toc_title: Contents
---



Computing resources
==========================================================

SBND has a number of computing resources available, many of which are
supplied by Fermilab Computing Sector (SCD when we talk about the
Scientific Computing Division).
Here we list some of them.

> Fermilab Computing Division has produced a
> [very short flyer](http://cd-docdb.fnal.gov/cgi-bin/ShowDocument?docid=5892)
> explaining in a nutshell the different credentials used in Fermilab.
> It can be found as [document 5892 in the SCD DocDB](http://cd-docdb.fnal.gov/cgi-bin/ShowDocument?docid=5892).
> **It is a strongly recommended reading, to everybody!**




#### SCD liaison

The Scientific Computing Division Liaison is a person from Fermilab SCD
who acts as a bridge between SCD and an experiment. They is typically
fairly informed of what is going on, computation-wise, in the
experiment, and in the computing division _[1]_. They is also able
to route any request to the proper people, but they is not necessarily
required to do actual work on solving the merit of the issues. Also,
they is not required to be a member of the experiment.

The current liaison for SBND is [Vito Di Benedetto](mailto:vito@fnal.gov) (SCD).

_[1]_ This is defined as knowing what goes on in the computing division
more than most experiment members, and knowing what is going on in the
experiment more than most of the computing division people.



Computing Access
----------------------------------------------------

To get a Fermilab computing account follow the instructions at this
site: <https://get-connected.fnal.gov/accessandbadging/access/>.
Our experiment number is `T-1053 (SBND)`.

**Write down the initial Kerberos and Services Account passwords before
submitting**. They will be necessary once your accounts have been
created.

You will receive an email once this is complete which gives you your
Fermilab email account and username (you will need this for service
now).

The next step is to "kerberize" your machine. You can follow instructions here:
- Mac: <https://fermi.servicenowservices.com/kb_view.do?sysparm_article=KB0011294>
- Linux: <https://fermi.servicenowservices.com/kb_view.do?sysparm_article=KB0011296>
- Windows: <https://fermi.servicenowservices.com/kb_view.do?sysparm_article=KB0011316>

Once your computer is SSH-ready and kerberized, you should be able to
log on by typing:

```bash
kinit ${USER}@FNAL.GOV
# insert your kerberos password
ssh -Y ${USER}@sbndgpvm01.fnal.gov
```

(where `$USER` is your Fermilab user name).

More details can be found ta the [Newbie Material](Newbie_Material.html) wiki page

If this does not work, please submit a to
request a SBND project account:

1.  [ServiceNow](https://fermi.servicenowservices.com/) -> Request something;
    search for something like: `Experiment Computing Account` and you'll be offered
    a "Experiment/Project/Collaboration Computing Account" match, that you can pick;
2.  Enter your name, then select `T-1053 (SBND)`
3.  Verify that the correct Fermilab principal is displayed when you enter your name
4.  Enter your home institution, then click <Submit>.

You can reset your Fermilab passwords for service-now here:
<https://password-reset.fnal.gov/showLogin.cc>
If you can't remember your password because you didn't write it down
then you will have contact the [service desk](mailto:servicedesk@fnal.gov) (+1 (630) 840-2345).



Where to work: interactive nodes ("GPVM")
---------------------------------------------------------------------------------------------------

We have some dedicated "nodes" where we can log in and work
interactively.
These are General Purpose Virtual Machines (GPVM); they are shared by
all SBND collaborators, and they can not be the fastest way to develop
and run analyses.
But they see all the resources that we have available: you can read data
from SBND disks and tapes, and you can submit SBND jobs to the grid.
The access is via SSH with FNAL.GOV Kerberos credentials.

The nodes and their OS version are:

 Node                 |  OS   
----------------------|-------
 `sbndgpvm01.fnal.gov` | SLF 7 
 `sbndgpvm02.fnal.gov` | EL9 
 `sbndgpvm03.fnal.gov` | EL9 
 `sbndgpvm04.fnal.gov` | EL9 
 `sbndgpvm-test-al9.fnal.gov` | EL9 
 `sbndbuild01.fnal.gov` | SLF 7 
 `sbndbuild02.fnal.gov` | SLF 7 
 `sbndbuild03.fnal.gov` | EL9 



The `GPVM` interactive machines have no relevant
local storage, and areas in `/exp/sbnd` and `/pnfs` should be used (the home
directory works too, but it has small allowance).

The interactive "build nodes" have
roughly the same environment as the other GPVM's. The policy is to
**use these machines only to build code and running tests**; this
excludes job submission and local running of job campaigns and of single
jobs beyond the size of a test job (say, 100 events).

[Information about all SBND GPVM's](SBND_servers.html) is
on a [separate page](SBND_servers.md).

With SL7 reaching EOL on June 30, 2024 GPVMs are being migrated to EL9.
In case users have the need to use SL7, there is the possibility to use SL7 dev container.
More details are in the [GPVM migration](https://sbnsoftware.github.io/GPVM_migration) wiki page.


Opening a ticket in Fermilab Service Desk
------------------------------------------------------------------------------------------------------

This is the favourite sport of ours: when something goes wrong, open a
ticket.
You want to open a Service Desk ticket if your job submission that used
to work yesterday fails today, if the GPVM are very slow (if they are
just slow, it's normal), if you are denied access to some resource you
expect to deserve.
You don't open a service desk ticket if your jobs crash (most of the
time, you just have to fix them), if there is a bug in SBND code
([e-mail to SBND mailing list](mailto:sbnd_software@fnal.gov),
write about it on SBN Slack channel (`#sbnd_general`)
and/or [open a GitHub issue](https://github.com/SBNSoftware/sbndcode/issues/new))
or if you need help with using LArSoft
([LArSoft wiki](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki),
[LArSoft mailing list](mailto:larsoft@fnal.gov),
and [SBND mailing list](mailto:sbnd_software@fnal.gov)).

You need to log in via Fermilab "Services" password (the same you use
to access Fermilab e-mail and Redmine), and then you go at:

<https://fermi.servicenowservices.com/>

That will bring you to the "web portal" interface where you can generically
"request something" and a human being will sort it out in due time.
Another way is to access the [older service catalog](https://fermi.servicenowservices.com).
Then, on the left, you'll have a list of "Self service" items: selecting
"Scientific Computing Services" or "Core Computing Services" you
will be presented with a list of topics that should direct you to the
right type of request.
Most of the requests are under the "Scientific Computing Services",
with a relevant exception in the creation of computing accounts, which
is in "Core Computing Services".

> This ticket is completely unrelated to
> [issue tracking tickets](https://cdcvs.fnal.gov/redmine/projects/sbndcode/issues),
> opened via Redmine, against LArSoft or `sbndcode` pertaining LArSoft
> or ICARUS software bug reports or feature requests.



Accessing resources (DocDB, VOMS, ...) via certificates
--------------------------------------------------------

> Note: this section is about "personal" certificates, not the kind of
> [certificate proxies you need to work on the grid](Get_a_certificate_proxy.md).

A CILogon certificate gives access to a number of Fermilab resources.
After you [get a CILogon certificate](Setting_up_access_with_CILogon_certificate.md),
you will gain access to:

-   [SBN DocDB](http://sbn-docdb.fnal.gov)
-   [Fermilab Virtual Organization (VOMS) server](https://voms.fnal.gov:8443/voms/fermilab/user/home.action)
-   Jenkins build server



Accessing resources via Virtual Private Network
------------------------------------------------------------------------------------------------------------------

Some resources can be accessed only from within Fermilab network. For
some, the access outside Fermilab network is still allowed but
crippled.
To allow users to access these resources in full by connecting via a
Virtual Private Network (VPN), which needs to be [set up on the client node](../sbn_wiki/VPN.md).



Submitting jobs: Virtual Organisation
---------------------------------------------------------------------------------------------

The name of our virtual organisation is `sbnd`.



Submitting jobs: grid resources
---------------------------------------------------------------------------------

This is about where your job gets actually shipped for execution, and
who runs it.

We can use different resources:

-   *FermiGrid* is the grid dedicated to Fermilab users
-   *Open Science Grid* is an international grid, with strong
    contributions from physics but not limited to it
-   *Wilson Cluster* is a Fermilab cluster *offering Graphics Processing Units* (GPU)

To submit jobs, you'll also need a [certificate proxy](Get_a_certificate_proxy.md).

_Note_: to ensure that your LArSoft jobs are executed in a complete environment,
it is strongly recommended that the jobs are executed in the proper [Singularity container](https://singularity.lbl.gov)
([FIFE documentation here](https://cdcvs.fnal.gov/redmine/projects/fife/wiki/Singularity_jobs)).
One such container featuring Scientific Linux Fermi 7 (SL7) is available in CVMFS,
and it can be enabled by adding to `jobsub_submit` the options:
`--append_condor_requirements='(TARGET.HAS_SINGULARITY=?=true)' -l '+SingularityImage="/cvmfs/singularity.opensciencegrid.org/fermilab/fnal-wn-sl7:latest"'`
(when using LArBatch `project.py` from `larbatch` `v01_55_01` or newer,
Singularity containers are already enabled in most configurations,
as [documented by the author](https://indico.fnal.gov/event/48412/#2-container-issues-and-larbatc),
and often no action is needed, beside maybe adding a `<os>` element for good measure).
Also note that FIFE recommends that Operating System selection be not enforced
via `--os` option when using containers (after all, we are explicitly shipping the whole OS).

And, about FIFE recomendations, [Project-py](https://cdcvs.fnal.gov/redmine/projects/project-py/wiki/Project-py_guide)
is the recommended job submission tool (SBN-specific wiki documentation pending).



Software distribution
--------------------------------------------------------------

SBND code and the "software stack" it relies on are distributed in
binary form for a few supported platforms.

Here is where you can find those packages pre-installed: CVMFS and
FermiApp. LArSoft/SBND code UPS products precompiled for selected
platforms can also be downloaded from the
[SciSoft repository](Using_LArSoft_on_a_local_machine.md).
The [content of the areas](Software_distribution_content.md) is described
in its own web page.



### CVMFS

SBND CVMFS area is `/cvmfs/sbnd.opensciencegrid.org`.

CVMFS is a file system that mirrors locally a remote storage area (not
dissimilarly from NFS), and it is available on the Open Science Grid
nodes (and Fermigrid as well).
So it is a safe bet.

You can also install it on your laptop;
[LArSoft links to instructions](https://cdcvs.fnal.gov/redmine/projects/larsoft/wiki/LArSoft_cvmfs_page)
(currently from MicroBooNE). Good news is, it's not hard.

The full path to access the area is:
`/cvmfs/sbnd.opensciencegrid.org/products/sbnd`. The
`products/sbnd` directory contains our software distribution.

_[[Instructions](Write_files_to_CVMFS.md) on how to deploy software in there are
[elsewhere](Write_files_to_CVMFS.md).]_



Storing data
--------------------------------------------

We have two types of data storage available, that we'll call
"BlueArc" and "dCache". FIFE explains [their characteristics](Understanding_storage_volumes.md)
in detail.
Production level data are stored to tape ("Enstore") and tracked with a database ("SAM").



### Local storage: CephFS disks

CephFS is the filesystem used by Fermilab disk servers. These are
multi-terabyte disks that are split between experiments.
SBND has its own slice of it, in two partitions:

-   `/exp/sbnd/data` where you can write a few large files (e.g. ROOT data);
    if your data is larger than a hundred GB, people start muttering, as
    the space is limited and shared among all of us. Time to go dCache
    then.
-   `/exp/sbnd/app` where you can keep a few software builds; this is also a
    shared disk, and you should keep no large data here. But you need to
    have the code here, as content in the `/exp/sbnd/data` partition
    **can't be executed**.

**These data areas can be only directly accessed from the GPVM and BUILD nodes.**
If your grid job needs data from them, you have to copy themto the grid worker node first.

You should create your own directory under `/exp/sbnd/data/users/${USER}`
and `/exp/sbnd/app/users/${USER}`, and stick to them.
Space available to SBND collaboration:

path            | space
----------------| --------
`/exp/sbnd/app`     | 6.0 TB
`/exp/sbnd/data`    | 25 TB
  

Be fair about disk usage and make sure to clean up unneeded stuff, this
resource is shared by everyone in the collaboration.

The available disk space can be read using `df -h`.  
Quota and usage per user are available in the [SBND CephFS usage](https://landscape.fnal.gov/monitor/d/d4qZ8JSSz/cephfs-experiment-usage?orgId=1&var-group=sbnd)


### World-visible storage: dCache

dCache area consists of a huge data space, made of tapes and disks.

We have three types of dCache areas:

-   `scratch`: files in this area can be deleted automatically; you can
    store a grid job result there waiting to transfer it into a safe
    place, but don't rely on leaving your important stuff there for
    long
-   `persistent`: files in this area will not be deleted
-   `resilient`: area used for files with intense access (like a
    working area snaphot which is accessed by thousands of jobs)

We have a limited quota of space as well, so fill it responsibly.
More information (including how to remotely access it) can be found in
the [SBND dCache wiki page](SBND_dCache_storage.md).




### Tape storage

> 20170906: SBND is requesting the ability to store data on tapes. This
> is a multi-step procedure requiring access to file transfer service, a
> file database and actual tape allocation.



### File database (SAM)

Fermilab provides a service, SAM, to track where files are currently
stored. An introduction to the system can be found on [User Guide for SAM](_How_to_create_and_use_a_SAM_definition.html),
and users interact with it via
[sam-web-client](https://cdcvs.fnal.gov/redmine/projects/sam-web-client/wiki).
In short, SAM not only stores
metadata of the files (e.g., that a file is simulation, and how many
events are in it) and the current locations (that is, the "original"
tape location, the copies cached in dCache, the copies spread across
worker nodes...), but it can also queue the files for delivery.

SBND is assigned a "station" that SAM clients will communicate with
to access the database.
More information on [SBND SAM](SAM.md) is collected in its
own [web page](SAM.md).



Web server pages
----------------------------------------------------

SBND and SBN has a number of web pages.
A few are listed here.



### SBN online web gate

The SBN online web gate is at <https://sbn-online.fnal.gov>. That is not
a public page.
Its content is also readable directly from SBND GPVM\'s and FNALU as
`/web/sites/s/sbn-online.fnal.gov`. Direct write access is restricted,
and can be requested asking [William Badgett](mailto:badgett@fnal.gov).
Currently the site has almost no content and we are looking for
volunteers to help populate it with useful detector status info.



### SBND data web directory

The SBND data web directory is at <https://sbnd-data.fnal.gov>.
The site is currently only accessible via a browser when connected to
the FNAL network (VPN included). We are in the process of changing
this.
Its content is also readable directly from SBND GPVM\'s and FNALU as
`/web/sites/s/sbnd-data.fnal.gov`. Direct write access is restricted,
and can be requested asking the "owner" of the site. At time of
writing, the site owners are [Andrzej
Szelc](mailto:andrzej.szelc@manchester.ac.uk) and [Dominic
Brailsford](mailto:d.brailsford@lancaster.ac.uk).



### Communication tools



#### Mailing lists

Add link to mailing list webpage



#### Electronic logbook

SBND online system uses an [electronic logbook](http://dbweb0.fnal.gov/ECL/sbnd/) (friendly called
"eLog"), accessible at <http://dbweb0.fnal.gov/ECL/sbnd/> . The
Fermilab service account credentials are used to log in. Most current
SBND members have an account. New members need to request one by
clicking on the "Members" tab and then on the "Request an account"
link.



Other obscure services and resources
--------------------------------------------------------------------------------------------

SBND uses more services, which are usually hidden to most users. They
are documented in [their own page](Computing_services_and_resources_for_SBND_experts.html).
