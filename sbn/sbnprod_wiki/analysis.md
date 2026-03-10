---
layout: page
title: SBN Production Sample Descriptions 
subtitle: Descriptions of SBN Production Samples
description: Wiki for the SBN Analyzers using Production Samples 
hero_height: is-medium
# menubar: sbnprod_menu
toc: true
toc_title: SBN Production Sample Description
---



SBN Production Available Samples Descriptions-
==========================================

> Below we will include useful information for analyzers to understand what goes into each sample, as listed from the [Samples Page](https://sbnsoftware.github.io/sbn/sbnprod_wiki/sample). 

Here is what is listed for each sample: 
1. short description of sample, what it's used for, how to use it, general notes on usage
2. which runs are used: time frame or cuts to make definition
3. code versions
4. fcls?



#### What is in each sample:

calibntuples:  
reco1:   
caf:   
flatcaf:  



---

<div align="center">
  
# Generation 2 Analyses

</div>

> **Note on Gen 2:** *[Insert description here regarding what distinguishes Gen 2 from previous iterations, such as updated reconstruction algorithms or new calibration constants.]*

---

##  Data (Unblinded)

>  Unblinded data is available for use and doesn't require access requests?


### 1. BNB + Light Data
*The primary neutrino stream for SBND physics analysis.*

#### **Run 1 Analysis Development Sample (Fix + Rolling)**
* **calibntuples:** `data_MCP2025C_Fall25-Run1_BNB_Dev_bnblight_v10_14_02_histreco2_sbnd`

#### **Rolling Sample**
> **Documentation:** Check the relevant DocDB for the specific run list used in the Rolling Sample.  
> **Usage:** *[Insert guidance on when this should be used over other samples.]*

| Stage | Code Version | Sample Definition |
| :--- | :--- | :--- |
| **reco1** | v10_14_02 |`data_MCP2025C_Fall25-Run1_BNB_RollingDev_bnblight_v10_14_02_reco1_sbnd` |
| **caf** | v10_14_02 | `data_MCP2025C_Fall25-Run1_BNB_RollingDev_bnblight_v10_14_02_caf_sbnd` |
| **flatcaf** | v10_14_02 | `data_MCP2025C_Fall25-Run1_BNB_RollingDev_bnblight_v10_14_02_flatcaf_sbnd` |

#### **Fixed Dev Sample**
> **Documentation:** Check the relevant DocDB for the specific run list used in the Fixed Development Sample.  
> **Usage:** *[Insert guidance on when this should be used over the Rolling sample.]*

| Stage | Code Version | Sample Definition |
| :--- | :--- | :--- |
| **reco1** | v10_14_02 | `data_MCP2025C_Fall25-Run1_BNB_FixedDev_bnblight_v10_14_02_reco1_sbnd` |
| **caf** | v10_14_02 | `data_MCP2025C_Fall25-Run1_BNB_FixedDev_bnblight_v10_14_02_caf_sbnd` |
| **flatcaf** | v10_14_02 | `data_MCP2025C_Fall25-Run1_BNB_FixedDev_bnblight_v10_14_02_flatcaf_sbnd` |

---

### 2. OffBeam + Light Data
> **Integration Note:** This sample is intended to be combined with **BNB+Light** data for accurate cosmic background estimation.

#### **Development Sample Reference:**

| Stage | Code Version | Sample Definition |
| :--- | :--- | :--- |
| **calibntuples** | v10_14_02 | `data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_histreco2_sbnd` |
| **caf** | v10_14_02 | `data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_caf_sbnd` |
| **flatcaf** | v10_14_02 | `data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_flatcaf_sbnd` |



# Generation 1 Analyses
What is included in Gen 1 analyses?



## Data

### BNB + Light Data

Here is all the information for BNB + Light

### Zero Bias Data

### OffBeam + Light Data

### OffBeam Zero Bias Data

## MC


## Related Pages

- [Samples Page](sample)
