---
layout: page
title: Setting up your account for ssh access to private network
  connections
---



Setting up your account for ssh access to private network connections
==============================================================================================================================================================

First, test if you can login to the subnets:

From either of the daq servers do:\

    ssh username@sbnd-daq33-priv.fnal.gov

and

    ssh username@sbn-daq01-priv.fnal.gov

If you can access without getting prompted for a password you\'re ok. If
you get asked for a password proceed to the instructions below. If it
denies access then most likely there\'s some other issue.

------------------------------------------------------------------------

The private addresses starting with 192.168 are not registered in the
KDC node database, and so regular kerberos tickets will not work when
ssh\'ing to one of the private ports. To enable your account for private
ssh access, first type the following:

      kinit username@FNAL.GOV
      ssh-keygen

You will be prompted for a password, remember it. This will create two
files, private and public keys in your \~/.ssh directory:

      id_rsa
      id_rsa.pub

Rename the private key and copy the public key:

      cd ~/.ssh
      mv id_rsa sbn_rsa
      cp id_rsa.pub authorized_keys

Then add the following to your **\~/.ssh/config** file:

    Host *-priv
        StrictHostKeyChecking no
        GSSAPIAuthentication no
        GSSAPIDelegateCredentials no
        AddKeysToAgent yes
        IdentityFile ~/.ssh/sbn_rsa
        PasswordAuthentication no
        ForwardAgent yes
        Protocol 2
        AddressFamily inet
        ServerAliveInterval 60
        ForwardX11 yes

The first time you use this method you will be prompted for the keytab
password from above. Try it out, e.g.:

      ssh sbn-daq01-priv
      ssh sbnd-daq33-priv
