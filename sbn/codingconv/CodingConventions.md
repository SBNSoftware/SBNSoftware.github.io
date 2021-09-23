---
title:       SBN analysis code conventions
description: Summary of code conventions as guidelines for SBN authors and reviewers.
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

|         | Name                                         | Meaning  |
| ------- | -------------------------------------------- | -------- |
| \*\*\*  | **[R]** Required <br/> **[F]** Forbidden     | Reviewers are asked to reject code that does not satisfy this requirement.     |
| \*\*    | **[E]** Encouraged <br/> **[D]** Discouraged | Reviewers may reject code that does not satisfy this recommendation. |
| \*      | **[S]** Suggested                            | The author should consider implementing the suggestion; a reviewer should not reject code where the author has deliberated not to follow the suggestion.|

> While this document is in draft, guidelines that have not been
> discussed or have been questioned have the priority mark written
> in italic font (e.g. "it is _**required**_ that ..." or "**_[R]_**").



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


#   Conventions   ##############################################################

The conventions are articulated in the following sections:

* [Naming](CodingConventionsList.md#Naming-conventions)
* [Coding](CodingConventionsList.md#Coding)
* [Documentation](CodingConventionsList.md#Documentation)
* [Linking and building](CodingConventionsList.md#Linking-and-building)


