---
layout: page
title:  Setting up access with CILogon certificate
toc:    true
---


DUNE has [such a good explanation](https://web.fnal.gov/project/LBNF/Documentation/SitePages/Get%20a%20CI%20Logon%20Certificate.aspx)
that... well, this is a copy of it.



First: Why would you want to do this?
--------------------------------------

[CILogon](http://cilogon.org) provides a free, year-long certificate
that you can load into your browser and use for accessing the SBN DocDB.
The recommended way to access resources like SBN DocDB is the Single Sign On
interface, which anyway does accept CI Logon certificates.

> The CILogon Certificate discussed below *can not* be used to digitally sign email.



Instructions for getting a CILogon Certificate and importing the certificate into your browser
-----------------------------------------------------------------------------------------------

There are three steps, documented below:

1.  get a CILogon certificate (once every year)
2.  importing that certificate in your browser (once every year)
3.  registering with SBN DocDB (once every life)



### Generating or renewing a certificate

This is something you need to do once per year. You can copy the
certificate file on different machines (e.g., your phone, your laptop,
your home desktop), or you can have different ones at the same time, all
of which identify *you*.
No penalty in doing this more often.

1.  Point your browser at <https://cilogon.org>.
2.  Look through the list of supported Identity Providers:
    -   if your institution is in that list (if that's Fermilab, see
        the next option instead):
        1.  select it and click the "Log On" button
        2.  follow the log in procedure; this is specific to the
            institution you have picked
    -   if your institution is not on that list, and you have accounts
        at Fermilab:
        1.  select `Fermi National Accelerator Laboratory` and click the
            "Log On" button
        2.  enter your Services username and password (the same you
            access ServiceNow and Fermilab e-mail with; and the user
            name is just that, without `@services.fnal.gov` or anything)
            and click the "Login" button
3.  If you do not have accounts at Fermi and your institution is not in
    the list (and you are a part of SBND, of course):
    -   you will need to obtain an account with one of the institutions
        supporting CILogon (hint:
        [Fermilab](https://fermi.servicenowservices.com/kb_view.do?sysparm_article=KB0013239)
        ) before proceeding with the instructions on this page.
4.  Choose "Create Password-Protected Certificate" and enter a password
    to protect your to be generated certificate; do it!
    You will tell your browser to remember it for you, in the end.
5.  Click "Get New Certificate", then on the next page
    the "Click Here To Download Your Certificate" button.
6.  Save it to your computer, and make a note of where you save it: this file
    is *your certificate*, and you will need to upload this file to your browser(s)
7.  Log off.



### Loading the certificate into your browser

There are too many web browsers around, and they use too many different
approaches, and they change them too often.
If you find this information is outdated (because you have the most
recent browser and it works different from here), feel free to update
the pertaining section, also indicating which version you are
describing.

A search engine will likely give you better information than this
anyway. But what you are going to do is:

1.  look for the proper secrity/certificate settings page of your browser
2.  tell your browser to "import" your "p12" certificate



#### Safari, and Vivaldi and Chrome on OSX

These browsers use the operating system's "key chain" to access certificates.

1.  click on the certificate that has been downloaded (check the downloads folder).
    This will add it to your O.S. keychain for use with Safari.



#### Vivaldi and Chrome on Linux

_(tested on Vivaldi 4.0.2312.41 and Chrome 92.0.4515.107)_

1. Go to the URL: `chrome://settings/certificates` (yes, in Vivaldi too)
    - you might need to tell Vivaldi to have preferences shown in a
        tab rather than in a dialogue window...
    - you should see a page themed in the Chrome way (if Vivaldi shows
      a page themed in a very different, Vivaldi-like way, then it redirected
      to `vivaldi://` and will likely show the general preferences instead;
      in that case, try again with the `chrome://` URL above).
      
2. The "Import" button should be fairly obvious under "Your certificates" tab.



#### Chrome on Windows

1.  go to the URL: `chrome://settings`, look for "Advanced Settings"
2.  in there, there should be a "Manage Certificates" where you can Import them



#### Firefox

_(tested on version 90.0.2 in Linux)_

1. Pick the "Settings" page (or visit `about:preferences` URL)
2. Look for the "Security" paragraph or directly serach for "Certificates"
  and click on "View Certificates...".
3. The tab "Your Certificates" contains the "Import..." button.


#### Internet Explorer

1.  double click on the saved certificate file
2.  select 'Next' on the wizard (twice)
3.  enter the password you entered for the certificate
4.  keep the default options and click on "Next" until you get to
    "Finish"



Access to SBN DocDB
--------------------

After you get your first certificate, you'll have to ask the DocDB
administrators for access with that new credential.
This appears to be needed only once.



### Applying for Access to DocDB using this certificate

If you are just renewing a certificate that has not already expired, you
will not need to reregister with SBND DocDB.
Otherwise, you have to register and present your new certificate, and a
human has to accept you in (so it may take one day).

1.  point your certificate-aware browser to SBND DocDB: <https://sbn-docdb.fnal.gov>
2.  click "apply for access"
3.  you'll be asked which access groups you want to join (if unsure, pick only `SBN`)



### Accessing DocDB once you have certificate access

1.  go to SBND DocDB: <https://sbn-docdb.fnal.gov>
2.  if prompted, now or at the next step, by the browser to choose a certificate
    to use, choose the same certificate you used to apply for access
3.  choose the "Certificate Version of SBN DocDB" as the link to follow

