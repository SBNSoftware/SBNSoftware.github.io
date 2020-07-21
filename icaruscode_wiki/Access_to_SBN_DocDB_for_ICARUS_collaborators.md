---
layout: page
title: Access to SBN DocDB for ICARUS collaborators
---



Access to SBN DocDB for ICARUS collaborators
============================================================================================================

Fermilab DocDB allows for *many* ways to access. Depending on your
access mode, all page URL will be slightly different.\
The recommended way is currently via [Single Sign
On](https://sbn-docdb.fnal.gov/cgi-bin/sso/DocumentDatabase "SSO"){.external}.
This method allows you to be *identified as yourself*, and allows for
many actual authentication paths (e.g. [a CILogon
certificate](Setting_up_access_with_CILogon_certificate.html)).



### Solution to access denial problems

DocDB has per-document access policies, that are set by the person
uploading the document (the lists \"can modify\" and \"can view\"): if
you belong to one of the allowed groups, you can view a document or
event.

In the old shared username/password authentication, one could view all
and only the documents of the login group (e.g. if you log in as
`icarus` you won\'t be able to see documents which only `lar1nd` can
see).\
In the new personal log in, you may belong to several groups, but
*sometimes you start with not belonging to any*, and you\'ll be denied
access to most documents.\
In order to fix that, after logging in check in the [Your
account](https://sbn-docdb.fnal.gov/cgi-bin/sso/SelectEmailPrefs){.external}
page the list **Member of groups:**: it should likely contain *at least*
`icarus` and `sbn`.\
If it does not, open the [Apply for
access](https://sbn-docdb.fnal.gov/cgi-bin/sso/CertificateApplyForm){.external}
link and select the groups you need (usually no more than just `icarus`,
`sbn` and `lar1nd`, that is SBND).\
The authorization is not automatic, so it will take some time (maybe a
working day). After this, you are done with this business.
