---
layout: page
title: Access to servers via SSH
---



Access to servers via SSH
======================================================================

Fermilab servers are most often interactively accessed via Secure Shell
(SSH), with Kerberos authentication.

To access the server, you need to know:

-   your Kerberos credentials: it is the `<username>` given you by
    Fermilab computing, and the password you chose for it
-   the name of the server (for example, `sbndgpvm01.fnal.gov`).

There are two steps required to access a server, for example:\

    kinit -R <username>@FNAL.GOV  # authenticate via Kerberos, receive a "ticket" 
    ssh <username>@sbndgpvm01.fnal.gov # log in

\
Note that the first line asks your Kerberos client to attempt and renew
an existing ticket, saving you from the hassle of retyping the password.
If that fails, you need to run without `-R` option. A one-liner to do
all of that (in bash shell) is:\

    kinit -R <username>@FNAL.GOV || kinit <username>@FNAL.GOV

.



Access as a different user
------------------------------------------------------------------------

You may need to log in a server acting in a different role. For example,
you may want to write something in `/grid/fermiapp` on behalf of SBND;
that can be done^[1]^ only on `sbndgpvm01.fnal.gov`, and only by
the `sbnd` user.\
There is no person holding the `sbnd` user name, but there are some real
users who are allowed to impersonate it. If you are among them, this is
the magic:\

    kinit -R <username>@FNAL.GOV  # just as above
    ssh sbnd@sbndgpvm01.fnal.gov # log in as "sbnd" user

\
The people allowed to do so are the ones whose Kerberos principal, that
is a string like `<username>@FNAL.GOV`, is listed in `.k5login` file in
the home directory of the virtual user (in the example above, in
`sbndgpvm01.fnal.gov:~sbnd/.k5login`).\
People in that list can add more simply by editing that file, but
Fermilab demands the list to be kept short for maintenance and security
purposes (see [DocDB
5644](http://cd-docdb.fnal.gov/cgi-bin/RetrieveFile?docid=5644)).

^1^ This is at the time of writing, 20180129.
