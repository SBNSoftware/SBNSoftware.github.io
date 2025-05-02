---
layout: page
title: Gallery access with Python
description: Setup and usage of gallery via Python
toc: true
---

Access to ICARUS data products in Python via _gallery_
=======================================================

> _Note and disclaimer_: this is the type of information that falls outdated fast.
> Update it freely or contact the author if it stopped working.
> It was tested with `icarusalg` `v09_91_02_01` under the SL7 contained provided by Vito Di Benedetto at that time.

It is possible to have almost full access to data products stored in _art_/ROOT files with Python.

_gallery_ is a light-weight library provided by the authors of _art_, which understands the _art_ data format.
It is written in C++, but the amazing `cppyy` library can make it available in Python.


Setup
------

> At the time of writing, LArSoft is only compatible with Scientific Linux 7.
> If you are using a different operating system, like Alma Linux 9 on the ICARUS GPVM,
> you'll need to [use a SL7 container](../../../GPVM_migration.md).

The required setup is:
 1. `gallery`, for accessing the _art_/ROOT files
 2. `icarusalg`, for accessing the ICARUS data products
    * if any data product class is still defined only in `icaruscode`, it should be migrated to `icarusalg`;
      but in the meanwhile, you'll need to set up `icaruscode` too
      (it automatically pulls `icarusalg` in, so only `icaruscode` setup would be needed);
    * if all needed data products are in SBN (as opposed to ICARUS) code, setting up `sbnobj` will suffice;
    * likewise, if all needed data products are in LArSoft, setting up `larsoftobj` will suffice;

Currently, `icarusalg` pulls in `larsoftobj` and `larsoftobj` pulls in `gallery`, so no explicit setup of _gallery_ is needed unless going the `sbnobj` way.

In summary:
```
source /cvmfs/icarus.opensciencegrid.org/products/icarus/setup_icarus.sh
setup icarusalg v09_91_02_01 -q e26:prof
```
is all it's needed to access gallery.


### Python environment setup

It is recommended that for Python work a Python virtual environment be created,
where the needed version of Python libraries can be pulled in.

#### Python area creation

The simplest way to craete a Python working area is via `venv` and `pip` Python modules.
For example, this is a Bash script creating a new Python environment
and pulling in enough packages to work with Jupyter notebooks and with Pandas library:
```bash
#! /usr/bin/env bash
#
# Usage:  createPandasEnv.sh [WorkingAreaPath]
# 
# If not specified, the area is created in the current directory.
# 

# will install via pip the following "additional" Python modules:
declare -a PythonModules=(
  'urllib3<2' # urllib3 v2 requires a OpenSSL newer than the one installed with SLF 7
  'numpy' 'matplotlib' 'pandas'
  'tables' # PyTables: required by Pandas to support HDF5 I/O
  'jupyter-server' 'notebook' 'nbconvert'
  )

declare WorkDir="${1:-.}"

echo "Creating a new Python environment in '${WorkDir}'"

python -m venv --upgrade-deps "$WorkDir" || exit $?

# let's enter the environment immediately, before installing the modules
source "${WorkDir}/bin/activate" || exit $?
pip --require-virtualenv install "${PythonModules[@]}"
```
This example script is provided here as [createPandasEnv.sh](createPandasEnv.sh).
For example, `bash createPandasEnv.sh pythonAnalysis` will create a `./pythonAnalysis` working area.t this time, it download and installs 350 MB worth of software.

#### Regular Python area setup

Once the environment is created (in `$WorkDir`), 
```bash
source "${WorkDir}/bin/activate"
cd "$WorkDir"
```
will activate the area and enter its directory.



Example
--------

Assuming that the current area is already set up as described above,
access to _art_/ROOT files can be achieved via `galleryUtils` module (provided by `sbnalg` from `v10` on, and before by `icarusalg`).

In an interactive `python` session (or equivalent),
```py
import galleryUtils
help(galleryUtils)
```
will print an example of how to access an event.
[This example](printMuons.py) is a refurbished version of the one provided in `galleryUtils`:
```py
import galleryUtils
import ROOT

sampleEvents = galleryUtils.makeEvent("sample.root")
LArG4tag = ROOT.art.InputTag("largeant")

for event in galleryUtils.forEach(sampleEvents):
  
  particles = event.getProduct[ROOT.std.vector[ROOT.simb.MCParticle]](LArG4tag)
  
  nMuons = sum(abs(part.PdgCode()) == 13 for part in particles)
  print(f"{event.eventAuxiliary().id()}: {nMuons} muons")
  
# for all events
```
This can also access official production files — it's as simple as using XRootD URLs in the `makeEvent()` argument,
and having all the access permissions correctly configured.

Some notes:
 * The whole known C++ namespace is exposed in the `ROOT` module namespace;
   for example, `geo::CryostatID` becomes `ROOT.geo.CryostatID`.
 * the syntax of `cppyy` for template arguments is to enclose them in square brackets,
   and expressing them either as classes (`ROOT.std.vector[ROOT.geo.CryostatID]`)
   or as strings (`"std::vector<geo::CryostatID>"`).
   _[author preference: that the former allows more control to the user.]_
 * `event.eventAuxiliary().id()` returns a `art::EventID` object;
   in `galleryUtils` its class is given a method to convert it into a string (`R:1 S:0 E:1`),
   which is why we can seamlessly use `print()` on it.
   Similar tricks are performed by `ROOTutils.py` on `TVector`-like objects,
   and by `LArSoftUtils.py` on several geometry objects
   (including `geo::CryostatID`, `geo::Point_t`, etc.) when [it loads `geo::Geometry`](geometry_examples.md).



Known limitations
------------------

_gallery_ suffers some limitations compared to _art_:
 * it is not able to access `art::Run` and `art::SubRun` data products, but only `art::Event` ones.
 * its interface is behind compared to `art::Event`.

`cppyy` also suffers severe limitations.
 * overload resolution is tricky; apparently `cppyy` attempts to call all the possible functions/methods with the same name
   in the attempt to figure out which one is the correct one, and captures the exceptions from errors.
     * The error message when failing to find the appropriate function is usually of not much use.
     * If the call itself throws an exception, it may be impossible to access that exception in Python.
 * some template calls do not work (e.g. `for TPC in geom.Iterate[ROOT.geo.TPCGeo]():` does not iterate anything).


Other resources
----------------

A guide [SBN DocDB 4339](https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=4339), by now ancient,
describes how to use _gallery_ in C++.
An working example is [`galleryAnalysis.cpp`](https://github.com/SBNSoftware/icarusalg/blob/develop/icarusalg/gallery/examples/galleryAnalysis/C%2B%2B/galleryAnalysis.cpp) in `icarusalg` `v10_04_07`.
Compared to using Python, C++ requires a careful and sometimes painstaking compilation of building instructions (e.g. Cmake);
a middle ground is the use of ROOT interpreter (Cling), which does for C++ a good deal of the magic that `cppyy` does for Python.





---

_For questions or feedback, contact [Gianluca Petrillo](mailto:petrillo@slac.stanford.edu)._
