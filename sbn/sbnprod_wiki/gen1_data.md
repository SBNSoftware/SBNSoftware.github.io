---
layout: page
title: Generation 1 — Data
subtitle: SBN Production — Gen 1 Data Samples
description: Gen 1 data samples for SBN analyzers
hero_height: is-medium
toc: false
toc_title: Gen 1 Data
---
 
<h1 align="center">Data (Unblinded)</h1>
 
> Unblinded data is available for use and doesn't require access requests.
 
---
 
<details>
<summary><h2 style="display:inline"> BNB + Light Data</h2></summary>
<br>
<p><em>The primary neutrino stream for SBND physics analysis.</em></p>
<blockquote>
<strong>Documentation:</strong> All Gen 1 data samples are described in DocDB 44638. Check there for the specific run lists used in each Development Sample.
</blockquote>
<h3>Run 1 Fixed Analysis Development Sample</h3>
 
<blockquote>
<strong>Usage:</strong> <em>The fixed sample is a good place to start an analysis because its data is taken over a short time period and shouldn't contain time-dependent signatures.</em>
</blockquote>
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>calibntuples</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25_reprocess_FixedDev_bnblight_v10_06_00_09_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25_reprocess_FixedDev_bnblight_v10_06_00_09_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25_reprocess_FixedDev_bnblight_v10_06_00_09_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>
<h3>Run 1 Rolling Analysis Development Sample</h3>
 
<blockquote>
<strong>Usage:</strong> <em>The rolling sample is a good place to check the time-dependent signatures present in analyses.</em>
</blockquote>
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>calibntuples</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25_reprocess_RollingDev_bnblight_v10_06_00_09_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25_reprocess_RollingDev_bnblight_v10_06_00_09_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25_reprocess_RollingDev_bnblight_v10_06_00_09_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>
<h3>Run 2 Fixed Analysis Development Sample</h3>
 
<blockquote>
<strong>Note:</strong> This sample <strong>does not contain POT accounting information</strong>.
</blockquote>
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>calibntuples</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25-Run2_FixedDev_bnblight_v10_06_00_09_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25-Run2_FixedDev_bnblight_v10_06_00_09_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25-Run2_FixedDev_bnblight_v10_06_00_09_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>
<h3>Run 2 Rolling Analysis Development Sample</h3>
 
<p><em>Coming soon!</em></p>
</details>

---
 
<details>
<summary><h2 style="display:inline"> OffBeam + Light Data</h2></summary>
<br>
<blockquote>
<strong>Integration Note:</strong> This sample is intended to be combined with <strong>BNB+Light</strong> data for accurate cosmic background estimation. When combining with BNB+Light data, don't forget to scale the off-beam by an additional <strong>(1 - 0.0754)</strong>.
</blockquote>
<h3>Run 1 Sample</h3>
 
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>calibntuples</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25_reprocess_Intime_offbeamlight_v10_06_00_09_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25_reprocess_Intime_offbeamlight_v10_06_00_09_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25_reprocess_Intime_offbeamlight_v10_06_00_09_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>
<h3>Run 2 (1.5%) Sample</h3>
 
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>calibntuples</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25-Run2_InTimeCosmic_offbeamlight_v10_06_00_09_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25-Run2_InTimeCosmic_offbeamlight_v10_06_00_09_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25-Run2_InTimeCosmic_offbeamlight_v10_06_00_09_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>
</details>
<h1 align="center">Data (Blinded)</h1>
 
> Blinded data requires access requests. For more information, consult your working group conveners.
 
---
 
<details>
<summary><h2 style="display:inline"> BNB + Light Data</h2></summary>
<br>
<h3>Run 1 1e20 Sample</h3>
 
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>calibntuples</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25_reprocess_Dev1e20_bnblight_v10_06_00_09_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25_reprocess_Dev1e20_bnblight_v10_06_00_09_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25_reprocess_Dev1e20_bnblight_v10_06_00_09_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>
</details>

---
 
## Related Pages
- [← Back to Gen 1 Analyses](gen1_analyses)
- [← Back to Sample Descriptions](sample_descriptions)
- [Samples Page](sample)
 
