

# Remote Shift Connection Instructions

Below are brief instructions for getting connections to allow remote
shifting. As usual, read the main
[wiki](Wiki) for
more details on shifting in general.

A brief description of accounts at Fermilab can be found at the
[corresponding Wiki
page](AccountsAtFNAL).

The [ICARUS Document
Database](https://sbn-docdb.fnal.gov/cgi-bin/private/DocumentDatabase)
(logging in as icarus) has additional useful information :

-   The *Monitoring from Home* document in [DocDB
    17136](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=17136),
    has more detailed descriptions of items and pictures.
-   The *ROC Document* in [DocDB
    15944](https://sbn-docdb.fnal.gov/cgi-bin/sso/RetrieveFile?docid=15944)
    has more details about connection instructions (e.g. Zoom room for
    shift).

~\
~

::: 
[Edit this
section](RemoteShift/edit?section=2){.icon-only
.icon-edit}
:::



## **Testing your connections**

Shifters should test their connections well in advance of shift (see the
pieces below) and then again a few days before their shift. When
connecting to the VNC sessions (DAQ, Slow Controls), people testing
their connections should use the VIEW ONLY mode, so that they do not
disturb the shifter or the screens accidentally. To switch to VIEW ONLY
mode see our [NoVNC wiki
page](NoVNC).

When you need to interact with the session during your shift, remember
to turn off View Only.

~\
~

::: 
[Edit this
section](RemoteShift/edit?section=3){.icon-only
.icon-edit}
:::



## **What to do before every session**

A shared requisite some of the tools (especially iFix and Online
Monitoring) is to have an **FNAL VPN** enabled. See how to
[here](https://fermi.servicenowservices.com/kb_view.do?sysparm_article=KB0560)
. See SBN\'s page about using the [FNAL
VPN](https://sbnsoftware.github.io/sbn_wiki/VPN.html) for
additional guidance.

Besides the FNAL VPN, there are specific pre-requisites for each of the
connections that you\'ll need to set up for your shift. Those are listed
in each of the subsections below.

You will also need a **valid kerberos token** before starting any
connecting. For this, type the following in your terminal before every
session:\

    kinit username@FNAL.GOV

~\
~

**NOTE:** in the ssh commands on this page, sometimes the first ssh
tunnel specifies only the machine name. If you have issues with
permission denied errors from the commands, try appending your username
(likely `icarus` as in most of the commands below) to the machine name.
As an example, if you get a permission denied error, try\

    ssh -KL 9443:localhost:9443 username@icarus-gateway01.fnal.gov

\
**or**\

    ssh -KL 9443:localhost:9443 icarus@icarus-gateway01.fnal.gov

instead of\

    ssh -KL 9443:localhost:9443 icarus-gateway01.fnal.gov

~\
~

::: 
[Edit this
section](RemoteShift/edit?section=4){.icon-only
.icon-edit}
:::



## **Automating the connections**

The commands to make the tunnels to the machines that run the Slow
Controls and the DAQ, and to access Grafana are explicitly written in
the sections below. However, those who wish to *automate* the steps can
download [this GitHub
repository](https://github.com/brucehoward-physics/SBN_CR) ,
or clone it with the command

    git clone https://github.com/brucehoward-physics/SBN_CR.git

This repository contains scripts based on those used in the control
rooms but with some modification. These scripts run to set up the
tunnels once you have followed the prerequisites in of the given
categories below. There is `./setup_tunnel` for the DAQ VNC,
`./setup_tunnel_dcs` for the Slow Controls (DCS) VNC, and
`./connect_grafana` for the tunnel to set up the Grafana DAQ monitoring.
For Linux users, there is also a script to setup clickable icons for
creating the tunnels. See the slides in [DocDB
17136](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=17136)
for more details.

~\
~

::: 
[Edit this
section](RemoteShift/edit?section=5){.icon-only
.icon-edit}
:::



## **Contacts**

A couple of names are mentioned throughout this page, which contact
information is found in the table below.

  -------------- --------------------
  **Liaison**    **Email**
  Bruce Howard   howard at fnal.gov
  Wenqiang Gu    wgu at bnl.gov
  -------------- --------------------

~\
~

-   **Table of contents**
-   [Remote Shift Connection
    Instructions]
    -   [Testing your connections]
    -   [What to do before every
        session]
    -   [Automating the connections]
    -   [Contacts]
    -   [iFix]
        -   [Pre-requisites]
        -   [Instructions]
        -   [Recorded tutorial]
    -   [DCS (EPICS) VNC]
        -   [Pre-requisites]
        -   [Instructions]
        -   [Recorded tutorial]
    -   [DAQ VNC]
        -   [Pre-requisites]
        -   [Instructions]
    -   [DAQ Grafana Page]
        -   [Pre-requisites]
        -   [Instructions]
    -   [Other important pages]
    -   [Backup commands]
        -   [DAQ VNC]
        -   [DCS VNC]

~\
~

::: 
[Edit this
section](RemoteShift/edit?section=6){.icon-only
.icon-edit}
:::



## **iFix**

::: 
[Edit this
section](RemoteShift/edit?section=7){.icon-only
.icon-edit}
:::



### Pre-requisites

-   VPN enabled.
-   Fermi **Windows** domain account. You can request one via
    [Fermilab\'s Service Desk](http://servicedesk.fnal.gov/).
-   iFix account. Please **email the iFix liaisons well in advance** to
    request one. The current liaisons are Bruce and Wenqiang.
-   A Remote Desktop program supported by your Operating System to view
    the iFix cryogenics display.\
    For Windows, there is Remote Desktop Connection. For Mac, there is a
    Microsoft Remote Desktop program. For Scientific Linux, we have used
    Vinagre. For Ubuntu, try Remmina.

::: 
[Edit this
section](RemoteShift/edit?section=8){.icon-only
.icon-edit}
:::



### Instructions

1\. Open the Remote Microsoft Desktop and click on Add PC\
2. In PC name, type ppd-ifix2.fnal.gov\
3. Login using your Fermi Windows Domain account and password. If
you\'re receiving a credential error, try adding `FERMI\` before your
username.\
4. Click on the iFix icon in located in the Microsoft Desktop.\
5. Select SBN from the list of experiments\
6. Select ICARUS

::: 
[Edit this
section](RemoteShift/edit?section=9){.icon-only
.icon-edit}
:::



### Recorded tutorial

An [iFix tutorial for
shifters](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=19190)
can be found in the SBN DocDB 19190. You\'ll have to access like
*icarus*. This video goes through the steps to connect to the iFix
machine and it shows what to monitor during comissioning.\
~\
~

::: 
[Edit this
section](RemoteShift/edit?section=10){.icon-only
.icon-edit}
:::



## **DCS (EPICS) VNC**

-   Since VPN is needed for some of the connections like iFix, you will
    have it enabled during your shift.

::: 
[Edit this
section](RemoteShift/edit?section=11){.icon-only
.icon-edit}
:::



### Pre-requisites

-   Kerberos ticket.
-   Log-in permissions to the SBN-FD machines. Contact the person in
    charge of setups, currently Bruce and Wenqiang.

::: 
[Edit this
section](RemoteShift/edit?section=12){.icon-only
.icon-edit}
:::



### Instructions

From a terminal, do:

    ssh -KL 9443:icarus-evb06:443 icarus@icarus-gateway01.fnal.gov

Then, in a browser, open <https://localhost:9443>. This will grant
access to the noVNC. VNC password can be found on the [SBN-FD elog
Projects
page](http://dbweb0.fnal.gov/ECL/sbnfd/PL/project?pid=1)

You will find below a back-up command. Try the command below if you
cannot use the above, but make note that you are doing so in the ECL as
this can cause port collisions.

::: 
[Edit this
section](RemoteShift/edit?section=13){.icon-only
.icon-edit}
:::



### Recorded tutorial

A [PMT tutorial for
shifters](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=19441)
can be found in the SBN DocDB 19441. You\'ll have to access like
*icarus*. This video goes through the steps to connect to the icarus evb
06 machine, which currently runs the PMT EPICS. A video showing what to
monitor during commissioning will also be added soon.\
~\
~

::: 
[Edit this
section](RemoteShift/edit?section=14){.icon-only
.icon-edit}
:::



## **DAQ VNC**

-   Since VPN is needed for some of the connections like iFix, you will
    have it enabled during your shift.

::: 
[Edit this
section](RemoteShift/edit?section=15){.icon-only
.icon-edit}
:::



### Pre-requisites

-   Kerberos ticket.
-   Log-in permissions to the SBN-FD machines. Contact the person in
    charge of setups, currently Bruce and Wenqiang.

::: 
[Edit this
section](RemoteShift/edit?section=16){.icon-only
.icon-edit}
:::



### Instructions

From a terminal, do:\

    ssh -KL 8443:icarus-evb01:443 icarus@icarus-gateway01.fnal.gov

Then, in a browser, open <https://localhost:8443>. This will grant
access to the noVNC. VNC password can be found on the [SBN-FD Electronic
Logbook Projects
page](http://dbweb0.fnal.gov/ECL/sbnfd/PL/project?pid=1)

Note, you may need to zoom out in your browser in order to see the whole
desktop. Firefox also may have a scroll bar that allows you to move
around the part of the screen you see. NoVNC has a \"hand\" tool that
allows you to move around on the screen as well.

If for some reason this connection doesn\'t work, then try the \"DAQ VNC
backup command\" listed at the very end of this page.

~\
~

::: 
[Edit this
section](RemoteShift/edit?section=17){.icon-only
.icon-edit}
:::



## **DAQ Grafana Page**

-   Since VPN is needed for some of the connections like iFix, you will
    have it enabled during your shift.

::: 
[Edit this
section](RemoteShift/edit?section=18){.icon-only
.icon-edit}
:::



### Pre-requisites

-   Kerberos ticket.
-   Log-in permissions to the SBN-FD machines. Contact the person in
    charge of setups, currently Bruce and Wenqiang.

::: 
[Edit this
section](RemoteShift/edit?section=19){.icon-only
.icon-edit}
:::



### Instructions

From a terminal, do:

    ssh -KL 10080:localhost:10080 icarus@icarus-gateway01.fnal.gov ssh -KL 10080:localhost:10080 icarus@icarus-evb01.fnal.gov

Then, in a browser, open <http://localhost:10080> . This will grant
access to the Grafana page. Login is \"ICARUS-Shift\". Password can be
found on the [SBN-FD Electronic Logbook Projects
page](http://dbweb0.fnal.gov/ECL/sbnfd/PL/project?pid=1).

If you get errors following the above, try breaking the step into two
and going to db02 instead, so\

    ssh -KL 10080:localhost:10080 icarus@icarus-gateway01.fnal.gov

and then in the terminal this opens

    ssh -KL 10080:localhost:10080 icarus@icarus-db02.fnal.gov

and *then* opening the web browser and going to <http://localhost:10080>
.

~\
~

::: 
[Edit this
section](RemoteShift/edit?section=20){.icon-only
.icon-edit}
:::



## **Other important pages**

-   **Webcams** (require VPN): See pages listed in [SBN-FD Electronic
    Logbook Projects
    page](http://dbweb0.fnal.gov/ECL/sbnfd/PL/index)
-   **Monitoring** (requires VPN): See pages listed in [SBN-FD
    Electronic Logbook Projects
    page](http://dbweb0.fnal.gov/ECL/sbnfd/PL/index)
-   **Slack**: sbn.slack.com. Login and go to `#icarus-shift-operations`
    channel. It requires an invite so request one from your supervisor
    or Bruce if you haven't got one.
-   **Zoom**: use the shift Zoom room to coordinate shift take over
    if/as needed or desired, activities related to tests conducted by
    experts, etc. The connection details are at the beginning of [DocDB
    15944](https://sbn-docdb.fnal.gov/cgi-bin/sso/RetrieveFile?docid=15944)
    (try this link if you don\'t use SSO to sign into docDB, [Docdb
    15944 alternate
    link](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=15944))

~\
~

~\
~

~\
~

::: 
[Edit this
section](RemoteShift/edit?section=21){.icon-only
.icon-edit}
:::



## **Backup commands**

::: 
[Edit this
section](RemoteShift/edit?section=22){.icon-only
.icon-edit}
:::



### DAQ VNC

If for some reason the preferred method of connecting didn\'t work, try
this:

    ssh -KL 8443:localhost:8443 icarus-gateway01.fnal.gov ssh -KL 8443:localhost:443 icarus@icarus-evb01.fnal.gov

**and** post on the ECL that you connected with this command, as it may
cause port collision with other users/experts.

::: 
[Edit this
section](RemoteShift/edit?section=23){.icon-only
.icon-edit}
:::



### DCS VNC

If for some reason the preferred method of connecting didn\'t work, try
this:

    ssh -KL 9443:localhost:9443 icarus-gateway01.fnal.gov ssh -KL 9443:localhost:443 icarus@icarus-evb06.fnal.gov

**and** post on the ECL that you connected with this command, as it may
cause port collision with other users/experts.
:::

Files (1)

::: {style="display: none;"}
::: {.attachments}
::: {.contextual}
[Edit attached
files](/redmine/attachments/wiki_pages/28539/edit "Edit attached files"){.icon-only
.icon-edit}
:::

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -- ---------------------------------------------- -----------------------------------------------------------------------------
  [ViewOnlyVNC.png](/redmine/attachments/61422/ViewOnlyVNC.png){.icon .icon-attachment} [(80 KB)]{.size} [ViewOnlyVNC.png](/redmine/attachments/download/61422/ViewOnlyVNC.png "Download"){.icon-only .icon-download}      [Bruce Howard, 10/20/2020 10:58 AM]{.author}   [Delete](/redmine/attachments/61422 "Delete"){.delete .icon-only .icon-del}
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -- ---------------------------------------------- -----------------------------------------------------------------------------
:::

::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](RemoteShift.pdf){.pdf}
[HTML](RemoteShift.html){.html}
[TXT](RemoteShift.txt){.txt}

::: {style="clear:both;"}
:::
:::
:::
:::

::: 
Loading\...
:::

::: 
:::

::: 
::: {.bgl}
::: {.bgr}
Powered by [Redmine](https://www.redmine.org/) © 2006-2019 Jean-Philippe
Lang
:::
:::
:::
:::
:::
