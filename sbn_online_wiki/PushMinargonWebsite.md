---
layout: page
title: How to Push the Minargon Website
###subtitle: Specific Wiki for SBNDQM
description: Wiki documentation for SBNDQM
hero_height: is-small
toc: false
toc_title: SBNDQM Contents
---

1. Switch to my dev branch e.g. `git checkout feature/mking_crt`
2. Verify that all changes work on local branch
3. Commit changes to all files EXCEPT:
	1. runserver.py
	2. settings.conf
4. Pull down the deploy version and resolve conflicts
	1. `git pull origin sbnd-deploy` (here, the origin is https://github.com/SBNSoftware/sbndaq-minargon.git)
	2. Resolve any changes, make sure to copy back over the correct settings.conf appropriate to your local version:
		1. `cp /home/nfs/munjung/dev_minargon/sbndaq-minargon/settings.conf ./`
		3. export MINARGON_SETTINGS=`pwd`/settings.conf
5. Push your feature branch
	1. `git push origin feature/mking_crt`
	2. or `git push origin HEAD:feature/mking_crt`
6. Pull request merge your feature branch with sbnd-dev-deploy
7. On the gpvm, 
	1. `cd /web/sites/s/sbn-online.fnal.gov/cgi-bin-dev/minargon/sbndaq-minargon`
	2. `git pull origin sbnd-dev-deploy`
	3. `cd ../`
	4. `touch minargon.wsgi`
8. Check `https://sbn-onlinedev.fnal.gov/cgi-bin/minargon/minargon.wsgi/introduction` for your changes
9. Pull request sbnd-dev-deploy with sbnd-deploy
10. On the gpvm, 
	1. `cd /web/sites/s/sbn-online.fnal.gov/cgi-bin/minargon/`
	2. `git pull sbn sbnd-deploy`
	3. `touch minargon.wsgi`
11. Check `https://sbn-online.fnal.gov/cgi-bin/minargon/minargon.wsgi/introduction` for your changes