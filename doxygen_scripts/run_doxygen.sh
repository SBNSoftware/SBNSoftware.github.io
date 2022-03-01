#!/bin/bash

rm -r ../doxygen || exit 1
mkdir ../doxygen || exit 1
# Don't connect a terminal so latex can't ask any questions
time doxygen Doxyfile < /dev/null || exit 1
