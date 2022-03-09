---
layout: page
title:  Submitting LArSoft PRs via SBNSoftware
toc: true
---



# Submitting LArSoft PRs via SBNSoftware 

We have forks of all LArSoft repos in SBNSoftware Github organization

Automated updates of the develop branch, but nothing beyond that

Allows coordination on branches for LArSoft, and allows PRs to be submitted from these repos rather than user-specific forks


To add this as a new ‘remote’ (using larsim as example):

* Create development area like usual
* Pull down lar repo: mrb g larsim
* Move to it: cd $MRB_TOP/srcs/larsim
* Add SBNSoftware remote as ‘sbn’: 
git remote add sbn git@github.com:SBNSoftware/larsim.git
git remote add sbn https://github.com/SBNSoftware/larsim.git 
if using tokens


Remember: updates targeted for patch releases and 2022A release, we will want to make based on LArSoft v09_37_01 (or later patches…)
  
git checkout -b feature/<user_name>_<description> LARSOFT_SUITE_v09_37_01


Make changes and commits as usual, but when pushing commits, push to the ‘sbn’ remote:

git push sbn feature/<user_name>_<description>


When ready, can issue the PR to LArSoft pointing to this fork/branch:

But please coordinate that with release managers/conveners, especially if a patch release!!!

