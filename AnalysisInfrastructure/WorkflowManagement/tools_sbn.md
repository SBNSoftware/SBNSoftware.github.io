# SBN Workflow Tools

[sbnutil github repo](https://github.com/SBNSoftware/sbnutil)

<details>
<summary>sbnpoms_wrapperfcl_maker.sh</summary>
<pre>
Purpose: Make an empty wrapper fcl file.

Usage: sbnpoms_wrapperfcl_maker.sh [options]

Options:

-h|-?|--help        - Print help message.
--fclname &lt;fcl&gt;     - Wrapped fcl file.
--wrappername &lt;fcl&gt; - Wrapper fcl file.
</pre>
</details>

<details>
<summary>sbnpoms_runnumber_injector.sh</summary>
<pre>
Purpose: Append run and subrun overrides to fcl file.
         Subrun follows \$PROCESS+1, and wraps by incrementing
         the run number when the subrun exceeds the maximum.

Usage: sbnpoms_runnumber_injector.sh [options]

Options:

-h|-?|--help          - Print help message.
--fcl &lt;fcl&gt;           - Fcl file to append (default standard output).
--subruns_per_run &lt;n&gt; - Number of subruns per run (default 100).
--process &lt;process&gt;   - Specify process number (default \$PROCESS).
--run &lt;run&gt;           - Specify base run number (default 1).
</pre>
</details>

<details>
<summary>sbnpoms_flux_injector.sh</summary>
<pre>
Purpose: Add genie flux-related overrides to fcl file.

Usage: sbnpoms_flux_injector.sh [options]

Options:

-h|-?|--help                - Print help message.
--fcl &lt;fcl&gt;                 - Fcl file to append (default standard output).
--flux_copy_method &lt;method&gt; - Flux copy method (default "IFDH").
--max_flux_file_mb &lt;n&gt;      - Maximum size of flux files to copy (default GENIEGen decides).
</pre>
</details>

<details>
<summary>sbnpoms_metadata_injector.sh</summary>
<pre>
Purpose: Append SAM metadata overrides to a fcl file.

Usage: sbnpoms_metadata_injector.sh [options]

General options:

-h|-?|--help                  - Print help message.
--inputfclname &lt;fcl file&gt;     - Fcl file to append to.

Options for overriding SAM built-in metadata (service FileCatalogMetadata).

--mdappfamily &lt;family&gt;        - Application family.
--mdappversion &lt;version&gt;      - Appliction version.
--mdfiletype &lt;file_type&gt;      - File type.
--mdruntype &lt;run_type&gt;        - Run type.
--mdgroupname &lt;group&gt;         - Group.

Options for overriding experiment-specific metadata.

--mdfclname &lt;fcl file&gt;        - Fcl file name to store in metadata.
--mdprojectname &lt;project&gt;     - Project name.
--mdprojectstage &lt;stage&gt;      - Project stage.
--mdprojectversion &lt;version&gt;  - Project version.
--mdprojectsoftware &lt;product&gt; - Top level ups product.
--mdproductionname &lt;campaign&gt; - Campaign name.
--mdproductiontype &lt;type&gt;     - Campaign type.

Options for non-artroot files.

--tfilemdjsonname &lt;json name&gt; - Name of TFile json file.
--cafname         &lt;caf name&gt;  - Name of caf file.
</pre>
</details>

<details>
<summary>sbnpoms_metadata_extractor.py</summary>
<pre>
Purpose: SAM metadata extractor for artroot and non-artroot files.
         Use sam_metadata_dumper to extract internal sam metadata from
         artroot files.  Otherwise, read metadata from associated .json
         file.  Json format metadata written to standard output.

Usage:

sbnpoms_metadata_extractor.py [options] &lt;file&gt;

Arguments:

&lt;file&gt; - Path of file.

Options:

-h|--help - Print help.
-e|--experiment &lt;exp&gt; - Experiment (default $SAM_EXPERIMENT).
</pre>
</details>

<details>
<summary>sbnpoms_chooser.sh</summary>
<pre>
Purpose: Select artroot file(s), and perform various other "between exe"
         operations.

Usage: sbnpoms_chooser.sh [options]

Options:

-h|--help        - Print help message.
-S &lt;list&gt;        - Specify list file to receive chosen files (default none).
-d &lt;directory&gt;   - Specify directory to search for root files (default ".").
-n &lt;n&gt;           - Number of artroot files to choose (default 1).
--[no]metadata   - [Do not] extract metadata (using sbnpoms_metadata_extractor.py) 
                   for any artroot file in the input directory into a matching 
                   .json file, if the .json file doesn't already exist.
                   Default is to extract metadata.
--delete &lt;list&gt;  - Delete files in the specified list file.
--[no]match      - [Do not] match unpaired non-artroot root files and 
                   unpaired json files.  Rename json file to match root file.
                   Default is to match.
--max_length &lt;n&gt; - Maximum file name length (0=no limit, default 200).
--unique         - Ensure that .root file names are unique (rename). 
</pre>
</details>