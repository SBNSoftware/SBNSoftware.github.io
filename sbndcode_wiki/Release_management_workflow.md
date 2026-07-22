---
layout: page
title: Release management workflow
---

Required permissions
------------------------------------------------------------

Multiple permissions are needed to perform all of the actions involved
in release management, these include:

-   Access to cvmfssbnd account on oasiscfs.fnal.gov
-   Access to sbnd account on GPVMs
-   Account on the Jenkins build server and a [CILogon
    certificate](Setting_up_access_with_CILogon_certificate.html)
    loaded in your browser (Will need [Fermilab
    VPN](VPN.html) running if off site)
      * Relevant ticket to get Jenkins permissions: [Modify user on Jenkins Cluster](https://fermi.servicenowservices.com/com.glideapp.servicecatalog_cat_item_view.do?sysparm_id=6309a202db751740da5174131f961941)
-   Access to `scisoftgpvm01.fnal.gov`



Creating a new release
----------------------------------------------------------------
0.  [Get scripts](https://github.com/SBNSoftware/SBNSoftware.github.io/tree/master/sbndcode_wiki/attachments)
1.  [Tag the release](Tagging_a_release.md)
2.  [Build on Jenkins](Building_a_release_on_Jenkins.md)
3.  [Upload release to SciSoft](Write_files_to_SciSoft.md)
4.  [Deploy on CVMFS](Deploying_a_release_on_CVMFS.md)
5.  [Update the
    wiki](Updating_the_wiki_for_a_new_release.md)
6.  Email users on sbnd-software



sbnd\_data
---------------------------------------

-   [Updating sbnd\_data](Updating_sbnd_data.html)


Mailing lists you should be on
--------------------------------------------------------------------------------

-   SBND-SOFTWARE
-   SBN-SOFTWARE
-   LARSOFT
