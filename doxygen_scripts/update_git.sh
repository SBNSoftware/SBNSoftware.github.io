#!/bin/bash

git checkout doxygen || exit 1

git branch # informational

# Make sure we are on the right branch
[ `git symbolic-ref --short HEAD` == doxygen ] || exit 1

git add -A ../doxygen || exit 1

git commit -m 'Automated documentation update by doxygen_scripts/update_git.sh run by '$USER' on '$HOSTNAME || exit 1

git gc || exit 1

git push || exit 1

git checkout master || exit 1

git branch # informational

# Make sure we are on the right branch
[ `git symbolic-ref --short HEAD` == master ] || exit 1

git pull || exit 1

git gc || exit 1

git merge doxygen -m 'Automated merge of doxygen branch by doxygen_scripts/update_git.sh run by '$USER' on '$HOSTNAME || exit 1

git push || exit 1

git checkout doxygen || exit 1
