#!/bin/bash

whoami
hostname
date

cd `dirname $0` || exit 1
pwd

git pull || exit 1 # in case the scripting itself needs to be updated
./get_srcs.sh || exit 1
./run_doxygen.sh || exit 1
./update_git.sh || exit 1

date

echo DONE!
