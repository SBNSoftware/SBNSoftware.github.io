---
lang: en
title: Get a certificate proxy
---



Get an ICARUS certificate proxy(#Get-an-ICARUS-certificate-proxy)
==================================================================================

This is similar enough to SBND, that we refer to the [documentation in
there](Get_a_certificate_proxy.html), with the following
amendments:

-   the virtual organization name is, unsurprisingly,
    [icarus]{style="color: crimson;font-style: monospace;"}, which shows
    in the VOMS interface as `/fermilab/icarus` group.
-   as a consequence, the correct ritual for summoning a certificate
    proxy ends with a different enchantment:

        kinit "${USER}@FNAL.GOV"                                                       # get your Kerberos authentication
        setup cigetcert                                                                # (if not already there)
        cigetcert -s 'fifebatch.fnal.gov'                                              # ask for a certificate
        voms-proxy-init -noregen -rfc -voms 'fermilab:/fermilab/icarus/Role=Analysis'  # create a "proxy" from the certificate

-   the setup script is run with:
    `source /cvmfs/icarus.opensciencegrid.org/products/icarus/setup_icarus.sh`
-   the information on production accounts does not apply to ICARUS at
    all and should not be relied upon: ask [ICARUS production
    manager](Roles_and_people.html) if you need information
    about that.
