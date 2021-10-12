---
layout: page
title: LArSoft Filters
---


LArSoft Filters Used in SBND Simulation
========================================================================

This page contains a description of most of the larsoft filters in use in SBND.



Filters in sbndcode
----------

Filters are located in `sbndcode/sbndcode/Filters/`

| Name | Filters On | Description |
|------|------------|-------------|
| GenCRTFilter | `simb::MCTruth` | Keeps events with particles of specified type and that, based on initial truth information, will intersect the specified CRTs |
| GenNuFilter | `simb::MCTruth` | Keeps events with neutrinos that match the requested conditions: CC or NC, PDG of lepton, vertex in the TPC |
| LArG4CRTFilter | `simb::MCParticle` | Keeps events with geant propagated particles that cross specified CRT panels, in a certain range of momentum (additional options available).|
| LArG4FakeTriggerFilter | `simb::MCParticle` | Keeps events if there is at least one geant particle depositing a configurable energy in the TPC and with a time in a configurable window. |
| CRTTrigFilter | `sbnd::crt::CRTData` | Description |



Filters in larsim
----------

Only some of the most used filters are listed here. More filters may be available. Filters are located in `larsim/larsim/SimFilters/`

| Name | Filters On | Description |
|------|------------|-------------|
| FilterCryostatNus | `simb::MCTruth` | Keeps events with neutrinos in the cryostat volume |
| FilterGenInTime | `simb::MCTruth` | Keeps events where at least one particles is in a specified time window (more options available). An option allows running it without the actual filtering, and producing two output collections, one with the intime particles, and the other for all the outtime ones. |
| FilterNoMCParticles | `simb::MCParticle` | Filter events with no MCParticles |







