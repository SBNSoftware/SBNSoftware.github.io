---
layout: page
title: CAFs
---


# Introduction to the Common Analysis Framework (CAFs)

Whether MC or Data, the full reconstruction artroot files are huge. This means running an analysis with them or producing a set of analysis trees from them can take a very long time. This will become increasingly true as time goes on. Therefore, it is useful to have a set of reduced analysis tree files that still retain all the useful information required to do a sophisticated analysis whilst dropping the heavier, less analysis-relevant information like individual wire repsonses. Having a single type of analysis file also allows for more synchronisation in different analyses.

We call these tree files CAFs. CAF also provides a structure for doing analysis called CAFAna, however CAFs can be used in other frameworks too.

#### Making CAFs

A CAF can be produced from a reco2 file with a `lar` command  
```
lar -c cafmakerjob_sbnd.fcl -s your_reco2_file_here.root
```  
Note there are a range of alternative cafmaker fcl files found in [sbncode/fcl/caf/sbnd](https://github.com/SBNSoftware/sbncode/tree/develop/fcl/caf/sbnd) for SBND and in [icaruscode/fcl/caf](https://github.com/SBNSoftware/icaruscode/tree/develop/fcl/caf) for ICARUS.

You then normally want to produce a flat-caf using the following script available by setting up `sbnana`  
```
flatten_caf normal_caf_file.caf.root flat_caf_file_name.flat.caf.root
```
However, often for analysis work you will be using a pre-made set of CAFs produced by the production team and available via a SAM definition.

#### Understanding CAF structure

The CAF's have been built by a wide number of analyzers to contain the information useful for them. The file structure is *not* pristene (nor is it intended to be). One should inspect the variables they use to make sure they are sensible. Also! If there is information in the CAF's that is missing and necessary for your analysis, you are heavily encouraged to contribute them to the structure. 

CAFs consist of a series of branches containing different types of information. These branches are built from the C++ class [StandardRecord](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/StandardRecord.h) in the [sbnanaobj](https://github.com/sbnsoftware/sbnanaobj) repository. Each entry in the branch consists of one detector readout.

Going through some of the important branch structures in StandardRecord:
- [hdr](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRHeader.h): *header*, contains things like the run and subrun information
- [mc](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRTruthBranch.h): contains monte carlo truth information
  - [nu](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRTrueInteraction.h): list of neutrino interactions in readout
    - [prim](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRTrueParticle.h): list of primary particles produced in the neutrino interaction
    - E: neutrino energy [GeV]
    - ... others
  - [prtl](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRMeVPrtl.h): list of decays from the MeVPrtl generator
    - E: Portal particle energy [GeV]
    - ... others
- [true_particles](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRTrueParticle.h): list of all true particles (taken from G4) in the readout
- [slc](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRSlice.h): list of reconstructed slices in the readout
  - [reco](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRSliceRecoBranch.h): reconstructed objects in the slice
    - [trk](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRTrack.h): list of tracks in the slice
      - [truth](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRTrackTruth.h): truth matching for the track
        - [p](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRTrueParticle.h): true particle best matched to the track
          - *NOTE* about computing an efficiency: the list of particles truth matched to a track excludes those with no reconstructed track. Thus, the denomenator of any efficiency should always be taken from the true_particles branch, which has the list of all particles.
      - [chi2pid](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRTrkChi2PID.h): per-plane particle ID of track
      - len: track length [cm]
      - ... others
    - [shw](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRShower.h): list of tracks in the slice
      - [truth](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRTrackTruth.h): truth matching for the track
        - [p](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRTrueParticle.h): true particle best matched to the track
          - *NOTE* about computing an efficiency: the list of particles truth matched to a shower excludes those with no reconstructed shower. Thus, the denomenator of any efficiency should always be taken from the true_particles branch, which has the list of all particles.
      - ... others
    - [stub](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRStub.h): list of stubs (low energy hadronic objects) in the slice
  - [fmatch](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRFlashMatch.h): flash match information for the slice
  - [truth](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRTrueInteraction.h): best matched neutrino to the slice (if there is one)
    - *NOTE* about computing an efficiency: the list of neutrinos truth matched to a slice excludes those with no reconstructed slice. Thus, the denomenator of any efficiency should always be taken from the mc.nu branch, which has the list of all neutrinos.
  - ... others
- [crt_hits](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRCRTHit.h): list of CRT hits in the readout
- [crt_tracks](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/SRCRTTrack.h): list of CRT tracks in the readout

Each of these then has its own structure with more types of information. The best way of understanding this structure is either to open a `.flat.caf.root` file in a ROOT `TBrowser` and *browse* the contents or use the [sbnanaobj/StandardRecord](https://github.com/SBNSoftware/sbnanaobj/tree/develop/sbnanaobj/StandardRecord) directory where this structure is defined.

#### CAF Tutorials

The best way to get to grips with the CAFs is to view and follow along with a series of tutorials delivered by Ed Tyley, Jacob Larkin, Gray Putnam, Diana Mendez & Chris Backhouse at the April 2021 SBN Analysis Workshop. They cover all sorts of information from making CAFs and understanding their structure to doing event selection style analysis work and oscillation fits.
- The tutorial recordings can be accessed using the links in [this](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=21546) document.
- and the slides for each talk can be found at the workshop's [docDB page](https://sbn-docdb.fnal.gov/cgi-bin/sso/DisplayMeeting?conferenceid=9813) in the tutorials sections.
