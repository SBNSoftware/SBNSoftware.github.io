---
layout: page
title: Building a release on Jenkins
---

[Return to Release Management Workflow](https://sbnsoftware.github.io/sbndcode_wiki/Release_management_workflow.html)


Building a release on Jenkins
==============================================================================



Summary
----------------------------------

-   Go to
    <https://buildmaster.fnal.gov/buildmaster/job/sbndcode-release-build/>
-   Configure the build in the `Build with Parameters` tab.
-   Build `sbndcode` and `sbndutil`



Instructions
--------------------------------------------

-   Log on to the Jenkins server.
    -   You either need to be on the internal `fgz` network or the
        [Fermilab
        VPN](https://fermi.service-now.com/kb_view.do?sysparm_article=KB0560)
    -   You now need an [RSA
        token](https://fermi.service-now.com/kb_view.do?sysparm_article=KB0011463)
        to access the VPN.
    -   You will also need a [CILogon
        certificate](https://cdcvs.fnal.gov/redmine/projects/sbndcode/wiki/Setting_up_access_with_CILogon_certificate)
        loaded in your browser.
        - NB: When generating ther CILogon certificate, use the Fermilab identity provider rather than the institution.
    -   Go to
        <https://buildmaster.fnal.gov/buildmaster/job/sbndcode-release-build/>
-   Configure the build.
    -   If only the version number has changed the fastest way is to go
        to the `Build with Parameters` tab and just bump the `SBND_VERSION`
        parameter and set `SBND` and `SBNDUTIL` parameters to the relevant release branch. 
        Finally update the LArSoft SQUAL parameter if required (see LArSoft release notes, rarely changes).
    -   This won\'t save the changes to the parameters.
    -   If more than one parameter has changed then it\'s probably best
        to go the the `Configure` tab as this will save changes.
    -   See the section at the end for more details on the
        configuration.
-   Hit `Build` at the bottom of the `Build with Parameters` tab.
-   You should then see a configuration matrix with flashing icons.
-   These will turn solid when the builds have finished, green for
    success and red for failure.
    -   If all green then you can exit Jenkins and the Fermilab VPN as
        it\'s not needed for anything else.
    -   If any are red you can find out why the build failed by clicking
        on the red icon, last build under the `Permalinks` heading and
        then `Console Output`.
    -   Sometimes builds will fail due to temporary I/O issues on
        Jenkins so if you can\'t find an obvious reason for the failure,
        wait an hour and try building again.
    -   If every build failed it\'s probably an issue with the
        configuration parameters.
    -   You can rebuild just the failed builds by going to
        `Matrix Reloaded`.



Build configuration
----------------------------------------------------------

-   Parameter descriptions:
    -   `SBND_VERSION`: release version number you used to tag the release
    -   `SBND`: release branch for sbndcode
    -   `SBNDUTIL`: release branch for sbndutil, if non-specified gets tag from sbndcode ups products
    -   `SQUAL`: larsoft s-qualifier for scientific linux \< art
        version \>:\< compiler \>, the larsoft release notes will inform
        you if either of these change. 
-   We only make compiled binaries for SLF7, we used to do OSX
    builds too but nobody used them and the build time was very long.
-   If at some point in the future we need to add/drop builds the
    configuration matrix can be modified by checking the relevant labels
    under the `Configuration Matrix` tab.
-   Most experiments keep their Jenkins build scripts on
    [larutils](https://cdcvs.fnal.gov/redmine/projects/larutils/repository/revisions/develop/show/buildScripts)
    and just call it from the command section of the `Build`
    configuration tab.
-   I\'m lazy and couldn\'t be bothered to request to push to `larutils`
    every time something needed to be changed so I copy pasted the
    script into the command section.
-   Sometimes this script needs to be altered so it\'s worth
    familiarising your self with it.
