---
layout: page
title: Streaming HDF5 over XRootD (EAF)
---

# Streaming HDF5 over XRootD

Read and write analysis HDF5 (`.h5`) files — e.g. SPINE output — straight from
dCache over the XRootD protocol. No local copy and no dependency on the `/pnfs`
mount, so it works anywhere with a network connection, including the Elastic
Analysis Facility (EAF).

Two packages do the work: **`fsspec-xrootd`** streams the remote file and
**`h5py`** reads/writes HDF5 through that stream.

## 1. Install with pixi

```bash
# inside a pixi project (run `pixi init` first if you need one)
pixi add h5py fsspec fsspec-xrootd
```

Package docs: [h5py](https://www.h5py.org/),
[fsspec](https://filesystem-spec.readthedocs.io/en/latest/),
[fsspec-xrootd](https://scikit-hep.org/fsspec-xrootd/index.html).

Then run Python in the environment with `pixi run python ...` (or `pixi shell`).

## 2. Get a bearer token

dCache XRootD access needs a WLCG token. Mint one for sbnd:

```bash
htgettoken -a htvaultprod.fnal.gov -i sbnd
```

The XRootD client finds it automatically. Tokens are short-lived — re-run this
if you hit `Auth failed: No protocols left to try`.

## 3. Get a file's XRootD URL

For a SAM-catalogued file, ask samweb for its `root://` URL:

```bash
samweb get-file-access-url <filename> --schema=root
```

Alternatively, `ifdh` can translate a filename (or a `/pnfs` path) too:

```bash
ifdh getUrl <filename> root
```

Either prints something like:

```
root://fndca1.fnal.gov:1094//pnfs/fnal.gov/usr/sbnd/.../file.h5
```

Paste that into the code below.

## 4. Read a file (stream)

```python
import fsspec, h5py

url = "root://fndca1.fnal.gov:1094//pnfs/fnal.gov/usr/sbnd/.../file.h5"

with fsspec.open(url, "rb") as stream:
    with h5py.File(stream, "r") as f:
        print(list(f.keys()))     # top-level datasets / groups
        data = f["data"][:]       # read a dataset into memory
```

## 5. Write a file (stream)

h5py needs random-access seeks while writing, which a write-mode XRootD stream
does not support. So build the file in memory, then write it out in one pass:

```python
import io, fsspec, h5py, numpy as np

url = "root://fndca1.fnal.gov:1094//pnfs/fnal.gov/usr/sbnd/persistent/users/<user>/hdf5/out.h5"

buf = io.BytesIO()
with h5py.File(buf, "w") as f:           # build the HDF5 in memory
    f.create_dataset("data", data=np.arange(10))

with fsspec.open(url, "wb") as stream:   # stream it to dCache in one write
    stream.write(buf.getvalue())
```

Write only where your token allows — your `persistent` or `scratch` user area.
Read it back with the snippet in section 4.
