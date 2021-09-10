---
layout: page
title: TITUS Event Display
subtitle: Specific Wiki for the TITUS event display for ICARUS
description: Wiki documentation specific to TITUS
toc: true
toc_title: TITUS Contents
---



TITUS Event Display via docker
==============================

Instructions
-------------

#### Install docker On Your Local Machine
- Instructions for installing and configuring docker can be found at the docker docs site, linked [here](https://docs.docker.com/get-docker/)
- Note that docker will be configured as the root user, you can find instructions for changing this in the documentation linked above

#### Pull the TITUS Image from dockerhub
- Issue the command:
  ```
  docker pull sfbaylaser/titus:latest
  ```
- This will pull the image into your docker space and save time when you go to start the image
- Note that the image is large, about 9 GB, so can take a few minutes to download.

#### Create a Data Folder On Your Local Machine and Download a Data File
- Create a folder to contain data files that you download
- See the [information on the previous page](../samples/datafiles.md) for finding data files
- If you have an FNAL computing account then you can copy the data file to your local machine

#### Start the Event Display
- **On a Linux Machine**
  - Once the image has been pulled and you have your data area set up you can start the container by issuing the command (making sure to substitute in the path to your data directory!):
    ```
    docker run -i -t --rm -e DISPLAY=$DISPLAY -u docker -v /tmp/.X11-unix:/tmp/.X11-unix:ro -v /path/to/your/data/area:/data --name="rdev" sfbaylaser/titus /bin/bash
    ```
- **On an OSX Machine**
  - Open a terminal window and start socat:
    ```
    socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
    ```
  - Open another terminal window to start xquartz, get the IP address and run docker:
    ```
    open -a Xquartz
    export IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
    docker run -it --rm -e DISPLAY=$IP:0 -v /path/to/your/data/area:/data sfbaylaser/titus /bin/bash
    ```
- **Open the Display Window -** the above will put you into a bash shell inside the image, from here you launch the display with:
  ```
  source setup_titus.sh
  evd.py -i /data/yourdatafile.root
  ```

#### Notes:
- Note that the TITUS event display can only display "decoded" data files, it cannot display files in artdaq format. Be sure to download a decoded data file!
- If on OSX and you don't have `socat` you can install with:
  ```
  brew install socat
  ```
- For OSX docker will respect Apple's file system sandbox guidelines... meaning that the path to your data file area on your local machine is best set off of your "Users" area, for example: `/Users/yourusername/data`


Some troubleshooting and experiences
-------------------------------------

### `Could not connect to display :0` (I)

On a Gentoo Linux system I got blessed with this message when running `evd.py`:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
No protocol specified
qt.qpa.screen: QXcbConnection: Could not connect to display :0
Could not connect to any X display.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
and that was it.

Connection to the graphics (`X.org`) server requires several conditions:
* a socket to the X server must be present in `/tmp/.X11-unix` directory
  (both on the host machine and inside the container); for example:
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  $ ls -l /tmp/.X11-unix/
  total 0
  srwxrwxrwx 1 root root 0 Mar  4 01:14 X0
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  The volume binding argument `-v /tmp/.X11-unix:/tmp/.X11-unix:ro` maps
  the host `/tmp/.X11-unix` into the container one, for everybody happiness.
* `DISPLAY` variable must be set to `:N` or equivalent, where `N` is the server number
  (if there is a `/tmp/.X11-unix/X0`, the server number is `0`);
  the argument `-e DISPLAY=$DISPLAY` imports host's `DISPLAY` value
  into the container.
* a Xauthority cookie must be available in `~/.Xauthority`, or else the X server
  may refuse to serve. This can be obtained with _another volume binding_:
  `-v "${HOME}/.Xauthority:/home/docker/.Xauthority"` which again imports the cookies
  from user's home directory in the host into the home directory of user `docker`
  (which is the one we use inside the container, per `-u docker` argument).
  This step may be not necessary if the authentication is provided or circumvented
  in a different way (for example, `xhost +si:localuser:$USER` or `xhost +local`
  or even `xhost +`).
* Xauthority cookie contains the name of the host it belongs to. A shortcut
  is to set container's host-name the same as the host host-name
  (urgh, getting entangled with "host" overloading); this can be achieved with
  the argument `-h "$HOSTNAME"`.

In conclusion, my experience with my Gentoo Linux host was that I needed to add:
`-v "${HOME}/.Xauthority:/home/docker/.Xauthority" -h "$HOSTNAME"` to the command
suggested in the main instructions.

Details of the system: Gentoo Linux (updated 20210303), Linux 5.10.13, SystemD-based,
user added to `docker` UNIX group (`docker` is not run with `sudo`);
no `xhost` in the system.


### `Could not connect to display :0` (II)

On a Ubuntu Linux system I got blessed with this message when running `evd.py`:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
No protocol specified
qt.qpa.screen: QXcbConnection: Could not connect to display :0
Could not connect to any X display.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
and that was it.

The rules are the same as mentioned [above](#could-not-connect-to-display-0-i),
but here the problem is that `/tmp/.X11-unix/X0` is not bound into the container.

Solution: I still have to figure it out...

Details of the system: Ubuntu Linux LTS 20.04, docker installed via Discover
(front-end of `apt`), and running via `sudo`.
