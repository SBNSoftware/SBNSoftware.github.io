---
layout: page
title: Get a certificate proxy
---



Get a SBND certificate and proxy
====================================================================================

> Note: this page is about certificates and proxies to access grid
> resources. For "personal" certificates to access DocDB and web-based
> resources, you want a [CILogon certificate](Setting_up_access_with_CILogon_certificate.html)
> instead.



Virtual Organization membership
----------------------------------------------------------------------------------

First, you need to be registered in the proper Virtual Organization,
which in our case is a unsurprising `sbnd`.

You can play some *roles* in the organisation, and you need to choose
which one to wear when getting a certificate proxy. Examples of roles
are `Analysis` (which you should pick if unsure) and `Production`.

You can check your status by pointing your browser to Fermilab VOMS
server at <https://voms.fnal.gov:8443/voms/fermilab/user/home.action> .
You will be required to present a certificate (the
[CILogon certificate](Setting_up_access_with_CILogon_certificate.html)
is good enough for this), and from it the server will know who you are
and will tell what you can do.

If you don't get the expected result (e.g., you are not listed in the
`fermilab/sbnd` group or you need to play a different role),
[request the change via service desk](Computing_resources.html#Opening-a-ticket-in-Fermilab-Service-Desk).



Get the proxy
----------------------------------------------

The ritual for getting the certificate and proxy goes like this:

    kinit "${USER}@FNAL.GOV"                                                     # get your Kerberos authentication
    setup cigetcert                                                              # (if not already there)
    cigetcert -s 'fifebatch.fnal.gov'                                            # ask for a certificate
    voms-proxy-init -noregen -rfc -voms 'fermilab:/fermilab/sbnd/Role=Analysis'  # create a "proxy" from the certificate

> Make sure UPS is set up first (e.g.
> `source /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh`).

The last line of the output from this sequence should look something
like:

    Your proxy is valid until Tue Sep 27 01:49:24 2016

where the date is 24 hours in the future.
This "proxy" is what we need to get our job done.
The command

    voms-proxy-info -all

will tell you more than you want to know about your current certificate.



Production role jobs
------------------------------------------------------------



### Getting production privileges

Submit a service desk ticket asking for production role privileges for
SBND. You will most likely have to add a computing coordinator to the
watch list.
You then have to ask someone with access to the sbndpro account to add
you to the k5login file. The people to ask are the computing
coordinators or the production coordinator(s).
You should then be able to ssh to an sbnd machine as the sbndpro user:

     ssh -Y sbndpro@sbndgpvm01.fnal.gov 



### Getting the production proxy (old-school method)

The following should be run on the command line when logged into the
sbndpro account.

    kx509; voms-proxy-init -noregen -rfc -voms 'fermilab:/fermilab/sbnd/Role=Production' 

You should now be able to submit production jobs.



### Getting the production proxy (the new method)

A much easier alternative to getting production-role access is to use
the production proxy certificate that is pushed to the gpvm several
times a day, courtesy of the SCD.
As with the old-school method, the certificate is only accessible from
the sbndpro account.

Here is some fine print, sent from Kevin Retzke when this method was
setup on the sbndgpvms:

>    Some requirement/fine print: 
>
>    1. We only offer the service for service accounts that are abiding by cs-docdb 5644 and its addendums. These requirements include, but are not limited to: 
>    * No more than ten people from the experiment are allowed in the .k5login file at any time. USDC members do not count against the limit. 
>    * The cert and key files should never be sent over a network via any unencrypted means, especially as email attachments. 
>
>    2. Our service principal (monitor/gcso/fermigrid.fnal.gov@FNAL.GOV) needs to be added to the .k5login of the production account on each target machines. 
>
>    3. The destination directory (we typically use /opt/accountname) needs to be created on each target machine, owned by the production account. 
>
>    4. Someone with the production role must be designated to have the service certificate registered under in VOMS. 

The certificate has to be registered to someone. At time of writing, the
certificate is registered to Dominic Brailsford.

To use the certificate, make sure the following environment variable is
set:

    X509_USER_PROXY=/opt/sbndpro/sbndpro.Production.proxy

At time of writing, the .profile file for sbndpro should setup the
`X509_USER_PROXY` environment variable so hopefully you don't need to
do anything! Once `X509_USER_PROXY` is set, you are able to submit
production jobs (no need to use the old-school method as well!)
