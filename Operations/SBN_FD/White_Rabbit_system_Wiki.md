

# White Rabbit System

1\) **WR installation at Fermilab for the SBN program**

This figure illustrates the final deployment of WR Network at Fermilab
for the SBN program

!(/redmine/attachments/download/62402/WR_installation.png)

2\) **WR installation at beam locations: BNB (MI-12) and NuMI (MI-60)**

A WR node ( Linux server ) has been deployed at each of the two beam
locations. Each server mounts a SPEC/DIO card with the function of
broadcasting the beam signals onto the WR Network.

The server name at MI-12 is : sbn-mi12.fnal.gov\
The server name at MI-60 is : sbn-mi60.fnal.gov

These servers are *behind* the AD Network firewall. They are reachable
ONLY by logging onto the AD gateway node *outland.fnal.gov*. To be able
to login on those nodes a user needs an account on outland.fnal.gov. At
the moment ONLY SLAM group members (who manage those WR servers) AND
afava, badgett and torretta have an account on *outland*.

Fig 2a shows the SPEC/DIO card installed in the server at MI-12. The
LEMO input cables carry the following beam signals: the LEMO cable in
DIO input 5 ( software Channel 4) is the \"gatedBES\" signal which
provides the BNB early warning ; the cable in DIO input 2 ( software
channel 1) is the \$1D ; the cable in DIO input channel 4 (software
channel 3) is the BNB RWM.

!(/redmine/attachments/download/63323/spec-dio-mi12-labels.png)

Fig 2b shows the SPEC/DIO card installed in the server at MI-60. The
beam signals cables entering the DIO are: MIBS \$74 in DIO input 5
(software channel 4) which is the MI to NuMI extraction signal ; \$AE in
DIO input 2 (software channel 1) which is the equivalent of the BNB
\$1D.

!(/redmine/attachments/download/63324/spec-dio-mi60-labels.png)

See point 5) below to see the current beam signals implementation at
MI12 and MI60.

3\) **WR installation at ICARUS**

AT ICARUS we have two WR nodes:\
a) a Linux server, *icarus-daq02*, with a SPEC/DIO card. The server is
installed in the Timing rack on the West Mezzanine Alcove \#1.

b\) a SPEXI /DIO card pair mounted inside the national Instrument (NI)
crate installed in the Trigger rack on the East Mezzanine.

::: 
[Edit this
section](White_Rabbit_system_Wiki/edit?section=2){.icon-only
.icon-edit}
:::



## How to synchronize a SPEC/DIO in the WR network

Read here [Setup SPEC/DIO in WR
network](Setup_SPECDIO_in_WR_network)
for how to synchronize a SPEC/DIO.

When the DIO is synchronized, then you can use it to broadcast signals
on the WR network (see next section)

4\) **How to send/receive beam signals on the WR network**

At both sending and receiving nodes we use software developed by the
CERN WR group and provided by the vendor , in our case SevenSolutions,
Granada, Spain ( web: sevensols.com ).\
See this page [How to send and receive beam signals on the WR
network](_How_to_send_and_receive_beam_signals_on_the_WR_network)
for instructions.

5\) **Current Beam signals settings at MI-12 and MI-60 (as Feb
22,2021)**\
See this page [Current beam signals
settings](_Current_beam_signals_settings_)
for details

6\) How to setup a WR switch and nodes\
See here [How to setup a WR switch and
nodes](_How_to_setup_a_WR_switch_and_nodes_)
for info.

7\) **Troubleshooting**\
See this page
[Troubleshooting](_Troubleshooting_)
for info

**APPENDIX: find here various technical information on WR hardware and
installation and tests performed at DAB test stands (2017)**

-   [White
    Rabbit](White_Rabbit)
    -   [White
        Rabbit](White_Rabbit)
        device driver and software installation
    -   [SPEC
        Cards](SPEC_Cards)
        Configuration
    -   [SPEC
        DIO](SPEC_DIO)
        How to set up
        -   [DIO
            test (2017)](_DIO_test_(2017))
            timeline of DIO tests sbnd-daq25
    -   [SPEC
        TDC](SPEC_TDC)
        How to setup the TDC and run \~tools programs
    -   [SPEC
        Fine-Delay](SPEC_Fine-Delay)
        How to setup the FineDelay and run \~tools programs
