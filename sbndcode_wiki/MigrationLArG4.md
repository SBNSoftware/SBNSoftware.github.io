---
layout: page
title: SBND Migration to the new LArG4
---


SBND Migration to the new LArG4
========================================================================

This page described the code migration to the new, refactored, LArG4.

Up until `sbndcode vxx_xx_xx`, we were running the LegacyLArG4. From `sbndcode vxx_xx_xx` we
migrated to the new, refactorized, LArG4. The Pull Request linked to this migration is
[R#134](https://github.com/SBNSoftware/sbndcode/pull/134).
There are several benefits in using the refactorized larg4, as described in
[docdb 11910](https://sbn-docdb.fnal.gov/cgi-bin/sso/RetrieveFile?docid=11910&filename=SBND.pdf&version=1).

Details of this migration are given on [docdb ???](???).



How Do I Run the LegacyLArG4?
-----------------------------------------------------------------------------

In the standard workflow, replace the following fhicls to run the LegacyLArG4:

`standard_g4_sbnd.fcl` -> `legacy_g4_sbnd.fcl`
`standard_detsim_sbnd.fcl` -> `legacy_detsim_sbnd.fcl`

If you are using a G4 fcl file which is not `standard_g4_sbnd.fcl`, the following replacement
should allow you to run the LegacyLArG4:
`g4_xxx.fcl` -> `legacy_g4_xxx.fcl`


Questions?
-----------------------------------------------------------------------------

Contact [Marco](http://www-tele.fnal.gov/cgi-bin/telephone.script?type=id&string=30269N).


