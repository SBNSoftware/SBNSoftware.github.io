---
layout: page
title: Working on a feature branch (to easily share code)
---



Working on a feature branch (to easily share code)
======================================================================================================================

-   **Table of contents**
-   [Working on a feature branch (to easily share
    code)]

(Adapted from the 35 ton tutorials by Karl Warburton)

[Setup your
directory](How_to_setup_your_directory_and_launch_your_first_job.html).

Change to desired repository (e.g sbndcode).\

    cd $MRB_SOURCE/sbndcode 

Make sure you have the latest develop branch.

    git checkout develop
    git pull 

Make a new feature branch.

    git flow feature start < BranchName > 


This will give you a branch called \"feature/BranchName\". You may need to run the command "git flow init" before this. If you do set the first option as "master", the second as "develop" (if these are not already set) and leave the rest as defaults.

Do some coding.

Check which files you have created/edited.\

    git status #Lists the changed/edited modules#
    git diff #Line by line description of what has been changed# 

Push to your feature branch if it\'s not ready for publishing (store it
for later).\

    git add file_name.cc #Do this for all the files you want to add#
    git commit -m "about the commit" 

Publish the feature branch.\

    git flow feature publish < BranchName > 

When the project is finished you can now either delete the feature
branch or merge it into develop.

-   Delete feature branch locally.\

        git branch -d feature/< BranchName > 

-   Delete feature branch in origin.\

        git branch -dr origin/feature/< BranchName > 

-   Merge into develop.\

        git flow feature finish < BranchName > 

    \
    Note that this merges the feature branch into your *local* `develop`
    branch, deletes the *local* feature branch, but it does **not** push
    the changes into the *remote* `develop` branch, nor it deletes the
    *remote* feature branch.\
    If merged you might want to push to develop.\

        git push origin develop 
