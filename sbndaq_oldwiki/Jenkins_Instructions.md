---
lang: en
title: Jenkins Instructions
---

[]{#Jenkins-Instructions}

Jenkins Instructions[¶](#Jenkins-Instructions){.wiki-anchor}
============================================================

These instructions are intended to assist you with adding and
configuring new project builds on the Jenkins build system
(<https://buildmaster.fnal.gov>). If you have not done any work on
Jenkins, then you need to open a service desk ticket and request
privileges to create new and modify existing projects on Jenkins. You
also need a cilogon certificate configured in your browser
(<https://cilogon.org/>). After logging into Jenkins, look for the
sbndaq tab where you can find all sbndaq projects. While the Jenkins
build system is incredibly flexible and can do many tasks, its current
application is very limited, primarily, to running highly customized
build scripts that can be also run from a command line. Hence, when you
click a \"Schedule a Build with parameters\" button on a snbdaq\'s
project line, Jenkins configures several environment variables and runs
one of the sbndaq build scripts, which is downloaded every time from the
project\'s git repository. All environment variables are user-defined,
except for WORKSPACE, and are available to the build script at runtime.
All current sbndaq build scripts are using the following environment
variables WORKSPACE, PRODUCTS, BRANCHTAG, QUAL, BUILDTYPE,
ARTDAQ_VERSION, and PROJECT_SOURCE_GIT_PREFIX, which have
self-describing names. Consider reviewing the source of each build
script for details of their use.

Assuming you have a new project with a build script, which correctly
builds your project, and is templated from one of the build scripts that
is currently used by Jenkins, then you can configure a new Jenkins build
as follows:

1.  Open the <https://buildmaster.fnal.gov/buildmaster/view/sbndaq/>
    link in your browser and authenticate with your cilogon certificate.
2.  Click on the \"New Item\" link in the left panel.
3.  Type a name for your new project and at the bottom type
    \"sbndaq_artdaq_core-build\" into the \"copy from\" field, then
    click on OK.
4.  Change any settings on the page if necessary, e.g. remove or add
    environment variables or build qualifiers in the \"Configuration
    Matrix\" section.
5.  Change the path to your script in the \"Build\" section on the line
    starting with \"curl -o build.sh <https://%22>.
6.  Click on the \"Save\" button.
7.  Build your project by clicking on the \"Build with parameters\" link
    in the left panel. Leave all settings unchanged, and then click on
    the \"Build\" button.
8.  Move your mouse over a blinking ball and click on the tiny arrow
    next to it and select the \"Workspace\" from the pop-up menu.
9.  On the \"Workspace\" page, click on the \"copyBack\" link, which
    opens a directory browser with your build artifacts such as log
    files and \*.tar.bz2. You can view them directly by clicking on the
    view link on the same line or download them locally by clicking on
    the link itself.
10. If necessary update your build script in git and repeat until the
    build works.

Build script example:
<https://redmine.fnal.gov/redmine/projects/sbndaq/repository/artdaq-core/revisions/develop/entry/for-jenkins/build-sbndaq_artdaq_core.sh>