:::

Files (7)

::: {style="display: none;"}
::: {.attachments}
::: {.contextual}
[Edit attached
files](/redmine/attachments/wiki_pages/29753/edit "Edit attached files"){.icon-only
.icon-edit}
:::

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -- ---------------------------------------------------- -----------------------------------------------------------------------------
  [WR_installation.png](/redmine/attachments/62402/WR_installation.png){.icon .icon-attachment} [(287 KB)]{.size} [WR_installation.png](/redmine/attachments/download/62402/WR_installation.png "Download"){.icon-only .icon-download}                           [Donatella Torretta, 01/03/2021 05:18 PM]{.author}   [Delete](/redmine/attachments/62402 "Delete"){.delete .icon-only .icon-del}
  [SPEC_DIO_mi12.png](/redmine/attachments/62403/SPEC_DIO_mi12.png){.icon .icon-attachment} [(997 KB)]{.size} [SPEC_DIO_mi12.png](/redmine/attachments/download/62403/SPEC_DIO_mi12.png "Download"){.icon-only .icon-download}                                   [Donatella Torretta, 01/04/2021 12:48 PM]{.author}   [Delete](/redmine/attachments/62403 "Delete"){.delete .icon-only .icon-del}
  [SPEC_DIO_mi60.png](/redmine/attachments/62404/SPEC_DIO_mi60.png){.icon .icon-attachment} [(1.03 MB)]{.size} [SPEC_DIO_mi60.png](/redmine/attachments/download/62404/SPEC_DIO_mi60.png "Download"){.icon-only .icon-download}                                  [Donatella Torretta, 01/04/2021 12:48 PM]{.author}   [Delete](/redmine/attachments/62404 "Delete"){.delete .icon-only .icon-del}
  [SPEC_DIO_mi60.png](/redmine/attachments/62932/SPEC_DIO_mi60.png){.icon .icon-attachment} [(505 KB)]{.size} [SPEC_DIO_mi60.png](/redmine/attachments/download/62932/SPEC_DIO_mi60.png "Download"){.icon-only .icon-download}                                   [Donatella Torretta, 02/21/2021 07:18 PM]{.author}   [Delete](/redmine/attachments/62932 "Delete"){.delete .icon-only .icon-del}
  [spec-dio-mi12-b.png](/redmine/attachments/63319/spec-dio-mi12-b.png){.icon .icon-attachment} [(1.16 MB)]{.size} [spec-dio-mi12-b.png](/redmine/attachments/download/63319/spec-dio-mi12-b.png "Download"){.icon-only .icon-download}                          [Donatella Torretta, 03/19/2021 03:12 PM]{.author}   [Delete](/redmine/attachments/63319 "Delete"){.delete .icon-only .icon-del}
  [spec-dio-mi12-labels.png](/redmine/attachments/63323/spec-dio-mi12-labels.png){.icon .icon-attachment} [(1.14 MB)]{.size} [spec-dio-mi12-labels.png](/redmine/attachments/download/63323/spec-dio-mi12-labels.png "Download"){.icon-only .icon-download}      [Donatella Torretta, 03/19/2021 04:42 PM]{.author}   [Delete](/redmine/attachments/63323 "Delete"){.delete .icon-only .icon-del}
  [spec-dio-mi60-labels.png](/redmine/attachments/63324/spec-dio-mi60-labels.png){.icon .icon-attachment} [(675 KB)]{.size} [spec-dio-mi60-labels.png](/redmine/attachments/download/63324/spec-dio-mi60-labels.png "Download"){.icon-only .icon-download}       [Donatella Torretta, 03/19/2021 04:42 PM]{.author}   [Delete](/redmine/attachments/63324 "Delete"){.delete .icon-only .icon-del}
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -- ---------------------------------------------------- -----------------------------------------------------------------------------
:::

::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](White_Rabbit_system_Wiki.pdf){.pdf}
[HTML](White_Rabbit_system_Wiki.html){.html}
[TXT](White_Rabbit_system_Wiki.txt){.txt}

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
