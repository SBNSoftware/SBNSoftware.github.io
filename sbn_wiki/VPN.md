---
layout: page
title: VPN
---

Virtual Private Network (VPN) to Fermilab
====================================================================================================

**Table of contents** (links do not work yet... need to find out how to fix them...)
*   [Obtaining the credentials]
*   [Cisco client installation]
    -   [Additional setup for Linux]
*   [Free client installation]
    -   [OpenConnect for OSX]
    -   [OpenConnect for Linux]
    -   [OpenConnect for iOS (Apple mobile)]
    -   [OpenConnect for Android]
*   [Log in the VPN]
    -   [Cisco AnyConnect]
    -   [OpenConnect (command line interface)]

Some resources can be accessed only from within Fermilab network. For
some, the access outside Fermilab network is still allowed but crippled.

To allow users to access these resources in full by connecting via a
Virtual Private Network (VPN)
For this access, the user must obtain from Fermilab all the credentials to access.
They also need a program to be correctly set up on the client node (e.g. laptop).

A quite understandable description of the system is documented in
[CD DocDB 3435](http://cd-docdb.fnal.gov/cgi-bin/ShowDocument?docid=3435).

As stated in there, Fermilab has chosen Cisco "AnyConnect", which provides a
[client](http://www.cisco.com/c/en/us/support/security/anyconnect-secure-mobility-client/tsd-products-support-series-home.html)
to connect to its VPN. There is also a free alternative.


Obtaining the credentials{#RSAtoken}
-------------------------------------

Fermilab has adopted an authentication system that requires a token.
The token (a number) is different on each connection, and the user must be able
to promptly provide it when requested at the beginning of the connection.

The token can be obtained from a special "key" (an hardware dongle that must be requested to Fermilab)
or by a software application.

Currently one way to get get started is:

1.  First you need to get a token by opening a ticket [RSA Token Request form](https://fermi.servicenowservices.com/nav_to.do?uri=com.glideapp.servicecatalog_cat_item_view.do?sysparm_id=99aecde66f172500c7743acf1e3ee401){.external}
    (takes a while and both hard and soft tokens are limited)
2.  [Set it up](https://fermi.servicenowservices.com/kb_view.do?sysparm_article=KB0011426)
3.  [Use it](https://fermi.servicenowservices.com/kb_view.do?sysparm_article=KB0013046)

A token will be requested on each connection.


Cisco client installation
----------------------------------------------------------------------

The [official Cisco AnyConnect client](http://www.cisco.com/c/en/us/support/security/anyconnect-secure-mobility-client/tsd-products-support-series-home.html)
is supported for Linux, OSX and Windows.

That software is only available via Fermilab: visit https://vpn.fnal.gov
and log in with your Services account credential
(just the user name, without `@services.fnal.gov`). The web site will
guide you to install the software.

Once installed, you can start the client interface and fill in the
information in the table below.


### Additional setup for Linux

The web site will just download a "script" `vpnsetup.sh`. That is not
just the script (it contains the binary data of the package itself).
To install that, run

    sudo sh vpnsetup.sh
    
or similar. In short: you need administrator privileges.

The script will also install SystemV scripts to start and stop the VPN. It
will also try to set it to start automatically (this failed on Gentoo
Linux).

If your system uses [systemd](https://github.com/systemd/systemd) instead,
it may still work... or not (this too failed on Gentoo Linux).

When the sequence of failures is long enough, you are ready to give a
try to the free client.



Free client installation
--------------------------------------------------------------------

The [free](https://www.gnu.org/licenses/oldsy-licenses/lgpl-2.1.html)
client [OpenConnect](http://www.infradead.org/openconnect) is
available for Linux, Windows, OSX, Android and many others.


### OpenConnect for OSX

Under OSX, OpenConnect is also via homebrew:
    
    brew install openconnect
    


### OpenConnect for Linux

To do (need it? please [ask](mailto:petrillo@slac.stanford.edu)).

Chances are that your distribution has it prepackaged for you:

* Gentoo (checked on: 2020-05-19T15:08:15Z): `emerge net-vpn/openconnect`
* Ubuntu (checked on: 18.04 LTS): `apt install openconnect`



### OpenConnect for iOS (Apple mobile)

The idea is that iTune offers an
[official client](https://itunes.apple.com/us/app/cisco-anyconnect/id1135064690?mt=8)
based on AnyConnect 4.6^[1]^.

A [video from Northern Arizona University](https://mediaspace.nau.edu/media/How+to+Connect+to+Cisco+AnyConnect+VPN+on+an+iOS+Device/0_wmaarq43)
may help through the next steps, using the information above.
Considering the experience with the OSX version of a similar software,
it is possible that the user name is required in the full format,
`user@services.fnal.gov`.

[Report your luck with it if you try it!](mailto:petrillo@fnal.gov)

^[1]^ Currently, that is August 2018, there is also another version dubbed
"Legacy" which is based on 4.0, and I am not talking about that one.



### OpenConnect for Android

OpenConnect binary distribution is available via
[F-Droid](https://f-droid.org/repository/browse).



Log in the VPN
------------------------------------------------

To start using the VPN, a login must be performed.
The VPN "split" mode will make sure that only the traffic to Fermilab network
goes through the VPN.
The credentials for log in are:

parameter           | value
------------------- | ----------------------------------------------------------------------
Server              | `vpn.fnal.gov`
Authorization group | `SiteVPN-RSA`
User name           | plain user name (no `@fnal.gov`, `@services.fnal.gov` or such)
First password      | Services password (same as for e-mail access, ServiceNow and others)
Second password     | from the RSA token application

The client asks for two passwords. The second one changes every minute
and is obtained from the RSA token or application.
Apparently depending on the system the token to be entered is either 6 digits
(Android RSA token application?) or 10 digits (iOS?).
In the latter case the code is made of the 4 digits of your secret
(that is always the same and you chose) and the 6 digits generated every time.


### Cisco AnyConnect

Under OSX and Linux, a graphic user interface called
"Cisco AnyConnect Secure Mobility Client" will allow you to enter the information above.

The first box ("Connect to") allows to choose one of the preconfigured clients.
You want to type the Fermilab VPN server here.
Note that depending on the client options, the client could attempt to connect
to a VPN as soon as it is started: make sure that if that happens,
Fermilab VPN is chosen.

The `SiteVPN-RSA` authorization group should be already preselected - if not, it needs to be chosen.
Three more text boxes are present.
The user name appears to be accepted _without_ the `@services.fnal.gov` suffix.
Two password boxes are the first one for the Fermilab Services password,
the second password for the RSA token.
On a successful connection, a dialog box will appear prompting the user to accept
the conditions of use, and after accepting it the VPN is active.


### OpenConnect (command line interface)

The simplest command to start is:

    sudo openconnect --user=<USERNAME> --authgroup=SiteVPN-RSA vpn.fnal.gov

or equivalent. Superuser privileges are likely necessary to mess with
the network configuration;
with no special configuration, the very first password request will come from `sudo`
and the answer is usually the local user login password.

The `--user` argument, optional, is the one like in the table above. If
not specified, it will be asked interactively.
The `--authgroup` argument is also optional, and again its value will be
asked interactively if the option is omitted.
In this log in procedure, **pay attention to the text in the prompts**.

Remember that if you use that command, the first password request comes
from `sudo` to gain administrator privileges on your own machine
(prompy may be something like `[sudo] password for <username>:`).
Then if Fermilab certificates are not recognized by your system, you may receive
_twice_ the confirmation that the certificates being used are trustworthy
(two different certificates, two requests). Saying `yes` will move forward.

Then the next prompt may be for the access group, if `--authgroup` was not specified
(prompt: `GROUP: [option|option|...]:`).
At this point FNAL server will always send a message like `Please enter your SERVICES username and password.`.
The next prompt may be for the user name, _if `--user` was not specified_ (prompt: `Username:`).
**If the `--user` option is specified, this prompt is skipped, despite the message from FNAL to enter both username _and_ password.**
Then, the VPN access password is requested (`Password:`: first password from the table above),
and then the RSA token is (another `Password:`: second password from the table above).

The shell is occupied by `openconnect`, unless the `--background` option
is specified. If not, to disconnect it is enough to hit `<Ctrl>+<C>`.

> The command I end up using looks like:
>     
>     sudo /usr/sbin/openconnect --background --user=<MyUserName> --authgroup=SiteVPN-RSA --setuid="$USER" vpn.fnal.gov
>     
> Quite a mouthful.
> This is an example of output with `openconnect` `v8.09`:
>     
>     POST https://vpn.fnal.gov/
>     Connected to 198.49.208.88:443
>     SSL negotiation with vpn.fnal.gov
>     Server certificate verify failed: signer not found
>     
>     Certificate from VPN server "vpn.fnal.gov" failed verification.
>     Reason: signer not found
>     To trust this server in future, perhaps add this to your command line:
>         --servercert pin-sha256:<CertificateHash1>
>     Enter 'yes' to accept, 'no' to abort; anything else to view: yes
>     Connected to HTTPS on vpn.fnal.gov with ciphersuite (TLS1.2)-(RSA)-(AES-128-CBC)-(SHA1)
>     Got HTTP response: HTTP/1.0 302 Temporary moved
>     POST https://v-main-gcca-1-outside.fnal.gov/
>     Connected to 198.49.208.79:443
>     SSL negotiation with v-main-gcca-1-outside.fnal.gov
>     Server certificate verify failed: signer not found
>     
>     Certificate from VPN server "v-main-gcca-1-outside.fnal.gov" failed verification.
>     Reason: signer not found
>     To trust this server in future, perhaps add this to your command line:
>         --servercert pin-sha256:<CertificateHash2>
>     Enter 'yes' to accept, 'no' to abort; anything else to view: yes
>     Connected to HTTPS on v-main-gcca-1-outside.fnal.gov with ciphersuite (TLS1.2)-(RSA)-(AES-128-CBC)-(SHA1)
>     POST XML abilitato
>     Please enter your SERVICES username and password.
>     POST https://v-main-gcca-1-outside.fnal.gov/
>     POST XML abilitato
>     Please enter your SERVICES username and password.
>     Password:
>     Password:
>     POST https://v-main-gcca-1-outside.fnal.gov/
>     Got CONNECT response: HTTP/1.1 200 OK
>     CSTP connected. DPD 30, Keepalive 20
>     Connected as <MY.IP.ADD.RES>, using SSL, with DTLS + LZS in progress
>     Continuing in background; pid <PID>
>     

Chances are that your Linux operating system is distributing convenience
scripts to manage the VPN... check the standard places (e.g. something
in `/etc/init.d` for Debian, `service` for RedHat, `rc-service` for
old Gentoo, maybe a `systemd` unit...).
