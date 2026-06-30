---
layout: page
title: SBN Production Sample Descriptions
subtitle: Descriptions of SBN Production Samples
description: Wiki for the SBN Analyzers using Production Samples
hero_height: is-medium
toc: false
toc_title: SBN Production Sample Description
---

SBN Production Available Samples Descriptions
==========================================

---

## SBND Analysis Generations

| Generation | Link |
| :--- | :--- |
| **Generation 2** | [View Gen 2 →](gen2_analyses) |
| **Generation 1** | [View Gen 1 →](gen1_analyses) |

---


## ICARUS Analysis

Currently links to an edit of the samples webpage containing only ICARUS files, but ICARUS Collaborators can update to have similar layout to SBND: [ICARUS Samples](icarus_sample)


How to access the samples
--------------------------

MC sample datasets are declared to the SBN SAM instance which is acessible to both SBND and ICARUS collaborators. All samweb commands should specify the SBN instance with `samweb -e sbnd` 

### Definition commands
- checking definition files: `samweb -e sbnd list-definition-files {definition}`
- checking number of files and events (for samples with full metadata): `samweb -e sbnd list-definition-files {definition} --summary`

### File commands
- checking metadata: `samweb -e sbnd get-metadata {filename}` (fcl files used are listed in metadata) 
- file location: `samweb -e sbnd locate-file {filename}`

### Finding the file that contains a specific run/subrun/event (SBND only)
#### **MC samples**
Each SBND MC file has a unique subrun, so one just nedd the run/subrun to identify the file:
- search: `samweb -e sbnd list-files "defname: {dataset name} and run_number run#.subrun#"`


## Related Pages
- [Samples Page](sample_old)
