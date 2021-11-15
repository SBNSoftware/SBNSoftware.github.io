---
layout: page
title: SBN Production Available Samples wiki
subtitle: Wiki for SBN Production available samples
description: Wiki for the SBN Production Team samples bookkeeping 
hero_height: is-medium
# menubar: sbnprod_menu
toc: true
toc_title: SBN Production Available Samples
---



SBN Production Available Samples Page
==========================================

A list of samples that were requested and produced since Oct 2020 and the status of open requests can be checked at the [SBN Production Requests Database](https://docs.google.com/spreadsheets/d/17mFPGsP7gw4GRLSCwIL15QrtUnLVri_2k2Wjzhd6Ork/edit?usp=sharing). 

The spreadsheet contain the configuration files used, the code version, the statistics produced and the SAM dataset for access. Currently the production passes are organized in spreadsheet tabs. If necessary information can't be found, please email the production group at [sbn-mc-prod@fnal.gov](sbn-mc-prod@fnal.gov)

More information about the workflow can be found at the [SBN Analysis Infrastructure Workflow Management page](AnalysisInfrastructure/WorkflowManagement/workflow.md)


Monte Carlo official SBN Production Samples
--------------------------

SBND MC
--------------------------

| Sample Description | production push | approx. date production | release version | # Events | Sample type | Samweb definition | Notes |   
| --- | --- | --- | --- | --- | --- | --- | --- |
| BNB nue+cosmic | MC2021Bv1 | --- | v09_28_01_02 | 15000 | reco1 | official_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_intrnue_spill_gsimple-configh-v1_tpc_gen_g4_detsim_reco1_sbnd | --- |
| --- | --- | --- | --- | 14800 | reco2 | official_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configh-v1_tpc_reco2_sbnd | --- |
| --- | --- | --- | --- | 14800 | flat caf | official_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configh-v1_tpc_reco2_flat_caf_sbnd | The naming on this dataset is not properly set, it does have the nue only sample |
| BNB nue+cosmic | MC2021Bv1 | --- | v09_28_01_02 | 15000 | reco1 | official_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_intrnue_spill_gsimple-configh-v1_tpc_gen_g4_detsim_reco1_sbnd | --- |
| --- | --- | --- | --- | 15000 | reco2 | official_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configh-v1_tpc_reco2_sbnd | --- |
| --- | --- | --- | --- | 15000 | caf | official_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configh-v1_tpc_reco2_caf_sbnd | --- |
| BNB full-osc + cosmics | MC2021Bv1 | --- | v09_28_01_02 | --- | reco1 | test15_official_test15_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_fullosc_spill_gsimple-configh-v1_tpc_reco1_sbnd | --- |
| --- | --- | --- | --- | --- | reco2 | test_official_test_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_fullosc_spill_gsimple-configh-v1_tpc_reco2_sbnd | --- |
| --- | --- | --- | --- | --- | caf | test_official_test_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_fullosc_spill_gsimple-configh-v1_tpc_reco2_caf_sbnd | --- |
| BNB nu+cosmic | MC2021Bv1 | --- | v09_28_01_02 | --- | reco1 | official_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configh-v1_tpc_reco1_sbnd | --- |
| --- | --- | --- | --- | --- | reco2 | test100_official_test100_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configh-v1_tpc_reco2_sbnd | --- |
| --- | --- | --- | --- | --- | caf | test100_official_test100_MC2021Bv1_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configh-v1_tpc_reco2_caf_sbnd | --- |
| CAFs of SBND in-time cosmics, with SCE | MCP2021A | --- | v09_28_00 | 1144 | flat caf | official_MCP2021A_CAF_prodcorsika_proton_intime_filter_sc_concat_caf_sbnd | --- |
| CAFS of SBND BNB nu-only with SCE | MCP2021A | --- | v09_28_00 | 150000 | flat caf | official_MCP2021A_CAF_prodgenie_nu_singleinteraction_tpc_sbnd_flat_caf_sbnd	| --- |
| CAFs of SBND BNB neutrinos + cosmics, with SCE | MCP2021A | --- | v09_28_00 | 185300 | flat caf | official_MCP2021A_CAF_prodoverlay_corsika_cosmics_proton_genie_nu_spill_tpc_sbnd_flat_caf_sbnd		| --- |
| in-time cosmics, with SCE | MCP2021A | --- | v09_26_00 | --- | reco2 | official_MCP2021A_prodoverlay_corsika_cosmics_proton_genie_nu_spill_tpc_sbnd_reco2_sbnd	| --- |
| BNB neutrinos + cosmics, with SCE | MCP2021A | --- | v09_26_00 | --- | reco2 | official_MCP2021A_prodgenie_nu_singleinteraction_tpc_sbnd_reco2_sbnd	| --- |
| BNB nu-only, with SCE | MCP2021A | --- | v09_26_00 | --- | reco2 | official_MCP2021A_prodcorsika_proton_intime_filter_sce_reco2_sbnd	| --- |
| In time Cosmics | SBNWorkshop0421 | --- | v09_19_00_02 | 150627 | flat cafs | 	workshop_SBNWorkshop0421_prodcorsika_proton_intime_filter_flat_caf_sbnd		| --- |
| NuE Overlay | SBNWorkshop0421 | --- | v09_19_00_01 | 45700 | flat cafs | 	workshop_SBNWorkshop0421_prodoverlay_corsika_cosmics_proton_genie_intrnue_spill_gsimple-configf-v1_tpc_flat_caf_sbnd	| --- |
| BNB Overlay | SBNWorkshop0421 | --- | v09_19_00_01 | 286850 | flat cafs | workshop_SBNWorkshop0421_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configf-v1_tpc_flat_caf_sbnd	| --- |
| Intime cosmics | MCP2020A | --- | v09_09_00 | 151407 | reco2 | official_MCP2020A_prodcorsika_proton_intime_filter_reco2_sbnd	| --- |
| BNBnue | MCP2020A | --- | v09_09_00 | 72300 | reco2 | official_MCP2020A_prodgenie_intrnue_singleinteraction_tpc_gsimple-configf-v1_reco2_sbnd	| --- |
| BNBnue+cosmics | MCP2020A | --- | v09_09_00 | 45950 | reco2 | official_MCP2020A_prodoverlay_corsika_cosmics_proton_genie_intrnue_spill_gsimple-configf-v1_tpc-configf-v1_tpc_reco2_sbnd	| --- |
| BNB nu+cosmics | MCP2020A | --- | v09_09_00 | 287350 | reco2 | official_MCP2020A_prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configf-v1_tpc-configf-v1_tpc_reco2_sbnd	| --- |
| Cathode crossing muons | MCP2020A | --- |	v09_08_00 | 9700 | detsim | official_MCP2020A_prodsingle_mu_10GeV_cathodecrossing_detsim_sbnd	| --- |
| low energy electrons | MCP2020A | --- |	v09_08_00 | 19000 | detsim | official_MCP2020A_prodsingle_electron_1-50MeV_detsim_sbnd	| --- |
| Stopping muons from top | MCP2020A | --- |	v09_08_00 | 9500 | detsim | official_MCP2020A_prodsingle_muplus_stopping_fromtop_detsim_sbnd	| --- |
| BNB nu (single interaction) | MCP2020A | --- |	v09_09_00 | 198400 | reco2 | official_MCP2020A_prodgenie_nu_singleinteraction_tpc_gsimple-configf-v1_reco2_sbnd	| --- |


ICARUS MC
--------------------------

| Sample Description | production push | approx. date production | release version | # Events | Sample type | Samweb definition | Notes |   
| --- | --- | --- | --- | --- | --- | --- | --- |









| BNB nu-only | MCP2020A | --- | v09_09_02_01 | 113302 | reco2 | poms_icarus_prod_2020A_00_BNB_nu_v09_09_02_01_reco2		| --- |
| NuMI off axis for ICARUS | MCP2020A | --- | v09_07_00_prof | 70790 | reco2 | ICARUS_prod_2020A_00_numioffaxis_v09_10_01_reco2	| --- |
| COSMICs_ML | --- | --- | v09_07_00_prof	 | 543700 | detsim | ICARUS_poms_prod_cosmics_ML_v09_07_00_detsim	| --- |
| Intime cosmics | MCP2020A | --- | v09_09_00 | 189534 | reco2 | ICARUS_prod_2020A_00_intime_cosmic_v09_09_00_reco2_halfstats	| --- |
| --- | --- | --- | --- | 159538 | reco2SCEfix | ICARUS_prod_intime_cosmic_v09_09_02_01_reco2SCEfix | --- |
| BNB Nue+cosmics | MCP2020A | --- | v09_09_00 | 58339 | reco2 | ICARUS_prod_2020A_00_BNB_nue_cosmic_v09_09_00_reco2	| --- |
| --- | --- | --- | --- | 56514 | reco2SCEfix | ICARUS_prod_BNB_nue_cosmic_v09_09_02_01_reco2SCEfix | --- |
| BNB Nu+cosmics | MCP2020A | --- | v09_09_00 | 189775 | reco2 | ICARUS_prod_2020A_00_BNB_nu_cosmic_v09_09_00_reco2_halfstats	| --- |
| --- | --- | --- | --- | 165816 | reco2SCEfix | ICARUS_prod_BNB_nu_cosmic_v09_09_02_01_reco2SCEfix | --- |
| BNB nue | MCP2020A | --- | v09_09_00 | 50976 | reco2 | ICARUS_prod_2020A_00_BNB_nue_v09_09_00_reco2	| --- |
| --- | --- | --- | --- | 51092 | reco2SCEfix | ICARUS_prod_BNB_nue_v09_09_02_01_reco2SCEfix | --- |



ICARUS BNB nu-only sample	ICARUS	icaruscode v09_09_02_01	poms_icarus_prod_2020A_00_BNB_nu_v09_09_02_01_reco2				113302
Numi off axis + cosmic	ICARUS	icaruscode v09_17_01 in branch feature/gp_numiCosmicProton	icarus_numi_offaxis_cosmic_v09_17_01				47425
BNB Nue+cosmics, ICARUS	ICARUS	icaruscode v09_17_01	"poms_icarus_bnb_nue_cosmic_v09_17_01_reco2
"		poms_icarus_bnb_nue_cosmic_v09_17_01_caf		9190 /  8790
SBNworkshop2021_CAF_ICARUS_nu	ICARUS	icaruscode v09_19_00_02	workshop_SBNWorkshop0421_prodoverlay_corsika_cosmics_cosmics_proton_genie_nu_spill_gsimple-config_caf_icarus				162896
SBNworkshop2021_CAF_ICARUS_nue	ICARUS	icaruscode v09_19_00_02	workshop_SBNWorkshop0421_prodoverlay_corsika_cosmics_cosmics_proton_genie_intrnue_spill_gsimple-config_caf_icarus				53250
SBNworkshop2021_CAF_ICARUS_cosmics	ICARUS	icaruscode v09_19_00_02	workshop_SBNWorkshop0421_prod_corsika_intime_cosmics-config_caf_icarus				112223
Event selection, BNB Nu+ intime cosmics, ICARUS 	ICARUS	icaruscode v09_17_00 -q e19:prof	ICARUS_event_selection_BNB_NuPlus_intime_cosmics_v09_17_00_detsim				11175
Event selection, intime cosmics, ICARUS	ICARUS	icaruscode v09_17_00 -q e19:prof	ICARUS_event_selection_intime_cosmics_v09_17_00_detsim				14939
ICARUS NU+Cosmics Overburden	ICARUS	icaruscode v09_27_00_02	ICARUS_prod_2021A_00_intime_outoftime_ovb_v09_27_00_02				31489
ICARUS Intime cosmics with overburden	ICARUS	icaruscode v09_27_00_02	ICARUS_prod_2021A_00_nu_outoftime_ovb_v09_27_00_02				32525
ICARUS, BNB nu+cosmics, 	ICARUS	v09_28_01_01_01	IcarusProd2021B_BNB_Nu_Cosmics_v09_28_01_01_01_reco1				51827
ICARUS, BNB nu+cosmics, 	ICARUS	v09_28_01_01_01	IcarusProd2021B_BNB_Nu_Cosmics_v09_28_01_01_01_reco2	IcarusProd2021B_BNB_Nu_Cosmics_v09_28_01_01_01_CalibTuples	IcarusProd2021B_BNB_Nu_Cosmics_v09_28_01_01_01_caf		50478 /  None / 49872
ICARUS, In-time Cosmics, 	ICARUS	v09_28_01_01_01	IcarusProd2021B_Intime_Cosmic_v09_28_01_01_01_reco1				50479
ICARUS, In-time Cosmics,	ICARUS	v09_28_01_01_01	IcarusProd2021B_Intime_Cosmic_v09_28_01_01_01_reco2	IcarusProd2021B_Intime_Cosmic_v09_28_01_01_01_CalibTuples	IcarusProd2021B_Intime_Cosmic_v09_28_01_01_01_caf		50452 /  None  /  50452
ICARUS, BNB full-osc, 	ICARUS	v09_28_01_01_01	IcarusProd2021B_BNB_FullOsc_Cosmics_v09_28_01_01_01_reco1				16091
ICARUS, BNB full-osc,	ICARUS	v09_28_01_01_01	IcarusProd2021B_BNB_FullOsc_Cosmics_v09_28_01_01_01_reco2	IcarusProd2021B_BNB_FullOsc_Cosmics_v09_28_01_01_01_CalibTuples	IcarusProd2021B_BNB_FullOsc_Cosmics_v09_28_01_01_01_caf		15960 /  None /  9048
ICARUS , BNB nue+cosmic,	ICARUS	v09_28_01_01_01	IcarusProd2021B_BNB_Nue_Cosmics_v09_28_01_01_01_reco1				16598
ICARUS , BNB nue+cosmic, 	ICARUS	v09_28_01_01_01	IcarusProd2021B_BNB_Nue_Cosmics_v09_28_01_01_01_reco2	IcarusProd2021B_BNB_Nue_Cosmics_v09_28_01_01_01_CalibTuples	IcarusProd2021B_BNB_Nue_Cosmics_v09_28_01_01_01_caf		15471 / None /  15471
ICARUS, NuMI + cosmic MC, 	ICARUS	v09_28_01_01_01	IcarusProd2021B_NuMI_Nu_Cosmics_v09_28_01_01_01_reco1				60278
ICARUS, NuMI + cosmic MC, 	ICARUS	v09_28_01_01_01	IcarusProd2021B_NuMI_Nu_Cosmics_v09_28_01_01_01_reco2	IcarusProd2021B_NuMI_Nu_Cosmics_v09_28_01_01_01_CalibTuples	IcarusProd2021B_NuMI_Nu_Cosmics_v09_28_01_01_01_caf		59625 / none / 59625
NuMI nue + cosmics	ICARUS	icaruscode v09_28_01_01_01	IcarusProd2021B_NuMI_Nue_Cosmics_v09_28_01_01_01_reco2	IcarusProd2021B_NuMI_Nue_Cosmics_v09_28_01_01_01_CalibTuples	IcarusProd2021B_NuMI_Nue_Cosmics_v09_28_01_01_01_caf		10020 / none / 10020


### Notes on samples ###
* MC2020A
  * SBND Intime Cosmic sample in MCP2020A (and possibly older productions)
    * bug in LArSoft can lead to issues where the best matching particle is non existent
    * more information: [DocDB:20894](https://sbn-docdb.fnal.gov/cgi-bin/private/ShowDocument?docid=20894) 

Processed Data SBN Production Samples
--------------------------

ICARUS DATA
--------------------------
              

