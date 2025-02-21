---
layout: page
title: How to Edit Minargon Website
###subtitle: Specific Wiki for SBNDQM
description: Wiki documentation for SBNDQM
hero_height: is-small
toc: false
toc_title: SBNDQM Contents
---

## Important Links
[Minargon Website](https://sbn-online.fnal.gov/cgi-bin/minargon/minargon.wsgi/introduction)
[Minargon Github](https://github.com/SBNSoftware/sbndaq-minargon)

## Setup Every Time
Log into gpvm then gateway then evb with local forwarding:
```
ssh -KYXL localhost:5002:localhost:5002 mking@sbndgpvm01.fnal.gov
ssh -KXYL localhost:5002:localhost:5002 mking@sbnd-gateway01.fnal.gov
ssh -KXYL localhost:5002:localhost:5002 mking@sbnd-evb01.fnal.gov
```
If you do not yet have a local development area, see **Create a local development area**
If you do have a local development area, then:

## Create a local development area
Instructions in the readme of the [minargon github](https://github.com/SBNSoftware/sbndaq-minargon)
On gateway or evb machine:

`mkdir dev_minargon_tutorial` from home area
`git clone https://github.com/SBNSoftware/sbndaq-minargon.git`:  clone github repository for the website
`python3 -m venv env`: Create python virtual environment in `sbndaq-minargon` folder
`. env/bin/activate`: Activate the virtual environment
`pip install --upgrade pip` upgrade pip
`pip install -r requirements.txt` install necessary python packages
`git pull origin sbnd-deploy` pull down the current SBND deploy version as a starting point
`cp /home/nfs/munjung/dev_minargon/sbndaq-minargon/settings.conf ./`: Copy over Moon's settings configuration file

**If not all dependencies are present:**
`pip install elasticsearch` dependency in the current deploy version which is not listed in requirements.txt
`pip install Pillow` for the timeseries view.

8/5/24: pip install Requirements + matplotlib + elasticsearch

## Viewing the Website
In your development area, `. env/bin/activate`: Activate the python virtual environment.
Make sure that the port in `runserver.py` is the same as the local forwarding port 
(Make sure you have the right settings.conf file in sbndaq-minargon ) 
From sbndaq-minargon folder, run

export MINARGON_SETTINGS=\`pwd\`/settings.conf

In a browser, go to URL given by running `./runserver.py`

## Editing the Website
First, pull down the changes in the deploy version:
`git pull origin sbnd-deploy`

### Views
Contains python scripts. In particular, `views.py` is the relevant python script that creates what we see in the website.

In lines `@app.route(<url>)`,  these define the parameters to create different webpages
### Templates
Contains HTML scripts
`layout.html` contains the headings, dropdown items, etc for the header on each page.
`introduction.html` is the introductory page of the website. 



