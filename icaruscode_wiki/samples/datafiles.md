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
    * `samweb list-files "run_number=nnnn and data_tier=raw"` reports the "raw" files
      (hot from DAQ and ready to be decoded into a LArSoft format)
    * `samweb list-files "run_number=nnnn and icarus_project.stage=decoder"`
      reports the "decoded" raw files (ready for LArSoft reconstruction or event display)
    * all available metadata to select on can be seen by picking a file and asking `get-metadata`;
      for example: `samweb get-metadata data_dl14_run4811_174_20210209T091842_20210209T135806-stage0-b12a3477-ad55-49e6-8673-152a25892ced.root`
* `samweb locate-file filename`   where filename is a decoded file


### Examples of metadata

A data file after decoding:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              File Name: data_dl14_run4811_174_20210209T091842_20210209T135806-stage0-b12a3477-ad55-49e6-8673-152a25892ced.root
                File Id: 14070183
            Create Date: 2021-02-09T13:58:23+00:00
                   User: icaruspro
              File Size: 2171683037
               Checksum: enstore:1434059387
                         adler32:2c6e027c
                         md5:ddfbe196be4f155683add958aec447e2
         Content Status: good
              File Type: data
            File Format: artroot
                  Group: icarus
              Data Tier: reconstructed
            Application: art decoder v09_14_00
             Process Id: 2824730
            Event Count: 10
            First Event: 155711
             Last Event: 155873
             Start Time: 2021-02-09T13:47:38+00:00
               End Time: 2021-02-09T13:58:04+00:00
            Data Stream: out1
    art.file_format_era: ART_2011a
art.file_format_version: 13
        art.first_event: 155711
         art.last_event: 155873
       art.process_name: stage0
           art.run_type: physics
               fcl.name: stage0_single_icarus.fcl
    icarus_project.name: icarus_decoder_v09_14_00
icarus_project.software: icaruscode
   icarus_project.stage: decoder
 icarus_project.version: v09_14_00
            merge.merge: 0
           merge.merged: 0
        production.name: offline
        production.type: decoder_test
                   Runs: 4811.0001 (physics)
                Parents: data_dl14_run4811_174_20210209T091842.root
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Note the `Parents` item that allows to escalate to the raw data file:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             File Name: data_dl14_run4811_174_20210209T091842.root
               File Id: 14062048
           Create Date: 2021-02-09T09:23:56+00:00
                  User: icaruspro
             File Size: 4177777228
              Checksum: enstore:1684374478
                        adler32:cebf83cf
        Content Status: good
             File Type: data
           File Format: artroot
             Data Tier: raw
           Data Stream: ext
   icarus_project.name: DataXportTesting_03Feb2020
  icarus_project.stage: Run0
icarus_project.version: raw_sbndaq_v0_04_03
       sbn_dm.detector: sbn_fd
       sbn_dm.file_day: 9
     sbn_dm.file_month: 2
      sbn_dm.file_year: 2021
                  Runs: 4811 (physics)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
