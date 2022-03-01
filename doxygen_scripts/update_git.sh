#!/bin/bash

# Make sure we are on the right branch
[ `git symbolic-ref --short HEAD` == doxygen ] || exit 1

git add -A ../doxygen || exit 1

git commit -m 'Automated documentation update by doxygen_scripts/update_git.sh run by '$USER' on '$HOSTNAME || exit 1
