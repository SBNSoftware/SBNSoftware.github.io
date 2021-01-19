---
layout: page
title: Write files to CVMFS
---



Write files to CVMFS
============================================================

-   **Table of contents**
-   [Write files to CVMFS]
    -   [Access privileges]

Modifications to SBND area in CVMFS are performed interacting as user
`cvmfssbnd` on the server `oasiscfs.fnal.gov`.\
A file `README` in the home directory in there contains instructions
that may be more up to date than these ones.

These are the suggested operations, optimised for \"the less time in
`oasiscfs.fnal.gov`, the better\":

1.  get a Kerberos ticket as usual:

        kinit -R "${USER}@FNAL.GOV" || kinit "${USER}@FNAL.GOV"

    (this is just a trick so that it renews if available, otherwise it
    asks for a password and creates a new one)

2.  copy the files you want to store in CVMFS into `oasiscfs.fnal.gov`
    (you need to [be authorised]:

        scp sbnd_data-01.00.00-noarch.tar.bz2 cvmfssbnd@oasiscfs.fnal.gov:

    will copy all the files (in this case, a single
    `sbnd_data-01.00.00-noarch.tar.bz2`) into the home directory of
    `cvmfssbnd`

3.  log in `oasiscfs.fnal.gov` (you need to [be
    authorised]:

        ssh cvmfssbnd@oasiscfs.fnal.gov

4.  start the CVMFS update session:

        cvmfs_server transaction sbnd.opensciencegrid.org

5.  do what it takes to modify the CVMFS area at
    `/cvmfs/sbnd.opensciencegrid.org`: copy files, move files, expand
    files, edit files\...

        tar xvvf sbnd_data-01.00.00-noarch.tar.bz2 -C /cvmfs/sbnd.opensciencegrid.org/products/sbnd

6.  close and \"publish\" the update wit a tag string and a message;
    **make sure you are not in the CVMFS directory**:

        cd
        cvmfs_server publish -m "Published sbnd_data 1.0.0" -a 1.0 sbnd.opensciencegrid.org

    \
    will create a new tag `1.0`, with a meaningful description. A tag
    can be also created after publication, with
    `cvmfs_server tag -m "Published sbnd_data 1.0.0" -a 1.0 sbnd.opensciencegrid.org`
    (same effect as before). To see all tags, issue
    `cvmfs_server tag -l sbnd.opensciencegrid.org` (`-l` is optional).

7.  log out

You can try and check the directory
`/cvmfs/sbnd.opensciencegrid.org/products/sbnd` (and note that on GPVM
the directory `/cvmfs/sbnd.opensciencegrid.org` might not show with a
`ls /cvmfs`, but it will automatically appear the first time it is
requested), but it takes some time for the CVMFS server to propagate the
change to the world.



Access privileges
------------------------------------------------------

A few SBND people are allowed to log as `cvmfssbnd` on
`oasiscfs.fnal.gov`, and these people can add a few others. If you are a
`blesseduser`, the access command is:\

    kinit blesseduser@FNAL.GOV
    ssh cvmfssbnd@oasiscfs.fnal.gov

\
As of December 2016, these people are blessed:

-  [Andrzej Szelc](mailto:aszelc@ed.ac.uk)
-  [Gianluca Petrillo](mailto:petrillo@fnal.gov)
-  [Corey Adams](mailto:corey.adams@yale.edu)
-  [Roxanne Guenette](mailto:Roxanne.Guenette@physics.ox.ac.uk)
-  [Tom Brooks](mailto:tom.g.r.brooks@gmail.com)
-  [Andrew Scarff](mailto:a.scarff@sheffield.ac.uk)

To add a user to the list, his/her Kerberos principal must be added to
`.k5login` file in the home directory of `cvmfssbnd`.\
Since January 2018, we can freely edit the list of authorised people and
we are responsible of the maintenance of that list.

A \"backup file\" showing how this file looks like is attached to this
wiki page
([k5login-201801165](/redmine/attachments/45990/k5login-201801165){.attachment}).\
The actual file is at `oasiscfs.fnal.gov:~cvmfssbnd/.k5login` (the
ownership `cvmfssbnd:cvmfs` and the access mode `0600` must be
preserved).
