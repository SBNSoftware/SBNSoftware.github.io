---
title:       SBN analysis code conventions
description: Summary of code conventions as guidelines for SBN authors and reviewers.
breaks:      false
toc:         true
---

<!-- BEGIN HACKMD this is temporary for HackMD editing -->
[TOC]
<!-- END   HACKMD this is temporary for HackMD editing -->


#   Purpose   ##################################################################


This set of guidelines aims to improve the readability and maintainability of
the code base it covers, and indirectly the ease of use.
Code performance considerations are secondary here.



#   Scope   ####################################################################

This policy is intended to cover all code in the following SBN coder repositories:
`sbnobj`, `sbncode`, `sbnana`.
It is expected that authors attempt to strictly adhere to it,
as defined in the "Definitions" paragraph.
Policy rules may be enforced by reviewers during code review, and by the
release managers.



#   Definitions   ##############################################################

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

[\*]\*\*\* **[strongly] not recommended** hold the same priority as **[strongly] recommended**;

\*\* **discouraged** holds the same priority as **encouraged**.

> While this document is in draft, guidelines that have not been
> discussed or have been questioned have the priority mark written
> in italic font (e.g. "it is _**required**_ that ...").



#   Compliance and procedures   ################################################

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



#   Naming conventions   #######################################################

_Rationale_: naming should:

* be predictable to facilitate code discovery and automatic maintenance
* facilitate the understanding of the code
* not replace the documentation
* bear consistent style


##  Libraries and packages  ###############################################

Naming of libraries can be almost completely automated by `cet_build_tools`.
A "package" is a branch of the source tree in a repository.

* It is **strongly recommended**/**required** that the implicit rules are
  followed for all code that is built under `cet_build_tools`.
* It is **recommended**/**strongly recommended** that the same implicit rules
  are followed for all code in SBN repositories.
* It is **recommended** that only one library is generated per source code
  directory (i.e. per package), and that if multiple libraries are desired,
  they be placed in their own subdirectories (sub-packages).
* Use of CamelCase and single string (no `-` nor `_` ) in package and library
  names is **strongly recommended**.


> ### A summary of `cet_build_tools` naming convention ###
> 
> * Plugin library name (module, service, tool) matches its main file name and
>   the plugin class: `PCAngleKinkFinder_module.cc` contains a class (_art_ module
>   plugin) called `PCAngleKinkFinder` (its namespace is not constrained).
> * Library name matches the directory where the source code is stored, and it
>   encodes the path of the source within the repository; for example, code in
>   `sbncode/TPCReco/KinkExp` is all wrapped up in a single library
>   `sbncode_TPCReco_KinkExp` (`libsbncode_TPCReco_KinkExp.so`).


##  Source files  ##########################################################

* `cet_build_tools` is somehow biassed toward using `.cc` suffix for C++
  files, and it is **recommended** that this suffix be used for source files
  containing the definition of _art_ plugin classes (modules, services, tools);
  for the other files, it is **strongly recommended** to stick to the existing
  convention in the source directory or its parent, if any is present.
* **suggested** suffixes:
    * C++ headers: `.h`
    * C++ source: `.cpp`
    * C++ template implementation: `.tcc`


##  Capitalization  ########################################################

* "CamelCase" is **recommended** for composite names (e.g. `PhotonLibrary`).
* Plugin name is **required** to match the file it is defined in
  (this is a `cet_build_tools` build system requirement).


##  Variables and other identifiers  #######################################

Variable names should be designed with a code reader in mind,
even at the cost of some additional key strokes, and then to minimize
possible name collisions or ambiguities.

* Use of a descriptive control variable is **strongly recommended**
  in any loop longer than five lines.
* Declaration of identifiers starting with an underscore is **discouraged**
  (even to denote private class members); declaration of identifiers starting
  with two or more underscores (e.g. `__i`) is **forbidden**.
* Use of identifiers with different capitalization in the same scope is
  **forbidden** except if the capitalization follows a physics formula,
  where it is still **discouraged**. For example,
  `double const F = G * m * M / (d*d);` is acceptable, but 
  `double const F = G * m1 * m2 / (d*d);` should still be preferred.
