#!/bin/bash

# Try and make sure we don't create a big git mess, by starting in the right
# place and being up to date
#
# Make sure we are on the right branch
[ `git symbolic-ref --short HEAD` == doxygen ] || exit 1
git pull || exit 1


rm -r ../doxygen || exit 1
mkdir ../doxygen || exit 1
# Don't connect a terminal so latex can't ask any questions
time doxygen Doxyfile < /dev/null || exit 1
