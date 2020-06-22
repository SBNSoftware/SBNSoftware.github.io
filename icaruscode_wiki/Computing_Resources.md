---
lang: en
title: Computing Resources
---

Computing Resources
====================

-   [SCD liaison](#scd-liaison)
-   [Computing Access](#computing-access)
    -   [SSH access to remote servers](#ssh-access-to-remote-servers)
-   [Where to work: interactive nodes ("GPVM")](#where-to-work-interactive-nodes-gpvm)
-   [Opening a ticket in Fermilab Service Desk](#opening-a-ticket-in-fermilab-service-desk)
-   [Accessing resources (DocDB, VOMS, ...) via certificates](#accessing-resources-docdb-voms--via-certificates)
-   [Accessing resources via Virtual Private Network](#accessing-resources-via-virtual-private-network)
-   [Submitting jobs: Virtual Organisation](#submitting-jobs-virtual-organisation)
-   [Submitting jobs: grid resources](#submitting-jobs-grid-resources)
-   [Software distribution](#software-distribution)
        -   [CVMFS](#cvmfs)
-   [Storing data](#storing-data)
    -   [Local storage: BlueArc disks](#local-storage-bluearc-disks)
    -   [World-visible storage: dCache](#world-visible-storage-dcache)
    -   [Tape storage](#tape-storage)
    -   [File database (SAM)](#file-database-sam)
-   [Web server pages](#web-server-pages)
    -   [SBN online web gate](#sbn-online-web-gate)
    -   [ICARUS data web directory](#icarus-data-web-directory)
    -   [Communication tools](#communication-tools)
        -   [Mailing lists](#mailing-lists)
-   [Other obscure services and resources](#other-obscure-services-and-resources)

ICARUS has a number of computing resources available, many of which are
supplied by Fermilab Computing Sector (SCD when we talk about the
Scientific Computing Division).\
Here we list some of them.

> Fermilab Computing Division has produced a **[very short
> pamphlet]{style="color: red;"}** explaining in a nutshell the
> different credentials used in Fermilab. It can be found as [document
> 5892 in the SCD
> DocDB](http://cd-docdb.fnal.gov/cgi-bin/ShowDocument?docid=5892){.external}.
> **It is a strongly recommended reading, to everybody!**



#### SCD liaison

The [Scientific Computing Division Liaison](Roles_and_people.md) is a person from Fermilab SCD
who acts as a bridge between SCD and an experiment. They is typically
fairly informed of what is going on, computation-wise, in the
experiment, and in the computing division^[1](#fn1)^. They is also able
to route any request to the proper people, but they is not necessarily
required to do actual work on solving the merit of the issues. Also,
they is not required to be a member of the experiment.

The current liaison for ICARUS is [[Wes
Ketchum]{style="color: limegreen;font-weight: bold;font-size: larger;"}](mailto:wketchum@fnal.gov)
(SCD).

^1^ This is defined as knowing what goes on in the computing division
more than most experiment members, and knowing what is going on in the
experiment more than most of the computing division people.



Computing Access
-----------------

See the [Computing resources](Computing_resources.html) page
to see a discussion about the resources available to ICARUS.

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
    ssh -Y ${USER}@icarusgpvm01.fnal.gov

\
(where `${USER}` should be replaced by your Fermilab user name).

If this does not work, please submit a [service desk
ticket](#Opening-a-ticket-in-Fermilab-Service-Desk) to
request a ICARUS project account (note that someone has to authorise
this so it will probably fail):

1.  [ServiceNow](https://fermi.service-now.com/fsc/){.external} -\>
    Service Catalog -\> Affiliation/Experiment Computing Account Request
2.  Enter your name, then select `T-1052 (ICARUS)`
3.  Verify that the correct Fermilab principal is displayed when you
    enter your name
4.  Enter your home institution, then click \<Submit\>.

You can reset your Fermilab passwords for service-now here:
<https://password-reset.fnal.gov/showLogin.cc>\
If you can\'t remember your password because you didn\'t write it down
then you will have contact the [service
desk](mailto:servicedesk@fnal.gov) (+1 (630) 840-2345).



### SSH access to remote servers

Access to servers via terminal is obtained via secure shell (SSH).\
For most cases you access to a remote server authenticating as yourself
by providing a Kerberos 5 ticket: see above for how to get registered
for this type of authentication.\
The ticket can be obtained on the local machine (e.g. your laptop) using
a Kerberos 5 client (usually that is MIT\'s):\

    kinit -F -l 26h -r 7d username@FNAL.GOV

asks the Kerberos realm `FNAL.GOV` (which must be described somewhere in
your system, typically in `/etc/krb5.conf` that you copied from
Fermilab) to authenticate you as `username`, which must be the Fermilab
user name (it can be omitted if it is the same as the local user name on
the laptop). The other options:

-   `-F`: the ticket is *forwardable*: you can send it with your request
    for connection; this is the first of the steps to avoid errors like
    `Could not chdir to home directory /nashome/u/username: Permission denied`;
-   `-l 26`: lifetime of the ticket is 26 hours: for 26 hours SSH can
    reuse this ticket, then you have to get a new one or renew this one;
-   `-r 7d`: expiration time is 7 days: after 7 days, this ticket can\'t
    be renewed any more and you need to get a new one.

You can see the list of current Kerberos5 tickets with `klist -f` (`-f`
shows the flags of the tickets, `F` means it\'s *forwardable*, `f` means
it *has been forwarded*; `R` means renewable, `i` means invalid and the
others mean you need to read the manual, `man klist`).\
If you do not have a valid ticket, you can maybe renew one with:\

    kinit -R user

\
and if it works you save yourself typing a password. A practical
command: `kinit -R username || kinit -F -l 26h -r 7d username` will
attempt renewing and get a new ticket on failure.

Next and last, SSH needs not only to use that ticket, but also to
forward it to the remote server. This is called \"delegating
credentials\" in SSH lingo. One time command:\

    ssh -K username@icarusgpvm01.fnal.gov

-   `-K` tells SSH to forward the Kerberos credentials; this is the
    other step to avoid errors like
    `Could not chdir to home directory /nashome/u/username: Permission denied`;
-   other common options can be added (`-X`, `-Y`, \...).

For a permanent solution, you can change the SSH client configuration of
your user (OpenSSH stores it in `${HOME}/.ssh/config` by default) by
adding something like:\

    Host cdcvs.fnal.gov
        ForwardX11 no        # for Redmine GIT connections, don't try graphics
        ForwardX11Trusted no

    Host *.fnal.gov 131.225.*
        User                      username  # Fermilab user name (allows something like `ssh icarusgpvm01.fnal.gov`)
        ForwardX11                yes       # establish an X11 connection to get graphics on your laptop (via X servers like X11 or XQuartz)
        ForwardX11Trusted         yes
        GSSAPIAuthentication      yes       # enable authentication via Kerberos 5
        GSSAPIDelegateCredentials yes       # forward Kerberos 5 credentials
        ConnectTimeout            60        # bail out if no answer for one minute

Hint: you can edit Kerberos 5 configuration file so that `FNAL.GOV` is
the default realm, and then you don\'t need to type `@FNAL.GOV` in
Kerberos 5 commands. That might not be welcome if your institution uses
Kerberos 5 too with a different realm, which opens a new realm of
complication.



Where to work: interactive nodes ("GPVM")
------------------------------------------

We have some dedicated \"nodes\" where we can log in and work
interactively.\
These are General Purpose Virtual Machines (GPVM); they are shared by
all ICARUS collaborators, and they can not be the fastest way to develop
and run analyses.\
But they see all the resources that we have available: you can read data
from ICARUS disks and tapes, and you can submit ICARUS jobs to the
grid.\
The access is via SSH with FNAL.GOV [Kerberos
credentials](#SSH_access_to_remote_servers).\
The nodes are called:

  --------------------------------------------------- -------
  [`icarusgpvm01.fnal.gov`]{style="color: green;"}    SLF 6
  [`icarusgpvm02.fnal.gov`]{style="color: green;"}    SLF 6
  [`icarusgpvm03.fnal.gov`]{style="color: green;"}    SLF 7
  [`icarusgpvm04.fnal.gov`]{style="color: green;"}    SLF 7
  [ `icarusbuild01.fnal.gov`]{style="color: navy;"}   SLF 6
  [ `icarusbuild02.fnal.gov`]{style="color: navy;"}   SLF 7
  --------------------------------------------------- -------

The [GPVM]{style="color: green;"} interactive machines have no relevant
local storage, and areas in `/icarus` and `/pnfs` should be used (the
home directory works too, but it has small allowance).

The interactive \"build nodes\"
[`icarusbuild01.fnal.gov`]{style="color: navy;"} and
[`icarusbuild02.fnal.gov`]{style="color: navy;"} have roughly the same
environment as the other GPVM\'s. The policy is to **use this machine
only to build code and running tests**; this excludes job submission and
local running of job campaigns and of single jobs beyond the size of a
test job (say, 100 events). To maximise the benefit, build from the
local disk; you can make your own scratch area by

    cd /scratch
    ./createMyScratchArea.sh

[Information about all ICARUS GPVM\'s](ICARUS_servers.html){.wiki-page
.new} is on a [separate page](ICARUS_servers.html){.wiki-page .new}.



Opening a ticket in Fermilab Service Desk
------------------------------------------

When something goes wrong, open a ticket! Its fun, its easy but most
important it is how you engage experts to solve your problems (well,
software problems).\
You want to open a Service Desk ticket if your job submission that used
to work yesterday fails today, if the GPVM are very slow (if they are
just slow, it\'s normal), if you are denied access to some resource you
expect to deserve.\
You don\'t open a service desk ticket if your jobs crash (most of the
time, you just have to fix them), if there is a bug in ICARUS code
([e-mail to ICARUS mailing list](mailto:icarus_reconstruction@fnal.gov)
and/or [Redmine
ticket](https://cdcvs.fnal.gov/redmine/projects/icaruscode/issues/new){.external}
there) or if you need help with using LArSoft (LArSoft
[wiki](.html), [mailing list](mailto:larsoft@fnal.gov) or
[forum](http://www.larforum.org/forum){.external}, and [ICARUS mailing
list](mailto:icarus_reconstruction@fnal.gov)).

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
> tickets](https://cdcvs.fnal.gov/redmine/projects/icaruscode/issues){.external},
> opened via Redmine, against LArSoft or `icaruscode` pertaining LArSoft
> or ICARUS software bug reports or feature requests.



Accessing resources (DocDB, VOMS, ...) via certificates
--------------------------------------------------------

> Note: this section is about \"personal\" certificates, not the kind of
> [certificate proxies you need to work on the
> grid](Get_a_certificate_proxy.html).

A CILogon certificate gives access to a number of Fermilab resources.\
After you [get a CILogon
certificate](Setting_up_access_with_CILogon_certificate.html),
you will gain access to:

-   [SBN DocDB](http://sbn-docdb.fnal.gov){.external} (see also [some
    specific ICARUS
    instructions](Access_to_SBN_DocDB_for_ICARUS_collaborators.html))
-   [Fermilab Virtual Organization (VOMS)
    server](https://voms.fnal.gov:8443/voms/fermilab/user/home.action){.external}
-   Jenkins build server



Accessing resources via Virtual Private Network
------------------------------------------------

Some resources can be accessed only from within Fermilab network. For
some, the access outside Fermilab network is still allowed but
crippled.\
To allow users to access these resources in full by connecting via a
Virtual Private Network (VPN), which needs to be [set up on the client node](../sbn_wiki/VPN.md)



Submitting jobs: Virtual Organisation
--------------------------------------

The name of our virtual organisation is `icarus`.



Submitting jobs: grid resources
--------------------------------

This is about where your job gets actually shipped for execution, and
who runs it.\
We can use different resources:

-   *FermiGrid* is the grid dedicated to Fermilab users
-   *Open Science Grid* is an international grid, with strong
    contributions from physics but not limited to it
-   *Wilson Cluster* is a Fermilab cluster *offering Graphics Processing
    Units* (GPU); if you need information, ask [Gianluca
    Petrillo](mailto:petrillo@slac.stanford.edu)

To submit jobs, you\'ll also need a [certificate
proxy](Get_a_certificate_proxy.html).



Software distribution
----------------------

ICARUS code and the \"software stack\" it relies on are distributed in
binary form for a few supported platforms.\
Here is where you can find those packages pre-installed: CVMFS and
FermiApp. LArSoft/ICARUS code UPS products precompiled for selected
platforms can also be downloaded from the [SciSoft
repository](Using_LArSoft_on_a_local_machine.html){.wiki-page .new}.\
The [content of the
areas](Software_distribution_content.html){.wiki-page .new} is described
in its own web page.



### CVMFS

ICARUS has a CVMFS area with the `icarus.opensciencegrid.org`.\
CVMFS is a file system that mirrors locally a remote storage area (not
dissimilarly from NFS), and it is available on the Open Science Grid
nodes (and Fermigrid as well).\
So it is a safe bet.\
You can also install it on your laptop; [LArSoft links to
instructions](LArSoft_cvmfs_page.html) (currently from
MicroBooNE). Good news is, it\'s not hard.

The full path to access the area is:
`/cvmfs/icarus.opensciencegrid.org/products/icarus`. The
`products/icarus` directory contains our software distribution.

*[[Instructions](Write_files_to_CVMFS.html) on how to deploy
software in there are
[elsewhere](Write_files_to_CVMFS.html).]{style="color: gray;"}*



Storing data
-------------

We have two types of data storage available, that we\'ll call
\"BlueArc\" and \"dCache\". FIFE explains [their
characteristics](Understanding_storage_volumes.html) in
detail.\
Production level data are stored to tape (\"Enstore\") and tracked with
a database (\"SAM\").



### Local storage: BlueArc disks

BlueArc is a brand of the disk servers Fermilab uses. These are
multi-terabyte disks that are split between experiments.\
ICARUS has its own slice of it, in two partitions:

-   `/icarus/data` where you can write a few large files (e.g. ROOT
    data); if your data is larger than a hundred GB, people start
    muttering, as the space is limited and shared among all of us. Time
    to go dCache then.
-   `/icarus/app` where you can keep a few software builds; this is also
    a shared disk, and you should keep no large data here. But you need
    to have the code here, as content in the `/icarus/data` partition
    **can\'t be executed**.

**These data areas can be only directly accessed from the GPVM nodes.**
If your grid job needs data from them, you have to copy the information
locally first.

You should create your own directory under `/icarus/data/users/${USER}`
and `/icarus/app/users/${USER}`, and stick to them.\
Space available to ICARUS collaboration:

`/icarus/app`

1.5 TB
([RITM0599944](https://fermi.service-now.com/nav_to.do?uri=sc_task.do?sys_id=c8b8489bdb384700cbd0f3421f961931){.external})

`/icarus/data`

10 TB

~~20 TB~~
([RITM0599944](https://fermi.service-now.com/nav_to.do?uri=sc_task.do?sys_id=c8b8489bdb384700cbd0f3421f961931){.external})

This information can be read using `quota -s` or `df -h`.



### World-visible storage: dCache

dCache area consists of a huge data space, made of tapes and disks.\
We have two types of dCache areas:

-   `scratch`: files in this area can be deleted automatically; you can
    store a grid job result there waiting to transfer it into a safe
    place, but don\'t rely on leaving your important stuff there for
    long
-   `persistent`: files in this area will not be deleted

We have a limited quota of space as well, so fill it responsibly.\
More information (including how to remotely access it) can be found in
the [ICARUS dCache wiki page](ICARUS_dCache_storage.html){.wiki-page
.new}.



### Tape storage

> 20170906: ICARUS is requesting the ability to store data on tapes.
> This is a multi-step procedure requiring access to file transfer
> service, a file database and actual tape allocation.



### File database (SAM)

Fermilab provides a service, SAM, to track where files are currently
stored. An introduction to the system can be found on [User Guide for
SAM](User_Guide_for_SAM.html), and users interact with it
via [sam-web-client](.html). In short, SAM not only stores
metadata of the files (e.g., that a file is simulation, and how many
events are in it) and the current locations (that is, the \"original\"
tape location, the copies cached in dCache, the copies spread across
worker nodes\...), but it can also queue the files for delivery.

ICARUS is assigned a \"station\" that SAM clients will communicate with
to access the database.\
More information on [ICARUS SAM](SAM.html){.wiki-page .new} is collected
in its own [web page](SAM.html){.wiki-page .new}.



Web server pages
-----------------

ICARUS and SBN has a number of web pages. Information about them is
available in the [ICARUS wiki](ICARUS_homepage.html){.wiki-page .new}.



### SBN online web gate

The SBN online web gate is at <https://sbn-online.fnal.gov>. That is not
a public page.\
Its content is also readable directly from ICARUS GPVM\'s and FNALU as
`/web/sites/s/sbn-online.fnal.gov`. Direct write access is restricted,
and can be requested asking [William Badgett](mailto:badgett@fnal.gov).
Currently the site has almost no content and we are looking for
volunteers to help populate it with useful detector status info.



### ICARUS data web directory

The ICARUS data web directory is at <https://icarus-data.fnal.gov>.\
The site is currently only accessible via a browser when connected to
the FNAL network (VPN included). We are in the process of changing
this.\
Its content is also readable directly from ICARUS GPVM\'s and FNALU as
`/web/sites/s/icarus-data.fnal.gov`. Direct write access is restricted,
and can be requested asking the \"owner\" of the site. At time of
writing, the site owners are [Wes Ketchum](mailto:wketchum@fnal.gov) and
[Gianluca Petrillo](mailto:petrillo@slac.stanford.edu).



### Communication tools


#### Mailing lists

ICARUS owns some mailing lists for specific purposes. The most generally
useful are listed in the [ICARUS Redmine
wiki](ICARUS_homepage.html#Collaboration){.wiki-page .new}.\
Mailing lists owned by ICARUS and hosted at [Fermilab
ListServ](http://listserv.fnal.gov){.external}:

  ---------------------------------- -------------------------------------------------- -------------------------------
  **Mailing list**                   **owner**                                          **purpose**
  <icarus_reconstruction@fnal.gov>   [Daniele Gibin](mailto:daniele.gibin@pd.infn.it)   General software mailing list
  ---------------------------------- -------------------------------------------------- -------------------------------



Other obscure services and resources
-------------------------------------

ICARUS uses more services, which are usually hidden to most users. They
are documented in [their own
page](Computing_services_and_resources_for_ICARUS_experts.html){.wiki-page
.new}.
