#!/bin/bash

export LARDIR=lardev-"$1"
echo $LARDIR

source /grid/fermiapp/products/sbnd/setup_sbnd.sh
cd /sbnd/app/users/ascarff/releases/
mkdir $LARDIR
cd $LARDIR
export MRB_PROJECT=larsoft
mrb newDev -v $1 -q e19:prof
#mrb newDev -v v08_13_00 -q e19:prof
source localProducts*/setup

cd $MRB_SOURCE
mrb g https://github.com/SBNSoftware/sbndutil
mrb g https://github.com/SBNSoftware/sbndcode

cd sbndcode
git flow init
git flow release start $1
cd ../sbndutil
git flow init
git flow release start $1
