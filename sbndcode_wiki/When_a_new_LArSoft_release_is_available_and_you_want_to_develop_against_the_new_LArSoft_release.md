---
lang: en
title: When a new LArSoft release is available and you want to develop
  against the new LArSoft release
---

{#When-a-new-LArSoft-release-is-available-and-you-want-to-develop-against-the-new-LArSoft-release}

When a new LArSoft release is available and you want to develop against the new LArSoft release(#When-a-new-LArSoft-release-is-available-and-you-want-to-develop-against-the-new-LArSoft-release)
==================================================================================================================================================================================================================

(Stolen from dunetpc wiki)

-   Relogin into a sbndgpvm node, do the following\

        source /grid/fermiapp/products/sbnd/setup_sbnd.sh
        setup larsoft vxx_yy_zz -q e14:prof #set up the latest larsoft release
        cd larsoft_mydev
        mrb newDev -p #this creates a new localProducts_XXXX directory using the new larsoft release and the existing srcs directory
        source localProducts_XXXX/setup  #make sure to use the new localProducts directory, it's better to delete the old directory
        cd srcs/sbndcode
        git checkout develop
        git pull


-   If you are working on a feature branch (ignore if you are working in
    develop branch):\

        cd srcs/sbndcode
        git checkout develop
        git pull
        git checkout feature/<my feature branch>
        git merge develop

-   Update all other repositories if they exist in your srcs directory
    (e.g. larreco)

-   Make a clean build\

        cd $MRB_BUILDDIR
        mrb z
        mrbsetenv
        mrb i -j4 #rebuild
