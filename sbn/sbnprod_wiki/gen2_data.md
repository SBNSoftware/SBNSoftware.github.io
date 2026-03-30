---
layout: page
title: Generation 2 — Data (Unblinded)
subtitle: SBN Production — Gen 2 Data Samples
description: Gen 2 unblinded data samples for SBN analyzers
hero_height: is-medium
toc: true
toc_title: Gen 2 Data
---

<h1 align="center">Data (Unblinded)</h1>

> Unblinded data is available for use and doesn't require access requests.

---

## BNB + Light Data

*The primary neutrino stream for SBND physics analysis.*

<details>
<summary><strong>➕ Run 1 Analysis Development Sample (Fix + Rolling)</strong></summary>
<br>

<ul>
  <li><strong>calibntuples:</strong> <code>data_MCP2025C_Fall25-Run1_BNB_Dev_bnblight_v10_14_02_histreco2_sbnd</code></li>
</ul>

</details>

<details>
<summary><strong>➕ Rolling Sample</strong></summary>
<br>

<blockquote>
<strong>Documentation:</strong> Check the relevant DocDB for the specific run list used in the Rolling Sample.<br>
<strong>Usage:</strong> <em>[Insert guidance on when this should be used over other samples.]</em>
</blockquote>

<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_Fall25-Run1_BNB_RollingDev_bnblight_v10_14_02_reco1_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_Fall25-Run1_BNB_RollingDev_bnblight_v10_14_02_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_Fall25-Run1_BNB_RollingDev_bnblight_v10_14_02_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>

</details>

<details>
<summary><strong>➕ Fixed Dev Sample</strong></summary>
<br>

<blockquote>
<strong>Documentation:</strong> Check the relevant DocDB for the specific run list used in the Fixed Development Sample.<br>
<strong>Usage:</strong> <em>[Insert guidance on when this should be used over the Rolling sample.]</em>
</blockquote>

<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_Fall25-Run1_BNB_FixedDev_bnblight_v10_14_02_reco1_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_Fall25-Run1_BNB_FixedDev_bnblight_v10_14_02_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_14_02</td><td><code>data_MCP2025C_Fall25-Run1_BNB_FixedDev_bnblight_v10_14_02_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>

</details>

---

## OffBeam + Light Data

> **Integration Note:** This sample is intended to be combined with **BNB+Light** data for accurate cosmic background estimation.

<details>
<summary><strong>➕ Development Sample Reference</strong></summary>
<br>

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

</details>

---

## Related Pages
- [← Back to Gen 2 Analyses](gen2_analyses)
- [← Back to Sample Descriptions](sample_descriptions)
- [Samples Page](sample)
