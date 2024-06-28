---
layout: page
title: Get a certificate proxy
---



Get an ICARUS certificate proxy
================================

This is similar enough to SBND, that we refer to the
[documentation in there](../sbndcode_wiki/Get_a_certificate_proxy.md), with the following
amendments:

-   the virtual organization name is, unsurprisingly, `icarus`, which shows
    in the VOMS interface as `/fermilab/icarus` group.
-   as a consequence, the correct ritual for summoning a certificate
    proxy ends with a different enchantment:

        kinit "${USER}@FNAL.GOV"                                                       # get your Kerberos authentication
        kx509                                                                          # ask for a certificate
        voms-proxy-init -noregen -rfc -voms 'fermilab:/fermilab/icarus/Role=Analysis'  # create a "proxy" from the certificate

    The commands `kx509` and `voms-*` should be installed in the system already (and also in the apptainers).
-   the setup script is run with:
    `source /cvmfs/icarus.opensciencegrid.org/products/icarus/setup_icarus.sh`
-   the information on production accounts does not apply to ICARUS at
    all and should not be relied upon: ask [ICARUS production manager](Roles_and_people.md) if you need information
    about that.


Production certificate proxy for `icaruspro` shared user
---------------------------------------------------------

For people who needs a certificate proxy when wearing the `icaruspro` user, the procedure is different.
A certificate for `Production` role is always automatically kept up to date, and the startup script (`.bash_profile`) is automatically setting up the environment variable `KX509_USER_PROXY` to point at it.
If this does not executed for any reason, an equivalent line can be executed. First cross-check the correct command, e.g.

* run `grep '^export X509_USER_PROXY' ~icaruspro/.bash_profile` and figure out the correct path to set `KX509_USER_PROXY` to;
* run `kx509`, which is set to write instructions on how to actual set up the proxy (but _won't do it);
* run `setup_icaruspro <version> <qualifiers>` specifying an `icaruscode` version (this currently needs to happen in a SLF7 apptainer); this _will do_ the setup.

As an example, the actual command that worked on June 2024:

    export X509_USER_PROXY='/opt/icaruspro/icaruspro.Production.proxy'

