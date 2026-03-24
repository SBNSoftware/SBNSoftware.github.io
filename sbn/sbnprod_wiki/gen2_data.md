---
layout: page
title: Generation 2 — Data (Unblinded)
subtitle: SBN Production — Gen 2 Data Samples
description: Gen 2 unblinded data samples for SBN analyzers
hero_height: is-medium
toc: true
toc_title: Gen 2 Data
---

## Data (Unblinded)

> Unblinded data is available for use and doesn't require access requests.

---

## BNB + Light Data

*The primary neutrino stream for SBND physics analysis.*

### Run 1 Analysis Development Sample (Fix + Rolling)

* **calibntuples:** `data_MCP2025C_Fall25-Run1_BNB_Dev_bnblight_v10_14_02_histreco2_sbnd`

### Rolling Sample

> **Documentation:** Check the relevant DocDB for the specific run list used in the Rolling Sample.  
> **Usage:** *[Insert guidance on when this should be used over other samples.]*

| Stage | Code Version | Sample Definition |
| :--- | :--- | :--- |
| **reco1** | v10_14_02 | `data_MCP2025C_Fall25-Run1_BNB_RollingDev_bnblight_v10_14_02_reco1_sbnd` |
| **caf** | v10_14_02 | `data_MCP2025C_Fall25-Run1_BNB_RollingDev_bnblight_v10_14_02_caf_sbnd` |
| **flatcaf** | v10_14_02 | `data_MCP2025C_Fall25-Run1_BNB_RollingDev_bnblight_v10_14_02_flatcaf_sbnd` |

### Fixed Dev Sample

> **Documentation:** Check the relevant DocDB for the specific run list used in the Fixed Development Sample.  
> **Usage:** *[Insert guidance on when this should be used over the Rolling sample.]*

| Stage | Code Version | Sample Definition |
| :--- | :--- | :--- |
| **reco1** | v10_14_02 | `data_MCP2025C_Fall25-Run1_BNB_FixedDev_bnblight_v10_14_02_reco1_sbnd` |
| **caf** | v10_14_02 | `data_MCP2025C_Fall25-Run1_BNB_FixedDev_bnblight_v10_14_02_caf_sbnd` |
| **flatcaf** | v10_14_02 | `data_MCP2025C_Fall25-Run1_BNB_FixedDev_bnblight_v10_14_02_flatcaf_sbnd` |

---

## OffBeam + Light Data

> **Integration Note:** This sample is intended to be combined with **BNB+Light** data for accurate cosmic background estimation.

### Development Sample Reference

| Stage | Code Version | Sample Definition |
| :--- | :--- | :--- |
| **calibntuples** | v10_14_02 | `data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_histreco2_sbnd` |
| **caf** | v10_14_02 | `data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_caf_sbnd` |
| **flatcaf** | v10_14_02 | `data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_flatcaf_sbnd` |

---

## Related Pages
- [← Back to Gen 2 Analyses](gen2_analyses)
- [← Back to Sample Descriptions](sample_descriptions)
- [Samples Page](sample)
