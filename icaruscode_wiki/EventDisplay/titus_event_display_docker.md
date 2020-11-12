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
- See the information on the previous page for finding data files
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
