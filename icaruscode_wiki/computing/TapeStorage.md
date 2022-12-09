---
layout: page
title: Storing data files on tape
description: Instructions on how to store data files on Fermilab Enstore.
# menubar: icaruscode_menu
# toc_title: Contents
---

Storing data files on tape
===========================

To store data files on tape, the data must be associated to a SAM definition so that they can be tracked down.
Prerequisites are to have the data contained in a single directory (no subdirectory structure), and a definition name (`<defname>` below) in mind.
If the data is made of small files, it may be a good idea to compact it into a single or a few (possibly compressed) tarball file(s).
Storage of data files is a two-step procedure.

1.  Preliminary step: setup (`sam4users`):
    ```
    setup fife_utils
    ```
2.  Register the files into the SAM database and associate them to a SAM definition.
    To create a dataset (a SAM "definition") from all the files in the directory `/path/to/data/dir`:
    ```
    sam_add_dataset -e icarus -n <defname> -d /path/to/data/dir
    ```
    SAM likes unique file names, so it will append some string at the end of the file names.
    If that is not desired, the option `--no-rename` will tell SAM to refrain from renaming (but I don't know what happens in case of file name collisions):
    ```
    sam_add_dataset -e icarus -n <defname> -d /path/to/data/dir --no-rename
    ```
    Notes:
     * It is suggested that the SAM definition starts with `icarus` (in case of merge with `sbn`...).
     * After creating the SAM definition, it is recommended that a description be added to it to explain the content and purpose:
       ```
       samweb modify-definition -e icarus --defname=<defname> --description="ICARUS PMT laser calibration data collected in January 2022"
       ```
3.  archive the dataset on tape:
    ```
    sam_archive_dataset -n <defname>
    ```
