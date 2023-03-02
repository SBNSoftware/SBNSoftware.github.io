---
title:       SBN analysis code conventions — summary
description: Summary of code conventions as guidelines for SBN authors and reviewers.
breaks:      false
layout:      page_TOC_1_3
toc:         true
---

--------------------------------------------------------------------------------

Quick links to the [introductory sections](CodingConventions.md):
* [Purpose & Scope](CodingConventions.md#purpose--scope)
* [Definitions](CodingConventions.md#definitions)
* [Compliance and procedures](CodingConventions.md#compliance-and-procedures)
* [Editing](CodingConventions.md#editing)

The guidelines with explanations are on [their own page](CodingConventionsExplained.md).

--------------------------------------------------------------------------------

#   [N] Naming conventions   ###################################################

_Rationale_: naming should:
* be predictable to facilitate code discovery and automatic maintenance
* facilitate the understanding of the code
* not replace the documentation
* bear consistent style


##  [NL] Libraries and packages  ###########################################

Naming of libraries can be almost completely automated by `cet_build_tools`.
A "package" is a branch of the source tree in a repository.

[`[NL.01]`](#NL01) <span id="NL01"> **[+++]**
  The implicit rules of `cet_build_tools` must be followed for all code
  that is built under it (MRB).

[`[NL.02]`](#NL02) <span id="NL02"> **[++]**
  The same implicit rules are encouraged for all code in SBN repositories.

[`[NL.03]`](#NL03) <span id="NL03"> **[++]**
  Only one library should generated per source code directory
  (i.e. per package); if multiple libraries are desired,
  they should be placed in their own subdirectories (sub-packages).

[`[NL.04]`](#NL04) <span id="NL04"> **[+++]**
  Package and library names must use CamelCase and single string
  (no `-` nor `_` ).


> ### A summary of `cet_build_tools` naming convention ###
> 
> * Plugin library name (module, service, tool) matches its main file name and
>   the plugin class: `PCAngleKinkFinder_module.cc` contains a class (_art_ module
>   plugin) called `PCAngleKinkFinder` (its namespace is not constrained).
> * Library name matches the directory where the source code is stored, and it
>   encodes the path of the source within the repository; for example, code in
>   `sbncode/TPCReco/KinkExp` is all wrapped up in a single library
>   `sbncode_TPCReco_KinkExp` (`libsbncode_TPCReco_KinkExp.so`).


##  [NS] Source files  #####################################################

[_explanations_](CodingConventionsExplained.md#ns-source-files)

[`[NS.01]`](#NS01) <span id="NS01"> **[++]**
  Use `.cc` suffix for C++ source files
  containing the definition of _art_ plugin classes (modules, services, tools).

[`[NS.02]`](#NS02) <span id="NS02"> **[+++]**
  For the other files, stick to the existing
  convention in the source directory or its parent, if any is present.

[`[NS.03]`](#NS03) <span id="NS03"> **[++]**
  Match names of source files hosting a main algorithm or class with
  the name of that algorithm or class (e.g. `sbn::Track` source file should
  be called `Track.h`/`Track.cxx`).

[`[NS.04]`](#NS04) <span id="NS04"> **[+]**
  File suffixes:
  
  | type of source               | name pattern                       | example                       |
  | ---------------------------- | ---------------------------------- | ----------------------------- |
  | _art_ plugin source file     | `*_module.cc`, `*_service.cc`, ... | `PCAngleKinkFinder_module.cc` |
  | C++ header                   | `*.h`                              | `Track.h`                     |
  | C++ source                   | `*.cxx`                            | `Track.cxx`                   |
  | C++ template implementation  | `*.txx`                            | `Track.txx`                   |


##  [NC] Capitalization  ###################################################

[_explanations_](CodingConventionsExplained.md#nc-capitalization)

[`[NC.01]`](#NC01) <span id="NC01"> **[++]**
  "CamelCase" is **encouraged** for composite names (e.g. `PhotonLibrary`).

[`[NC.01]`](#NC01) <span id="NC01"> **[+++]**
  _art_ plugin name is **required** to match the file it is defined in.


##  [NV] Variables and other identifiers  ##################################

[_explanations_](CodingConventionsExplained.md#nv-variables-and-other-identifiers)

[`[NV.01]`](#NV01) <span id="NV01"> **[+++]**
  Descriptive control variable name in any loop longer than five lines.

[`[NV.02]`](#NV02) <span id="NV02"> **[−−]**
  Avoid identifiers starting with an underscore (e.g. `_i`).

[`[NV.03]`](#NV03) <span id="NV03"> **[−−−]**
  No declaration of identifiers starting with two or more underscores (e.g. `__i`).

[`[NV.04]`](#NV04) <span id="NV04"> **[−−−]**
  No identifiers with different capitalization in the same scope
  except (**[−−]**) if the capitalization follows a physics formula.

[`[NV.05]`](#NV05) <span id="NV05"> **[++]**
  Private data member names start with `f` and use CamelCase.
  Public data members and local variables follow simple camelCase
  (as above; e.g. `trackLength`).

[_Example_](CodingConventionsExplained.md#identifiers-example)


### Summary of identifier name recommendations

[`[NV.t1]`](#NVt1) <span id="NVt1">

| context                 | name style         | example                       |
| ----------------------- | ------------------ | ----------------------------- |
| local variable          | camelCase          | `nearestTrackIndex`           |
| function                | camelCase          | `findNearestTrack`            |
| class/struct name       | CamelCase          | `IsolatedTrack`               |
| public member variable  | camelCase          | `nTracks`                     |
| private member variable | `f` + CamelCase    | `fNTracks`                    |
| global variable         | CamelCase          | `GlobalVariablesAreEvil`      |
| namespace               | short, lower case  | `track`                       |
| library name            | CamelCase          | `TrackFinder`                 |



##  [NA] CAF-Specific Naming Conventions ###################################

[_explanations_](CodingConventionsExplained.md#na-caf-specific-naming-conventions)

[`[NA.01]`](#NA01) <span id="NA01"> **[++]**
  When adding branches or data products to the CAF files,
  follow the standards for nomenclature and numbering already existing in the file
  (e.g.: initialize empty variables to `-5`).

[`[NA.02]`](#NA02) <span id="NA02"> **[+++]**
  Use `k` and CamelCase for names for `Cuts` and `Vars` in CAFAna macros
  is **required**.

[`[NA.03]`](#NA03) <span id="NA03"> **[++]**
  Use namespaces to tag the names/versions of the cuts.
  For example:
  ```cpp
  namespace SBNworkshop2020 {
    
    Cut kEnergy;
    
  } // namespace SBNworkshop2020
  ```
  instead of `Cut kEnergy_SBNworkshop2020`.

[`[NA.04]`](#NA04) <span id="NA04"> **[+++]**
  End the name of a cut with a corresponding `_tag` unless defined in a namespace
  (e.g. `kEnergyCut_2020PAC`).

[`[NA.05]`](#NA05) <span id="NA05"> **[+++]**
  When editing cuts and vars from frozen analyses, create a new copy
  of the cut or var and leave the old one untouched.

[`[NA.06]`](#NA06) <span id="NA06"> **[++]**
  Store cuts and vars in sensibly corresponding scripts
  (e.g. keep numu analysis cuts in `Cuts/NumuCuts.cxx`).

[`[NA.07]`](#NA07) <span id="NA07"> **[++]**
  Remove unused CAF branches.



#   [C] Coding   ###############################################################

##  [CO] Organization, layout and style  ###################################

[_explanations_](CodingConventionsExplained.md#co-organization-layout-and-style)

_Rationale_: protect the modularity of the code and control the dependency tree.

[`[CO.01]`](#CO01) <span id="CO01"> **[++]**
  One header and source file per class.

[`[CO.02]`](#CO02) <span id="CO02">**[+++]**
  Indent via spaces (2 per level **suggested**).

[`[CO.03]`](#CO03) <span id="CO03">**[−−]**
  Avoid editor-specific directives to describe the indentation settings.

[`[CO.04]`](#CO04) <span id="CO04">**[++]**
  Use [K&R style of brackets](https://en.wikipedia.org/wiki/Indentation_style#K.26R_style).


### Specific for CAF libraries and tools

[_explanations_](CodingConventionsExplained.md#specific-for-caf-libraries-and-tools)

[`[CO.21]`](#CO21) <span id="CO21"> **[+++]**
  `CAFMaker_module.fcl` is intended to access _art_ data products,
  create `StandardRecord` objects, and call filling functions only. 

[`[CO.22]`](#CO22) <span id="CO22">**[+++]**
  All computations for filling CAF branches and calculations live
  in the corresponding `Fill<specifier>Vars.cxx` script.

[`[CO.23]`](#CO23) <span id="CO23">**[−−−]**
  No dependence to LArSoft packages in `StandardRecord`.


##  [CS] Source file metadata  #############################################

[_explanations_](CodingConventionsExplained.md#cs-source-file-metadata)

_Rationale_: we want every piece of code associated to one or more authors,
both to facilitate its use and maintenance by allowing to ask to its authors,
and as a recognition and acknowledgement.

[`[CS.01]`](#CS01) <span id="CS01"> **[+++]**
  Report author(s) and possibly a contact mean on every source file.

[`[CS.02]`](#CS02) <span id="CS02"> **[++]**
  Use Doxygen format for file metadata.
  ```cpp
  /**
   * @file   TrackBloating/TrackBloatAlg.h
   * @brief  Algorithm to double the memory required by a track.
   * @author Mark Johnson (mjohnson@fnal.gov), John Markson (jmarkson@fnal.gov)
   */
  ```

[`[CS.03]`](#CS03) <span id="CS03"> **[++]**
  Authors of major changes add their name (and contact).


##  [CE] Error handling and message logging  ###############################

[_explanations_](CodingConventionsExplained.md#ce-error-handling-and-message-logging)

_Rationale_: users should be immediately reported errors stemming from faulty
configuration or input. Code should prioritize reporting dangerous or dubious
conditions over automatic mitigation.

[`[CE.01]`](#CE01) <span id="CE01"> **[++]**
  Use `assert()` to document assumptions (e.g. `assert(!tracks.empty());`).

[`[CE.02]`](#CE02) <span id="CE02"> _**[++]**_
  Use C++ exceptions to reporting errors (`cet::exception` where available)

  > The guideline above is the original thought by G. Petrillo.
  > C. Backhouse proposes the exact opposite.
  > Which practice is best for us should be considered
  > [under discussion](https://github.com/PetrilloAtWork/SBNSoftware.github.io/pull/5).

[`[CE.03]`](#CE03) <span id="CE03"> **[−−]**
  Avoid "catch-all" constructs (`catch (...)`). Really.

[`[CE.04]`](#CE04) <span id="CE04"> **[++]**
  Route reports of unusual conditions into specific message streams
  (use `mf::LogError`/`mf::LogProblem` where available, or `std::cerr`).

[`[CE.05]`](#CE05) <span id="CE05"> **[++]**
  Use message facility library for message logging in _art_ code
  (e.g. `LOG_MF_INFO()`, `mf::LogVerbatim()`, ...).

[`[CE.06]`](#CE06) <span id="CE06"> **[−−]**
  Avoid C/C++ output streams to console (`std::cout`, `std::cerr`)
  when logging libraries are available.

[`[CE.07]`](#CE07) <span id="CE07"> **[−−−]**
  Do not include `<iostream>` in header files.

[`[CE.08]`](#CE08) <span id="CE08"> **[++]**
  With message facility (or Python `logging` module):
  * `DEBUG` level: messages that may help tracking bugs
  * `INFO` level: one-time (terse) configuration messages, summary messages
    at the end of the job, and possibly per-event or per-run summary
    (e.g. `67 tracks produced from 1267 hits in C:0 T:1.`).
  * `WARNING` level: _exceptional_ conditions that might compromise the result.
  * `ERROR` level: _exceptional_ conditions which compromise the result.
    Most often, the program should be interrupted.
  * `FATAL` level: avoid; the program should be interrupted.

[`[CE.09]`](#CE09) <span id="CE09"> _**[+++]**_
  A failure to retrieve configured input data must trigger a fatal error.
  This behaviour may be bypassed with a separate configuration parameter,
  provided that additional diagnostic information is then reported.


##  [CC] Configuration and experiment-specific features  ###################

[_explanations_](CodingConventionsExplained.md#cc-configuration-and-experiment-specific-features)

_Rationale_: code must work for all SBN experiments with the least possible changes,
ideally limited to configuration files. The explicit lack of support for one
of the experiments is still preferable to code that gives for that experiment
wrong results.

[`[CC.01]`](#CC01) <span id="CC01"> **[−−−]**
  No constants describing the specific detectors in SBN-shared code,
  and avoid those in experiment-specific coed too.

[`[CC.02]`](#CC02) <span id="CC02"> **[+++]**
  Attempt to use a feature of shared code with a detector/experiment that
  does not support it must trigger a fatal error.

[`[CC.03]`](#CC03) <span id="CC03"> **[++]**
  Use LArSoft services to gain information and functionality specific to
  the detector if possible.


##  [CL] LArSoft and _art_  ################################################

[_explanations_](CodingConventionsExplained.md#cl-larsoft-and-art)

[`[CL.01]`](#CL01) <span id="CL01"> **[++]**
  In general, try to adopt the practices recommended by _art_
  if not conflicting with these guidelines.

[`[CL.02]`](#CL02) <span id="CL02"> **[++]**
  Depending on the context, read a _art_ data product using:
  * if no _art_ associations are needed:
    ```cpp
    auto const& hits = event.getByLabel<std::vector<recob::Hit>>(fHitTag);
    ```
  * if associations are needed, and therefore `art::Ptr` or `art::Handle`:
    ```cpp
    auto const hitHandle = event.getValidHandle<std::vector<recob::Hit>>(fHitTag);
    std::vector<recob::Hit> const& hits = *hitHandle;
    ```

[`[CL.03]`](#CL03) <span id="CL03"> **[++]**
  Use `art::InputTag` data type to identify data products.

[`[CL.04]`](#CL04) <span id="CL04"> **[−]**
  Consider alternatives to `art::FindManyP` if available.

[`[CL.05]`](#CL05) <span id="CL05"> **[+]**
  Use of `art::ProductToken` for simple data product reading.

[`[CL.06]`](#CL06) <span id="CL06"> **[++]**
  Declare input data products to _art_ by calling `consumes()`
  in module constructors.

[`[CL.07]`](#CL07) <span id="CL07"> **[++]**
  Use [configuration validation](https://cdcvs.fnal.gov/redmine/projects/fhicl-cpp/wiki/Configuration_validation_and_fhiclcpp_types)
  in place of plain `fhicl::ParameterSet` access.

[`[CL.08]`](#CL08) <span id="CL08"> **[++]**
  Use the containers provided by LArSoft `Geometry` service to store data
  by geometry plane, TPC etc.

[`[CL.09]`](#CL09) <span id="CL09"> **[++]**
  Use `Geometry` service methods to iterate through detector TPC, planes etc.



##  [CF] Language features  ################################################

[_explanations_](CodingConventionsExplained.md#cf-language-features)

[`[CF.001]`](#CF001) <span id="CF001"> **[++]**
  Motivated adoption of well-supported new features is **encouraged**;
  still, if the feature is considered too obscure a clarification comment
  is **suggested**.


### `auto` keyword

[_explanations_](CodingConventionsExplained.md#auto-keyword)

The `auto` keyword has the magic ability of decreasing with its sole
appearance the readability of the code by a few marks.
It should be used judiciously (and sparsely).

[`[CF.005]`](#CF005) <span id="CF005"> **[−−]**
  In general, avoid using `auto`.

[`[CF.006]`](#CF006) <span id="CF006"> **[+]**
  As an exception, use `auto` keyword when the underlying type is _obvious_
  from the code in the same line or the previous one.
  In doubt, spell the type out instead.

[_examples_](CodingConventionsExplained.md#auto-examples)


### Namespaces

[_explanations_](CodingConventionsExplained.md#namespaces)

[`[CF.011]`](#CF011) <span id="CF011"> **[−−]**
  Avoid importing a namespace (e.g. `using namespace std;`), especially
  in global scope.

[`[CF.012]`](#CF012) <span id="CF012"> **[−−−]**
  Never ever use `using namespace` directives in global scope of header files.

[`[CF.013]`](#CF013) <span id="CF013"> **[++]**
  Consider using a namespace to enclose a large self-contained group of
  utilities and to enclose implementation details.


### Variables and parameters

[_explanations_](CodingConventionsExplained.md#variables-and-parameters)

[`[CF.021]`](#CF021) <span id="CF021"> **[+++]**
  Define variables in the lowest scope they are needed in,
  and as close as where they are needed as possible

[`[CF.022]`](#CF022) <span id="CF022"> **[+]**
  Prefer a single collection of structured elements over multiple collections
  of simple elements when no other performance issue is involved.


### C++ best practices

[_explanations_](CodingConventionsExplained.md#c-best-practices)


[`[CF.051]`](#CF051) <span id="CF051"> **[−−−]**
    Pointer variables _never_ own their memory. Do not use `new` operator.

[`[CF.052]`](#CF052) <span id="CF052"> **[++]**
  Manage a resource by using a wrapping object that follows
  [RAII](https://en.wikipedia.org/wiki/Resource_acquisition_is_initialization) pattern
  ([_examples_](CodingConventionsExplained.md#examples-of-resource-manager-objects)).

[`[CF.053]`](#CF053) <span id="CF053"> **[++]**
  Profusely use decorations explaining your intentions to the compiler
  (e.g. `const` qualifier, `[[fallback]]` annotation on `switch`, `override` methods).

[`[CF.054]`](#CF054) <span id="CF054"> **[+++]**
  Use the most appropriate and descriptive type for each variable and quantity
  (e.g. use an unsigned type for a counter
  — many examples [here](CodingConventionsExplained.md#examples-of-c-best-practices) —,
  use `const` for all variables that are not supposed to be modified, etc.).

[`[CF.055]`](#CF055) <span id="CF055"> **[++]**
  Qualify as `const` _all_ "variables" that are not expected to changed value.

[`[CF.056]`](#CF056) <span id="CF056"> **[++]**
  Use temporary variables to avoid code repetitions.

[`[CF.057]`](#CF057) <span id="CF057"> **[−−−]**
  Do not use `const_cast` nor `reinterpret_cast`.

[`[CF.058]`](#CF058) <span id="CF058"> **[−−]**
  Avoid `dynamic_cast`.

[`[CF.059]`](#CF059) <span id="CF059"> **[−−−]**
  Avoid `goto` statements.

[`[CF.060]`](#CF060) <span id="CF060"> **[+]**
  Consider using braces as initialization syntax
  (e.g. `DataEntry data { 5.0, 7.0 };`).

[`[CF.061]`](#CF061) <span id="CF061"> **[+++]**
  Do not use word-spelling of logical operators
  (use `&&`, `||`, `!` rather than `and`, `or`, `not`).


[_examples_](CodingConventionsExplained.md#examples-of-c-best-practices)


#### References vs. pointers

[_explanations_](CodingConventionsExplained.md#references-vs-pointers)

_Rationale_: references and pointers share the same performance, but have different
features that make them appropriate for different usage patterns.

[`[CF.101]`](#CF101) <span id="CF101"> **[++]**
  Choose a pointer type if a variable is allowed to point to "no object"
  (`nullptr`), or if reassignments are required.

[`[CF.102]`](#CF102) <span id="CF102"> **[+]**
  In class definitions, consider mixed use to gain the safety of a
  reference and the flexibility of a pointer (e.g. presenting a reference
  in class interface but internally storing a pointer).


#### Memory usage and avoiding unnecessary copy of data

[_explanations_](CodingConventionsExplained.md#memory-usage-and-avoiding-unnecessary-copy-of-data)

_Rationale_: copying large chunks of data has deleterious effects,
and has been a common cause of excessive use of memory
(for example, a temporary copy of a 1-GB data structure may be
almost negligible in the overall memory balance, but it may make
a remote job cross a 2 GB memory hard limit and have the job killed).
There are well known patterns that prevent unnecessary copies.


[`[CF.111]`](#CF111) <span id="CF111"> **[++]**
  Prevent unnecessary copy of values returned by functions
  (e.g. `auto const& digits = event.getByLabel<std::vector<raw::RawDigits>>(WaveformTag);`).

[`[CF.112]`](#CF112) <span id="CF112"> **[+++]**
  Declare function arguments of large non-trivial types as constant references.

[`[CF.113]`](#CF113) <span id="CF113"> **[+]**
  Consider, as pattern for initialization of large data members from
  function arguments, to pass the argument by value and then `std::move()` that value.

[`[CF.114]`](#CF114) <span id="CF114"> **[++]**
  When the final size of a collection is known in advance,
  allocate its memory at once.


#### Checked vs. unchecked element access (i.e. `at()` vs. `[]`)

[_explanations_](CodingConventionsExplained.md#checked-vs-unchecked-element-access-ie-at-vs-)

_Rationale_: most often, the unchecked access should be preferred because faster,
but it is important to avoid indices out of range.
Conversely, the choice of one method over the other reflects the underlining
consideration.

[`[CF.121]`](#CF121) <span id="CF121"> **[++]**
  Use unchecked access when the element is already known to be in range.

[`[CF.122]`](#CF122) <span id="CF122"> **[++]**
  Use unchecked access when the element is expected by protocol to be present.


#### User class design

[_explanations_](CodingConventionsExplained.md#user-class-design)

[`[CF.151]`](#CF151) <span id="CF151"> **[−−]**
  You should not _need_ destructors in your classes.

[`[CF.152]`](#CF152) <span id="CF152"> **[+]**
  For objects that will exist in large collections,
  and especially for data structures, consider ordering data members
  from the largest to the smallest to avoid waste of memory from data alignment.

[`[CF.153]`](#CF153) <span id="CF153"> **[++]**
  Initialize data members holding configuration information
  (e.g. a threshold for an algorithm) in the constructor initializer list
  (and mark them `const` if feasible).

[`[CF.154]`](#CF154) <span id="CF154"> **[+++]**
  Mark all member functions that do not modify the object as `const`,
  and consider factoring out the parts of non-`const` methods which do not
  modify the object as new `const` methods.

[`[CF.155]`](#CF155) <span id="CF155"> **[++]**
  Initialize all non-`const` data members in their declaration in the class.

[`[CF.156]`](#CF156) <span id="CF156"> **[++]**
  All data members of a class should be assigned a known value on construction.

[`[CF.157]`](#CF157) <span id="CF157"> **[−−−]**
  Never write empty constructors.

[`[CF.158]`](#CF158) <span id="CF158"> **[++]**
  Consider using delegated constructors to improve maintainability.

[`[CF.159]`](#CF159) <span id="CF159"> **[+]**
  Consider declaring a type a `class` if there is an "invariant"
  (i.e. constraints on the data members) to be preserved, `struct` otherwise.


##  [CT] Libraries and tools  ##############################################

_Rationale_: libraries evolve fast and what was best practice may become obsolete or detrimental.
But it often also becomes an acquired pattern that is hard to break.
  
[`[CT.001]`](#CT001) <span id="CT001"> **[++]**
  Use `geo::Point_t` and `geo::Vector_t` in place of ROOT's `TVector3` for locations and displacements.

[`[CT.002]`](#CT002) <span id="CT002"> **[--]**
  Avoid using `std::pow()` with integral exponents; use `std::hypot()` or _cetlib_ `cet::pow()` or similar as appropriate.
  Also avoid taking the square root for distance when not essential.


##  [CQ] Quantity types and their units  ###################################

_Rationale_: clarity and predictability are essential when interpreting data
values, and relying heavily on conventions facilitate it.


### Units

[`[CQ.01]`](#CQ01) <span id="CQ01"> **[+++]**
  Mandatory units for data quantities are described in
  [`StandardRecord` documentation in `sbnanaobj`](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/README.md).
  Existing exceptions should be treated as a bug rather than a precedent.


### Data types

[`[CQ.11]`](#CQ11) <span id="CQ11"> **[++]**
  The following C++ data types are encouraged for storage of some quantities:

  | Unit type                                       | data type  |
  | ----------------------------------------------- | ---------- | 
  | momentum, energy, energy density                | `float`    |
  | charge, charge density                          | `float`    |
  | space coordinate <br> (added precision reduces rounding errors of geometry calculations)  | `double`   |
  | time, relative to a reference within the event  | `double`   |
  | absolute time <br>(achieves _(barely)_ nanosecond precision on UTC times)    | `long double`   |



#   [D] Documentation   ########################################################


##  [DF] Functionality documentation  ######################################

[_explanations_](CodingConventionsExplained.md#df-functionality-documentation)

_Rationale_: plain-English documentation should allow the use of an algorithm
without falling back to interpret the code, and should especially include
the assumptions and considerations that are relevant to the users and are
not expressed by the code.

[`[DF.01]`](#DF01) <span id="DF01"> **[++]**
  Algorithm classes and function should include also
  1. description of their function
  2. explanation of the input format
  3. explanation of the requirements and assumptions on the input
  4. an explanation of the features of the output
  5. plus a reference to external documentation (e.g. SBN DocDB document)

[`[DF.02]`](#DF02) <span id="DF02"> **[+++]**
  Add documentation in the source code, in Doxygen format,
  attached to the object being described.


##  [DC] Tracking of changes  ##############################################

[_explanations_](CodingConventionsExplained.md#dc-tracking-of-changes)

_Rationale_: discovery of major changes to the functionality of the code or
"relevant" changes of working parameters should be achievable
without a systematic comparison the different versions of the code.

[`[DC.01]`](#DC01) <span id="DC01"> **[+++]**
  Each repository contains in its main directory a `changes.md` file;
  the start of the file includes information about the format, like the
  pattern used for each entry and the tag for breaking changes.

[`[DC.02]`](#DC02) <span id="DC02"> **[+++]**
  Authors are **required** to update the `changes.md` log when...
  * ... a new algorithm is added: mentioning the purpose of the new feature.
  * ... a change in parameters that may affect future results.
  * ... a change makes existing samples unreadable or misinterpreted.

[`[DC.03]`](#DC03) <span id="DC03"> **[+++]**
  In the last case, the change is defined as breaking and the entry is
  **required** to explicitly state that with a standard tag
  (`**BREAKING CHANGE**` is the recommendation).

[`[DC.04]`](#DC04) <span id="DC04"> **[+]**
  Consider keeping the format of the change log simple.

[`[DC.05]`](#DC05) <span id="DC05"> **[++]**
  The information about the release version of a change,
  should be added by the release manager.



#   [L] Linking and building  ##################################################


##  [LB] Build diagnostics ("warnings")  ###################################

[_explanations_](CodingConventionsExplained.md#lb-build-diagnostics-warnings)

_Rationale_: compilation warnings have proven to be a powerful tool in early
detection of program mistakes. Experience shows that a single ignored warning
both creates a habit, and makes it harder to spot additional ones.

[`[LB.01]`](#LB01) <span id="LB01"> **[+++]**
  Building warnings must be addressed.
  All of them must be treated as errors, except for the deprecation one.

[`[LB.02]`](#LB02) <span id="LB02"> **[++]**
  If the compiler reports an intended behaviour as problematic, the code
  should be reviewed with other people to identify whether the report is correct.
  If the review concludes the diagnostic message is spurious, the diagnostic
  message can be "acknowledges".

[`[LB.03]`](#LB03) <span id="LB03"> **[+++]**
  Acknowledgement of a diagnostic message, when decided, must target only
  the line of code triggering it, must disable only the diagnostic message that
  needs to be acknowledged, and must be exhaustively documented in a comment.

[`[LB.04]`](#LB04) <span id="LB04"> **[+++]**
  Deprecation warnings on new code must be resolved.

