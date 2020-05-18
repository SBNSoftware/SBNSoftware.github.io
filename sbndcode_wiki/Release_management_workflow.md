---
lang: en
title: Release management workflow
---

[]{#Release-management-workflow}

Release management workflow[¶](#Release-management-workflow){.wiki-anchor}
==========================================================================

(Note almost all of this information is from the MicroBooNE instructions
[here (tagging)](Tagging.html){.wiki-page}, [here (Jenkins
build)](Jenkins_Build.html){.wiki-page}, [here
(CVMFS)](Oasis.html){.wiki-page}, and
[here](Uboone_data.html){.wiki-page}.)

[]{#Required-permissions}

Required permissions[¶](#Required-permissions){.wiki-anchor}
------------------------------------------------------------

Multiple permissions are needed to perform all of the actions involved
in release management, these include:

-   Access to cvmfssbnd account on oasiscfs.fnal.gov
-   Access to sbnd account on GPVMs
-   Account on the Jenkins build server and a [CILogon
    certificate](Setting_up_access_with_CILogon_certificate.html){.wiki-page}
    loaded in your browser (Will need [Fermilab
    VPN](VPN.html){.wiki-page} running if off site)
-   Access to <https://scisoftportal.fnal.gov>

[]{#Creating-a-new-release}

Creating a new release[¶](#Creating-a-new-release){.wiki-anchor}
----------------------------------------------------------------

1.  [Tag the release](Tagging_a_release.html){.wiki-page}
2.  [Build on Jenkins](Building_a_release_on_Jenkins.html){.wiki-page}
3.  [Upload release to SciSoft](Write_files_to_SciSoft.html){.wiki-page}
4.  [Deploy on CVMFS](Deploying_a_release_on_CVMFS.html){.wiki-page}
5.  [Update the
    wiki](Updating_the_wiki_for_a_new_release.html){.wiki-page}
6.  Email users on sbnd-software

[]{#sbnd_data}

sbnd\_data[¶](#sbnd_data){.wiki-anchor}
---------------------------------------

-   [Updating sbnd\_data](Updating_sbnd_data.html){.wiki-page}

[]{#Code-monitoring}

Code monitoring[¶](#Code-monitoring){.wiki-anchor}
--------------------------------------------------

-   [Commit emails](Commit_emails.html){.wiki-page}
-   [Continuous integration](Continuous_integration.html){.wiki-page}

[]{#Mailing-lists-you-should-be-on}

Mailing lists you should be on[¶](#Mailing-lists-you-should-be-on){.wiki-anchor}
--------------------------------------------------------------------------------

-   SBND-SOFTWARE
-   SBND-COMMIT
-   SBND-SOFTWARE-BUILD
-   BUILD-SERVICE-USERS
-   LARSOFT
-   ART-USERS

[]{#Legacy-pages}

Legacy pages[¶](#Legacy-pages){.wiki-anchor}
--------------------------------------------

-   [Deploy on
    /grid/fermiapp](Deploying_a_release_on_fermigrid.html){.wiki-page}
