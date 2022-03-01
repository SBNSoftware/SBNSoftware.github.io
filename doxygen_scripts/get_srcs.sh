#!/bin/bash

DIR=`pwd`/srcs/

do_git()
{
    echo
    echo $2
    cd $DIR || exit 1
#    [ -d $2 ] || git clone ${1}/${2}.git || exit 1
    if ! [ -d $2 ]
    then
        if [[ $1 == *cdcvs* ]]
        then
            git clone ${1}/${2} || exit 1
        else
            git clone ${1}/${2}.git || exit 1
        fi
    fi
    cd $2
    if [ $2 == lardataalg ]
    then
        git pull $1/${2}.git develop || exit 1
    else
        git pull || exit 1
    fi
    cd $DIR || exit 1
}

mkdir -p $DIR || exit 1
cd $DIR || exit 1

# # redmine sources
# for REPO in nusimdata nutools ifdh-art art messagefacility cetlib fhiclcpp ppfx gallery canvas
# do
#     # ssh version doesn't work under kcron
# #    do_git ssh://p-larreco@cdcvs.fnal.gov/cvs/projects $REPO
#     do_git http://cdcvs.fnal.gov/projects $REPO
# done

# github larsoft sources
for REPO in larsim larreco larcoreobj larcorealg lardataalg lardataobj larsoftobj larwirecell larpandora larg4 larexamples lareventdisplay larcore lardata larevt larana larsoft webevd larutils larbatch larpandoracontent # larrecodnn
do
    do_git git@github.com:LArSoft $REPO
done

# github SBN sources
for REPO in sbnobj sbncode sbndcode icaruscode icarusalg sbndutil sbnanaobj sbnana
do
    do_git git@github.com:SBNSoftware $REPO
done

# do_git https://github.com/GENIE-MC Generator

# do_git https://github.com/WireCell wire-cell-build
