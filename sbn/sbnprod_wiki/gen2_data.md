---
layout: page
title: Generation 2 — Data 
subtitle: SBN Production — Gen 2 Data Samples
description: Gen 2 data samples for SBN analyzers
hero_height: is-medium
toc: false
toc_title: Gen 2 Data
---

<h1 align="center">Data (Unblinded)</h1>

> Unblinded data is available for use and doesn't require access requests.

---

<details>
<summary><h2 style="display:inline"> BNB + Light Data</h2></summary>
<br>

<p><em>The primary neutrino stream for SBND physics analysis.</em></p>

<h3>Run 1 Analysis Development Sample (Fix + Rolling)</h3>

<ul>
  <li><strong>calibntuples:</strong> <code>data_MCP2025C_Fall25-Run1_BNB_Dev_bnblight_v10_14_02_histreco2_sbnd</code></li>
</ul>

<h4>Run 1 Rolling Analysis Development Sample</h4>

<blockquote>
<strong>Documentation:</strong> Check DocDB 44638 for the specific run list used in the Rolling Sample.<br>
<strong>Usage:</strong> <em>Rolling Dev sample is a good place to check the time-dependent signatures present in analyses.</em>
</blockquote>

<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_Fall25-Run1_BNB_RollingDev_bnblight_v10_14_02_reco1_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_14_02</td><td><code>data_SBND2026A_SBND2026A_gen2_run1_BNBLight_Data_RollingDev_Respin_v10_14_02_04_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_14_02</td><td><code>data_SBND2026A_SBND2026A_gen2_run1_BNBLight_Data_RollingDev_Respin_v10_14_02_04_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>

<h4>Run 1 Fixed Analysis Development Sample</h4>

<blockquote>
<strong>Documentation:</strong> Check DocDB 44638 for the specific run list used in the Fixed Development Sample.<br>
<strong>Usage:</strong> <em>The fixed sample is a good place to start an analysis because its data is taken over a short time period and shouldn't contain time-dependent signatures.</em>
</blockquote>

<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_Fall25-Run1_BNB_FixedDev_bnblight_v10_14_02_reco1_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_14_02</td><td><code>data_SBND2026A_SBND2026A_gen2_run1_BNBLight_Data_FixedDev_Respin_v10_14_02_04_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_14_02</td><td><code>data_SBND2026A_SBND2026A_gen2_run1_BNBLight_Data_FixedDev_Respin_v10_14_02_04_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>





<h3>Fall Validation II - Run 1</h3>

<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_FallValidationII_RollingDev_bnblight_v10_14_00_reco1_sbnd</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_FallValidationII_RollingDev_bnblight_v10_14_00_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_FallValidationII_RollingDev_bnblight_v10_14_00_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_FallValidationII_RollingDev_bnblight_v10_14_00_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>


</details>

---

<details>
<summary><h2 style="display:inline"> OffBeam + Light Data</h2></summary>
<br>

<blockquote>
<strong>Integration Note:</strong> This sample is intended to be combined with <strong>BNB+Light</strong> data for accurate cosmic background estimation, or can be used for other background studies. 
</blockquote>

<h3>Development Sample</h3>

<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>calibntuples</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_Fall25-Run1_InTime_offbeamlight_v10_14_02_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>


<h3>Full Run 1 Sample</h3>

<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>flatcaf</strong></td><td>v10_14_02_02</td><td><code>data_SBND2026A_gen2_InTime-Run1_v10_14_02_02_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>


<h3>Fall Validation II - Run 1</h3>

<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_FallValidationII_RollingDev_offbeamlight_v10_14_00_reco1_sbnd</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_FallValidationII_RollingDev_offbeamlight_v10_14_00_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_FallValidationII_RollingDev_offbeamlight_v10_14_00_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_FallValidationII_RollingDev_offbeamlight_v10_14_00_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>








</details>

---

<details>
<summary><h2 style="display:inline"> Specialty Data Samples</h2></summary>
<br>
<h3>Run 2 Crossing Muon Study</h3>
<blockquote>
For calibration purposes
</blockquote>

<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_14_02_04</td><td><code>data_SBND2026A_gen2_crossingmu-Run2_v10_14_02_04_reco1_sbnd</code></td></tr>
    <tr><td><strong>calibntuple</strong></td><td>v10_14_02_04</td><td><code>data_SBND2026A_gen2_crossingmu-Run2_v10_14_02_04_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_14_02_04</td><td><code>data_SBND2026A_gen2_crossingmu-Run2_v10_14_02_04_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_14_02_04</td><td><code>data_SBND2026A_gen2_crossingmu-Run2_v10_14_02_04_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>








<h3>Narrow Bunch Study</h3>

<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>raw</strong></td><td>v10_14_02_02</td><td><code>SBND_DATA_Run2_NarrowBunch_Raw</code></td></tr>
    <tr><td><strong>reco1</strong></td><td>v10_14_02_02</td><td><code>data_SBND2026A_SBND2026A_gen2_run2_BNBLight_Data_v10_14_02_02_reco1_sbnd</code></td></tr>
    <tr><td><strong>larcv</strong></td><td>v10_14_02_02</td><td><code>data_SBND2026A_SBND2026A_gen2_run2_BNBLight_Data_v10_14_02_02_larcvreco1_sbnd</code></td></tr>
    <tr><td><strong>calibntuple</strong></td><td>v10_14_02_02</td><td><code>data_SBND2026A_SBND2026A_gen2_run2_BNBLight_Data_v10_14_02_02_histreco2_sbnd</code></td></tr>
  </tbody>
</table>


</details>


---

<h1 align="center">Data (Blinded)</h1>

> Blinded data requires access requests. For more information, consult your working group conveners.

---

<details>
<summary><h2 style="display:inline"> BNB + Light Data</h2></summary>
<br>

<h3>Full Run 1 Sample</h3>

<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_14_02_02</td><td><code>data_SBND2026A_gen2_BNB-Run1_v10_14_02_02_reco1_sbnd</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_14_02</td><td><code>data_SBND2026A_gen2_BNB-Run1_v10_14_02_02_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_14_02</td><td><code>data_SBND2026A_gen2_BNB-Run1_v10_14_02_02_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_14_02</td><td><code>data_SBND2026A_gen2_BNB-Run1_v10_14_02_02_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>


</details>



---

## Related Pages
- [← Back to Gen 2 Analyses](gen2_analyses)
- [← Back to Sample Descriptions](sample)
- [Samples Page](sample_old)
