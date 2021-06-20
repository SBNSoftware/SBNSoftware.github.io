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
  --fclname &lt;fcl&gt;     - Wrapped fcl file.<br>
  --wrappername &lt;fcl&gt; - Wrapper fcl file.<br>
  
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
  --fcl &lt;fcl&gt;           - Fcl file to append (default standard output).<br>
  --subruns_per_run &lt;n&gt; - Number of subruns per run (default 100).<br>
  --process &lt;process&gt;   - Specify process number (default $PROCESS).<br>
  --run &lt;run&gt;           - Specify base run number (default 1).<br>
</details>
