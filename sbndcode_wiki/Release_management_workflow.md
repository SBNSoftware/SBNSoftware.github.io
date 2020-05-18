---
lang: en
title: Release management workflow
---

{#Release-management-workflow}

Release management workflow(#Release-management-workflow)
==========================================================================

(Note almost all of this information is from the MicroBooNE instructions
[here (tagging)](Tagging.html), [here (Jenkins
build)](Jenkins_Build.html), [here
(CVMFS)](Oasis.html), and
[here](Uboone_data.html).)

{#Required-permissions}

Required permissions(#Required-permissions)
------------------------------------------------------------

Multiple permissions are needed to perform all of the actions involved
in release management, these include:

-   Access to cvmfssbnd account on oasiscfs.fnal.gov
-   Access to sbnd account on GPVMs
-   Account on the Jenkins build server and a [CILogon
    certificate](Setting_up_access_with_CILogon_certificate.html)
    loaded in your browser (Will need [Fermilab
    VPN](VPN.html) running if off site)
-   Access to <https://scisoftportal.fnal.gov>

{#Creating-a-new-release}

Creating a new release(#Creating-a-new-release)
----------------------------------------------------------------

1.  [Tag the release](Tagging_a_release.html)
2.  [Build on Jenkins](Building_a_release_on_Jenkins.html)
3.  [Upload release to SciSoft](Write_files_to_SciSoft.html)
4.  [Deploy on CVMFS](Deploying_a_release_on_CVMFS.html)
5.  [Update the
    wiki](Updating_the_wiki_for_a_new_release.html)
6.  Email users on sbnd-software

{#sbnd_data}

sbnd\_data(#sbnd_data)
---------------------------------------

-   [Updating sbnd\_data](Updating_sbnd_data.html)

{#Code-monitoring}

Code monitoring(#Code-monitoring)
--------------------------------------------------

-   [Commit emails](Commit_emails.html)
-   [Continuous integration](Continuous_integration.html)

{#Mailing-lists-you-should-be-on}

Mailing lists you should be on(#Mailing-lists-you-should-be-on)
--------------------------------------------------------------------------------

-   SBND-SOFTWARE
-   SBND-COMMIT
-   SBND-SOFTWARE-BUILD
-   BUILD-SERVICE-USERS
-   LARSOFT
-   ART-USERS

{#Legacy-pages}

Legacy pages(#Legacy-pages)
--------------------------------------------

-   [Deploy on
    /grid/fermiapp](Deploying_a_release_on_fermigrid.html)
