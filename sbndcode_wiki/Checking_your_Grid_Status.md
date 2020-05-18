---
lang: en
title: Checking your Grid Status
---

{#Checking-your-Grid-Status}

Checking your Grid Status(#Checking-your-Grid-Status)
======================================================================

{#Fifemon-GrafanaKibana}

Fifemon: Grafana/Kibana(#Fifemon-GrafanaKibana)
----------------------------------------------------------------

-   [Fifemon](https://fifemon.fnal.gov/){.external} provides you with
    information about your current running jobs, how much space we have,
    why your jobs are being held. You need to enter your SERVICE
    password to access it.

!(/redmine/attachments/download/59580/fife.png)

-   I find Grafana and User batch details the most useful you can access
    by clicking on the graph ana button indicated
-   You can then place you user name in search bar. As you can see I\'ve
    had several jobs start and some held within the last 24 hours. There
    is lists, efficiency details and loads of information so just freely
    click around for the info.

!(/redmine/attachments/download/59581/graf.png)

-   Kibana gives you specific information such as job locations. You can
    open specific cluster up from graphana and open Kibana for it.

!(/redmine/attachments/download/59583/kib.png)

-   \"Jobsub\"=https://cdcvs.fnal.gov/redmine/projects/jobsub/wiki/Frequently\_Asked\_Questions
    helps you get information from a local command line e.g. gpvms. One
    you have setup sbnd you can run the jobsub command such as


    jobsub_q --user=yourname 

!(/redmine/attachments/download/59582/jobsub_q.png)

which list the jobs you have currently running. Sometimes you have
realised you jobs are incorrect and you might remove them here is a few
examples:\

    jobsub_rm --user=yourusername
    jobsub_rm --jobid=your jobid 
    jobsub_rm --constraint '(JobStatus=?=5)&&(Owner=?="yourusername")' 

\
The first removes the all the job for with your username, second remove
all jobs with a specific job id, the third removes all jobs that have
been held by you.
