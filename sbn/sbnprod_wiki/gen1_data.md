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
<hr>
<blockquote>
<strong>Validation &amp; earlier productions:</strong> <em>The samples below are validation campaigns and earlier reconstruction passes of the development samples above.</em>
</blockquote>
<h3>Fall25 Validation — Full Run 1 Rolling Dev (BNB + Light)</h3>
 
<blockquote>
<strong>Note:</strong> Full Run 1 rolling development validation sample (~75k events). This sample <strong>does not contain POT accounting information</strong>.
</blockquote>
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_10_03_01</td><td><code>data_MCP2025B_noPOT_FullRun1_RollingDev_bnblight_v10_10_03_01_reco1_sbnd</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_10_03_01</td><td><code>data_MCP2025B_noPOT_FullRun1_RollingDev_bnblight_bnblight_v10_10_03_01_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_10_03_01</td><td><code>data_MCP2025B_noPOT_FullRun1_RollingDev_bnblight_bnblight_v10_10_03_01_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_10_03_01</td><td><code>data_MCP2025B_noPOT_FullRun1_RollingDev_bnblight_bnblight_v10_10_03_01_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>
<h3>Fall25 Validation — Full Run 1 Rolling Dev (BNB + Light, DNN)</h3>
 
<blockquote>
<strong>Note:</strong> DNN reconstruction variant of the Full Run 1 rolling validation sample (~75k events).
</blockquote>
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_10_03_02</td><td><code>data_MCP2025B_FullRun1_RollingDev_DNN_bnblight_v10_10_03_02_reco1_sbnd</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_10_03_02</td><td><code>data_MCP2025B_FullRun1_RollingDev_DNN_bnblight_v10_10_03_02_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_10_03_02</td><td><code>data_MCP2025B_FullRun1_RollingDev_DNN_bnblight_v10_10_03_02_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_10_03_02</td><td><code>data_MCP2025B_FullRun1_RollingDev_DNN_bnblight_v10_10_03_02_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>
<h3>Spring25 Fixed Dev Sample (5e18 POT) — Earlier Productions</h3>
 
<blockquote>
<strong>Note:</strong> Earlier reconstruction passes (~90k events) of the Run 1 fixed development sample.
</blockquote>
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_06_00</td><td><code>data_MCP2025B_DevSample_bnblight_v10_06_00_reco1_sbnd</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_06_00_02</td><td><code>data_MCP2025B_02_DevSample_bnblight_v10_06_00_02_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_06_00_02</td><td><code>data_MCP2025B_02_DevSample_bnblight_v10_06_00_02_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_06_00_02</td><td><code>data_MCP2025B_02_DevSample_bnblight_v10_06_00_02_flatcaf_sbnd</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_06_00_05</td><td><code>data_MCP2025B_05_DevSample_bnblight_v10_06_00_05_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_06_00_05</td><td><code>data_MCP2025B_05_DevSample_bnblight_v10_06_00_05_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_06_00_05</td><td><code>data_MCP2025B_05_DevSample_bnblight_v10_06_00_05_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>
<h3>Spring25 Rolling Dev Sample — Earlier Productions</h3>
 
<blockquote>
<strong>Note:</strong> Earlier reconstruction passes (~30k events) of the Run 1 rolling development sample.
</blockquote>
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_06_00</td><td><code>data_MCP2025B_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_reco1_sbnd</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_06_00_02</td><td><code>data_MCP2025B_02_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_02_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_06_00_02</td><td><code>data_MCP2025B_02_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_02_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_06_00_02</td><td><code>data_MCP2025B_02_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_02_flatcaf_sbnd</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_06_00_04</td><td><code>data_MCP2025B_04_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_04_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_06_00_04</td><td><code>data_MCP2025B_04_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_04_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_06_00_04</td><td><code>data_MCP2025B_04_DevSample_Run1Rolling_5e18_bnblight_v10_06_00_04_flatcaf_sbnd</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_06_00_05</td><td><code>data_MCP2025B_05_DevSample_Run1Rolling_bnblight_v10_06_00_05_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_06_00_05</td><td><code>data_MCP2025B_05_DevSample_Run1Rolling_bnblight_v10_06_00_05_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_06_00_05</td><td><code>data_MCP2025B_05_DevSample_Run1Rolling_bnblight_v10_06_00_05_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>
<h3>Spring25 Validation Dev Sample</h3>
 
