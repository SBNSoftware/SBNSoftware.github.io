---
layout: page
title: Sharing code between SBND and ICARUS
---



Sharing code between SBND and ICARUS
============================================================================================

***PAGE IN DEVELOPMENT.*** This page is dedicated to advice about using
code from one experiment in the other. The hope is by noting things that
change or may change going from one to the other will help avoid pit
falls and headaches in the future. If you\'re stuck, don\'t hesitate to
reach out! You can ask questions on various general purpose (e.g.
\#general) or analysis-related Slack channels. Likely some people have
run into this issue before and found a fix, so it can be better to ask
and save time than reworking everything! In particular, Yun-Tse Tsai
(\@Yun-Tse) has done a lot of work on exchange of code between SBND and
ICARUS and may have some insight.



Differences in `icaruscode` vs. `sbndcode`
---------------------------------------------------------------------------------------------------



### Includes/Services between experiments (especially .fcl includes)

The fcl includes, services, etc. are different between the two code
bases. For example, `sbndcode` has four services tables, two of which
are most important to this discussion:

-   `sbnd_basic services`: a very basic set of services that has very
    few functionalities
-   `sbnd_services`: a more complete set of services (though there exist
    others too) that builds on the basic\_services and adds many more
    features.

whereas `icaruscode` has

-   `icarus_basic_services`: a set of services which has significantly
    more functionality than `sbnd_basic_services`, more like
    `sbnd_services` though not the same.

though depending on your specific needs you may need other services
(simulation, wire calibration, etc.). While `sbnd_services` cannot be
directly replaced by `icarus_basic_services` in all instances, this is
probably a place to start. For more information on the services provided
by the tables, see `job/services_icarus.fcl` in an `icaruscode` release
(`fcl/services_sbnd.fcl` in an `sbndcode` release).

On the include side of things, there are three general categories of
these. In some cases, an SBND-specific include maps directly to an
ICARUS-specific include. In other cases, there is no ICARUS-specific
include, but a base include can be used. In still other cases, an
include used in SBND code appears to have no equivalent in ICARUS code.
Below is a non-exhaustive list of such includes. The easiest way to see
if your module is listed to do a ctrl-F (apple-F on Mac) for the include
you are looking for:

  Includes with direct ICARUS counter-part                            SBND includes with no ICARUS-specific analog, but a basic include   Includes from SBND with no equivalent found
  ------------------------------------------------------------------- ------------------------------------------------------------------- ---------------------------------------------
  hitfindermodules\_sbnd.fcl -\> hitfindermodules\_icarus.fcl         caldata\_sbnd.fcl -\> caldata.fcl                                   rootoutput\_sbnd.fcl
  cluster\_sbnd.fcl -\> cluster\_icarus.fcl                           databaseutil\_sbnd.fcl -\> databaseutil.fcl                         sam\_sbnd.fcl
  trackfindermodules\_sbnd.fcl -\> trackfindermodules\_icarus.fcl     particleid\_sbnd.fcl -\> particleid.fcl                             
  calorimetry\_sbnd.fcl -\> calorimetry\_icarus.fcl                                                                                       
  showerfindermodules\_sbnd.fcl -\> showerfindermodules\_icarus.fcl                                                                       
  pandoramodules\_sbnd.fcl -\> pandoramodules\_icarus.fcl                                                                                 
  simulationservices\_sbnd.fcl -\> simulationservices\_icarus.fcl                                                                         
  services\_sbnd.fcl -\> services\_icarus.fcl                                                                                             
  simulationservices\_sbnd.fcl -\> simulationservices\_icarus.fcl                                                                         

**TODO**: cases where ICARUS includes have no direct counterpart in
SBND?



### Difference in module/product names between experiments

Often ICARUS modules and the products they create may differ from those
used by SBND. The general procedure is quite similar, but in ICARUS we
run 2 reconstruction steps, for example. One stage (reco1) is the
\"Gaus\" or \"Gauss\" stage that uses Gauss deconvolved TPC hits and is
more akin to what is used by SBND. The other stage (reco2) is the
\"Raw\" stage, which uses the raw digits instead of performing a
deconvolution. This has effects both on what you get in terms of files,
but also in terms of the products available. Instead of just Pandora
products, now there are PandoraGaus products (from the deconvolved
reconstruction) and PandoraICARUS products (from the raw digits). In
addition, the code also currently has versions split between the two
active volumes, Cryo0 and Cryo1, so the following mappings exist for
example:

  sbndcode       icaruscode (Gaus, example)    icaruscode (Raw, example)
  -------------- ----------------------------- -------------------------------
  pandora        pandoraGausCryo0, etc.        pandoraICARUSCryo0, etc.
  pandoraTrack   pandoraTrackGausCryo0, etc.   pandoraTrackICARUSCryo0, etc.



Detector agnostic code
----------------------------------------------------------------

In general, code pulled from the master branch of the LArSoft git
repositories should work regardless of the experiment on which you are
working. However, in a feature branch, this may not be true. Or, if you
are trying to use code housed in SBND specific areas in ICARUS, for
example from `sbndcode`, this will also not necessarily be the case.

One particular cause of frustration can be if code uses
detector-specific plane information, since the wire planes are oriented
differently between SBND and ICARUS. A signature of a mistake of this
type is an error message that looks like the following:\

    %MSG-s ArtException:  PostEndJob 12-Nov-2019 09:23:26 CST ModuleEndJob
    cet::exception caught in art
    ---- OtherArt BEGIN
      ---- EventProcessorFailure BEGIN
        EventProcessor: an exception occurred during current event processing
        ---- ScheduleExecutionFailure BEGIN
          Path: ProcessingStopped.
          ---- OtherArt BEGIN
            ---- TPCGeo BEGIN
              TPCGeo[0x5ed6970]::Plane(): no plane for view #2
              cet::exception going through module 
            ---- TPCGeo END
          ---- OtherArt END
          Exception going through path reco
        ---- ScheduleExecutionFailure END
      ---- EventProcessorFailure END
    ---- OtherArt END
    %MSG
    Art has completed and will exit with status 1.

\
This particular failure mode was one specific call to
`fGeom->WirePitch(geo::kW)` in code originally used with SBND.



General advice
------------------------------------------------

Three pieces of general advice:

1.  If you try to run an art (LArSoft) job but the includes aren\'t
    right or something isn\'t being located, it will generally complain
    and tell you what it can\'t find. You can use these print statements
    to guide your debugging!
2.  Remember that Slack is just a click away!
3.  If you find something that isn\'t on this page, add it. Then it\'s
    there for the next time!
