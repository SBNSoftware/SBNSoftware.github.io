---
lang: en
title: Computing resources
---

{#Computing-resources}

Computing resources(#Computing-resources)
==========================================================

-   **Table of contents**
-   [Computing resources](#Computing-resources)
    -   -   -   [SCD liaison](#SCD-liaison)

    -   [Computing Access](#Computing-Access)

    -   [Where to work: interactive nodes
        (\"GPVM\")](#Where-to-work-interactive-nodes-GPVM)

    -   [Opening a ticket in Fermilab Service
        Desk](#Opening-a-ticket-in-Fermilab-Service-Desk)

    -   [Accessing resources via
        certificates](#Accessing-resources-via-certificates)

    -   [Accessing resources via Virtual Private
        Network](#Accessing-resources-via-Virtual-Private-Network)

    -   [Submitting jobs: Virtual
        Organisation](#Submitting-jobs-Virtual-Organisation)

    -   [Submitting jobs: grid
        resources](#Submitting-jobs-grid-resources)

    -   [Software distribution](#Software-distribution)
        -   [Local Fermilab area
            (FermiApp)](#Local-Fermilab-area-FermiApp)
        -   [CVMFS](#CVMFS)

    -   [Storing data](#Storing-data)
        -   [Local storage: BlueArc disks](#Local-storage-BlueArc-disks)
        -   [World-visible storage:
            dCache](#World-visible-storage-dCache)
        -   [Tape storage](#Tape-storage)
        -   [File database (SAM)](#File-database-SAM)

    -   [Web server pages](#Web-server-pages)
        -   [SBN online web gate](#SBN-online-web-gate)
        -   [SBND data web directory](#SBND-data-web-directory)
        -   [Communication tools](#Communication-tools)
            -   [Mailing lists](#Mailing-lists)
            -   [Electronic logbook](#Electronic-logbook)

    -   [Other obscure services and
        resources](#Other-obscure-services-and-resources)

SBND has a number of computing resources available, many of which are
supplied by Fermilab Computing Sector (SCD when we talk about the
Scientific Computing Division).\
Here we list some of them.

> Fermilab Computing Division has produced a **[very short
> pamphlet]{style="color: red;"}** explaining in a nutshell the
> different credentials used in Fermilab. It can be found as [document
> 5892 in the SCD
> DocDB](http://cd-docdb.fnal.gov/cgi-bin/ShowDocument?docid=5892){.external}.
> **It is a strongly recommended reading, to everybody!**

{#SCD-liaison}

#### SCD liaison(#SCD-liaison)

The Scientific Computing Division Liaison is a person from Fermilab SCD
who acts as a bridge between SCD and an experiment. They is typically
fairly informed of what is going on, computation-wise, in the
experiment, and in the computing division^[1](#fn1)^. They is also able
to route any request to the proper people, but they is not necessarily
required to do actual work on solving the merit of the issues. Also,
they is not required to be a member of the experiment.

The current liaison for SBND is [[Vito Di
Benedetto]{style="color: limegreen;font-weight: bold;font-size: larger;"}](mailto:vito@fnal.gov)
(SCD).

^1^ This is defined as knowing what goes on in the computing division
more than most experiment members, and knowing what is going on in the
experiment more than most of the computing division people.

{#Computing-Access}

Computing Access(#Computing-Access)
----------------------------------------------------

See the [Computing resources](Computing_resources.html) page
to see a discussion about the resources available to SBND.

To get a Fermilab computing account follow the instructions at this
site:
<https://fermi.service-now.com/kb_view_customer.do?sysparm_article=KB0010797>.
Our experiment number is T-1053.

**Write down the initial Kerberos and Services Account passwords before
submitting**. They will be necessary once your accounts have been
created.

You will receive an email once this is complete which gives you your
Fermilab email account and username (you will need this for service
now).\
Once your computer is SSH-ready and kerberized, you should be able to
log on by typing:\

    kinit ${USER}@FNAL.GOV
    ssh -Y ${USER}@sbndgpvm01.fnal.gov

\
(where `$USER` is your Fermilab user name).

If this does not work, please submit a [service desk
ticket](#Opening-a-ticket-in-Fermilab-Service-Desk) to
request a SBND project account (I believe someone has to authorise this
so it will probably fail):

1.  [ServiceNow](https://fermi.service-now.com/fsc/){.external} -\>
    Service Catalog -\> Affiliation/Experiment Computing Account Request
2.  Enter your name, then select `T-1053 (SBND)`
3.  Verify that the correct Fermilab principal is displayed when you
    enter your name
4.  Enter your home institution, then click \<Submit\>.

You can reset your Fermilab passwords for service-now here:
<https://password-reset.fnal.gov/showLogin.cc>\
If you can\'t remember your password because you didn\'t write it down
then you will have contact the [service
desk](mailto:servicedesk@fnal.gov) (+1 (630) 840-2345).

{#Where-to-work-interactive-nodes-GPVM}

Where to work: interactive nodes (\"GPVM\")(#Where-to-work-interactive-nodes-GPVM)
---------------------------------------------------------------------------------------------------

We have some dedicated \"nodes\" where we can log in and work
interactively.\
These are General Purpose Virtual Machines (GPVM); they are shared by
all SBND collaborators, and they can not be the fastest way to develop
and run analyses.\
But they see all the resources that we have available: you can read data
from SBND disks and tapes, and you can submit SBND jobs to the grid.\
The access is via SSH with FNAL.GOV Kerberos credentials.

The nodes and their OS version are:

  ------------------------------------------------- -------
  [`sbndgpvm01.fnal.gov`]{style="color: green;"}    SLF 6
  [`sbndgpvm02.fnal.gov`]{style="color: green;"}    SLF 6
  [`sbndgpvm03.fnal.gov`]{style="color: green;"}    SLF 6
  [`sbndgpvm04.fnal.gov`]{style="color: green;"}    SLF 7
  [ `sbndbuild01.fnal.gov`]{style="color: navy;"}   SLF 6
  [ `sbndbuild02.fnal.gov`]{style="color: navy;"}   SLF 7
  ------------------------------------------------- -------

The old `lar1ndgpvm01.fnal.gov` will be discontinued soon: don\'t get
used to it.

The [GPVM]{style="color: green;"} interactive machines have no relevant
local storage, and areas in `/sbnd` and `/pnfs` should be used (the home
directory works too, but it has small allowance).

The interactive \"build nodes\" [BUILD]{style="color: navy;"} have
roughly the same environment as the other GPVM\'s. The policy is to
**use these machines only to build code and running tests**; this
excludes job submission and local running of job campaigns and of single
jobs beyond the size of a test job (say, 100 events). To maximise the
benefit, build from the local disk; you can make your own scratch area
by

    cd /scratch
    ./createMyScratchArea.sh

[Information about all SBND GPVM\'s](SBND_servers.html) is
on a [separate page](SBND_servers.html).

{#Opening-a-ticket-in-Fermilab-Service-Desk}

Opening a ticket in Fermilab Service Desk(#Opening-a-ticket-in-Fermilab-Service-Desk)
------------------------------------------------------------------------------------------------------

This is the favourite sport of ours: when something goes wrong, open a
ticket.\
You want to open a Service Desk ticket if your job submission that used
to work yesterday fails today, if the GPVM are very slow (if they are
just slow, it\'s normal), if you are denied access to some resource you
expect to deserve.\
You don\'t open a service desk ticket if your jobs crash (most of the
time, you just have to fix them), if there is a bug in SBND code
([e-mail to SBND mailing list](mailto:sbnd-software@fnal.gov) and/or
[Redmine
ticket](https://cdcvs.fnal.gov/redmine/projects/sbndcode/issues/new){.external}
there) or if you need help with using LArSoft (LArSoft
[wiki](.html), [mailing list](mailto:larsoft@fnal.gov) or
[forum](http://www.larforum.org/forum){.external}, and [SBND mailing
list](mailto:sbnd-software@fnal.gov)).

You need to log in via Fermilab \"Service\" password (the same you use
to access Fermilab e-mail and Redmine), and then you go at:

<https://fermi.service-now.com/navpage.do>

On the left, you\'ll have a list of \"Self service\" items: selecting
\"Scientific Computing Services\" or \"Core Computing Services\" you
will be presented with a list of topics that should direct you to the
right type of request.\
Most of the requests are under the \"Scientific Computing Services\",
with a relevant exception in the creation of computing accounts, which
is in \"Core Computing Services\".

> This ticket is completely unrelated to [issue tracking
> tickets](https://cdcvs.fnal.gov/redmine/projects/sbndcode/issues){.external},
> opened via Redmine, against LArSoft or `sbndcode` pertaining LArSoft
> or SBND software bug reports or feature requests.

{#Accessing-resources-via-certificates}

Accessing resources via certificates(#Accessing-resources-via-certificates)
--------------------------------------------------------------------------------------------

> Note: this section is about \"personal\" certificates, not the kind of
> [certificate proxies you need to work on the
> grid](Get_a_certificate_proxy.html).

A CILogon certificate gives access to a number of Fermilab resources.\
After you [get a CILogon
certificate](Setting_up_access_with_CILogon_certificate.html),
you will gain access to:

-   [SBN DocDB](http://sbn-docdb.fnal.gov){.external}
-   [Fermilab Virtual Organization (VOMS)
    server](https://voms.fnal.gov:8443/voms/fermilab/user/home.action){.external}
-   Jenkins build server

{#Accessing-resources-via-Virtual-Private-Network}

Accessing resources via Virtual Private Network(#Accessing-resources-via-Virtual-Private-Network)
------------------------------------------------------------------------------------------------------------------

Some resources can be accessed only from within Fermilab network. For
some, the access outside Fermilab network is still allowed but
crippled.\
To allow users to access these resources in full by connecting via a
Virtual Private Network (VPN), which needs to be [set up on the client
node](VPN.html).

{#Submitting-jobs-Virtual-Organisation}

Submitting jobs: Virtual Organisation(#Submitting-jobs-Virtual-Organisation)
---------------------------------------------------------------------------------------------

The name of our virtual organisation is `sbnd`.

{#Submitting-jobs-grid-resources}

Submitting jobs: grid resources(#Submitting-jobs-grid-resources)
---------------------------------------------------------------------------------

This is about where your job gets actually shipped for execution, and
who runs it.\
We can use different resources:

-   *FermiGrid* is the grid dedicated to Fermilab users
-   *Open Science Grid* is an international grid, with strong
    contributions from physics but not limited to it
-   *Wilson Cluster* is a Fermilab cluster *offering Graphics Processing
    Units* (GPU); if you need information, ask [Corey
    Adams](mailto:coreyadams@fas.harvard.edu)

To submit jobs, you\'ll also need a [certificate
proxy](Get_a_certificate_proxy.html).

{#Software-distribution}

Software distribution(#Software-distribution)
--------------------------------------------------------------

SBND code and the \"software stack\" it relies on are distributed in
binary form for a few supported platforms.\
Here is where you can find those packages pre-installed: CVMFS and
FermiApp. LArSoft/SBND code UPS products precompiled for selected
platforms can also be downloaded from the [SciSoft
repository](Using_LArSoft_on_a_local_machine.html).\
The [content of the
areas](Software_distribution_content.html) is described in
its own web page.

{#Local-Fermilab-area-FermiApp}

### Local Fermilab area (FermiApp)(#Local-Fermilab-area-FermiApp)

This area is visible from Fermi Grid nodes and GPVMs. It is accessible
as `/grid/fermiapp/products/sbnd`.\
It contains SBND software distribution.\
*[[Instructions](Write_files_to_grid.html) on how to deploy
software in there are
[elsewhere](Write_files_to_grid.html).]{style="color: gray;"}*

{#CVMFS}

### CVMFS(#CVMFS)

SBND has a CVMFS area with the `sbnd.opensciencegrid.org`.\
CVMFS is a file system that mirrors locally a remote storage area (not
dissimilarly from NFS), and it is available on the Open Science Grid
nodes (and Fermigrid as well).\
So it is a safe bet.\
You can also install it on your laptop; [LArSoft links to
instructions](LArSoft_cvmfs_page.html) (currently from
MicroBooNE). Good news is, it\'s not hard.

The full path to access the area is:
`/cvmfs/sbnd.opensciencegrid.org/products/sbnd`. The `products/sbnd`
directory contains our software distribution.

*[[Instructions](Write_files_to_CVMFS.html) on how to deploy
software in there are
[elsewhere](Write_files_to_CVMFS.html).]{style="color: gray;"}*

{#Storing-data}

Storing data(#Storing-data)
--------------------------------------------

We have two types of data storage available, that we\'ll call
\"BlueArc\" and \"dCache\". FIFE explains [their
characteristics](Understanding_storage_volumes.html) in
detail.\
Production level data are stored to tape (\"Enstore\") and tracked with
a database (\"SAM\").

{#Local-storage-BlueArc-disks}

### Local storage: BlueArc disks(#Local-storage-BlueArc-disks)

BlueArc is a brand of the disk servers Fermilab uses. These are
multi-terabyte disks that are split between experiments.\
SBND has its own slice of it, in two partitions:

-   `/sbnd/data` where you can write a few large files (e.g. ROOT data);
    if your data is larger than a hundred GB, people start muttering, as
    the space is limited and shared among all of us. Time to go dCache
    then.
-   `/sbnd/app` where you can keep a few software builds; this is also a
    shared disk, and you should keep no large data here. But you need to
    have the code here, as content in the `/sbnd/data` partition
    **can\'t be executed**.

**These data areas can be only directly accessed from the GPVM and BUILD
nodes.** If your grid job needs data from them, you have to copy the
information locally first.

You should create your own directory under `/sbnd/data/users/${USER}`
and `/sbnd/app/users/${USER}`, and stick to them.\
Space available to SBND collaboration:

  -------------- -------
  `/sbnd/app`    3 TB
  `/sbnd/data`   16 TB
  -------------- -------

Be fair about disk usage and make sure to clean up unneeded stuff, this
resource is shared by everyone in the collaboration.

This information can be read using `quota -s` or `df -h`.

{#World-visible-storage-dCache}

### World-visible storage: dCache(#World-visible-storage-dCache)

dCache area consists of a huge data space, made of tapes and disks.\
We have two types of dCache areas:

-   `scratch`: files in this area can be deleted automatically; you can
    store a grid job result there waiting to transfer it into a safe
    place, but don\'t rely on leaving your important stuff there for
    long
-   `persistent`: files in this area will not be deleted

We have a limited quota of space as well, so fill it responsibly.\
More information (including how to remotely access it) can be found in
the [SBND dCache wiki page](SBND_dCache_storage.html).

{#Tape-storage}

### Tape storage(#Tape-storage)

> 20170906: SBND is requesting the ability to store data on tapes. This
> is a multi-step procedure requiring access to file transfer service, a
> file database and actual tape allocation.

{#File-database-SAM}

### File database (SAM)(#File-database-SAM)

Fermilab provides a service, SAM, to track where files are currently
stored. An introduction to the system can be found on [User Guide for
SAM](User_Guide_for_SAM.html), and users interact with it
via [sam-web-client](.html). In short, SAM not only stores
metadata of the files (e.g., that a file is simulation, and how many
events are in it) and the current locations (that is, the \"original\"
tape location, the copies cached in dCache, the copies spread across
worker nodes\...), but it can also queue the files for delivery.

SBND is assigned a \"station\" that SAM clients will communicate with to
access the database.\
More information on [SBND SAM](SAM.html) is collected in its
own [web page](SAM.html).

{#Web-server-pages}

Web server pages(#Web-server-pages)
----------------------------------------------------

SBND and SBN has a number of web pages. Information about them is
available in the [SBND wiki](SBND_homepage.html).

{#SBN-online-web-gate}

### SBN online web gate(#SBN-online-web-gate)

The SBN online web gate is at <https://sbn-online.fnal.gov>. That is not
a public page.\
Its content is also readable directly from SBND GPVM\'s and FNALU as
`/web/sites/s/sbn-online.fnal.gov`. Direct write access is restricted,
and can be requested asking [William Badgett](mailto:badgett@fnal.gov).
Currently the site has almost no content and we are looking for
volunteers to help populate it with useful detector status info.

{#SBND-data-web-directory}

### SBND data web directory(#SBND-data-web-directory)

The SBND data web directory is at <https://sbnd-data.fnal.gov>.\
The site is currently only accessible via a browser when connected to
the FNAL network (VPN included). We are in the process of changing
this.\
Its content is also readable directly from SBND GPVM\'s and FNALU as
`/web/sites/s/sbnd-data.fnal.gov`. Direct write access is restricted,
and can be requested asking the \"owner\" of the site. At time of
writing, the site owners are [Andrzej
Szelc](mailto:andrzej.szelc@manchester.ac.uk) and [Dominic
Brailsford](mailto:d.brailsford@lancaster.ac.uk).

{#Communication-tools}

### Communication tools(#Communication-tools)

{#Mailing-lists}

#### Mailing lists(#Mailing-lists)

SBND owns some mailing lists for specific purposes. The most generally
useful are listed in the [SBND Redmine
wiki](SBND_homepage.html#Collaboration).\
Mailing lists owned by SBND hosted at [Fermilab
ListServ](http://listserv.fnal.gov){.external}:

  -------------------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------
  **Mailing list**                 **owner**                                                                                                                                                      **purpose**
  <sbnd@fnal.gov>                  ?                                                                                                                                                              collaboration-wide discussion arena of general SBND topics, including announcements for the collaboration
  <sbnd-software@fnal.gov>         ?                                                                                                                                                              collaboration-wide discussion and trouble-shooting arena for software issues (e.g. ROOT, LArSoft, \...)
  <sbnd-software-build@fnal.gov>   [Gianluca Petrillo](mailto:petrillo@fnal.gov), [Andrzej Szelc](mailto:andrzej.szelc@manchester.ac.uk)                                                          mostly the target of automated e-mails from the build system
  <sbnd-production@fnal.gov>       [Dominic Brailsford](mailto:d.brailsford@lancaster.ac.uk), [Andrzej Szelc](mailto:andrzej.szelc@manchester.ac.uk), [Vito Di Benedetto](mailto:vito@fnal.gov)   for communication within the SBND data and simulation production crew and with the computing division experts (e.g. POMS)
  <SBND-COMMIT@fnal.gov>           [Dominic Brailsford](mailto:d.brailsford@lancaster.ac.uk), [Andrzej Szelc](mailto:andrzej.szelc@manchester.ac.uk)                                              To receive notice of commits to sbndcode and sbndutil
  -------------------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------

{#Electronic-logbook}

#### Electronic logbook(#Electronic-logbook)

SBND online system uses an [electronic
logbook](http://dbweb0.fnal.gov/ECL/sbnd/){.external} (friendly called
\"eLog\"), accessible at <http://dbweb0.fnal.gov/ECL/sbnd/> . The
Fermilab service account credentials are used to log in. Most current
SBND members have an account. New members need to request one by
clicking on the \"Members\" tab and then on the \"Request an account\"
link.

{#Other-obscure-services-and-resources}

Other obscure services and resources(#Other-obscure-services-and-resources)
--------------------------------------------------------------------------------------------

SBND uses more services, which are usually hidden to most users. They
are documented in [their own
page](Computing_services_and_resources_for_SBND_experts.html).
