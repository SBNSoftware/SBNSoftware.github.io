---
layout: page
title: Generation 2 — MC
subtitle: SBN Production — Gen 2 Monte Carlo Samples
description: Gen 2 Monte Carlo simulation samples for SBN analyzers
hero_height: is-medium
toc: true
toc_title: Gen 2 MC
---

<h1 align="center">Monte Carlo (MC)</h1>

---

<h2>Central Value MC Samples</h2>

<details>
<summary><h3 style="display:inline">➕ BNB + Light MC</h3></summary>
<br>

<h4>Development Sample</h4>

<table>
  <thead>
    <tr><th>Stage</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>calibntuples</strong></td><td><em>[Insert sample definition]</em></td></tr>
    <tr><td><strong>caf</strong></td><td><em>[Insert sample definition]</em></td></tr>
    <tr><td><strong>flatcaf</strong></td><td><code>aurora_SBND2026A_gen2_BNBLight_DevSample_prodgenie_corsika_proton_rockbox0p1_sbnd_CV_v10_14_02_03_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>

<h4>Full Run 1 x5 MC Sample <em>(50% available — 10M events!)</em></h4>

<table>
  <thead>
    <tr><th>Stage</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>reco1</strong></td><td><code>aurora_SBND2026A_gen2_BNBLight_prodgenie_corsika_proton_rockbox0p1_sbnd_CV_v10_14_02_03_reco1_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td><code>aurora_SBND2026A_gen2_BNBLight_prodgenie_corsika_proton_rockbox0p1_sbnd_CV_v10_14_02_03_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>

</details>

---

<h2>Special MC Samples</h2>

<details>
<summary><h3 style="display:inline">➕ Ar23</h3></summary>
<br>

<table>
  <thead>
    <tr><th>Stage</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>calibntuples</strong></td><td><code>mc_MCP2025C_FallProduction_prodgenie_corsika_proton_rockbox0p1_sbnd_CV_v10_14_02_histreco2_sbnd</code></td></tr>
    <tr><td><strong>caf</strong></td><td><code>mc_MCP2025C_FallProduction_prodgenie_corsika_proton_rockbox0p1_sbnd_CV_v10_14_02_caf_sbnd</code></td></tr>
    <tr><td><strong>flatcaf</strong></td><td><code>mc_MCP2025C_FallProduction_prodgenie_corsika_proton_rockbox0p1_sbnd_CV_v10_14_02_flatcaf_sbnd</code></td></tr>
  </tbody>
</table>

</details>

<details>
<summary><h3 style="display:inline">➕ BSM</h3></summary>
<br>

<blockquote>
<strong>Note:</strong> reco1 &amp; cafs are also available for all samples listed below.<br>
<strong>Available mass points:</strong> HNL_nupi0_m260MeV, HNL_nupi0_m215MeV, HNL_nupi0_m190MeV, HNL_nupi0_m165MeV, HNL_nupi0_m140MeV, HNL_nuee_m140MeV, HNL_nuee_m125MeV, HNL_nuee_m100MeV, HNL_nuee_m75MeV, HNL_nuee_m50MeV, HNL_nuee_m35MeV
</blockquote>

<h4>HNL_nupi0_m240MeV</h4>

<table>
  <thead>
    <tr><th>Stage</th><th>Sample Definition</th></tr>
  </thead>
  <tbody>
    <tr><td><strong>flatcaf</strong></td><td><code>aurora_SBND2026A_HNL2026_14_02_03_flat_caf_sbnd_HNL_nupi0_m240MeV</code></td></tr>
  </tbody>
</table>

</details>

<details>
<summary><h3 style="display:inline">➕ xsec</h3></summary>
<br>

<blockquote>
Available soon!
</blockquote>

</details>

---

<h2>Systematic Variations</h2>

<details>
<summary><h3 style="display:inline">➕ Systematic Variations</h3></summary>
<br>

<blockquote>
<strong>Usage Note:</strong> When using these samples you will need to make sure that the run, subrun, event, and a neutrino truth property are matched across the nominal sample and each systematic sample separately. This will remove any statistical fluctuations.
</blockquote>

<p>Available soon!</p>

</details>

---

## Related Pages
- [← Back to Gen 2 Analyses](gen2_analyses)
- [← Back to Sample Descriptions](sample_descriptions)
- [Samples Page](sample)