<blockquote>
<strong>Note:</strong> Early Spring 2025 validation production (MCP2025Av3, ~90k events) of the development sample.
</blockquote>
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_04_06_01</td><td><code>MCP2025Av3_DevSample_bnblight_v10_04_06_01_reco1</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_04_06_01</td><td><code>MCP2025Av3_DevSample_bnblight_v10_04_06_01_histreco2</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_04_06_01</td><td><code>MCP2025Av3_DevSample_bnblight_v10_04_06_01_caf</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_04_06_01</td><td><code>MCP2025Av3_DevSample_bnblight_v10_04_06_01_flatcaf</code></td></tr>
  </tbody>
</table>
<h3>BNB Summer 2024 Data (Keep-Up)</h3>
 
<blockquote>
<strong>Note:</strong> Legacy Summer 2024 keep-up BNB data (zero-bias + sunset triggers).
</blockquote>
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v09_93_01_01</td><td><code>sbnd_keepup_summer2024_neutrino_data_bnbZeroBiasAndSunset0-00009_reco1</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v09_93_01_01</td><td><code>hist_sbnd_keepup_summer2024_neutrino_data_bnbZeroBiasAndSunset0-00009_reco2</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v09_93_01_01</td><td><code>sbnd_keepup_summer2024_neutrino_data_bnbZeroBiasAndSunset0-00009_caf</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v09_93_01_01</td><td><code>sbnd_keepup_summer2024_neutrino_data_bnbZeroBiasAndSunset0-00009_flatcaf</code></td></tr>
  </tbody>
</table>
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
<hr>
<blockquote>
<strong>Validation &amp; earlier productions:</strong> <em>Kept for reference; for analysis, prefer the current v10_06_00_09 reprocess samples above.</em>
</blockquote>
<h3>Fall25 Validation — Full Run 1 Rolling Dev (OffBeam + Light, DNN)</h3>
 
<blockquote>
<strong>Note:</strong> DNN reconstruction of the Full Run 1 off-beam rolling validation sample (~40k events).
</blockquote>
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_10_03_02</td><td><code>data_MCP2025B_FullRun1_RollingDev_offbeamlight_v10_10_03_02_reco1_sbnd</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_10_03_02</td><td><code>data_MCP2025B_FullRun1_RollingDev_offbeamlight_v10_10_03_02_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_10_03_02</td><td><code>data_MCP2025B_FullRun1_RollingDev_offbeamlight_v10_10_03_02_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_10_03_02</td><td><code>data_MCP2025B_FullRun1_RollingDev_offbeamlight_v10_10_03_02_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>
<h3>Run 1 Sample — Earlier Productions</h3>
 
<blockquote>
<strong>Note:</strong> Earlier reconstruction passes of the Run 1 in-time cosmic (off-beam) sample. The current v10_06_00_09 production is listed under &ldquo;Run 1 Sample&rdquo; above.
</blockquote>
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_06_00</td><td><code>data_MCP2025B_InTimeCosmics_offbeamlight_v10_06_00_reco1_sbnd</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_06_00_02</td><td><code>data_MCP2025B_02_InTimeCosmics_offbeamlight_v10_06_00_02_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_06_00_02</td><td><code>data_MCP2025B_02_InTimeCosmics_offbeamlight_v10_06_00_02_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_06_00_02</td><td><code>data_MCP2025B_02_InTimeCosmics_offbeamlight_v10_06_00_02_flatcaf_sbnd</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_06_00_05</td><td><code>data_MCP2025B_02_InTimeCosmics_offbeamlight_v10_06_00_05_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_06_00_05</td><td><code>data_MCP2025B_02_InTimeCosmics_offbeamlight_v10_06_00_05_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_06_00_05</td><td><code>data_MCP2025B_02_InTimeCosmics_offbeamlight_v10_06_00_05_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>
</details>

---
 
<details>
<summary><h2 style="display:inline"> Zero Bias Data</h2></summary>
<br>
<p><em>Zero-bias (minimum-bias) trigger samples from Run 18115 (Feb 2025 workshop).</em></p>
<h3>Run 18115 BNB Zero Bias</h3>
 
