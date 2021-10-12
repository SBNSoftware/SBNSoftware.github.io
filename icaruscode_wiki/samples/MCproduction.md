---
layout: page
title: ICARUS simulation samples
description: ICARUS simulation samples
toc: true

---

List of simulated samples
--------------------------

ICARUS simulation samples are produced under the umbrella of the SBN production team.
The instructions to request a new sample can be found in the [SBN production wiki](../../sbn/sbnprod_wiki/Wiki.md#production-sample-requests).

Samples are currently tracked on a database in the form of a [spreadsheet][MCDB].
Samples produced October 2020 and earlier were tracked in [ICARUS wiki](https://cdcvs.fnal.gov/redmine/projects/icarus-production/wiki/Status_of_MC_Production).

The SBN Analysis Infrastructure group is attempting to keep a list of
["standard" configurations used in the SBN production campaigns](https://sbnsoftware.github.io/AnalysisInfrastructure/WorkflowManagement/workflow_icarus.html)
(which may also include ICARUS-specific samples).


How to access samples
----------------------

Some instructions on how to access sample files are provided in an [older ICARUS wiki page](https://cdcvs.fnal.gov/redmine/projects/sbn-analysis-group/wiki/How_to_access_ICARUS_sample):
<https://cdcvs.fnal.gov/redmine/projects/sbn-analysis-group/wiki/How_to_access_ICARUS_sample>

The following instructions aim to quickly go through the most frequently needed steps.

### List the files currently under a SAM definition #################################

The complete list of files can be retrieved with `list-definition-files`, e.g. :
```
samweb list-definition-files MCC1_poms_icarus_prod_electron_pi_plus_v08_45_00_reco2
```
(option `--summary` also prints file and event counts).

> **Note**: SAM definitions are just queries, and their resulting file list may change as  the content of SAM database changes
> (for example, a query requiring all data runs from `1000` to `100000` will match more data as new runs are registered in SAM).
> In such cases to guarantee future reproducibility a _snapshot_ needs to be used.

To get a single file, a different query can be used:
```
samweb list-files "defname:MCC1_poms_icarus_prod_electron_pi_plus_v08_45_00_reco2 with limit 1" 
```

### Find the location of a specific file ###########################################

See [How to pre-stage files and check if you need to do it](https://cdcvs.fnal.gov/redmine/projects/icarus-production/wiki/How_to_pre-stage_files_and_check_if_you_need_to_do_it) in the old ICARUS wiki.

In short: `samweb locate-file gen-d8e05fb1-f692-4215-97e0-8a87654b363e_20200315T232456_g4_20200316T104825_detsim_20200318T124838_reco1_20200319T114225_reco2.root`.

#### Access a file via XRootD

```
samweb get-file-access-url --schema=root gen-d8e05fb1-f692-4215-97e0-8a87654b363e_20200315T232456_g4_20200316T104825_detsim_20200318T124838_reco1_20200319T114225_reco2.root
```
returns all URL in XRootD format. One still needs to verify whether they are actually available, as described above.


### Process the files in a SAM definition with _art_ ###############################

When submitting jobs with `project.py` (from `larbatch`),
you should then include this dataset into the `<inputdef>` field in the XML configuration file:
```
<inputdef>MCC1_poms_icarus_prod_electron_pi_plus_v08_45_00_reco2</inputdef>
```
(this replaces the other `<inputXxx>` elements).
Pay attention to prestaging! (see [below](#copy-all-files-in-a-sam-definition-from-tape)).


#### Copy all files in a SAM definition from tape

The only copy of the data file might be on tape (Enstore).
The action of copying all of the needed files from tape to disk (dCache) is called "prestaging".
Instructions on how to do that are in the [old ICARUS wiki](https://cdcvs.fnal.gov/redmine/projects/icarus-production/wiki/How_to_pre-stage_files_and_check_if_you_need_to_do_it)
at https://cdcvs.fnal.gov/redmine/projects/icarus-production/wiki/How_to_pre-stage_files_and_check_if_you_need_to_do_it.



### SAM query setup ################################################################

Provided that a working ICARUS setup is available, the only steps required to unleash SAM power is:
    
    source /cvmfs/icarus.opensciencegrid.org/products/icarus/setup_icarus.sh
    setup sam_web_client
    
plus a valid [grid certificate proxy](../Get_a_certificate_proxy.md).


### Usage directions for `samweb` command

The command `samweb` will list most (all?) supported "subcommands".
Each subcommand accepts the `--help` option to give specific guidance; for example:
```
samweb list-definition-files --help
```



[MCDB]: https://docs.google.com/spreadsheets/d/17mFPGsP7gw4GRLSCwIL15QrtUnLVri_2k2Wjzhd6Ork
