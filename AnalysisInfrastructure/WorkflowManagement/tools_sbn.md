# SBN Workflow Tools

<details>
  <summary>sbnpoms_wrapperfcl_maker.sh</summary>
  
  Purpose: Make an empty wrapper fcl file.<br>
  <br>
  Usage: sbnpoms_wrapperfcl_maker.sh [options]<br>
  <br>
  Options:<br>
  <br>
  -h|-?|--help        - Print help message.<br>
  --fclname <fcl>     - Wrapped fcl file.<br>
  --wrappername <fcl> - Wrapper fcl file.<br>
</details>

<details>
  <summary>sbnpoms_runnumber_injector.sh</summary>
  
  Purpose: Append run and subrun overrides to fcl file.<br>
           Subrun follows $PROCESS+1, and wraps by incrementing<br>
           the run number when the subrun exceeds the maximum.<br>
  <br>
  Usage: sbnpoms_runnumber_injector.sh [options]<br>
  <br>
  Options:<br>
  <br>
  -h|-?|--help          - Print help message.<br>
  --fcl <fcl>           - Fcl file to append (default standard output).<br>
  --subruns_per_run <n> - Number of subruns per run (default 100).<br>
  --process <process>   - Specify process number (default $PROCESS).<br>
  --run <run>           - Specify base run number (default 1).<br>
</details>
