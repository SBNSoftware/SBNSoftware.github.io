---
layout: page
title: How to find data files
toc: true
---

How to find data files
=======================

Find data files in [this spreadsheet](https://docs.google.com/spreadsheets/d/1nkMDRcguwIuaHFUH6sFDLd3UcQVNrCpe8pLdELHsuAk/edit).

Note that this is a protected link, you will need to request access to view the list of runs.


From the run number
--------------------

You can use `samweb` (`setup sam_web_client` on a GPVM) to locate decode files available on PNFS disks:
* `samweb list-files "run_number=nnnn"`   where `nnnn` is the run number being searched for
* `samweb locate-file filename`   where filename is a decoded file