<blockquote>
<strong>Note:</strong> ~610k events.
</blockquote>
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_04_03</td><td><code>MCP2025A_GoldenRun_LArv10_v10_04_03_bnbzerobias_reco1</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_04_03</td><td><code>MCP2025A_GoldenRun_LArv10_v10_04_03_bnbzerobias_histreco2</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_04_03</td><td><code>MCP2025A_GoldenRun_LArv10_v10_04_03_bnbzerobias_caf</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_04_03</td><td><code>MCP2025A_GoldenRun_LArv10_v10_04_03_bnbzerobias_flatcaf</code></td></tr>
  </tbody>
</table>
<h3>Run 18115 OffBeam Zero Bias</h3>
 
<blockquote>
<strong>Note:</strong> ~240k events.
</blockquote>
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_04_03</td><td><code>MCP2025A_GoldenRun_LArv10_v10_04_03_offbeamzerobias_reco1</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_04_03</td><td><code>MCP2025A_GoldenRun_LArv10_v10_04_03_offbeamzerobias_histreco2</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_04_03</td><td><code>MCP2025A_GoldenRun_LArv10_v10_04_03_offbeamzerobias_caf</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_04_03</td><td><code>MCP2025A_GoldenRun_LArv10_v10_04_03_offbeamzerobias_flatcaf</code></td></tr>
  </tbody>
</table>
</details>

---
 
<details>
<summary><h2 style="display:inline"> Crossing Muon Data</h2></summary>
<br>
<p><em>Crossing-muon calibration samples.</em></p>
<h3>Crossing Muon (After-Light Trigger) — Full Run 1</h3>
 
<blockquote>
<strong>Note:</strong> Full Run 1 crossing-muon sample (~30k events) on the after-light trigger.
</blockquote>
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_06_03</td><td><code>data_MCP2025B_CrossingMuon_FullRun1_AfterLight_8_crossingmuon_v10_06_03_reco1_sbnd</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_06_03</td><td><code>data_MCP2025B_CrossingMuon_FullRun1_AfterLight_8_crossingmuon_v10_06_03_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_06_03</td><td><code>data_MCP2025B_CrossingMuon_FullRun1_AfterLight_8_crossingmuon_v10_06_03_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_06_03</td><td><code>data_MCP2025B_CrossingMuon_FullRun1_AfterLight_8_crossingmuon_v10_06_03_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>
<h3>Feb25 Workshop Calibration / Crossing Muons</h3>
 
<blockquote>
<strong>Note:</strong> Early calibration productions (reco1 only available).
</blockquote>
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_04_03</td><td><code>MCP2025A_CalibData_LArv10_v10_04_03_reco1</code></td></tr>
    <tr><td><strong>reco1</strong></td><td>v10_04_01_01</td><td><code>MCP2025A_CalibDatawraw_18115_17934_CrossingMuon_v10_04_01_01_reco1_DATA_SBND</code></td></tr>
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
<h3>Run 1 Full 1e20 POT Sample</h3>
 
<blockquote>
<strong>Note:</strong> Full Run 1 1e20 POT BNB dataset (~1.7M events). The v10_06_00_09 rows are the Spring 2025 reprocess.
</blockquote>
<table>
  <thead>
    <tr><th>Stage</th><th>Code Version</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td>v10_06_00_02</td><td><code>data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_02_reco1_sbnd</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_06_00_02</td><td><code>data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_02_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_06_00_02</td><td><code>data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_02_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_06_00_02</td><td><code>data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_02_flatcaf_sbnd</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_06_00_05</td><td><code>data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_05_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_06_00_05</td><td><code>data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_05_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_06_00_05</td><td><code>data_MCP2025B_02_FullData_1e20_bnblight_v10_06_00_05_flatcaf_sbnd</code></td></tr>
    <tr><td><strong>calibntuples</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25_reprocess_FullData1e20_bnblight_v10_06_00_09_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25_reprocess_FullData1e20_bnblight_v10_06_00_09_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td>v10_06_00_09</td><td><code>data_MCP2025C_Spring25_reprocess_FullData1e20_bnblight_v10_06_00_09_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>
</details>

---
 
## Related Pages
- [← Back to Gen 1 Analyses](gen1_analyses)
- [← Back to Sample Descriptions](sample_descriptions)
- [Samples Page](sample)- [Samples Page](sample)
 
