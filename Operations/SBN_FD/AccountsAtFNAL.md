

# Accounts at FNAL

Description of accounts at FNAL (and connection tools) and what they are
used for during ICARUS shifts

-   **Table of contents**
-   [Accounts at FNAL]
    -   [Fermilab Services Account]
    -   [Kerberos]
    -   [FERMI Domain for Windows
        Machines]
    -   [Tools]
        -   [VPN]

For both in-person and remote shifts, a Fermilab Services and Fermilab
Kerberos account is required. These are the two general accounts that
Fermilab Users use. The FERMI Domain account is an additional account
required for monitoring cryogenics remotely.

::: 
[Edit this
section](AccountsAtFNAL/edit?section=2){.icon-only
.icon-edit}
:::



## Fermilab Services Account

This is probably the account that you interact with the most at
Fermilab. It\'s how you sign into Fermilab pages that use Single Sign
On, Redmine (i.e. this site), Service Desk, ECL (the logbook), VPN, etc.

For in person shifts, for example, this is used to sign into the
logbook. For remote shifts, it\'s how you sign into the VPN and the ECL,
for example.

::: 
[Edit this
section](AccountsAtFNAL/edit?section=3){.icon-only
.icon-edit}
:::



## Kerberos

Kerberos is the authentication Fermilab uses to connect to Linux
computers/servers at the lab, for example if you are connecting to the
icarusgpvm machines for offline work. One will have a Fermilab Kerberos
account generally with the same username as the Services account but a
different password. This is why before using `ssh` to connect to a Linux
machine at Fermialb, one has to activate Kerberos for example by using
`kinit username@FNAL.GOV` from a terminal.

For in person shifts, this is used to sign into the shift station
computers at the start of shift.

For remote shifts, you sign into Kerberos with the `kinit` command once,
before establishing connections with the DAQ computer, Slow Controls
computer, and Grafana DAQ Monitoring.

::: 
[Edit this
section](AccountsAtFNAL/edit?section=4){.icon-only
.icon-edit}
:::



## FERMI Domain for Windows Machines

The extra account here beyond the normal two is the FERMI (Windows)
domain, which is somewhat less frequently used than the other two, but
is used to connect to Windows machines at the lab.

This is needed to view the iFix cryogenics details. While at ROC-West
there is an iFix station that is supposed to always be up, for remote
monitoring of the cryogenics we have been logging into a Windows server
which launches the iFix monitor. To log into the Windows server you will
need a FERMI domain account! One activates this by talking to the
Service Desk. Again, this should use the same username as the other two
accounts but will have a different password.

Note that once you have the FERMI domain account, you will need to reach
out to the liaisons listed on the [Remote Connections
page](RemoteShift)
to request that your FERMI Domain account get access to the server. This
must all be done well in advance of your shift to allow the time for
things to go through!

::: 
[Edit this
section](AccountsAtFNAL/edit?section=5){.icon-only
.icon-edit}
:::



## Tools

We will briefly explain tools relevant to the accounts as well.

::: 
[Edit this
section](AccountsAtFNAL/edit?section=6){.icon-only
.icon-edit}
:::



### VPN

VPN stands for Virtual Private Network. The VPN is so that you can
access things as if you were on the Fermilab network, so some of the
pages or servers that are restricted you will then have access to. One
example is the iFix cryogenics monitor.

Setting this up requires some interaction with service desk, and setting
up a dual authentication tool, for example on a smartphone. See
information on how to use the VPN
[here](https://fermi.servicenowservices.com/kb_view.do?sysparm_article=KB0560)
and SBN\'s page with links
[here](https://sbnsoftware.github.io/sbn_wiki/VPN.html) .

Your log-in to this will then be your Services username and password and
the dual-authentication (second password). The second password will be
just the dual-authentication code if you entered your PIN to get the
code. If you didn\'t enter your PIN to get the code, then the second
password is of the style XXXXYYYYYY where XXXX is the PIN and YYYYYY is
the dual-authentication code.
:::

Files (0)

::: {style="display: none;"}
::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](AccountsAtFNAL.pdf){.pdf}
[HTML](AccountsAtFNAL.html){.html}
[TXT](AccountsAtFNAL.txt){.txt}

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