* Starting data members with `f` and use CamelCase is **recommended** (e.g. `double fTrackLength`).


Example:
```cpp
for (auto i: interactions) // * `i` not clear
                           // * `auto` obscures the type
                           // * each object copied
{
  
  for (auto p = 0; p < i.NParticles(); ++p) // `p` not clear
  {
      auto part = i.GetParticle(p); // inconsistent indentation
                                    // again copy
      /* ... useful code here ... */
  }          // what is this brace closing?
  
}            // what is this brace closing?
```
should become:
```cpp
for (simb::MCTruth const& interaction: interactions)
{
  
  for (int iPart = 0; iPart < interaction.NParticles(); ++iPart)
  {
    auto part = interaction.GetParticle(iPart);
    
    /* ... useful code here ... */
    
  } // for all particles
  
} // for all interactions
```
Names don't need to be that long, as long as they are meaningful.


##  CAF-Specific Naming Conventions ########################################

* When adding branches or data products to the CAF files, it is **recommended**
  to follow the standards for nomenclature and numbering already existing in the file. For example: initialize empty variables to `-5` when appropriate, when adding a vector of objects, add also an `int` indicating vector size, etc.
* Use of `k` and CamelCase for names for `Cuts` and `Vars` in CAFAna macros
  is **required**.
* Names of cuts and vars for a frozen analysis are **required** to end
  with a corresponding `_tag` for example: `kEnergyCut_2020PAC`.
  
> [name=Gianluca Petrillo][time=Sat, Jul 31, 2021 10:25 PM]
> There may be some room for discussion in using namespaces to tag the names of the cuts.
> For example:
> ```cpp
> namespace SBNworkshop2020 {
> 
>   Cut kEnergy;
>     
> } // namespace SBNworkshop2020
> ```
> instead of `Cut kEnergy_SBNworkshop2020`.
> This has a few practical advantages. It is faster to write, and it can be adopted in other namespaces or local scope (by inlining or just by using it).
> It is also easier to rename if needed.
* When editing cuts and vars from frozen analyses, create a new copy the cut or var and leave the old one in use for future comparisons.
* Store cuts and vars in sensibly corresponding scripts i.e. keep numu analysis cuts in `Cuts/NumuCuts.cxx` and MC cuts in `Cuts/TruthCuts.cxx` etc. 


#   Coding   ###################################################################

##  Organization, layout and style  ########################################

Rationale: protect the modularity of the code and control the dependency tree.

* One header and source file per class is **encouraged**. Exceptions apply
  for implementation details (that may be branched out in a separate file
  in a `Details` subdirectory, or left in the main file) and for simple
  helper functions and classes.
* Mixing tabulation characters and spaces in indentation is **forbidden**.
  Indentation must be uniform: either 2, 3 or 4 characters per level everywhere,
  on every line of the code and for every level of indentation.
  In case of modification of existing code violating this requirement,
  it is **endorsed** that the indentation be standardized first
  (with a commit solely devoted to reindentation), and it is otherwise
  **strongly recommended** that the existing indentation be exactly followed
  otherwise.
  The **recommended** indentation is via spaces (4 per level **suggested**).
  The use of editor-specific directives to describe the indentation settings
  is **discouraged** because of the editor-specificity.
