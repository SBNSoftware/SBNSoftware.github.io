% SBN analysis code conventions
% SBN Analysis Frameworks group
% June 15, 2021


################################################################################
#   Purpose
################################################################################


This set of guidelines aims to improve the readability and maintainability of
the code base it covers, and indirectly the ease of use.
Code performance considerations are secondary here.



################################################################################
#  Scope
################################################################################

This policy is intended to cover all code in the following SBN coder repositories:
`sbnobj`, `sbncode`. `sbnana`.
It is expected that authors attempt to strictly adhere to it,
as defined in the "Definitions" paragraph.
Policy rules may be enforced by reviewers during code review, and by the
release managers.



################################################################################
#  Definitions
################################################################################

This policy uses coded words to define the priority of the requirements:

\*\*\*\*\* **required**:
  reviewers are asked to reject code that does not satisfy this requirement

\*\*\*\* **strongly recommended**: defines a "strong recommendation";
  reviewers are encouraged to reject code that does not satisfy this recommendation

\*\*\* **recommended**: defines a "recommendation";
  reviewers may reject code that does not satisfy this recommendation

\*\* **encouraged**: defines an "encouragement", i.e. a practice that is considered
  to sensibly improve the quality of the code but is not mandated;
  reviewers should not reject code that does not satisfy an encouragement;

\* **suggested**: defines a "suggestion", i.e. a practice that is generally
  considered to improve the quality or coherence of the code;
  the author should consider implementing the suggestion;
  a reviewer should not reject code where the author has deliberated not to follow the suggestion.

The language used in the guidelines also uses formal wording to express the same
priorities in a negative sentence:

\*\*\*\*\* **forbidden** holds the same priority as **required**;

\*\*\*\* **[strongly] not recommended** hold the same priority as **[strongly] recommended**;

\*\*\* **discouraged** holds the same priority as **encouraged**.



################################################################################
#  Compliance and procedures
################################################################################

Code is considered compliant with this policy if _all_ the following apply:

1. all _requirements_ are satisfied;
2. if the code is subject to code review, reviewers have considered all the
   recommendations and judged, to their discretion, that a sufficient adherence
   is in place.

Arbitration can be requested if no agreement can be met between author(s) and
reviewers.

As the conventions and guidelines in this document are going to be many,
authors are not expected to know them (or even to have read them) all.
They are instead expected to consider them when pointed to them, and they are
expected to change their code to make it compliant when requested to.



################################################################################
#   Naming conventions
################################################################################

Rationale: naming should:

* be predictable to facilitate code discovery and automatic maintenance
* facilitate the understanding of the code
* not replace the documentation


##  Libraries  #############################################################


Naming of libraries can be almost completely automated by `cet_build_tools`.

* it is **strongly recommended**/**required** that the implicit rules are
  followed for all code that is built under `cet_build_tools`.
* it is **recommended**/**strongly recommended** that the same implicit rules
  are followed for all code in SBN repositories.
* it is **recommended** that only one library is generated per source code
  directory, and that if multiple libraries are desired, they be placed in
  their own subdirectories.


### A summary of `cet_build_tools` naming convention ###

* Plugin library name (module, service, tool) matches its main file name and
  the plugin class: `PCAngleKinkFinder_module.cc` contains a class (_art_ module
  plugin) called `PCAngleKinkFinder` (its namespace is not constrained).
* Library name matches the directory where the source code is stored, and it
  encodes the path of the source within the repository; for example, code in
  `sbncode/TPCReco/KinkExp` is all wrapped up in a single library
  `sbncode_TPCReco_KinkExp` (`libsbncode_TPCReco_KinkExp.so`).



##  Capitalization  ########################################################

* "CamelCase" is **recommended** for composite names (e.g. `PhotonLibrary`).
* Plugin name is **required** to match the file it is defined in
  (this is a `cet_build_tools` build system requirement).

# Package Names

* Use a descriptive index in any _for_ loop > 5 lines long.

* The use of `using namespace XXX` is _strongly discouraged_

* Use `auto` sparingly if at all.

* Use K&R style for the use of brackets https://en.wikipedia.org/wiki/Indentation_style#K.26R_style

* Begin data members with `f` and use CamelCase i.e. `double fTrackLength`

* Use CamelCase and single string (no - or _ ) in package names.


| Proper       | Not Proper    |
| :---         |    :----:     |
| FlashMatcher_module.cc | Flash_matcher_module.cc <br>flashMatcher_module.cc<br>FlashMatcher.cc |
| for (sliceIdx=0; sliceIdx<sliceMax; sliceIdx++)<br>for (iSlice=0; iSlice<maxSlice; iSlice++) | for(i=0;i<10;i++) |
|using namespace caf{<br>...code ... <br>}|using namespace caf;|
|auto ||


##  CAF-Specific Naming Conventions #############################################################

* CAFMaker_module.fcl is intended to access art data products, create StandardRecord objects, and call filling functions only. All computations for filling CAF branches and calculations are _required_ to live in the corresponding Fill<specifier>Vars.cxx script.

* StandardRecord is intended to hold the structure of CAF files only. Any dependence to LArSoft packages in StandardRecord is _forbidden_.

* When adding branches or data products to the CAF files, follow the standards for nomenclature and numbering already existing in the file. For example: initialize empty variables to -5 when appropriate, when adding a vector of objects, add also an int indicating vector size, etc.

* Use `k` and CamelCase for names for Cuts and Vars in CAFAna macros.

* Name cuts and vars for a frozen analysis with a corresponding `_tag` for example: `kEnergyCut_2020PAC`

* When editing cuts and vars from frozen analyses, create a new copy the cut or var and leave the old one in use for future comparisons.

* Store cuts and vars in sensibly corresponding scripts i.e. keep numu analysis cuts in `Cuts/NumuCuts.cxx` and MC cuts in `Cuts/TruthCuts.cxx` etc. 


################################################################################
#   Coding
################################################################################


##  Error handling  ########################################################

Rationale: users should be immediately reported errors stemming from faulty
configuration or input. Code should prioritize reporting dangerous or dubious
conditions over automatic mitigation.


* The liberal use of `assert()` or C++ `concept` constructs is **recommended**
  to document assumptions that the code is making and is not (formally)
  verifying; e.g. a function documented to require as argument a non-empty list
  of tracks may include as first line a `assert(!tracks.empty());`
* C++ exceptions are **recommended** as tools for reporting error;
  using `cet::exception` as base of exceptions where available is **encouraged**
  as a recognizable pattern and because of the convenience of the class.
* "Catch-all" constructs (`catch (...)`) are **strongly discouraged** as they
  have repeatedly been found to hide essential errors.
* messages reporting unusual conditions are **recommended** to be routed into
  specific streams for easy filtering; examples include the use of
  `mf::LogError`/`mf::LogProblem` when `messagefacility` library is available,
  or `std::cerr`.



################################################################################
#   Documentation
################################################################################

* **recommended** algorithm classes and function to include a description of
  their function, an explanation of the input format and requirements, of the
  assumptions and of the output, plus a reference to external documentation
  (e.g. SBN DocDB document) describing the physics of it when it applies
* **recommended** inline documentation in Doxygen format, attached to the object
  being described (for example, to a `class` definition instead than to the file
  where the definition is stored)



################################################################################
#   Summary
################################################################################
