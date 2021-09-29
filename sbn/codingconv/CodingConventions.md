---
title:       SBN analysis code conventions
description: Code conventions as guidelines for SBN authors and reviewers.
breaks:      false
layout:      page_TOC_1_3
toc:         true
---


#   Purpose & Scope ##################################################################


This set of guidelines aims to improve the readability and maintainability of
the code bases.

This policy is intended to cover all code in the following SBN coder repositories:
`sbnobj`, `sbncode`, `sbnana`.

It is expected that authors attempt to strictly adhere to it,
as defined in the "Definitions" paragraph.
Policy rules may be enforced by reviewers during code review, and by the
release managers.



#   Definitions   ##############################################################

This policy uses coded words to define the priority of the requirements:

|                 | Name                                           | Meaning  |
| --------------- | ---------------------------------------------- | -------- |
| **+++**/**---** | **[+++]** Required <br/> **[−−−]** Forbidden   | Reviewers are asked to reject code that does not satisfy this requirement.     |
| **++**/**--**   | **[++]** Encouraged <br/> **[−−]** Discouraged | Reviewers may reject code that does not satisfy this recommendation. |
| **+**/**-**     | **[+]**/**[−]** Suggested                      | The author should consider implementing the suggestion; a reviewer should not reject code where the author has deliberated not to follow the suggestion.|

> While this document is in draft, guidelines that have not been
> discussed or have been questioned may have the priority mark written
> in italic font (e.g. "it is _**required**_ that ..." or "**_[+++]_**").



#   Compliance and procedures   ################################################

Code is considered compliant with this policy if _all_ the following apply:

1. all _requirements_ are satisfied;
2. if the code is subject to code review, reviewers have considered all the
   recommendations and judged, to their discretion, that a sufficient adherence
   is in place.

Arbitration by a convener can be requested if no agreement can be met between author(s) and
reviewers.

> As the conventions and guidelines in this document are going to be many,
authors are not expected to know them (or even to have read them) all.
They are instead expected to consider them when pointed to them, and they are
expected to change their code to make it compliant when requested to.


#   Editing   ##################################################################

The editors of this document are at this time
[Gianluca Petrillo](mailto:petrillo@slac.stanford.edu) and
[Fernanda Psihas](mailto:psihas@fnal.gov).

This document is expected to evolve as new insights, opinions or practices
prevail. To propose an addition or a semantic change, please write to the main
editors of the document so that the topic gets a chance to be discussed before
integration into the guidelines.
You can also add a pull request to the GIT repository of the wiki or,
in case of cosmetic changes, edit the wiki directly.

The examples in the original version of these guidelines are artificial.
An aspect especially needed at this stage is examples of good and bad practices
_from SBN code base_. Everybody, and **especially the code reviewers**,
are invited to propose examples they encounter while reading others' code or
while applying one of the guidelines in this document.

Each main section is denoted by a mnemonic code (e.g. "[NS]" for the subsection
"Source files" under "Naming"). Each guideline has a mnemonic code made of the
mnemonic code of its section and a number of two or three digits.
Each subsection has some room for a few additions, and once a mnemonic code is
assigned to a guideline, it is never changed nor reused.
Removed guidelines will be marked as such.



#   Conventions   ##############################################################

The conventions are articulated in the following sections:

* [Naming](CodingConventionsList.md#naming-conventions) ([_with explanations_](CodingConventionsExplained.md#naming-conventions) )
* [Coding](CodingConventionsList.md#coding) ([_with explanations_](CodingConventionsExplained.md#coding))
* [Documentation](CodingConventionsList.md#documentation) ([_with explanations_](CodingConventionsExplained.md#documentation))
* [Linking and building](CodingConventionsList.md#linking-and-building) ([_with explanations_](CodingConventionsExplained.md#linking-and-building))

