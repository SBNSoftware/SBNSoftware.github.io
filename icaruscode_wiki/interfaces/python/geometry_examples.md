---
layout: page
title: ICARUS detector geometry interface in Python
description: Examples of accessing ICARUS detector geometry description via Python
toc: true
---

Examples of ICARUS detector geometry interface in Python
=========================================================


Setup
------

ICARUS geometry description can be accessed in Python via the [`geo::GeometryCore`](https://nusoft.fnal.gov/larsoft/doxsvn/html/classgeo_1_1GeometryCore.html) interface.
Assuming that `icarusalg` is set up in the working area, 
```.py
from ICARUSservices import ServiceManager
import ROOT
geom = ServiceManager.get('Geometry')
```
will bind `geom` to a `geo::GeometryCore` instance initialized with the default ICARUS geometry configuration (if a different one is needed, a configuration file must be provided; [ask](mailto:petrillo@slac.stanford.edu) for an example!).

Note that technically this does not require _gallery_; nevertheless, `geo::GeometryCore` does use _art_-related infrastructure (exceptions, message facility).


Example: intersection between wires
------------------------------------

_This example was last tested with `icaruscode` `v09_54_00`._

To get the geometric point intersection of two wires, [`geo::WireIntersection()`](https://nusoft.fnal.gov/larsoft/doxsvn/html/namespacegeo.html#af365983f9f6d3e62c0462bd312977b92) can be used:
```.py
wireAid = ROOT.geo.WireID(0, 0, 0, 300)
wireBid = ROOT.geo.WireID(0, 0, 1, 600)
wireA, wireB = geom.Wire(wireAid), geom.Wire(wireBid)
crossPoint = ROOT.geo.WiresIntersection(wireA, wireB)
print(f"Intersection between {wireAid} and {wireBid}: {crossPoint} cm")
```
will return the 3D point on `wireA` extension that is closest to `wireB`.
This does not inform whether the intersection is on the wire or not. That check needs to be explicit:
```.py
crossInfo = ROOT.geo.WiresIntersectionAndOffsets(wireA, wireB)
if crossInfo.offset1 <= wireA.HalfL() and crossInfo.offset2 < wireB.HalfL(): 
  print(f"Intersection between {wireAid} and {wireBid}: {crossInfo.point} cm")
else:
  print(f"Wires {wireAid} and {wireBid} do not intersect.")
```
which is not as smooth. Here we ask also for the distance of the intersection from the middle point of each wire, and request that it be less than half the wire length.



More examples
--------------

If you have an use case in mind and need (or would have benefitted from) an example, please contact [the maintainer of this page](petrillo@slac.stanford.edu), who might add what you need to it.
