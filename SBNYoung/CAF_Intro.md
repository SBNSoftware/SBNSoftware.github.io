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

CAFs consist of a series of branches containing different types of information. The top level currently (29-09-2021) consists of three things: 
- hdr (*header* contains things like the run and subrun information)
- mc (contains monte carlo truth information) 
- reco (contains the reconstructed output information). 

Each of these then has its own structure with more types of information. The best way of understanding this structure is either to open a `.flat.caf.root` file in a ROOT `TBrowser` and *browse* the contents or use the [sbnanaobj/StandardRecord](https://github.com/SBNSoftware/sbnanaobj/tree/develop/sbnanaobj/StandardRecord) directory where this structure is defined.

#### CAF Tutorials

The best way to get to grips with the CAFs is to view and follow along with a series of tutorials delivered by Ed Tyley, Jacob Larkin, Gray Putnam, Diana Mendez & Chris Backhouse at the April 2021 SBN Analysis Workshop. They cover all sorts of information from making CAFs and understanding their structure to doing event selection style analysis work and oscillation fits.
- The tutorial recordings can be accessed using the links in [this](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=21546) document.
- and the slides for each talk can be found at the workshop's [docDB page](https://sbn-docdb.fnal.gov/cgi-bin/sso/DisplayMeeting?conferenceid=9813) in the tutorials sections.
