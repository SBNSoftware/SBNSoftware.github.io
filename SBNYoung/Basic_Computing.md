---
layout: page
title: Basic Computing
---

#### Computing Access

One of the very first things you'll need to do is [apply](https://get-connected.fnal.gov/users/access/) for a Fermilab computing account for your experiment.
This will give you a services password (for logging into most Fermilab online resources) and a kerberos password which you use to identify your computer to the Fermilab servers you will be logging into.
There are detailed instruction of how to ssh into the appropriate virtual machines for your experiment in the [SBND](/sbndcode_wiki/Access_to_servers_via_SSH.md) and [ICARUS](https://sbnsoftware.github.io/icaruscode_wiki/Computing_Resources.html#ssh-access-to-remote-servers) pages.

#### Communicating with the experiment

If you're a brand new grad student then the whole idea of how a particle physics collaboration works will be a new concept. The structure can seem a little bonkers but the easiest way to start getting to know how it all fits together is coming to meetings and getting to know who people are.
All key information and connection details for relevant meetings will be sent out via the various mailing lists.
- Let's start by subscribing you to the SBN Young mailing list!
- Send an email to listserv@fnal.gov with no subject and just one line SUBSCRIBE SBN-YOUNG FIRSTNAME LASTNAME
- The format is then the same for any other lists just replacing SBN-YOUNG with any other list. An (incomplete) list of SBND mailing lists can be found [here](https://sbn-nd.fnal.gov/internal/mailing_lists.html) and ***TODO ICARUS MAILING LISTS***
- There is also an SBN-wide slack workspace. This is where most day-to-day conversations happen. You should be able to find anyone on the experiment here, there are also channels for different groups within the experiments which you can join (e.g. #sbn-young). Ask your supervisor to add you to this slack workspace.
- All important documents, including slides from all internal meetings can be found on the [docDB](https://sbn-docdb.fnal.gov/cgi-bin/sso/DocumentDatabase), you should be able to access this through Fermilab's single sign on once you have your services account (see above).

#### VNC

Once you're able to ssh into the fermilab clusters and are working on these machines it is often useful to be able to view windows such as event displays or plots. This can be done by using a VNC, there are some useful instructions for this on an [SBND page](https://sbnsoftware.github.io/sbndcode_wiki/Viewing_events_remotely_with_VNC.html).

#### MRB and setting up a basic build of sbndcode/icaruscode
