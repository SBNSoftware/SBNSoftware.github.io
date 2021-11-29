# ICARUS Keepup Processing

# Data Stream

Data stream is a metadata field intended to identify different output streams that are produced by the same program. The earliest stage where the streaming can be applied is at the DAQ level. This may generate multiple DAQ streams based on trigger information.
For example, we write the BNB and NuMI beam events to different DAQ streams.

Currently, we have 5 pre-defined data streams implemented at the DAQ level which also depends on 2 types of run configuration.

The first configuration, called "Majority trigger", is a hardware trigger based on a majority of PMT light signals in coincidence with the beam gate. There are 4 streams associated with this configuration

- bnb
- numi
- offbeambnb
- offbeamnumi

The second configuration, called the Minimum Bias, collects events in coincidence with the beam spills but ignoring the PMT light requirement. The data stream associated with this configuration is called the "unknown" stream and it contains a mix of the BNB and NuMI beam spills. The raw files categorized as the "unknown" stream will then split into file with only the BNB beam spills and file with only the NuMI beam spills.

Production uses the `data_stream`, `run_number`, and `data_tier` to construct different datasets to run through the POMS workflows in the keepup processing as shown below:

![Screen Shot 2021-11-24 at 3.52.50 PM.png](Screen_Shot_2021-11-24_at_3.52.50_PM.png)

Currently we are using 1 standard fcl file in the stage 0 reconstruction `stage0_multiTPC_splitstream_nofilter_icarus.fcl`

Meanwhile, there will be 2 different fcl files used in the stage 1 reconstruction depending on the beam spill or trigger type. We are running the `stage1_multiTPC_nofilter_icarus_gauss` for the BNB trigger/beam spill stage 0 files and `<new_numi_stage1_fcl>` for the NuMI trigger/beam spill stage 0 files.
