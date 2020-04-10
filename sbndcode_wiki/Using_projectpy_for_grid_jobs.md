---
lang: en
title: Using projectpy for grid jobs
---

[]{#Using-projectpy-for-Grid-Jobs}

Using project.py for Grid Jobs[¶](#Using-projectpy-for-Grid-Jobs){.wiki-anchor}
===============================================================================

Explanation courtesy of Dom Brailsford. Firstly to use the grid use
[project.py](https://cdcvs.fnal.gov/redmine/projects/larbatch/repository/revisions/develop/entry/scripts/project.py){.external}.

A useful explanation of project.py can be found in the [LAr Batch Tools
Redmine
site](https://cdcvs.fnal.gov/redmine/projects/larbatch/wiki/User_guide){.external}.
This gives more detail on the specific elements.

[]{#How-the-write-a-Projectpy-XML-file}

How the write a Project.py XML file[¶](#How-the-write-a-Projectpy-XML-file){.wiki-anchor}
-----------------------------------------------------------------------------------------

Project.py handles job submissions to the grid so that you don\'t have
to worry about managing all the jobs you send to the grid yourself.
Project.py runs from an XML file which defines some parameters i.e. how
many jobs you want to run. So lets look at an example XML file which
generates particles.

So firstly is the header section.

![](/redmine/attachments/download/40804/line1.png)

-   The first line is the version of XML you wish to use.
-   The lines 5-10 are for book keeping. Changing these might change
    your output folder structure.

Next is the project element.

![](/redmine/attachments/download/40805/line13.png)

-   Line 13 declares the name of the project.
-   Line 16 is the total number of events you want to produce in the
    sample and **NOT** the number of events per job.
-   Line 19 defines the operating system that you\'d like the grid
    worker node to have.
-   Line 22 defines how the jobs are queued.

The Larsoft sub element:

-   Lines 26-28 defines the LArsoft version you would like to run. If
    you want to run your own version you need to make your own tar file
    (create a tar file using make\_tar\_sbnd.sh local.tar .) and place
    in line 28. If you want to run the UPS product then you can omit
    line 28. Make sure the tar file is in dCache.

Next are the stage sub-elements. This defines the generator-level job
that you want to run.

![](/redmine/attachments/download/40807/line31.png)

-   Line 34 is where the fcl file is defined. You need to specify the
    full path to it.
-   Line 35 defines where the output file should go. Make sure it\'s a
    [SBND dCache storage](SBND_dCache_storage.html){.wiki-page} (pnfs)
    location.
-   Line 36 defines the work directory where initial some initial
    processing occurs. Make sure its a dCache area.
-   Line 37 defines how many jobs you wish to split the stage into.
-   Line 38 and 39 are definitions you need when you declare your output
    to SAM.

End with:\
![](/redmine/attachments/download/40806/line42.png)

[]{#Job-Submission}

Job Submission.[¶](#Job-Submission){.wiki-anchor}
-------------------------------------------------

Once you have written your XML script it you just need to pass a few
command line arguments which define the XML and the stage name you want
to use.

If you want to submit the gen-level jobs then you would, for example, do
the following command:

    project.py --xml prodsingle_mu_100-1257MeV_fixposcontained_fixangle.xml --stage gen --submit

It\'s useful to check (use checkana for anatree files) the output once a
stage is finished. Do this by:

    project.py --xml prodsingle_mu_100-1257MeV_fixposcontained_fixangle.xml --stage gen --check

This tell you what jobs have failed and succeeded.

For jobs which only produce an analysis file (from art::analyser) the
check command is:\

    project.py --xml prodsingle_mu_100-1257MeV_fixposcontained_fixangle.xml --stage gen --checkana

If you want to check you status with cool graphs sign in
[Grafana](https://fifemon.fnal.gov/monitor/dashboard/db/experiment-overview?var-experiment=sbnd&orgId=1&from=1508165371912&to=1508252205933&refresh=10s){.external}