* The use of [K&R style of brackets](https://en.wikipedia.org/wiki/Indentation_style#K.26R_style) is **endorsed**.


Specific for CAF libraries and tools:

* `CAFMaker_module.fcl` is intended to access art data products, create `StandardRecord` objects, and call filling functions only. All computations for filling CAF branches and calculations are **required** to live in the corresponding `Fill<specifier>Vars.cxx` script.
* `StandardRecord` is intended to hold the structure of CAF files only. Any dependence to LArSoft packages in StandardRecord is **forbidden**.


##  Source file metadata  #################################################

Rationale: we want every piece of code associated to one or more authors,
both to facilitate its use and maintenance by allowing to ask to its authors,
and as a recognition and acknowledgement.

* Every source file is **required** to report in a header
  the author(s) and possibly a contact mean (e-mail is **suggested**).
  Doxygen format is **recommended**:
  ```cpp
  /**
   * @file   TrackBloating/TrackBloatAlg.h
   * @brief  Algorithm to double the memory required by a track.
   * @author Mark Johnson (mjohnson@fnal.gov), John Markson (jmarkson@fnal.gov)
   * /
  ```
* Authors other than the ones in the headers are **strongly recommended**
  to report their name (and contact) upon major additions (including
  rewritten algorithm implementations) in a C++ comment;
  it is **recommended** that this information be added in the Doxygen
  documentation of the function or class being modified with the same
  `@author` syntax as for the file header.


##  Error handling and message logging  ###################################

Rationale: users should be immediately reported errors stemming from faulty
configuration or input. Code should prioritize reporting dangerous or dubious
conditions over automatic mitigation.


* The liberal use of `assert()` or C++ `concept` constructs is **recommended**
  to document assumptions that the code is making and is not (formally)
  verifying; e.g. a function documented to require as argument a non-empty list
  of tracks may include as first line a `assert(!tracks.empty());`.
* C++ exceptions are **recommended** as tools for reporting error;
  using `cet::exception` as base of exceptions where available is **encouraged**
  as a recognizable pattern and because of the convenience of the class.
* "Catch-all" constructs (`catch (...)`) are **strongly discouraged** as they
  have repeatedly been found to hide essential errors.
* Messages reporting unusual conditions are **recommended** to be routed into
  specific streams for easy filtering; examples include the use of
  `mf::LogError`/`mf::LogProblem` when `messagefacility` library is available,
  or `std::cerr`.
* Within _art_ jobs, message facility library is **strongly recommended**
  for message logging. Likewise, the use of C++ output stream to console
  (`std::cout`, `std::cerr`) is **strongly discouraged** unless the code is
  expected to be run in an environment where message facility is not available.
  In that case, it is still **suggested** that template output classes be used.
  Inclusion of `<iostream>` in a header file is **forbidden**: if output to
  C++ standard streams is _really_ needed, it should be placed into the
  implementation file rather than in the header.
* When using message facility (or Python `logging` module), the **endorsed**
  usage of the channels is:
    * `DEBUG` level: messages that may help tracking bugs; but keep in mind
      that users might be enabling debugging messages to investigate a specific
      part of the code, and having other parts overwhelm the log 
      will just make the log both huge and unusable. A good compromise is
      to provide in the log enough information to roughly identify where
      an issue is, but expecting that if further investigation is needed,
      the investigator will have to edit and instrument the source code.
    * `INFO` level: one-time (terse) configuration messages, summary messages
      at the end of the job, and possibly a per-event or per-run one-line
      summary (e.g. `67 tracks produced from 1267 hits in C:0 T:1.`).
      Additional verbosity should be regulated via configuration parameters
      and disabled by default.
    * `WARNING` level: _exceptional_ conditions that might compromise the result.
      An example of message not belonging to a warning:
      `Track point out of fiducial volume.`. Tracks are coming in and out
      of the fiducial volume all the time, so that is not an exceptional
      condition; an algorithm should either handle the situation in a
      documeted way, or otherwise throw an exception.
    * `ERROR` level: _exceptional_ conditions which compromise the result.
      Most often, rather than an error message, an exception should be throw.
    * `FATAL` level: avoid; throw an exception instead.
  
  When in _art_, if there is the risk that an error or warning message be spawn
  too much, consider to route it in a different message category.
  It is then possible for the users to set a limit so that a few messages
  are logged, but then additional ones are progressively discarded.


##  Configuration and experiment-specific features  #######################

The code must work for all SBN experiments with the least possible changes,
ideally limited to configuraion files. The explicit lack of support for one
of the experiments is still preferable to code that gives for that experiment
wrong results.

* Presence in the code of constants describing the specific detectors are
  **strongly discouraged** in the experiment code repositories, and
  **forbidden** in the repositories with SBN-shared code.
  Configuration parameters, via FHiCL or other objects at class construction
  or via member function calls, shoudl be used instead.
* If it proves unfeasible to support a feature for a specific experiment,
  the attempt to use that feature with that experiment is **required**
  to trigger a fatal error.
* The use of LArSoft services is **strongly recommended** when they provide
  the needed features. The loss in flexibility is offset by the wider testing
  of that code and the promise of interoperability with other experiments,
  including the other SBN ones. Examples of this include the detector
  geometry description and the properties and timings of the detectors.


##  Language features  ####################################################

C++ is now a relatively fast-paced standard, adding both language features
and library components every three years.
We are a bit behind that, in part because of the constraints from _art_ and
of supporting two different compilers (GCC and Clang).
In general, motivated adoption of well-supported new features is *encouraged*
although if the feature is considered too obscure a clarification comment
is *suggested*. An example:
```cpp
unsigned int n = 0;
for (auto const& elem: data) {
    (void) data; // prevent "unused variable" warnings
    ++n;
}
```


### `auto` keyword

The `auto` keyword has the magic ability of decreasing with its sole
appearance the readability of the code by a few marks.
It should be used judiciously (and sparsely).

* The `auto` keyword can be safely used when the underlying type is _obvious_
  from the code in the same line or the previous one.
  In doubt, spell the type out instead.
  Examples:
  
    * well known standard functions:
      ```cpp
      std::vector<int> values = getValues();
      auto iValue = values.begin(), vend = values.end();
      ```
      and also:
      ```cpp
      auto vertices = std::make_unique<std::vector<double>>();
      ```
      In the last case, `std::make_unique()` is a
      [standard C++ function](https://en.cppreference.com/w/cpp/memory/unique_ptr/make_unique)
      returning an instance of `std::unique_ptr` whose template type
      is spelled out in the same line.
    * functions that spell the type already elsewhere:
      ```cpp
      auto const& vertices
        = event.getByLabel<std::vector<recob::Vertex>>(vertexTag);
      ```
      In this case `art::Event::getByLabel()` (which should be reasonably
      well known anyway) returns the type spelled out in its template argument.
    * lambda types, of course, are acceptable when no other option is available:
      ```cpp
      auto elem = [&data](std::size_t i){ return data[i]; };
      auto combine = [](auto a, auto b){ return a + b; };
      ```
      but (usually) not:
      ```cpp
      auto elem = [&data](auto i){ return data[i]; };
      ```
      if the type of `i` is known in advance.
    
* returning an implementation detail object with a standard interface
  is an acceptable use of `auto` provided that the interface is well documented;
  but using a stable type offering that interface is still **recommended**.
  For example (as a class member function):
  ```.cpp
  /**
   * @brief Returns the sequence of particles.
   * 
   * The return value is a object that can be iterated in a range-for loop
   * and supports `begin()`, `end()`, `size()` and `empty()` calls.
   * Example of usage:
   * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.cpp}
   * for (recob::MCParticle const& particle: filter.getParticles())
   * { /* ... */ }
   * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   */
  auto getParticles() const;
  ```
* in the other cases, the use of `auto` is **not recommended**



### Namespaces

* Importing a namespace (e.g. `using namespace std;`) is *discouraged*;
  it is *strongly discouraged* in global scope;
  an exception is namespaces containing exclusively
  [user-defined literal operators](https://en.cppreference.com/w/cpp/language/user_literal)
  (e.g. `using namespace std::string_literals`);
  it is nevertheless always plainly **forbidden** in global scope
  from header files.
  Instead, importing specific symbols at local scope should be preferred
  (e.g. `using std::begin, std::end;`).
* In header files, it is **strongly recommended** that functions and variables
  that are considered implementation details be enclosed in a namespace;
  a standard choice is a specific namespace for that functionality,
  the namespace `details`, or both nested (e.g. `sbn::details::vtxStubs`).
  A similar **recommendation** still holds for code in implementation files
  (non-header).
 

### Variable and parameters

* It is **strongly recommended** that variables be defined
  in the lowest scope they are needed in,
  and as close as where they are needed as possible. For example:
  ```cpp
  std::vector<std::vector<int>> allProtons;
  std::vector<int> allInitialStateCounts; // BAD: counters should be unsigned
  std::vector<int> protons;               // BAD: not needed in this scope
  int nInitialState;                      // BAD: not initialized
                                          // BAD: a counter should be unsigned
                                          // BAD: not needed in this scope
  for (simb::MCTruth truth: mcTruthVec) { // BAD: unnecessary copy
    protons.clear();
    nInitialState = 0;
    for (int iPart = 0; iPart < truth.NParticles(); ++iPart) {
      if (truth.GetParticle(iPart).StatusCode() != 0) { // BAD: cryptic code
                                                        // BAD: redundant nesting
        ++nInitialState;
        if (truth.GetParticle(iPart).PdgCode() == 2212) { // redundant nesting?
                                                          // BAD: repetitive code
          protons.push_back(truth.GetParticle(iPart).TrackId());
        } // if proton
      } // if final state particle
    } // for all particles
    allProtons.push_back(protons); // BAD: copy of a vector
    allInitialStateCounts.push_back(nInitialState);
  } // for each truth
  ```
  is better served as:
  ```cpp
  std::vector<std::vector<int>> allProtons;
  std::vector<unsigned int> allInitialStateCounts;
  for (simb::MCTruth const& truth: mcTruthVec) {
    std::vector<int> protons;
    unsigned int nInitialState = 0;
    for (int iPart = 0; iPart < truth.NParticles(); ++iPart) {
      simb::MCParticle const& part = truth.GetParticle(iPart);
      if (part.StatusCode() == 0) continue; // not a primary
      ++nInitialState;
      if (part.PdgCode() != 2212) continue;
      protons.push_back(part.TrackId());
    } // for all particles
    allProtons.push_back(std::move(protons));
    allInitialStateCounts.push_back(nInitialState);
  } // for each truth
  ```
  (here `iPart` is declared `int` rather than `std::size_t`
  because that is the type (erroneously) used by `simb::MCTruth` interface).
  

### C++ best practices

* Pointer variables _never_ own their memory.
  The use of `new` operator is **forbidden**.
  Data arrays should be stored in collections like `std::vector`.
  Dynamic memory should be allocated via `std::make_unique()`.
  In case of interface with external libraries which do not follow this rule
  and return a pointer owning memory, if that memory is requested to be freed
  with `delete`, immediately wrapping it into a `std::unique_ptr`
  is **recommended**.
* More in general, resources that need to be acquired and eventually released
  are **recommended** to be managed by a specific object following the
  [RAII](https://en.wikipedia.org/wiki/Resource_acquisition_is_initialization) pattern,
  that is an object that automatically books the resource on construction
  and releases on destruction.
* It is **strongly recommended** that the type and constantness of the variables
  be reflecting its quantity. For example, an item count should be an `unsigned int`,
  an index of array or vector should be `std::size_t`
  (because that is the native type of `std::vector::operator[]` parameter).
* It is **recommended** that "variables" that are not expected to be changed
  be _always_ declared constant, so that accidental changes are spotted by
  the compiler (e.g. `int const nParticles = mcTruth.NParticles();`).
* It is **strongly recommended** to take care of avoiding copies of data
  when not necessary. For example:
  ```cpp
  auto digits = event.getByLabel<std::vector<raw::RawDigits>>(WaveformTag); // BAD
  ```
  should become
  ```cpp
  auto const& digits
    = event.getByLabel<std::vector<raw::RawDigits>>(WaveformTag);
  ```
  to avoid copying the vector.


#### User class design

* As a consequence of the resource management pattern described above ("RAII"),
  the use of destructors in classes is **strongly discouraged**;
  they should be unnecessary and omitted entirely
  (except for a polymorphic base class, where the definition should always be
  `virtual ~BaseClass() = default;`).
* An order of data members from the largest to the smallest is **encouraged**,
  to avoid waste of memory due to data alignment. For example:
  ```cpp
  struct TrackData { // BAD data alignment
    bool contained { false }; /// If `true`, track is fully contained.
    double energy { 0.0 };    /// Estimated energy [GeV]
    unsigned int nHits;       /// Number of hits along the track from all planes.
  }; // TrackData
  ```
  is likely to take 24 bytes, while reordering it as
  ```cpp
  struct TrackData {
    double energy { 0.0 };    /// Estimated energy [GeV]
    unsigned int nHits;       /// Number of hits along the track from all planes.
    bool contained { false }; /// If `true`, track is fully contained.
  }; // TrackData
  ```
  would reduce the size to 16 bytes.
* The initialization of configuration data members in the constructor
  initalizer list is **recommended**, as is their constantness.
  For example:
  ```cpp
  class EnergyEstimatorAlg {
  
    double fChargeThreshold; ///< Minimum charge for a hit to be included.
  
      public:
  
    EnergyEstimatorAlg(double chargeThr);
    
    // ...
  };
  ```
  should rather be:
  ```cpp
  class EnergyEstimatorAlg {
  
    double const fChargeThreshold; ///< Minimum charge for a hit to be included.
  
      public:
  
    EnergyEstimatorAlg(double chargeThr);
    
    // ...
  };
  ```
* it is **required** that all member functions that do not modify the object
  be declared `const`.
* the assignment of a default value to all non-`const` data members
  in the definition of the class is **encouraged**. For example:
  ```cpp
  class FilterEfficiency {
    unsigned int fTotal;  ///< Number of events processed by the filter.
    unsigned int fPassed; ///< Number of events passed by the filter.
    
    FilterEfficiency(): fTotal(0), fPassed(0) {}
  };
  ```
  would be instead:
  ```cpp
  class FilterEfficiency {
    unsigned int fTotal { 0 };  ///< Number of events processed by the filter.
    unsigned int fPassed { 0 }; ///< Number of events passed by the filter.
  };
  ```
  (in this simple case, the constructor can be omitted; in many other cases,
  it can at least be "defaulted": `FilterEfficiency() = default;`).


##  Quantity types and their units  #######################################

Rationale: clarity and predictability are essential when interpreting data
values, and relying heavily on conventions facilitate it.


### Units

The **required** units for data quantities are described in
[`StandardRecord` documentation in `sbnanaobj`](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/README.md).
Existing exceptions should be treated as a bug rather than a precedent.


### Data types

The following C++ data types are recommended for storage of some quantities:

* momentum, energy, energy density: `float`
* charge, charge density: `float`
* space coordinates: `double` (added precision reduces rounding errors of geometry calculations)
* relative time: `double` (relative to a reference within the event)
* absolute time: `long double` (achieves _(barely)_ nanosecond precision on UTC times)



### Other features


| Proper       | Not Proper    |
| :---         |    :----:     |
| `FlashMatcher_module.cc` | `Flash_matcher_module.cc` <br>`flashMatcher_module.cc`<br>`FlashMatcher.cc` |
| `for (sliceIdx=0; sliceIdx<sliceMax; sliceIdx++)`<br>`for (iSlice=0; iSlice<maxSlice; iSlice++)` | `for(i=0;i<10;i++)` |


#   Documentation   ############################################################

* **recommended** for algorithm classes and function to include also
    1. description of their function
       (e.g. "applies proton ID algorithm based on track range")
    2. explanation of the input format
       (e.g. "`recob::Track` objects with track fit")
    3. explanation of the requirements and assumptions on the input
       (e.g. "tracks are expected to have been corrected for space charge
       effects")
    3. an explanation of the features of the output
       (e.g. "a list of `ana::ParticleID` objects is returned, one for each
       input track, in the same order; if the algorithm could not be applied,
       the track is assigned a negative score value")
    4. plus a reference to external documentation (e.g. SBN DocDB document)
       describing the physics of it when it applies
* **recommended** inline documentation in Doxygen format, attached to the object
  being described (for example, to a `class` definition instead than to the file
  where the definition is stored)



#   Overview  #################################################################
