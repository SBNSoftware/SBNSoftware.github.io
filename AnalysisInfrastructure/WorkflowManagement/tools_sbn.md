# SBN Workflow Tools

[sbnutil github repo](https://github.com/SBNSoftware/sbnutil)

<details>
<summary>clean_sam_scratch_locations.py</summary>
<pre>
Purpose: Clean dead scratch locations.  Update parameter loc.scratch.

Usage:

clean_sam_scratch_locations.py [options]

Options:

-h|--help             - Print help.
-e|--experiment &lt;exp&gt; - Experiment (default $SAM_EXPERIMENT).
-n|--nfiles &lt;n&gt;       - Number of files to query per iteration (default no limit).
--def &lt;defname&gt;       - Parent definition (optional, default none).
--file &lt;filename&gt;     - File name (optional, default none).
--niter &lt;niter&gt;       - Number of iterations (default 1).
--nolabel             - Check all files with locations, but no tape label.
--invalid_disk &lt;file&gt; - Save files sith invalid persistent disk locations in specified file.
--invalid_tape &lt;file&gt; - Save files sith invalid tape locations in specified file.
</pre>
</details>

<details>
<summary>dcache_config.py</summary>
<pre>
Purpose: Analysis dCache configuraiton.

Usage:

dcache_config.py [options]

Options:

-h|--help       - Print help.
-e|--experiment - Experiment (default $EXPERIMENT).
--min_depth &lt;n&gt; - Minimum depth to print out (default 3).
--max_deptn &lt;n&gt; - Maximum depth to analyze (default 7).
--md            - Output in markdown format (default plain text).
</pre>
</details>

<details>
<summary>isartroot.py</summary>
<pre>
Purpose: Test whether file is an artroot file.  With no options, return 
         exit status 0 if file is an artroot file, nonzero otherise.

Usage:

isartroot.py [options] &lt;file&gt;

Options:

-h|--help    - Print help.
-n|--invert  - Invert selection (return status 0 for non-artroot root file).
-a|--anyroot - Return status 0 for any valid root file.
-v|--verbose - Print a human-readable message that matches return status.

Arguments:

&lt;file&gt; - Path of file.
</pre>
</details>

<details>
<summary>migrate_sam_definitions.py</summary>
<pre>
Purpose: Migrate dataset definitions from source SAM database (SBND or 
         ICARUS) to target SAM database (SBN).

Usage:

migrate_sam_definitions.py [options]

Options:

-h|--help             - Print help.
-e|--experiment &lt;exp&gt; - Experiment (default $SAM_EXPERIMENT).
-d|--definition &lt;def&gt; - Migrate a particular definition (default none).
-n|--ndefinitions&lt;n&gt;  - Number of defiitions migrate (default no limit).
</pre>
</details>

<details>
<summary>migrate_sam_files.py</summary>
<pre>
Purpose: Migrate files from source SAM database (SBND or ICARUS) to 
         target SAM database (SBN).

Usage:

migrate_sam_files.py [options]

Options:

-h|--help             - Print help.
-e|--experiment &lt;exp&gt; - Experiment (default $SAM_EXPERIMENT).
-n|--nfiles &lt;n&gt;       - Number of files to query per iteration (default no limit).
--def &lt;defname&gt;       - Parent definition (optional, default none).
--file &lt;filename&gt;     - File name (optional, default none).
--niter &lt;niter&gt;       - Number of iterations (default 1).
--invalid &lt;file&gt;      - Save unmigrated files in specified file.
</pre>
</details>

<details>
<summary>migrate_sam_users.py</summary>
<pre>
Purpose: Migrate users and groups from source SAM database (SBND or
         ICARUS) to target SAM database (SBN).

Usage:

migrate_sam_users.py [options]

Options:

-h|--help             - Print help.
-e|--experiment &lt;exp&gt; - Experiment (default $SAM_EXPERIMENT).
-u|--user &lt;user&gt;      - Check particular user (default all).
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
<summary>sbnd/sbndpoms_caf_concatenation.sh</summary>
<pre>
Purpose: Produces concatenated caf files from a dataset of standard cafs.
         Also provides the option to flatten the concatenated file.

Usage: sbndpoms_caf_concatenation.sh --defname &lt;SAMDEF&gt; [options]

Options:

-h|-?|--help         - Print help message.
--workdir &lt;dir&gt;      - Top level directory for producing the files.
--outdir &lt;dir&gt;       - Top level directory for storing the files.
--size &lt;maxsize&gt;     - Specify the maximum size of one of the files.
--flatten            - Created flattened caf files too.
</pre>
</details>

<details>
<summary>sbnd/sbndpoms_genfclwithrunnumber_maker.sh</summary>
<pre>
Purpose: Wrapper script to create a set of initial fcl files.
         Makes use of the sbnpoms_metadata_injector.sh script.

Usage: sbndpoms_genfclwithrunnumber_maker.sh [options]

Options:

-h|-?|--help         - Print help message.
--fcl &lt;fcl&gt;          - The gen fcl file for this campaign.
--outdir &lt;dir&gt;       - Top level directory for storing the files.
--samdeclare         - Declare produced fcls to SAM.
--nfiles &lt;n&gt;         - Number of files (i.e. subruns) to produce.
--workdir &lt;dir&gt;      - Top level directory for producing the files.
--mdprojver &lt;ver&gt;    - Code version being used for campaign.
--mdprojname &lt;name&gt;  - Name of production (i.e. MCPXXXXA).
--mdprojtype &lt;type&gt;  - Type of production (i.e. official).
--mdstagename &lt;name&gt; - Name of stage (i.e. gen).
-v|--verbose         - Increases verbosity of output.
</pre>
</details>

