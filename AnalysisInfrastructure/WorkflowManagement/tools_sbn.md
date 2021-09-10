# SBN Workflow Tools

[sbnutil github repo](https://github.com/SBNSoftware/sbnutil)

<details>
<summary>sbnpoms_wrapperfcl_maker.sh</summary>
<br>
Purpose: Make an empty wrapper fcl file.<br>
<br>
Usage: sbnpoms_wrapperfcl_maker.sh [options]<br>
<br>
Options:<br>
<br>
-h|-?|--help        - Print help message.<br>
--fclname &lt;fcl&gt;     - Wrapped fcl file.<br>
--wrappername &lt;fcl&gt; - Wrapper fcl file.<br>  
<br>
</details>

<details>
<summary>sbnpoms_runnumber_injector.sh</summary>
<br>
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
<br>
</details>

<details>
<summary>sbnpoms_flux_injector.sh</summary>
<br>
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
<br>
</details>

<details>
<summary>sbnpoms_metadata_injector.sh</summary>
<br>
Purpose: Append SAM metadata overrides to a fcl file.<br>
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
<br>
</details>

<details>
<summary>sbnpoms_metadata_extractor.py</summary>
<br>
Purpose: SAM metadata extractor for artroot and non-artroot files.<br>
         Use sam_metadata_dumper to extract internal sam metadata from<br>
         artroot files.  Otherwise, read metadata from associated .json<br>
         file.  Json format metadata written to standard output.<br>
<br>
Usage:<br>
<br>
sbnpoms_metadata_extractor.py [options] &lt;file&gt;<br>
<br>
Arguments:<br>
<br>
&lt;file&gt; - Path of file.<br>
<br>
Options:<br>
<br>
-h|--help - Print help.<br>
-e|--experiment &lt;exp&gt; - Experiment (default $SAM_EXPERIMENT).<br>
<br>
</details>

<details>
<summary>sbnpoms_chooser.sh</summary>
Purpose: Select artroot file(s), and perform various other "between exe"<br>
         operations.<br>
<br>
Usage: sbnpoms_chooser.sh [options]<br>
<br>
Options:<br>
<br>
-h|--help        - Print help message.<br>
-S &lt;list&gt;        - Specify list file to receive chosen files (default none).<br>
-d &lt;directory&gt;   - Specify directory to search for root files (default ".").<br>
-n &lt;n&gt;           - Number of artroot files to choose (default 1).<br>
--[no]metadata   - [Do not] extract metadata (using sbnpoms_metadata_extractor.py) <br>
                   for any artroot file in the input directory into a matching <br>
                   .json file, if the .json file doesn't already exist.<br>
                   Default is to extract metadata.<br>
--delete &lt;list&gt;  - Delete files in the specified list file.<br>
--[no]match      - [Do not] match unpaired non-artroot root files and <br>
                   unpaired json files.  Rename json file to match root file.<br>
                   Default is to match.<br>
--max_length &lt;n&gt; - Maximum file name length (0=no limit, default 200).<br>
--unique         - Ensure that .root file names are unique (rename). <br>
</details>