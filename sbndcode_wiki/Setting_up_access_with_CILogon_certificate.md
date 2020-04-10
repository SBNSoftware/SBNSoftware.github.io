---
lang: en
title: Setting up access with CILogon certificate
---

[]{#Setting-up-access-with-CILogon-certificate}

Setting up access with CILogon certificate[¶](#Setting-up-access-with-CILogon-certificate){.wiki-anchor}
========================================================================================================

-   **Table of contents**
-   [Setting up access with CILogon
    certificate](#Setting-up-access-with-CILogon-certificate)
    -   [First: Why would you want to do
        this?](#First-Why-would-you-want-to-do-this)
    -   [Instructions for getting a CILogon Certificate and importing
        the certificate into your
        browser](#Instructions-for-getting-a-CILogon-Certificate-and-importing-the-certificate-into-your-browser)
        -   [Generating or renewing a
            certificate](#Generating-or-renewing-a-certificate)
        -   [Loading the certificate into your
            browser](#Loading-the-certificate-into-your-browser)
            -   [Safari, and Vivaldi and Chrome on
                OSX](#Safari-and-Vivaldi-and-Chrome-on-OSX)
            -   [Vivaldi and Chrome on
                Linux](#Vivaldi-and-Chrome-on-Linux)
            -   [Chrome on Windows](#Chrome-on-Windows)
            -   [Firefox](#Firefox)
            -   [Internet Explorer](#Internet-Explorer)
    -   [Access to SBN DocDB](#Access-to-SBN-DocDB)
        -   [Applying for Access to DocDB using this
            certificate](#Applying-for-Access-to-DocDB-using-this-certificate)
        -   [Accessing DocDB once you have certificate
            access](#Accessing-DocDB-once-you-have-certificate-access)

DUNE has [such a good
explanation](https://web.fnal.gov/collaboration/DUNE/SitePages/Get%20a%20CI%20Logon%20Certificate.aspx){.external}
that\... well, this is a copy of it.

[]{#First-Why-would-you-want-to-do-this}

First: Why would you want to do this?[¶](#First-Why-would-you-want-to-do-this){.wiki-anchor}
--------------------------------------------------------------------------------------------

[CILogon](http://cilogon.org){.external} provides a free, *year-long
certificate* that you can load into your browser and use for accessing
the SBN DocDb. Note that this compares with the *one-week long* KCA
certificate (now going to be discontinued).

When accessing DocDB using a certificate, you will be able to access
*all* the documents you have permissions to access with *no
username/password entry required^[1](#fn1)^*.

> The CILogon Certificate discussed below *can not* be used to digitally
> sign email.

[]{#Instructions-for-getting-a-CILogon-Certificate-and-importing-the-certificate-into-your-browser}

Instructions for getting a CILogon Certificate and importing the certificate into your browser[¶](#Instructions-for-getting-a-CILogon-Certificate-and-importing-the-certificate-into-your-browser){.wiki-anchor}
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

There are three steps, documented below:

1.  get a CILogon certificate (once every year)
2.  importing that certificate in your browser (once every year)
3.  registering with SBN DocDB (once every life)

[]{#Generating-or-renewing-a-certificate}

### Generating or renewing a certificate[¶](#Generating-or-renewing-a-certificate){.wiki-anchor}

This is something you need to do once per year. You can copy the
certificate file on different machines (e.g., your phone, your laptop,
your home desktop), or you can have different ones at the same time, all
of which identify *you*.\
No penalty in doing this more often.

1.  point your browser at <https://cilogon.org>
2.  look through the list of supported Identity Providers
    -   if your institution is in that list (if that\'s Fermilab, see
        the next option instead):
        1.  select it and click the \'Log On\' button
        2.  follow the log in procedure; this is specific to the
            institution you have picked
    -   if your institution is not on that list, and you have accounts
        at Fermilab:
        1.  select `Fermi National Accelerator Laboratory` and click the
            \"Log On\" button
        2.  enter your Services username and password (the same you
            access ServiceNow and Fermilab e-mail with; and the user
            name is just that, without `@services.fnal.gov` or anything)
            and click the \"Login\" button
3.  if you do not have accounts at Fermi and your institution is not in
    the list (and you are a part of SBND, of course):
    -   you will need to obtain an account with one of the institutions
        supporting CILogon (hint:
        [Fermilab](https://fermi.service-now.com/kb_view_customer.do?sysparm_article=KB0010797){.external}
        ) before proceeding with the instructions on this page
4.  enter a Password to protect your to be generated certificate; do it!
    You will tell your browser to remember it for you, in the end
5.  click "Get New Certificate", then the \'Click Here To Download Your
    Certificate\' button
6.  save it to your computer, and make a note of where you save it: this
    file is *your certificate*, and you will need to upload this file to
    your browser(s)

[]{#Loading-the-certificate-into-your-browser}

### Loading the certificate into your browser[¶](#Loading-the-certificate-into-your-browser){.wiki-anchor}

There are too many web browsers around, and they use too many different
approaches, and they change them too often.\
If you find this information is outdated (because you have the most
recent browser and it works different from here), feel free to update
the pertaining section, also indicating which version you are
describing.\
A search engine will likely give you better information than this
anyway. But what you are going to do is:

1.  look for the proper secrity/certificate settings page of your
    browser
2.  tell your browser to \"import\" your \"p12\" certificate

[]{#Safari-and-Vivaldi-and-Chrome-on-OSX}

#### Safari, and Vivaldi and Chrome on OSX[¶](#Safari-and-Vivaldi-and-Chrome-on-OSX){.wiki-anchor}

These browsers use the operating system\'s \"key chain\" to access
certificates.

1.  click on the certificate that has been downloaded (check the
    downloads folder). This will add it to your O.S. keychain for use
    with Safari.

[]{#Vivaldi-and-Chrome-on-Linux}

#### Vivaldi and Chrome on Linux[¶](#Vivaldi-and-Chrome-on-Linux){.wiki-anchor}

1.  go to the URL: `chrome://settings/certificates` (yes, in Vivaldi
    too)
    -   you might need to tell Vivaldi to have preferences shown in a
        tab rather than in a dialogue window\...

[]{#Chrome-on-Windows}

#### Chrome on Windows[¶](#Chrome-on-Windows){.wiki-anchor}

1.  go to the URL: `chrome://settings`, look for \"Advanced Settings\"
2.  in there, there should be a \"Manage Certificates\" where you can
    Import them

[]{#Firefox}

#### Firefox[¶](#Firefox){.wiki-anchor}

*(tested on OSX version 47)*

1.  access the encryption preferences on the Firefox menu bar
    -   in OSX, pick \"Preferences\" from the \"Firefox\" menu, then
        pick the \"Advanced\" tab and the \"Certificates\" tab
    -   in Windows, pick the \"Options\" menu, select \'Advanced\' icon
        at the top and finally the \"Encryption\" tab
2.  pick the \"View Certificates\" button, then the \"Your
    Certificates\" tab
3.  click \"Import\" at the bottom and follow the instructions to import
    your certificate

[]{#Internet-Explorer}

#### Internet Explorer[¶](#Internet-Explorer){.wiki-anchor}

1.  double click on the saved certificate file
2.  select \'Next\' on the wizard (twice)
3.  enter the password you entered for the certificate
4.  keep the default options and click on \"Next\" until you get to
    \"Finish\"

[]{#Access-to-SBN-DocDB}

Access to SBN DocDB[¶](#Access-to-SBN-DocDB){.wiki-anchor}
----------------------------------------------------------

After you get your first certificate, you\'ll have to ask the DocDB
administrators for access with that new credential.\
This appears to be needed only once.

[]{#Applying-for-Access-to-DocDB-using-this-certificate}

### Applying for Access to DocDB using this certificate[¶](#Applying-for-Access-to-DocDB-using-this-certificate){.wiki-anchor}

If you are just renewing a certificate that has not already expired, you
will not need to reregister with SBND DocDB.\
Otherwise, you have to register and present your new certificate, and a
human has to accept you in (so it may take one day).

1.  point your certificate-aware browser to SBND DocDB:
    <https://sbn-docdb.fnal.gov>
2.  click \"\_apply for access\_\"
3.  you\'ll be asked which access groups you want to join (if unsure,
    pick only `SBN`)

[]{#Accessing-DocDB-once-you-have-certificate-access}

### Accessing DocDB once you have certificate access[¶](#Accessing-DocDB-once-you-have-certificate-access){.wiki-anchor}

1.  ​go to SBND DocDB: <https://sbn-docdb.fnal.gov>
2.  if prompted, now or at the next step, by the browser to choose a
    certificate to use, choose the same certificate you used to apply
    for access
3.  choose the \"Certificate Version of SBN DocDB\" as the link to
    follow

------------------------------------------------------------------------

^1^ Note however that the URL is different: if you are sent a link
copied from a person who used password authentication, following that
link you will be asked for password authentication. This *does not mean
you don\'t have access to the document*, but just that the URL you are
following should be changed.\
You can always go DocDB, authenticate as you wish and then search for
the document number.
