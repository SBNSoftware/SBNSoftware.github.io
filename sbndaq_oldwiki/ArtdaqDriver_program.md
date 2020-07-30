---
lang: en
title: ArtdaqDriver program
---

[]{#ArtdaqDriver-program}

ArtdaqDriver program[¶](#ArtdaqDriver-program){.wiki-anchor}
============================================================

Simple test-stand driver:\

    artdaqDriver -c <config>

Example:\
\-- Running PMT readout if you have sbndaq in your srcs area looks
like:\

    artdaqDriver -c srcs/sbndaq/dab/artdaqDriver/CAENV1730_driver.fcl

\
(you can make a copy of that fcl file and change it of course)
