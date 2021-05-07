

# ICARUS Operations Software Configuration

-   **Table of contents**
-   [ICARUS Operations Software
    Configuration]
-   [Login at control room console (\"Three Point
    Login\")]
-   [VNC/noVNC]
    -   [Update firewall]
    -   [systemd for vncserver]
    -   [websocket]
    -   [Window manager in VNC]
    -   [icarusdcs vnc server crashes]
-   [Authentication]

::: 
[Edit this
section](Icarus_ops_software_configuration/edit?section=2){.icon-only
.icon-edit}
:::



# Login at control room console (\"Three Point Login\")

-   Login to the sbn account.
-   Enter your kerberos password. (There is no password written
    somewhere).
-   Enter your kerberos username.

If this doesn\'t work then you are probably not in the icarus .k5login
file or you don\'t remember your kerberos password.

    For the "Three Point Login", any user who is in ~/.k5login can login
    with their Kerberos Username and Password.  Once logged in they will
    have a valid ticket that can be used to ssh out.

::: 
[Edit this
section](Icarus_ops_software_configuration/edit?section=3){.icon-only
.icon-edit}
:::



# VNC/noVNC

Run a VNC server, run a WebSocket proxy that points to the VNC server,
load the page, and connect! See the quick-start instructions in the
project README for more details.

::: 
[Edit this
section](Icarus_ops_software_configuration/edit?section=4){.icon-only
.icon-edit}
:::



## Update firewall

Ask the SLAM team to open the firewall on the computer for port 443 on
the public interface.

::: 
[Edit this
section](Icarus_ops_software_configuration/edit?section=5){.icon-only
.icon-edit}
:::



## systemd for vncserver

    /etc/systemd/system
    [root@icarus-evb01 system]# cat vncserver@\:1.service 
    [Unit]
    Description=Remote desktop service (VNC)
    After=syslog.target network.target

    [Service]
    Type=forking
    User=icarus

    # Clean any existing files in /tmp/.X11-unix environment
    ExecStartPre=-/usr/bin/vncserver -kill %i
    ExecStartPre=-/usr/bin/mkdir -p /home/nfs/icarus/.vnc
    ExecStart=/usr/bin/vncserver -localhost -alwaysshared -nolisten tcp -noreset %i
    PIDFile=/home/nfs/icarus/.vnc/%H%i.pid
    ExecStop=-/usr/bin/vncserver -kill %i

    [Install]
    WantedBy=multi-user.target

::: 
[Edit this
section](Icarus_ops_software_configuration/edit?section=6){.icon-only
.icon-edit}
:::



## websocket

    icarus    54371  54350  0 Jan22 ?        00:00:57     /usr/bin/python /usr/bin/websockify --web /usr/bin/../share/novnc/ 127.0.0.1:15901 127.0.0.1:5901
    icarus     6185  54371  0 Jan27 ?        00:00:10       /usr/bin/python /usr/bin/websockify --web /usr/bin/../share/novnc/ 127.0.0.1:15901 127.0.0.1:5901
    icarus    24397  54371  0 Jan28 ?        00:00:37       /usr/bin/python /usr/bin/websockify --web /usr/bin/../share/novnc/ 127.0.0.1:15901 127.0.0.1:5901
    icarus   162970  54371  0 Jan28 ?        00:00:00       /usr/bin/python /usr/bin/websockify --web /usr/bin/../share/novnc/ 127.0.0.1:15901 127.0.0.1:5901

    [root@icarus-evb01 system]# cat novnc@\:1.service 
    [Unit]
    Description=VNC over HTTP
    After=vncserver@:1.service
    Requires=vncserver@:1.service

    [Service]
    Type=simple
    User=icarus

    ExecStart=/usr/bin/novnc_server --vnc 127.0.0.1:5901 --listen 127.0.0.1:15901

    Restart=on-failure
    RestartSec=2

    [Install]
    WantedBy=multi-user.target

    Just a follow up on what I showed everyone upstairs.

    For the "Three Point Login", any user who is in ~/.k5login can login
    with their Kerberos Username and Password.  Once logged in they will
    have a valid ticket that can be used to ssh out.

    I put a script on Icarus CR 01 called "setup_tunnel" which is really
    just a wrapper around:

    ssh -L 8443:icarus-evb01.fnal.gov:443 icarus-gateway01

    And I set the Firefox home page to https://localhost:8443/

    You'll need to use the VNC password you specified to get control of the
    interface.

    You can change the default size of the VNC window by editing
    ~/.vnc/config (geometry) and then restarting the VNC service.  The size
    of the desktop is set at launch time and may generate scroll windows on
    smaller screens.

    Restarting VNC right now requires root access.  If you've got root
    access run: "systemctl restart vncserver@:1.service" 

    You may need to close and re-open firefox if the VNC session is restarted.

    Pat

**NOTE:** The above command `systemctl restart` will restart the server,
but if you want to check the status to see errors and such
(recommended!) then the command is the same but with `status` in place
of `restart`. That is\

    systemctl status vncserver@:1.service

::: 
[Edit this
section](Icarus_ops_software_configuration/edit?section=7){.icon-only
.icon-edit}
:::



## Window manager in VNC

    == Puppet Setup ==

    Add the `apache` class with the `novnc` application to the host.
    - Attach `apache` to the host
    - Edit class params to add the `novnc` application for this fqdn

    Add the `desktop` class to the host.

    Edit the `firewall` to permit `https` access to the server from the right network.

    == On the Host ==

    You'll need to put ssl certificates in:
    /etc/httpd/crts/server.crt
    /etc/httpd/crts/server.key
    /etc/httpd/crts/ca.crt

    They can be whatever.

    Whoever owns $vncuser should edit `~/.vnc/config` to meet their needs and set the VNC password.  This config file has replaced a lot of the xstartup bits (with something far more sane).

    Until the VNC password is set, the server wont actually start.

    EL8 plan - move these into systemd user services so they can be restarted by $vncuser

    -----
    puppet agent -t

    VNCUSER="vncuser" 
    USERHOME=$(getent passwd ${VNCUSER} | cut -d ':' -f6)

    mkdir -p ${USERHOME}/.vnc
    mkdir -p ${USERHOME}/.vnc
    cat << EOF >${USERHOME}/.vnc/config
    ## For desktop options do 'ls /usr/share/xsessions/'
    ## Not all desktops are suitable for VNC
    ##
    ## To select one, 
    ##   Extract the 'Exec=' line without Exec= (grep ^Exec= /usr/share/xsessions/icewm.desktop | sed -e 's/Exec=//')
    ##   Put it in ~/.Xclients
    ##   Make ~/.Xclients executable
    ##   It becomes the shell script that starts your window manager
    ##      so you can use various POSIX sh logic if you need to.
    ## echo "icewm-session" > ~/.Xclients ; chmod +x ~/.Xclients
    ##
    ## NOTE: desktop= sets the NAME of the session, not the window manager.
    #desktop=VNC_WINDOW_NUMBER_1
    geometry=1280x1024
    securitytypes=none
    localhost
    alwaysshared
    nolisten=tcp
    EOF

    cat << EOF >${USERHOME}/.vnc/xstartup
    #!/bin/sh
    unset SESSION_MANAGER
    unset DBUS_SESSION_BUS_ADDRESS
    VNC_DISPLAY=${DISPLAY}
    export VNC_DISPLAY
    exec /etc/X11/xinit/xinitrc
    # If the window manager exits, kill the session
    vncserver -kill ${DISPLAY}
    EOF

    chmod +x ${USERHOME}/.vnc/xstartup
    chown -R ${VNCUSER}:users ${USERHOME}/.vnc

    cat << EOF >/etc/systemd/system/vncserver@:1.service
    [Unit]
    Description=Remote desktop service (VNC)
    After=syslog.target network.target

    [Service]
    Type=forking
    User=${VNCUSER}

    # Clean any existing files in /tmp/.X11-unix environment
    ExecStartPre=-/usr/bin/vncserver -kill %i
    ExecStartPre=-/usr/bin/mkdir -p ${USERHOME}/.vnc
    ExecStart=/usr/bin/vncserver -localhost -alwaysshared -nolisten tcp -noreset %i
    PIDFile=${USERHOME}/.vnc/%H%i.pid
    ExecStop=-/usr/bin/vncserver -kill %i

    [Install]
    WantedBy=multi-user.target

    EOF

    cat << EOF > /etc/systemd/system/novnc@:1.service
    [Unit]
    Description=VNC over HTTP
    After=vncserver@:1.service
    Requires=vncserver@:1.service

    [Service]
    Type=simple
    User=${VNCUSER}

    ExecStart=/usr/bin/novnc_server --vnc 127.0.0.1:5901 --listen 127.0.0.1:15901

    [Install]
    WantedBy=multi-user.target

    EOF

    systemctl daemon-reload
    systemctl enable vncserver@:1.service novnc@:1.service
    systemctl start vncserver@:1.service novnc@:1.service

    -----

::: 
[Edit this
section](Icarus_ops_software_configuration/edit?section=8){.icon-only
.icon-edit}
:::



## icarusdcs vnc server crashes

15-Oct-2020 These changes did not have the desired effect. Using the CSS
phoebus gui on evb05 vnc crashed the ev06 vnc.

Summarized from RITM1027616.

These days very few Linux desktops support running multiple disconnected
instances out of the same home area.

VNC is running on evb05 and evb06 for the icarusdcs user. They are
trying to access and lock some of the same resources (in particular
/home/nfs/icarusdcs/.gvfs and some local dbus sockets). These files
cannot be shared between two running desktop sessions.

In theory the GOA messages are not that important. It is getting
launched automatically by DBUS via your desktop session. If you add:

sleep 10; kill -9 \`ps -axf \| grep goa-daemon \| cut -c 1-4\`; true

to your .xinitrc that should kill off that service automatically.

I\'d also encourage adding

    GVFS_DISABLE_FUSE=1
    export GVFS_DISABLE_FUSE

to \~/.profile on all the icarus shared accounts not using GNOME, MATE,
or Cinnamon.

The various desktop startup services will try to launch common tools.
Some of those tools depend on gvfs. Odds are you\'re not actually using
those integrations in icewm.

    Configured the files as suggested.  (see below)
    Restarted the vncserver on icarus-evb05.
    + GVFS_DISABLE_FUSE=1 is now set.
    + goa processes are still running.

    [icarusdcs@icarus-evb05 ~]$ cat .xinitrc
    GVFS_DISABLE_FUSE=1
    export GVFS_DISABLE_FUSE

    [icarusdcs@icarus-evb05 ~]$ cat .vnc/xstartup
    #!/bin/sh

    GVFS_DISABLE_FUSE=1
    export GVFS_DISABLE_FUSE

    unset SESSION_MANAGER
    unset DBUS_SESSION_BUS_ADDRESS
    VNC_DISPLAY=${DISPLAY}
    export VNC_DISPLAY
    exec /etc/X11/xinit/xinitrc
    # If the window manager exits, kill the session
    vncserver -kill ${DISPLAY}

    [icarusdcs@icarus-evb05 ~]$ cat .icewm/startup
    #!/bin/bash

    source ~/.profile

    # the sleep is required to ensure ICEWM has loaded the task bar
    sleep 1 && pkill -9 goa-daemon || true
    sleep 1 && pkill -9 goa-identity-service || true
    sleep 1 && pkill -9 gvfs-goa-volume-monitor || true

    [icarusdcs@icarus-evb05 ~]$ printenv | grep GV
    GVFS_DISABLE_FUSE=1
    DBUS_SESSION_BUS_ADDRESS=unix:abstract=/tmp/dbus-x6iBhIDjZU,guid=e1ec7973fcd1de40c15fe6f95f887152;unix:abstract=/tmp/dbus-DZGV1C7xVX,guid=9b6266a4b1f634db04c94e035f887152

    [icarusdcs@icarus-evb05 ~]$ ps -axf | grep goa
     29312 ?        Sl     0:00 /usr/libexec/gvfs-goa-volume-monitor
     29326 ?        SLl    0:00 /usr/libexec/goa-daemon
     29371 ?        Sl     0:00 /usr/libexec/goa-identity-service
    109542 pts/0    S+     0:00      |           \_ grep --color=auto goa

::: 
[Edit this
section](Icarus_ops_software_configuration/edit?section=9){.icon-only
.icon-edit}
:::



# Authentication

1\. request a special principal for the host. If a new principal,
requests need to be approved.\
For the CR this principal is \'<sbn/shift/$host.fnal.gov@FNAL.GOV>\'

2\. you will be emailed a one-time password

3\. create the keytab file in a secure location (the target host). This
file is sensitive and should have\
restrictive permissions.

SVC=service, eg sbn/shift\
HOST=eg icarus-cr-02.fnal.gov\
PASSWD=your one time password\
FILENAME=eg sbnshift (for sbnshift.keytab)

kadmin -p \${SVC}/\${HOST}.fnal.gov -w \${PASSWD} -q \"ktadd -k
\${FILENAME}.keytab \${SVC}/\${HOST}.fnal.gov\"

4\. if you put the keytab in
/var/kerberos/krb5/user/\$EUID/client.keytab, where EUID is the
effective UID of the user (56284 for sbn)\
it will be the default keytab. if you don\'t have a valid ticket account
will kinit against it. This method is the easiest.

5\. To authenticate against this file directly:

CCFILENAME=a filename for the credential cache\
KTFILENAME=your keytab filename\
HOST=your host

export KRB5CCNAME=FILE:\${FILENAME}/tmp/; kinit -A -k -t
/var/adm/krb5/\${KTFILENAME} sbn/shift/\${HOST}.<fnal.gov@FNAL.GOV>

\$KRB5CCNAME is the environment variable krb uses to save the credential
cache.

6\. now if you have KRB5CCNAME set correctly in a shell processes will
use that file as ticket cache\
and will have permissions granted to that principal. You can put
<sbn/shift/$host.fnal.gov@FNAL.GOV> in\
a user\'s .k5login on another host.
:::

Files (0)

::: {style="display: none;"}
::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](Icarus_ops_software_configuration.pdf){.pdf}
[HTML](Icarus_ops_software_configuration.html){.html}
[TXT](Icarus_ops_software_configuration.txt){.txt}

::: {style="clear:both;"}
:::
:::
:::
:::

::: 
Loading\...
:::

::: 
:::

::: 
::: {.bgl}
::: {.bgr}
Powered by [Redmine](https://www.redmine.org/) © 2006-2019 Jean-Philippe
Lang
:::
:::
:::
:::
:::
