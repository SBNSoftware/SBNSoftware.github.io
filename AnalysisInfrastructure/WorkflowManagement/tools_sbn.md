# SBN Workflow Tools

<details><summary>sbnpoms_wrapperfcl_maker.sh</summary>
Purpose: Make an empty wrapper fcl file.

Usage: sbnpoms_wrapperfcl_maker.sh [options]

Options:

-h|-?|--help        - Print help message.
--fclname <fcl>     - Wrapped fcl file.
--wrappername <fcl> - Wrapper fcl file.
</details>

<details><summary>sbnpoms_runnumber_maker.sh</summary>
Purpose: Append run and subrun overrides to fcl file.
         Subrun follows $PROCESS+1, and wraps by incrementing
         the run number when the subrun exceeds the maximum.

Usage: sbnpoms_runnumber_injector.sh [options]

Options:

-h|-?|--help          - Print help message.
--fcl <fcl>           - Fcl file to append (default standard output).
--subruns_per_run <n> - Number of subruns per run (default 100).
--process <process>   - Specify process number (default $PROCESS).
--run <run>           - Specify base run number (default 1).
</details>
