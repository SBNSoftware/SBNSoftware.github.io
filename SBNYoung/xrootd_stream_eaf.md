---
layout: page
title: Streaming ROOT files over XRootD with uproot (EAF)
---

# Streaming ROOT files over XRootD (uproot)

Read ROOT files — CAFs, ntuples, LArCV, ... — straight from dCache over the
XRootD protocol with [uproot](https://uproot.readthedocs.io). uproot fetches only
the branches and baskets you ask for, so you stream just the bytes you need: no
local copy and no dependency on the `/pnfs` mount. Works anywhere with a network
connection, including the Elastic Analysis Facility (EAF).

This is the ROOT counterpart of [Streaming HDF5 over XRootD](HDF5_stream_eaf.md).

## 1. Install with pixi

```bash
# inside a pixi project (run `pixi init` first if you need one)
pixi add uproot fsspec-xrootd
```

`fsspec-xrootd` provides the `root://` transport; uproot uses it automatically.
Run Python with `pixi run python ...` (or `pixi shell`).

## 2. Get a bearer token

```bash
htgettoken -a htvaultprod.fnal.gov -i sbnd
```

The XRootD client picks it up automatically. Re-run it if you hit
`Auth failed: No protocols left to try`.

## 3. Get a file's XRootD URL

```bash
samweb get-file-access-url <filename> --schema=root
```

prints e.g. `root://fndca1.fnal.gov:1094//pnfs/fnal.gov/usr/sbn/.../file.root`.

## 4. Open and read (stream)

```python
import uproot

url = "root://fndca1.fnal.gov:1094//pnfs/fnal.gov/usr/sbn/.../file.root"

with uproot.open(url) as f:
    print(f.keys(cycle=False))         # objects in the file (TTrees, ...)

    tree = f["opflash_tpc0_tree"]      # pick a TTree (use your own tree name)
    print(tree.num_entries)
    tree.show()                        # list branches and their types

    # read only the branches you name -> only those are streamed
    arr = tree.arrays(["_run", "_subrun", "_event"])
    print(arr["_event"])

    # a single branch; jagged (per-event) data comes back as an awkward Array
    times = tree["_flash_v._time"].array()
```

## 5. Stream large files in chunks

For files too big to hold in memory, `uproot.iterate` reads a few branches at a
time, batch by batch:

```python
import uproot

url = "root://fndca1.fnal.gov:1094//pnfs/fnal.gov/usr/sbn/.../file.root"

for batch in uproot.iterate({url: "opflash_tpc0_tree"},
                            ["_event", "_flash_v._time"],
                            step_size=1000):
    ...   # process `batch` (an awkward Array holding this chunk)
```

## Note: custom C++ objects (LArCV / art)

uproot reads standard ROOT types and many custom classes, but it cannot
deserialize objects written with ROOT *memberwise* streaming. In a LArCV file the
`std::vector<larcv::Particle>` inside the `particle_*` / `cluster3d_*` trees
raises `NotImplementedError: memberwise serialization`. Their event metadata
(`_run`, `_subrun`, `_event`) and simpler products (`opflash_*`, `crthit_*`) read
fine.

For the full SPINE particle/interaction content, read the SPINE HDF5 output
instead — see [Streaming HDF5 over XRootD](HDF5_stream_eaf.md).
