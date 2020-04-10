---
lang: en
title: How to create and use a SAM definition
---

[]{#How-to-create-and-use-a-SAM-dataset}

How to create and use a SAM dataset[¶](#How-to-create-and-use-a-SAM-dataset){.wiki-anchor}
==========================================================================================

This page is a quick guide to how to access files from sam and use them
in your analysis. There is two methods below. The first uses project.py
and works on the grid. The second provides a list of file from which you
can run over. Before we get into accessing the file there is a few
things to point out first. If you want more information about sam go to
the [SAM Redmine
Page](https://cdcvs.fnal.gov/redmine/projects/sam/wiki/User_Guide_for_SAM){.external}
or the [MicroBooNE SAM
Page](https://cdcvs.fnal.gov/redmine/projects/uboonecode/wiki/Sam){.external}\".
There is plenty of useful information here if what below is not helpful.

[]{#Check-that-you-are-a-SAM-user}

Check that you are a SAM user[¶](#Check-that-you-are-a-SAM-user){.wiki-anchor}
------------------------------------------------------------------------------

Once you have setup sbndcode (Or setup your local build):

    source /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh
    setup sbndcode v06_53_00 -q e14:prof

Check to see if you are a SAM user:

     samweb -e sbnd list-users 

If you are not SAM user ask Dom Brailsford
(<d.brailsford@lancaster.ac.uk>) to add you.

Quick Guide\
Here is how to use SAM quickly. Setup the following environments:\

    source /grid/fermiapp/products/setups.sh; 
    setup ifdhc; 
    setup sam_web_client;
    setup fife_utils; 

Now you can access SAM and locate files and there names using the samweb
command. The command list-files has an obvious job and you can apply
filters to list the files we have. Here are a few examples:\

    samweb -e sand list-definition-files defname
    samweb -e sbnd list-files "start_time > 02-Jul-2018" 
    samweb -e sbnd list-files "file_name like %somesubstring%.root AND MetaDataName = value" 

In the second example I used the AND so that I could apply multiple
filters. You can then locate a file using the locate-file command:\

    samweb -e sbnd locate-file file.root 

You can use tools such as ifdh\_fetch (described below) to copy the
file(s) to your local directory. Make sure you have enough space!

[]{#Make-sure-you-have-Certification}

Make sure you have Certification[¶](#Make-sure-you-have-Certification){.wiki-anchor}
------------------------------------------------------------------------------------

Firstly to do some of the task below you will need a proxy so grab one
of those. Follow the ritual from this page: [Get a certificate
proxy](Get_a_certificate_proxy.html){.wiki-page}

[]{#Sam-Definitions}

Sam Definitions[¶](#Sam-Definitions){.wiki-anchor}
--------------------------------------------------

A definition links all files that are similar together so that you can a
sample quickly. All our Monte Carlo samples will have definitions so
that you can easily access them but you can make your own.

[]{#Using-Definitions-and-Creating-Datasets}

### Using Definitions and Creating Datasets[¶](#Using-Definitions-and-Creating-Datasets){.wiki-anchor}

You can see all the definitions by running

     samweb -e sbnd list-definitions 

Hopefully (It has been done yet) you should see a list of the Monte
Carlo samples that have been written to tape. Monte Carlo samples will
be named with the following scheme:
production\_\[production.type\]\_\[production.name\]\_\[file\_type\]\_\[project.name\]\_\[project.stage\].
The production name will be the Monte Carlo production name. You can
find details of the [Monte Carlo
Website](https://sbnd-data.fnal.gov){.external} (Remember to be
connected via
[VPN](https://cdcvs.fnal.gov/redmine/projects/sbndcode/wiki/VPN){.external}\"
to use it). You can create your own definitions and delete existing
ones. You can run samweb help to see the list of options.

[]{#Creating-a-definition}

### Creating a definition[¶](#Creating-a-definition){.wiki-anchor}

If the dataset you require does not exist yet you can make it. To create
a definition you use:

    samweb create-definition <name> "meta-data parameter value" 
    e.g. samweb create-definition production_pre-production_0.5_mc_prodsingle_dualmu_3GeV_fixposcontained_openingangle1.0degree_reco "file_type mc and sbnd_project.name prodsingle_dualmu_3GeV_fixposcontained_openingangle1.0degree and production.name 0.5 and sbnd_project.stage reco and production.type pre-production " 

There is a whole bunch of meta-data parameters to choose from. You can
add secondary meta-data parameters by using a \"and\" like in the
example above.

[]{#Meta-Data}

Meta-Data[¶](#Meta-Data){.wiki-anchor}
--------------------------------------

You look at the meta-data associated with file by using the following
command. You can use this information to create definitions:

     samweb -e sbnd get-metadata <file-name>

You will get a response which will look something like this:

![](/redmine/attachments/download/46765/metadata.png)

You can also search for files with similar meta-data using:

    sameweb list-files -e sbnd "metadata-parameter = value" 
    e.g. samweb list-files -e sbnd "defname = production_pre-production_0.5_mc_prodsingle_dualmu_3GeV_fixposcontained_openingangle1.0degree_reco" 

[]{#Prestage-files}

Prestage files[¶](#Prestage-files){.wiki-anchor}
------------------------------------------------

This is **IMPORTANT**. We need to prestage files before we work on
anything stored on tape. Files NOT located in /pnfs/uboone/persistent or
/pnfs/uboone/scratch are in areas that are taped-backed storage,
Enstore. And while the files are permanently stored on tape, in order to
access those files, they must be staged to disk within dCache in order
to be processed. For a file to be staged to tape, the system must wait
for a tape drive to become available and for the file to be located on
that tape. This process can take from minutes up to many hours (20+
hours depending on Enstore load) This means that in order to process a
file, you are strongly encouraged to stage the file well ahead of time
so that reading of the file will be prompt and not cause delay. (Trying
to interactively read a file while that is not staged from tape will
cause the interactive session to hang waiting for access. Again, this
can be hours.) In order to prestage a dataset you should issues the
following commands:

     samweb prestage-dataset -e sbnd --defname=<your_dataset_name_here> 

If you want to only stage a specific amount you can add:\--max-files=n.

[]{#Would-you-like-a-test-file}

Would you like a test file?[¶](#Would-you-like-a-test-file){.wiki-anchor}
-------------------------------------------------------------------------

Sometimes you just want to copy one file from SAM to a local disk for
testing. This can be done simply using command ifdh\_fetch. The command:

    ifdh_fetch <file> 

will copy the specified file from SAM to your current directory. Note in
the above command \<file\> is just the name of a file in SAM, not a
path. For the above command to work, the specified file must have one or
more locations stored in the SAM database. You can also Run SAM commands
through it in order to copy down multiple files e.g:\

    ifdh_fetch -e sbnd --dims "file_name like sbnd_r%.root" 
    ifdh_fetch -e sbnd --dims "file_name like sbnd_r%.root AND start_time > 02-Jul-2018" 

Make Sure you have setup fife\_utils to use this.

[]{#Running-over-a-dataset-Grid-life}

Running over a dataset. Grid life.[¶](#Running-over-a-dataset-Grid-life){.wiki-anchor}
--------------------------------------------------------------------------------------

Once you have a definition that you want to use and you have prestaged
the files you are ready to run. One way to use the files is via
project.py and send the job to the grid. If you don\'t know what
project.py is look at our [redmine
page](https://cdcvs.fnal.gov/redmine/projects/sbndcode/wiki/Using_projectpy_for_grid_jobs){.external}
to begin with. Now, quite nicely for us project.py does all the heavy
lifting when it comes to using SAM. All we need to do is add a line
telling project.py what definition to use:
\<inputdef\>definition-name\</inputdef\>. Below is an example. It can
also be found on the gpvms at:
/sbnd/app/users/dbarker/samrunjobexample.xml.

![](/redmine/attachments/download/46767/projectpyexample.png)

Usually SAM requires a project (see below) to be made, then files are
accessed from a definition to be analysed. Project.py does this for you
under the hood. Run the file using the usually command:

    project.py --xml samrunjob.xml --submit --clean

[]{#Running-over-a-dataset-Local-life}

Running over a dataset. Local life.[¶](#Running-over-a-dataset-Local-life){.wiki-anchor}
----------------------------------------------------------------------------------------

[]{#A-quick-way-to-process-the-files}

### A quick way to process the files.[¶](#A-quick-way-to-process-the-files){.wiki-anchor}

In order to use the files one needs to create a project. You can see
your projects by running: samweb list-projects \--user=\$USER. This
first method is a quick way to get to create a project from a data set,
list the files associated with the data set and find where they belong
on tape. Firstly remember to prestage the data set. Give a name so that
a project is created as in the process.

    samweb prestage-dataset -e sbnd --defname=<definition name> --max-files <n> --name=<name of the project>

Give a unique project name. It is recommended that you label the project
with a time stamp and your user ID. Then list the files associated to
your project:

     samweb list-files -e sbnd "project_name <name of project> 

\
Then you can find where the files are on tape using:\

     samweb locate-file -e sbnd <file-name> 

\
You can then use LArSoft in the usual way. Remember at the finish the
project\

     samweb stop-project <name of project> 

[]{#Copying-the-files-to-local-scratch}

### Copying the files to local scratch.[¶](#Copying-the-files-to-local-scratch){.wiki-anchor}

This way you can copy the files. This method is straight from the
MicroBooNe \"page\":prjurl=\`samweb start-project \--defname=\$def
\$prjname\`. You can find more details there but I will just go through
it quickly.

-   Start a project, this returns a url.\

        prjurl=`samweb start-project -e sbnd --defname=<definition name> <prjname>`

```{=html}
<!-- -->
```
-   Setup the local scratch disk. You must do this otherwise the files
    are copied to /var/temp. This is a bad thing.\

        export TMPDIR=/sbnd/data/users/$USER/temp
        mkdir -p $TMPDIR

```{=html}
<!-- -->
```
-   Start the consumer process this returns a integer.\

         cpid=`samweb start-process -e sbnd --appfamily=art --appname=lar --appversion=v06_70_01 $prjurl --max-files=n --schemas=root` 

```{=html}
<!-- -->
```
-   Request the next file.\

         fileuri=`samweb get-next-file -e sbnd $prjurl $cpid` 

```{=html}
<!-- -->
```
-   Copy the file into the local scratch folder. I couldn\'t get this to
    work so instead i copied the file (ifdh cp \$fileurl ./)\

         loc=`ifdh fetchInput $fileuri | grep $TMPDIR` 

```{=html}
<!-- -->
```
-   Then you can copy the file and analyse it.\

        cp $loc /where/I/want/it 

```{=html}
<!-- -->
```
-   Release the file.\

         samweb release-file -e sbnd $prjurl $cpid `basename $fileuri` 

```{=html}
<!-- -->
```
-   Stop the consumer process.\

        samweb stop-process  -e sbnd $prjurl $cpid

```{=html}
<!-- -->
```
-   Stop the project.\

        samweb stop-project -e sbnd <prjname>

[]{#Using-art}

### Using art.[¶](#Using-art){.wiki-anchor}
