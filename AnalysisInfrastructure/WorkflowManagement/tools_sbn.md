# SBN Workflow Tools

[sbnutil github repo](https://github.com/SBNSoftware/sbnutil)

<details>
  <summary>sbnpoms_wrapperfcl_maker.sh</summary>
  
  Purpose: Make an empty wrapper fcl file.<br>
  <br>
  Usage: sbnpoms_wrapperfcl_maker.sh [options]<br>
  <br>
  Options:<br>
  <br>
  -h|-?|--help        - Print help message.<br>
  --fclname &lt;fcl&gt;     - Wrapped fcl file.<br>
  --wrappername &lt;fcl&gt; - Wrapper fcl file.<br>
  
</details>

<details>
  <summary>sbnpoms_runnumber_injector.sh</summary>
  
  Purpose: Append run and subrun overrides to fcl file.<br>
           Subrun follows \$PROCESS+1, and wraps by incrementing<br>
           the run number when the subrun exceeds the maximum.<br>
  <br>
  Usage: sbnpoms_runnumber_injector.sh [options]<br>
  <br>
  Options:<br>
  <br>
  -h|-?|--help          - Print help message.<br>
  --fcl &lt;fcl&gt;           - Fcl file to append (default standard output).<br>
  --subruns_per_run &lt;n&gt; - Number of subruns per run (default 100).<br>
  --process &lt;process&gt;   - Specify process number (default \$PROCESS).<br>
  --run &lt;run&gt;           - Specify base run number (default 1).<br>
</details>

<details>
  <summary>sbnpoms_flux_injector.sh</summary>
  
  Purpose: Add genie flux-related overrides to fcl file.<br>
  <br>
  Usage: sbnpoms_flux_injector.sh [options]<br>
<br>
  Options:<br>
<br>
  -h|-?|--help                - Print help message.<br>
  --fcl &lt;fcl&gt;                 - Fcl file to append (default standard output).<br>
  --flux_copy_method &lt;method&gt; - Flux copy method (default "IFDH").<br>
  --max_flux_file_mb &lt;n&gt;      - Maximum size of flux files to copy (default GENIEGen decides).<br>
</details>

<details>
<summary>sbnpoms_metadata_injector.sh</summary>

Purpose: Add fcl overrides for generating SAM metadata.<br>
<br>
Usage: sbnpoms_metadata_injector.sh [options]<br>
<br>
General options:<br>
<br>
-h|-?|--help                  - Print help message.<br>
--inputfclname &lt;fcl file&gt;     - Fcl file to append to.<br>
<br>
Options for overriding SAM built-in metadata (service FileCatalogMetadata).<br>
<br>
--mdappfamily &lt;family&gt;        - Application family.<br>
--mdappversion &lt;version&gt;      - Appliction version.<br>
--mdfiletype &lt;file_type&gt;      - File type.<br>
--mdruntype &lt;run_type&gt;        - Run type.<br>
--mdgroupname &lt;group&gt;         - Group.<br>
<br>
Options for overriding experiment-specific metadata.<br>
<br>
--mdfclname &lt;fcl file&gt;        - Fcl file name to store in metadata.<br>
--mdprojectname &lt;project&gt;     - Project name.<br>
--mdprojectstage &lt;stage&gt;      - Project stage.<br>
--mdprojectversion &lt;version&gt;  - Project version.<br>
--mdprojectsoftware &lt;product&gt; - Top level ups product.<br>
--mdproductionname &lt;campaign&gt; - Campaign name.<br>
--mdproductiontype &lt;type&gt;     - Campaign type.<br>
<br>
Options for non-artroot files.<br>
<br>
--tfilemdjsonname &lt;json name&gt; - Name of TFile json file.<br>
--cafname         &lt;caf name&gt;  - Name of caf file.<br>
</details>
