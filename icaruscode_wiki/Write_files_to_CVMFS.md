---
layout: page
title: Write files to CVMFS
subtitle: 
description: Instructions to store files in ICARUS CVMFS
toc: true
toc_title: Contents
---


Write files to CVMFS
============================================================

_(original text from Andrzej Szelc)_

Modifications to ICARUS area in CVMFS are performed interacting as user
`cvmfsicarus` on the server `oasiscfs.fnal.gov`.
A file `README` in the home directory in there contains instructions
that may be more up to date than these ones.

These are the suggested operations, optimised for "the less time in `oasiscfs.fnal.gov`, the better":

1.  get a Kerberos ticket as usual:

        kinit -R "${USER}@FNAL.GOV" || kinit "${USER}@FNAL.GOV"

    (this is just a trick so that it renews if available, otherwise it
    asks for a password and creates a new one)
2.  copy the files you want to store in CVMFS into `oasiscfs.fnal.gov`
    (you need to [be authorised](#access-privileges)):

        scp icarus_data-01.00.00-noarch.tar.bz2 cvmfsicarus@oasiscfs.fnal.gov:

    will copy all the files (in this case, a single
    `icarus_data-01.00.00-noarch.tar.bz2`) into the home directory of
    `cvmfsicarus`
3.  log in `oasiscfs.fnal.gov` (you need to [be authorised](#access-privileges)):

        ssh cvmfsicarus@oasiscfs.fnal.gov

4.  start the CVMFS update session:

        cvmfs_server transaction icarus.opensciencegrid.org

5.  do what it takes to modify the CVMFS area at
    `/cvmfs/icarus.opensciencegrid.org`: copy files, move files, expand
    files, edit files...

        tar xvvf icarus_data-01.00.00-noarch.tar.bz2 -C /cvmfs/icarus.opensciencegrid.org/products/icarus

6.  close and "publish" the update wit a tag string and a message;
    **make sure you are not in the CVMFS directory**:

        cd
        cvmfs_server publish -m "Published icarus_data 1.0.0" -a 1.0 icarus.opensciencegrid.org

    will create a new tag `1.0`, with a meaningful description. A tag
    can be also created after publication, with
    `cvmfs_server tag -m "Published icarus_data 1.0.0" -a 1.0 icarus.opensciencegrid.org`
    (same effect as before). To see all tags, issue
    `cvmfs_server tag -l icarus.opensciencegrid.org` (`-l` is optional).

7.  log out

You can try and check the directory
`/cvmfs/icarus.opensciencegrid.org/products/icarus` (and note that on
GPVM the directory `/cvmfs/icarus.opensciencegrid.org` might not show
with a `ls /cvmfs`, but it will automatically appear the first time it
is requested), but it takes some time for the CVMFS server to propagate
the change to the world.



Access privileges
------------------------------------------------------

A few ICARUS people are allowed to log as `cvmfsicarus` on
`oasiscfs.fnal.gov`, and they can add a few others.
As of August 2020, these people are:

Users with ICARUS CVMFS upload privileges                      | since
-------------------------------------------------------------- | ------
[Wes Ketchum](mailto:wketchum@fnal.gov)                        | 2016
[Yun-Tse Tsai](mailto:yuntse@slac.stanford.edu)                | 2016
[Tracy Usher](mailto:usher@slac.stanford.edu)                  | The Stone Age
[Francesco Tortorici](mailto:francesco.tortorici@ct.infn.it)   | 2016
[Gianluca Petrillo](mailto:petrillo@slac.stanford.edu)         | 2017
Miquel Nebot-Guinot                                            | 2020
Patrick Green                                                  | 2020
Chris Hilgenberg                                               | 2021

To add a user to the list, his/her Kerberos principal must be added to
`.k5login` file in the home directory of `cvmfsicarus`.


StashCache
-----------

StashCache is a storage area visible via CVMFS.
Nevertheless, it's quite a different beast, and information about it can be found in its own [StashCache wiki page](computing/stashCache.html).
