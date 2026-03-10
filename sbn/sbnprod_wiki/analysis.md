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
2. which runs are used: time frame or d
3. code versions
4. fcls?

---

<div align="center">
  
# <u> Generation 2 Analyses</u>

</div>

> Description of what is different with the Gen 2 analyses

---

## Data (Unblinded)
> Unblinded data is available for use and doesn't require access requests?


### BNB + Light Data
> Anything unique or should be known about BNB+Light? Main neutrino stream...

**Run 1 Analysis Development Sample (Fix + Rolling):**   
**calibntuples:** data_MCP2025C_Fall25-Run1_BNB_Dev_bnblight_v10_14_02_histreco2_sbnd  

**Rolling Sample:**   
> Check this DocDB for samples used for Rolling Sample  
> When should this be used over other samples?

**reco1:** data_MCP2025C_Fall25-Run1_BNB_RollingDev_bnblight_v10_14_02_reco1_sbnd
**caf:** data_MCP2025C_Fall25-Run1_BNB_RollingDev_bnblight_v10_14_02_caf_sbnd
**flatcaf:** data_MCP2025C_Fall25-Run1_BNB_RollingDev_bnblight_v10_14_02_flatcaf_sbnd

**Fixed Dev:**  
> Check this DocDB for samples used in Fixed Development Sample  
> When should this be used over other samples

**reco1:** data_MCP2025C_Fall25-Run1_BNB_FixedDev_bnblight_v10_14_02_reco1_sbnd  
**caf:** data_MCP2025C_Fall25-Run1_BNB_FixedDev_bnblight_v10_14_02_caf_sbnd  
**flatcaf:** data_MCP2025C_Fall25-Run1_BNB_FixedDev_bnblight_v10_14_02_flatcaf_sbnd  

### OffBeam + Light Data   
> This sample should be combined with BNB+Light for cosmic estimation

**Development Sample**  
**calibntuples:** data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_histreco2_sbnd  
**caf:** data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_caf_sbnd  
**flatcaf:** data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_flatcaf_sbnd  



### Zero Bias Data


### OffBeam Zero Bias Data

## MC









---

# 🧬 Generation 2 Analyses

> **Note on Gen 2:** *[Insert description here regarding what distinguishes Gen 2 from previous iterations, such as updated reconstruction algorithms or new calibration constants.]*

---

## 📂 Data (Unblinded)

> [!IMPORTANT]
> **Access Status:** Unblinded data is available for general use. Please verify if your specific analysis requires formal access requests before processing.

### 1. BNB + Light Data
*The primary neutrino stream for SBND physics analysis.*

**Run 1 Analysis Development Sample (Fix + Rolling)**
* **calibntuples:** `data_MCP2025C_Fall25-Run1_BNB_Dev_bnblight_v10_14_02_histreco2_sbnd`

#### **Rolling Sample**
> **Documentation:** Check the relevant DocDB for the specific run list used in the Rolling Sample.
> **Usage:** *[Insert guidance on when this should be used over other samples.]*

| Data Product | Sample Path/Name |
| :--- | :--- |
| **reco1** | `data_MCP2025C_Fall25-Run1_BNB_RollingDev_bnblight_v10_14_02_reco1_sbnd` |
| **caf** | `data_MCP2025C_Fall25-Run1_BNB_RollingDev_bnblight_v10_14_02_caf_sbnd` |
| **flatcaf** | `data_MCP2025C_Fall25-Run1_BNB_RollingDev_bnblight_v10_14_02_flatcaf_sbnd` |

#### **Fixed Dev Sample**
> **Documentation:** Check the relevant DocDB for the specific run list used in the Fixed Development Sample.
> **Usage:** *[Insert guidance on when this should be used over the Rolling sample.]*

| Data Product | Sample Path/Name |
| :--- | :--- |
| **reco1** | `data_MCP2025C_Fall25-Run1_BNB_FixedDev_bnblight_v10_14_02_reco1_sbnd` |
| **caf** | `data_MCP2025C_Fall25-Run1_BNB_FixedDev_bnblight_v10_14_02_caf_sbnd` |
| **flatcaf** | `data_MCP2025C_Fall25-Run1_BNB_FixedDev_bnblight_v10_14_02_flatcaf_sbnd` |

---

### 2. OffBeam + Light Data
> **Integration Note:** This sample is intended to be combined with **BNB+Light** data for accurate cosmic background estimation.

**Development Sample Reference:**
* **calibntuples:** `data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_histreco2_sbnd`
* **caf:** `data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_caf_sbnd`
* **flatcaf:** `data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_flatcaf_sbnd`




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
