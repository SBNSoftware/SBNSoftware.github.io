---
layout: page
title: Backward-compatibility configurations
description: Documentation of icaruscode configurations for processing of older samples
toc: true
---

Backward compatibility and legacy software configurations
==========================================================

While it is not at all guaranteed to be possible to correctly process with the current `icaruscode` version
a sample produced with an older one, we attempt to keep that possibility open at least for a while
after a breaking change is introduced.

This page collects a summary of the compatibility configurations, to be used as a look-up index;
the content of each of them is described on the top of their FHiCL configuration file.

name        | from           | to             | configuration file name                                                                                                                                     |
----------- | -------------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
`icarus_v2` | `v09_18_00`    | `v09_24_02_02` | [`services_compat_icarus-v09_18_00-v09_24_02_02.fcl`](../../../icaruscode/tree/develop/fcl/compatibility/services_compat_icarus-v09_18_00-v09_24_02_02.fcl) |

Configuration files are kept in the [`icaruscode/fcl/compatibility`](../../../icaruscode/tree/develop/fcl/compatibility) directory of `icaruscode` repository
and they are available out of the box in the release.



Using compatibility configurations
-----------------------------------

One way to obtain job configurations proper for processing an older sample is to overwrite a current configuration
with a "compatibility" settings table.
When one is provided, it usually follows the code name:
    
    services_compat_icarus-<FirstRelease>-<LastRelease>.fcl
    
which implies that the provided compatibility settings (which usually are for service configurations)
are valid from `<FirstRelease>` to `<LastRelease>`, both included.
For example, `services_compat_icarus-v09_18_00-v09_24_02_02.fcl` applies to samples produced with
`icaruscode` releases from `v09_18_00` to `v09_24_02_02`.
Each of these release intervals is associated with a tag name (the one in the example is `icarus_v2`).

These configurations are meant to overwrite an existing (current) configuration with the needed settings.
They are designed to be included at the end of an existing job configuration file that needs to be amended.
Since it overwrites values quite blindly, configurations with special customizations should make sure
that these customizations are not lost.
An example of turning a standard GEANT4 configuration into a legacy one:
    
    #include "standard_g4_icarus.fcl"
    
    # legacy configuration for older samples:
    #include "services_compat_icarus-v09_18_00-v09_24_02_02.fcl"
    
Note that these configurations include the settings for all the services that need a configuration change.
If the base job configuration does not need the service, then that service should be explicitly erased
(or it will be loaded, which may or may not have consequences). For example:
    
    #include "multitpc_detsim_icarus.fcl"
    
    # legacy configuration for older samples:
    #include "services_compat_icarus-v09_18_00-v09_24_02_02.fcl"
    
    # remove unused services
    services.PhotonVisibilityService: @erase

Each compatibility configuration should document in its heading the `Configured services`.


### Legacy geometry configurations

The [geometry wiki page](../Detector_geometry.md#legacy-configurations) lists some geometry configurations
that are also supposed to be used for legacy processing. Those configurations affect only the geometry;
sometimes that is sufficient, sometimes there are other services that need to be adjusted as well.
The compatibility configurations listed here use those geometry legacy configurations as needed,
and may add more settings.
If it is certain that only the geometry service is required,
like in the `multitpc_detsim_icarus.fcl` example above,
including only the legacy geometry configuration will suffice (and may save from some `@erase`).
