---
layout: page
title: How to get Geant4 standalone working on gpvms
---



How to get Geant4 standalone working on gpvms
==============================================================================================================

Since I just spent a really long time trying to get standalone G4
working on sbndgpvm and found conflicting instructions,\
here is a list of things that I found to be succesful in compiling
example B1. More may follow.

    source /cvmfs/fermilab.opensciencegrid.org/products/larsoft/setup
    setup geant4 v4_10_1_p03d -q e10:prof
    export G4INSTALL=/cvmfs/fermilab.opensciencegrid.org/products/larsoft/geant4/v4_10_1_p03d/source/geant4.10.01.p03
    mkdir /sbnd/app/users/andrzejs/geant4  
    cd /sbnd/app/users/andrzejs/geant4
    cp -r /cvmfs/fermilab.opensciencegrid.org/products/larsoft/geant4/v4_10_1_p03d/source/geant4.10.01.p03/examples/basic/B1 .
    cd B1/
    export G4WORKDIR=`pwd`
    cd ../
    mkdir B1-build
    cd B1-build/
    cmake -DCMAKE_PREFIX_PATH=/cvmfs/fermilab.opensciencegrid.org/products/larsoft/geant4/v4_10_1_p03d/Linux64bit+2.6-2.12-e10-prof/lib64/Geant4-10.1.3/ -DWITH_GEANT4_UIVIS=0   ../B1/
    gmake
