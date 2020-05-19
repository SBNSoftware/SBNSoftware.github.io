---
lang: en
title: How it works
---



How it works(#How-it-works)
============================================

The core of the process currently relies on
[project.py](https://cdcvs.fnal.gov/redmine/projects/larbatch/repository/revisions/develop/entry/scripts/project.py){.external}
which is a python script contained in
[larbatch](https://cdcvs.fnal.gov/redmine/projects/larbatch/wiki/User_guide){.external}.\
All samples to be generated are represented by a set of generator-level
fcl files contained in a sbndcode subdirectory:\

    sbndcode/fcl/gen

\
An xml generation script (make\_xml\_MCCVERSION.sh) in
[sbndutil](https://cdcvs.fnal.gov/redmine/projects/sbndutil){.external}
looks for all fcl files in the above directory and makes a project.py
xml file for each fcl file that it finds. The found fcl file is assumed
to be a generator-level fcl file and by default uses the following fcl
files for the downstream stages:\

    g4: standard_g4_sbnd.fcl
    detsim: standard_detsim_sbnd.fcl
    reco: standard_reco_sbnd_basic.fcl
    anatree: standard_anatree_sbnd.fcl

-   ~~Note: Prior to MCP 1.0 the name of standard\_reco\_sbnd.fcl was
    standard\_reco\_sbnd\_basic.fcl.~~
-   Currently standard\_reco\_sbnd.fcl is broken and
    standard\_reco\_sbnd\_basic.fcl is the one maintained.

While the above chain is assumed to be the default, it is possible that
some users may require tweaks or more severe changes to the downstream
stages. For example, an end user may require a particle gun sample with
transverse electron diffusion switched off. There are now alternative
downstream fcl files located in the main fcl directory:\

    sbndcode/fcl

\
which run downstream packages (e.g. largeant) with different parameters
or filters tacked on the end of the fcl path.

These alternative fcl files are linked to the MCC projects by the
generator-level fcl files described above. In a nut shell, there is a
schema utilised in some of the generator-level fcl files which the xml
generation script understands. The schema lists the wanted alternative
fcl files (can list as many alternative as you like in one generator fcl
file) and creates alternative project.py project xml files to be used in
the MCC.
