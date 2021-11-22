---
layout: page
title: ReleaseNotes093701
toc: true
---

-----------------------------------------------------------------------------
| v09.37.01 | 22 Nov 2021 | [ReleaseNotes](ReleaseNotes093701.html) |
| --- | --- | --- |



sbndcode v09_37_01 Release Notes
=======================================================================================

[List of sbndcode releases](List_of_SBND_code_releases.html)

Download instructions for [sbndcode v09_37_01](http://scisoft.fnal.gov/scisoft/bundles/sbnd/v09_37_01/sbndcode-v09_37_01.html)

Purpose
---------------------------------------------------

* Release for SBN-2021C

New features
---------------------------------------------------

* sbndcode PR 207:
  * Getting CRT to work with the new LArG4
  * This PR contains changes to sbndcode to allow the CRT to work with the new LArG4. This includes changes to the CRT detsim module and geometry. The geometry is changed to create individual logical volumes for each CRT scintillating strip (AuxDetSensitives). The strips are combined into an array (AuxDet).
  * This PR resolves issues #137 and #143.

* sbndcode PR 214:
  * created PMT Hardware Trigger Simulation in Trigger folder and modified HitDumper module to analyze it
  * This is a module to simulate the PMT hardware trigger on simulated data. It takes a largeant file with optical detectors waveforms and produces a vector whose index is time within the trigger (beam) window and content is number of PMT pairs passing the trigger threshold.
  * More information can be found at: https://sbnsoftware.github.io/sbndcode_wiki/SBND_Trigger and sbn-docdb: 23922
  * Corresponds with https://github.com/SBNSoftware/sbnobj/pull/32
  
* sbndcode PR 215:
  * Add CRT simulation to InTimes, Dirt, CRT-filtered samples
  * This PR adds CRT simulation to InTimes, Dirt and CRT-filtered gen and g4 stages, resolves issue #212

* sbndcode PR 216:
  * Deconvolution + HitFinder for XArapucas
  * This PR is resolves to the issue #198.
  * I added an electronics variable to the HitFinder and Deconvolution modules so we can distinguish daphne XArapucas from PMTs.
  * In the OpHitfinder side, I made an ad-hoc clock which is just a copy of the OpticalClock substituting the default optical frequency (500MHz) for the daphne readouts frequency (80MHz). The type of electronics then decides which clock is passed to larana algorithm.
  * In this approach, deconvolved PMT and XArapuca waveforms are calculated separately.

* sbndcode PR 218:
  * Reorganise dirt workflows to reduce fcl combinatorics
  * With LArSoft v09_36_00 we can now run multiple G4 instances in a single fcl. This means that we can now reorganise the dirt overlay fcls so that a single G4 fcl can be used for all dirt samples (prodgenie or prodoverlay), reducing future maintenance burden etc.

* sbndcode PR 220:
  * Temporarily disable optical hybrid mode
  * This PR turns off optical simulation in the OUT-TPC volume (issue #219)

* sbndcode PR 221:
  * move cafmaker fcls from sbncode to sbndcode as suggested in sbncode issue 170
  * corresponds with SBNSoftware/sbncode#170

* sbndcode PR 222:
  * Update to the parameter that switches between Ideal and test(data driven) simulation of optical waveforms (detsim).
  * With this PR we can tune XArapucas and PMTs separately as each one has its own variable (replaced SinglePEmodel with ArapucaSinglePEmodel and PMTSinglePEmodel).
  * As the ideal response is outdated for XArapucas, I've switched the test response to default for the upcoming production.
  * Ideal response for PMTs remains as default.

* sbndcode PR 223:
  * Add fhicl files for production (PDS)
  * This PR adds fhicl files for MC Production (PDS deconvolution testing samples).

* sbndcode PR 224:
  * Update fcl_file_checks.list (CI)
  * Following SBNSoftware/sbncode#197 and #221 we can now begin testing the new caf fcl that will be used in production workflows.

* sbndcode PR 226:
  * Improvements to fcl checks
  * Adds the correctly formatted error strings to pass to the data_production_stats` log file. This will mean the dashboard and email responses will contain a reason for failure / warning now like the other regression tests.
  * Cleans up the log file output slightly
  * Ensures the scripts doesn't fetch the old references when creating new ones (it doesn't need to).

* sbndcode PR 227:
  * FHiCL for Commissioning Samples
  * This PR adds FHiCLs reco1_sce_comm.fcl and reco2_sce_comm.fcl, which run reconstruction without dropping raw waveforms.
  * reco1_sce_comm.fcl also runs the HitDumper module, which saves and analysis tree to the hist_* auxiliary file.
  * Also, detector simulation for the commissioning samples should be made with detsim_comm_sbnd.fcl, which has a low PMT threshold to save the full waveform.

* sbndcode PR 229:
  * Removing duplicated commissioning fcls

Bug fixes
---------------------------------------------------

* sbndcode PR 228:
   * Fix for CRT detsim and reco
   * With PR #207 we are using a CRT geometry that uses the same logical volumes for CRT strips of the same type. This caused the CRT detsim and reco to always pick the first CRT strip declared in the GDML.
   * This PR fixes this problem by changing the logic in which the CRT geometry nodes are found. Now, the unique AuxDet volume is identified first, and then the code descends from it to find the strip (AuxDetSensitive).

Updated dependencies
---------------------------------------------------

* sbncode v09_37_01
* larsoft v09_37_01

Change List
==========================================

sbndcode
---------------------------------------------------

* 2021-11-22  Patrick Green : Merge branch 'release/v09_37_01'
* 2021-11-22  Patrick Green : Update to v09_37_01
* 2021-11-22  Patrick Green : Merge pull request #229 from SBNSoftware/mdeltutt_comm_patch
* 2021-11-22  Marco Del Tutto : Removing duplicated commissioning fcls
* 2021-11-22  Patrick Green : Merge pull request #227 from SBNSoftware/mdeltutt_commissioning
* 2021-11-22  Patrick Green : Merge pull request #215 from SBNSoftware/mdeltutt_crt_issue212
* 2021-11-20  Patrick Green : Merge pull request #228 from SBNSoftware/mdeltutt_crtstrips
* 2021-11-19  Marco Del Tutto : Retrive all the CRT geometry nodes starting from the AuxDet, because AuxDetSensitives of the same type now all have the same name
* 2021-11-19  Marco Del Tutto : Add a check on the stripName
* 2021-11-19  Marco Del Tutto : Merge branch 'mdeltutt_crt_issue212' into mdeltutt_commissioning
* 2021-11-19  Marco Del Tutto : Override output file names with prodgenie_cosmic_rockbox
* 2021-11-19  Marco Del Tutto : Remove extra lines added by a previous merge
* 2021-11-19  Marco Del Tutto : Merge branch 'mdeltutt_crt_issue212' into mdeltutt_commissioning
* 2021-11-19  Marco Del Tutto : Merge branch 'develop' into mdeltutt_crt_issue212
* 2021-11-19  Patrick Green : Merge pull request #207 from SBNSoftware/feature/ilepetic_crtfix
* 2021-11-19  Patrick Green : Merge branch 'develop' into feature/ilepetic_crtfix
* 2021-11-19  Patrick Green : Merge pull request #226 from SBNSoftware/feature/hlay_add_fcl_checks_messages
* 2021-11-18  Marco Del Tutto : Add reco fcls for commissioning, they do not drop raw waveforms
* 2021-11-18  Marco Del Tutto : Reduce PMT threshold
* 2021-11-18  Marco Del Tutto : Merge branch 'mdeltutt_crt_issue212' into mdeltutt_commissioning
* 2021-11-18  Patrick Green : Merge pull request #216 from SBNSoftware/bugfix/rodrigoa_hit_finder_xarapucas
* 2021-11-18  Henry Lay : Improve handling of reference updates & clean output
* 2021-11-18  Henry Lay : Remember to include the error code
* 2021-11-18  Marco Del Tutto : Fix conflicts
* 2021-11-18  Marco Del Tutto : Add genericcrtouttime to simulate path and drop AuxDetHits
* 2021-11-18  Henry Lay : Use environment variables properly
* 2021-11-18  Marco Del Tutto : Add EW and NS CRT-filter g4 fcls with SCE
* 2021-11-18  Marco Del Tutto : Move commissioning fcls to their own fcls dir
* 2021-11-18  Patrick Green : Merge pull request #224 from SBNSoftware/henrylay97-patch-1
* 2021-11-18  Henry Lay : Update fcl_file_checks.list
* 2021-11-18  Patrick Green : Merge pull request #223 from SBNSoftware/feature/fnicolas_decofhicl
* 2021-11-18  Patrick Green : Merge pull request #221 from SBNSoftware/feature/jlarkin_cafmaker_fcls
* 2021-11-18  Henry Lay : Add reporting functionality to fcl file checks
* 2021-11-18  Wesley : update signature of CRTChannelMapAlg::PositionToAuxDetChannel to not use tolerance; tolerance hard-coded in the function
* 2021-11-17  Marco Del Tutto : Merge branch 'mdeltutt_crt_issue212' into mdeltutt_commissioning
* 2021-11-17  Marco Del Tutto : Also merge AuxDetHits
* 2021-11-17  Marco Del Tutto : Remove spurious line and erase unused processes
* 2021-11-17  fran-nicar : Add g4 fhicl that saves MC trajectory points for cosmics
* 2021-11-17  fran-nicar : Add and modify PDS deconvolution fhicl files
* 2021-11-16  fran-nicar : Disable optical hybrid mode in g4 fhicls
* 2021-11-16  fran-nicar : Comment out pdfastsimout and ionandscintout
* 2021-11-16  Rodrigo Alvarez Garrote : replace the new variables each in its algorithm, set the test SER(from data) to defult for XArapucas and ideal SER for PMTs
* 2021-11-16  Rodrigo Alvarez Garrote : renamed fhicl parameters
* 2021-11-15  Edward Tyley : Reorganise dirt workflows to reduce fcl combinatorics
* 2021-11-12  eyandel : remove unused variables
* 2021-11-11  eyandel : added more more documentation and cleaned up code
* 2021-11-11  eyandel : created PMT Hardware Trigger Simulation in Trigger folder and modified HitDumper module to analyze it
* 2021-11-12  Patrick Green : Update to v09_36_00
* 2021-11-10  Edward Tyley : Drop more products in dirt workflow inkeeping with PR 206
* 2021-11-05  Edward Tyley : Update split_tpc_nu output patterns to retain the input file names
* 2021-11-05  Edward Tyley : Add sce version of dirt g4 fcls
* 2021-11-05  Edward Tyley : Move splitting dirt/tpc output to dedicated fcl that can be run after any previous dirt fcl
* 2021-11-05  Edward Tyley : Update path of GENIE rockbox max path length
* 2021-11-05  Edward Tyley : Update SimEnergyDep Filter
* 2021-10-28  Edward Tyley : Tidy rockbox fcls
* 2021-10-28  Edward Tyley : Tidy merge sim sources fcls for dirt overlay samples
* 2021-10-28  Edward Tyley : Add comments to rockbox overlay fcls
* 2021-10-27  Edward Tyley : First commit of working prodoverlay rockbox workflow
* 2021-10-27  Edward Tyley : Update filters for rockbox
* 2021-10-20  Edward Tyley : Create split output rockbox fcl
* 2021-10-20  Edward Tyley : First commit of GENIE rockbox fcls for simulating dirt
* 2021-11-08  Henry Lay : Turn off genie random seed flag
* 2021-11-05  Marco Del Tutto : Drop the SimEnergyDeposits made by LArG4 in standard g4 workflow
* 2021-11-08  Vito Di Benedetto : Update INPUT_STREAM for fcl_checks regression tests
* 2021-11-08  Henry Lay : Utilise vtx histogram range parameter
* 2021-11-08  Henry Lay : Correct fcl path
* 2021-11-08  Henry Lay : Update fcl_file_checks.list
* 2021-11-08  Henry Lay : Tiny tidy
* 2021-11-05  Vito Di Benedetto : cosmetic change
* 2021-11-05  Vito Di Benedetto : Configure fcl_checks test to let CI mechanism to handle reference files
* 2021-11-05  Henry Lay : Make the output file easier to parse
* 2021-11-04  Henry Lay : Correct access to references
* 2021-11-04  Henry Lay : Small corrections
* 2021-11-04  Henry Lay : Ensure sensible structure within tar
* 2021-11-04  Henry Lay : Update to use tarball
* 2021-09-20  Henry Lay : Add check for existence of reference
* 2021-09-20  Henry Lay : Change list of fcl files checked
* 2021-09-01  Henry Lay : Fix indentation
* 2021-08-02  Henry Lay : Create fcl_checks test for the ci
* 2021-11-03  Will Foreman : Set SimChannel module as simdrift in main backtracker service settings
* 2021-11-05  Patrick Green : Update to v09_35_01
* 2021-11-17  Jacob Larkin : Remove unecessary includes and source block from cafmakerjob_sbnd.fcl
* 2021-11-17  Marco Del Tutto : Add CRR strip volume name to mergesimsources
* 2021-11-17  Marco Del Tutto : Fix conflicts
* 2021-11-17  Patrick Green : Merge pull request #220 from SBNSoftware/feature/fnicolas_issue219
* 2021-11-17  Rodrigo Alvarez Garrote : Merge pull request #222 from SBNSoftware/feature/rodrigoa_split_SErs
* 2021-11-16  Rodrigo Alvarez Garrote : replace the new variables each in its algorithm, set the test SER(from data) to defult for XArapucas and ideal SER for PMTs
* 2021-11-16  Jacob Larkin : Remove commented out producers. Add comment about producers moved to common defs
* 2021-11-16  fran-nicar : Disable optical hybrid mode in g4 fhicls
* 2021-11-16  Rodrigo Alvarez Garrote : renamed fhicl parameters
* 2021-11-16  Jacob Larkin : Fix order in event weight fcl. Should run event weights before cafmaker
* 2021-11-16  Jacob Larkin : Move cafmaker fcls from sbncode to sbndcode
* 2021-11-16  fran-nicar : Comment out pdfastsimout and ionandscintout
* 2021-11-16  Patrick Green : Merge pull request #218 from SBNSoftware/feature/etyley_dirt
* 2021-11-15  Marco Del Tutto : Merge branch 'mdeltutt_crt_issue212' into mdeltutt_commissioning
* 2021-11-15  Marco Del Tutto : Merge branch 'feature/ilepetic_crtfix' into mdeltutt_crt_issue212
* 2021-11-15  Marco Del Tutto : Use Y, X, BERN, MINOS physical volumes for all the CRT strips
* 2021-11-15  Marco Del Tutto : Merge branch 'mdeltutt_crt_issue212' into mdeltutt_commissioning
* 2021-11-15  Marco Del Tutto : Add genericcrt to g4 fcls with CRT filter
* 2021-11-15  Marco Del Tutto : Add reco fcl for commissioning
* 2021-11-15  Edward Tyley : Reorganise dirt workflows to reduce fcl combinatorics
* 2021-11-15  Patrick Green : Merge pull request #214 from SBNSoftware/feature/eyandel_pmttrigger
* 2021-11-12  Marco Del Tutto : Add generic CRT to dirt fcls.
* 2021-11-12  Marco Del Tutto : Fix conflict
* 2021-11-12  Rodrigo Alvarez Garrote : Frecuency value loaded from fhicl in deconv algorithm
* 2021-11-12  Patrick Green : Merge tag 'v09_36_00' into develop
* 2021-11-12  Rodrigo Alvarez Garrote : Merge branch 'rodrigoa_hitfinder_update'
* 2021-11-12  eyandel : remove unused variables
* 2021-11-11  eyandel : added more more documentation and cleaned up code
* 2021-11-11  eyandel : created PMT Hardware Trigger Simulation in Trigger folder and modified HitDumper module to analyze it
* 2021-11-10  Marco Del Tutto : Improve comments
* 2021-11-10  Marco Del Tutto : Remove special geometry for noophybrid configuration. We will use the standard geometry also for noophybrid.
* 2021-11-10  Marco Del Tutto : Merge branch 'feature/ilepetic_crtfix' into mdeltutt_crt_issue212
* 2021-11-10  Marco Del Tutto : Clean up error message
* 2021-11-10  Ivan Lepetic : Adding gdml files with shielding
* 2021-11-09  Marco Del Tutto : Clean up error message
* 2021-11-09  Marco Del Tutto : Fix labels that identify CRT AuxDets
* 2021-11-09  Marco Del Tutto : Add CRT to the cosmic intime workflow
* 2021-11-09  Ivan Lepetic : Dropping AuxDetHits after G4 stage
* 2021-11-08  Ivan Lepetic : Changing G4 label for CRT detsim
* 2021-11-05  Ivan Lepetic : Re enable CRT detsim
* 2021-11-05  Ivan Lepetic : Put CRT translation into G4 stage
* 2021-11-05  Ivan Lepetic : Include geometry info
* 2021-11-03  Ivan Lepetic : Modifications to CRT detsim for new LArG4

sbndutil
---------------------------------------------------

* 2021-11-22  Patrick Green : Merge tag 'v09_37_01' into develop
* 2021-11-22  Patrick Green : Merge branch 'release/v09_37_01'
* 2021-11-22  Patrick Green : Update to v09_37_01
* 2021-11-12  Patrick Green : Merge tag 'v09_36_00' into develop
