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

<label for="sbnd-sample-search"><strong>Search Gen 1 and Gen 2 datasets</strong></label>
<input id="sbnd-sample-search" class="input" type="search" placeholder="Type any words from a dataset name, e.g. BNB light run 1" autocomplete="off" style="max-width: 40rem;">
<p id="sbnd-sample-search-status" role="status" aria-live="polite">Enter one or more words from a dataset name. All words must match; word order does not matter.</p>
<ul id="sbnd-sample-search-results"></ul>

<script>
(() => {
  const input = document.getElementById("sbnd-sample-search");
  const status = document.getElementById("sbnd-sample-search-status");
  const results = document.getElementById("sbnd-sample-search-results");
  const sources = [
    { label: "Gen 1 Data", path: "gen1_data.html" },
    { label: "Gen 1 MC", path: "gen1_mc.html" },
    { label: "Gen 2 Data", path: "gen2_data.html" },
    { label: "Gen 2 MC", path: "gen2_mc.html" }
  ];
  let samplesPromise;

  function loadSamples() {
    if (!samplesPromise) {
      samplesPromise = Promise.all(sources.map(async (source) => {
        const response = await fetch(new URL(source.path, window.location.href));
        if (!response.ok) {
          throw new Error(`Could not load ${source.label} (HTTP ${response.status}).`);
        }
        const page = new DOMParser().parseFromString(await response.text(), "text/html");
        const definitions = page.querySelectorAll("td:last-child code, td:last-child em, li code, li em");

        return Array.from(definitions, (definition) => {
          const row = definition.closest("tr") || definition.closest("li");
          const groups = [];
          let details = definition.closest("details");
          while (details) {
            const summary = details.querySelector(":scope > summary");
            if (summary) groups.unshift(summary.textContent.trim());
            details = details.parentElement.closest("details");
          }
          const metadata = row ? Array.from(row.children).slice(0, -1).map((cell) => cell.textContent.trim()).filter(Boolean) : [];
          return {
            name: definition.textContent.trim(),
            context: [source.label, ...groups, ...metadata].join(" · "),
            path: source.path
          };
        }).filter((sample) => sample.name);
      })).then((pages) => pages.flat());
    }
    return samplesPromise;
  }

  input.addEventListener("input", async () => {
    const query = input.value.trim().toLocaleLowerCase();
    const terms = query.split(/\s+/).filter(Boolean);
    results.replaceChildren();
    if (!terms.length) {
      status.textContent = "Enter one or more words from a dataset name. All words must match; word order does not matter.";
      return;
    }

    status.textContent = "Searching dataset names…";
    try {
      const samples = await loadSamples();
      if (input.value.trim().toLocaleLowerCase() !== query) return;
      const matches = samples.filter((sample) => {
        const name = sample.name.toLocaleLowerCase();
        return terms.every((term) => name.includes(term));
      });
      status.textContent = matches.length ? `${matches.length} matching dataset${matches.length === 1 ? "" : "s"}.` : "No matching datasets found.";

      for (const sample of matches) {
        const item = document.createElement("li");
        const link = document.createElement("a");
        link.href = sample.path;
        link.textContent = sample.name;
        const description = document.createElement("small");
        description.textContent = ` — ${sample.context}`;
        item.append(link, description);
        results.append(item);
      }
    } catch (error) {
      status.textContent = `Search unavailable: ${error.message}`;
    }
  });
})();
</script>

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
