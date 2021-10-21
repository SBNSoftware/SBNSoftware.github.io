---
title:       SBN analysis code conventions (with examples and explanations)
description: Explained code conventions as guidelines for SBN authors and reviewers.
breaks:      false
layout:      page_TOC_1_3
toc:         true
---

--------------------------------------------------------------------------------

Quick links to the [introductory sections](CodingConventions.md):
* [Purpose & Scope](CodingConventions.md#purpose--scope)
* [Definitions](CodingConventions.md#definitions)
* [Compliance and procedures](CodingConventions.md#compliance-and-procedures)

Quick links to the [summary sections](CodingConventionsList.md):
* [Naming conventions](CodingConventionsList.md#n-naming-conventions)
* [Coding](CodingConventionsList.md#c-coding)
* [Documentation](CodingConventionsList.md#d-documentation)
* [Linking and building](CodingConventionsList.md#l-linking-and-building)

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
  It is **required** that the implicit rules are
  followed for all code that is built under `cet_build_tools`.

[`[NL.02]`](#NL02) <span id="NL02"> **[++]**
  It is **encouraged** that the same implicit rules
  are followed for all code in SBN repositories.

[`[NL.03]`](#NL03) <span id="NL03"> **[++]**
  It is **encouraged** that only one library is generated per source code
  directory (i.e. per package), and that if multiple libraries are desired,
  they be placed in their own subdirectories (sub-packages).

[`[NL.04]`](#NL04) <span id="NL04"> **[+++]**
  Use of CamelCase and single string (no `-` nor `_` ) in package and library
  names is **required**.


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

[`[NS.01]`](#NS01) <span id="NS01"> **[++]**
  `cet_build_tools` is somehow biassed toward using `.cc` suffix for C++
  files, and it is **encouraged** that this suffix be used for source files
  containing the definition of _art_ plugin classes (modules, services, tools);

[`[NS.02]`](#NS02) <span id="NS02"> **[+++]**
  for the other files, it is **required** to stick to the existing
  convention in the source directory or its parent, if any is present.

[`[NS.03]`](#NS03) <span id="NS03"> **[++]**
  names of source files with a main algorithm or class are **encouraged**
  to match the one of that algorithm or class, e.g. `sbn::Track` source should
  be called `Track.h`/`Track.cxx`.

[`[NS.04]`](#NS04) <span id="NS04"> **[+]**
  **suggested** suffixes:
  * C++ headers: `.h`
  * C++ source: `.cxx`
  * C++ template implementation: `.txx`


##  [NC] Capitalization  ###################################################

[`[NC.01]`](#NC01) <span id="NC01"> **[++]**
  "CamelCase" is **encouraged** for composite names (e.g. `PhotonLibrary`).

[`[NC.01]`](#NC01) <span id="NC01"> **[+++]**
  Plugin name is **required** to match the file it is defined in
  (this is a `cet_build_tools` build system requirement).


##  [NV] Variables and other identifiers  ##################################

Variable names should be designed with a code reader in mind,
even at the cost of some additional key strokes, and then to minimize
possible name collisions or ambiguities.

[`[NV.01]`](#NV01) <span id="NV01"> **[+++]**
  Use of a descriptive control variable is **required**
  in any loop longer than five lines. Descriptive names do not need to be long:
  in a known formula, `V` and `R` are proper variable names for a voltage
  and a resistance if unambiguous in the scope, although caution should be taken
  when using `i` as a real number because of the tradition of `i` being an
  integral index.

[`[NV.02]`](#NV02) <span id="NV02"> **[−−]**
  Declaration of identifiers starting with an underscore is **discouraged**
  (even to denote private class members).

[`[NV.03]`](#NV03) <span id="NV03"> **[−−−]**
  declaration of identifiers starting
  with two or more underscores (e.g. `__i`) is **forbidden**.

[`[NV.04]`](#NV04) <span id="NV04"> **[−−−]**
  Use of identifiers with different capitalization in the same scope is
  **forbidden** except if the capitalization follows a physics formula,
  where it is still **discouraged**. For example,
  `double const F = G * m * M / (d*d);` is acceptable, but 
  `double const F = G * m1 * m2 / (d*d);` should still be preferred.

[`[NV.05]`](#NV05) <span id="NV05"> **[++]**
  Private data member names are **encouraged** to start with `f` and use CamelCase
   (e.g. `double fTrackLength`). This pattern should be reserved exclusively for such private data member.
  Conversely, public data members and local variables should instead follow the more general guideline
  expressed above (i.e. simple camelCase, e.g. `trackLength`).


##### Identifiers example

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
    simb::MCParticle const& part = interaction.GetParticle(iPart);
    
    /* ... useful code here ... */
    
  } // for all particles
  
} // for all interactions
```
Names don't need to be that long, as long as they are meaningful.


### Summary of identifier name recommendations

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

[`[NA.01]`](#NA01) <span id="NA01"> **[++]**
  When adding branches or data products to the CAF files, it is **encouraged**
  to follow the standards for nomenclature and numbering already existing in the file.
  For example: initialize empty variables to `-5` when appropriate,
  when adding a vector of objects, add also an `int` indicating vector size, etc.

[`[NA.02]`](#NA02) <span id="NA02"> **[+++]**
  Use of `k` and CamelCase for names for `Cuts` and `Vars` in CAFAna macros
  is **required**.

[`[NA.03]`](#NA03) <span id="NA03"> **[++]**
  The use of namespaces to tag the names/versions of the cuts is **encouraged**.
  For example:
  ```cpp
  namespace SBNworkshop2020 {
  
    Cut kEnergy;
      
  } // namespace SBNworkshop2020
  ```
  instead of `Cut kEnergy_SBNworkshop2020`.

[`[NA.04]`](#NA04) <span id="NA04"> **[+++]**
  Names of cuts and vars for a frozen analysis are **required** to end
  with a corresponding `_tag` unless they are defined in a namespace;
  for example: `kEnergyCut_2020PAC`.

[`[NA.05]`](#NA05) <span id="NA05"> **[+++]**
  When editing cuts and vars from frozen analyses, it is **required**
  that the editor create a new copy of the cut or var
  and leave the old one in use for future comparisons.

[`[NA.06]`](#NA06) <span id="NA06"> **[++]**
  Storing cuts and vars in sensibly corresponding scripts i.e. keep numu
  analysis cuts in `Cuts/NumuCuts.cxx` and MC cuts in `Cuts/TruthCuts.cxx` etc. is **encouraged**

[`[NA.07]`](#NA07) <span id="NA07"> **[++]**
  Removing unused CAF branches is **encouraged**.


#   [C] Coding   ###############################################################

##  [CO] Organization, layout and style  ###################################

_Rationale_: protect the modularity of the code and control the dependency tree.

[`[CO.01]`](#CO01) <span id="CO01"> **[++]**
  One header and source file per class is **encouraged**. Exceptions apply
  for implementation details (that may be branched out in a separate file
  in a `Details` subdirectory, or left in the main file) and for simple
  helper functions and classes.

[`[CO.02]`](#CO02) <span id="CO02">**[+++]**
  The **required** indentation is via spaces (2 per level **suggested**).
  Indentation must be uniform: either 2, 3 or 4 characters per level everywhere,
  on every line of the code and for every level of indentation.
  In case of modification of existing code violating this requirement,
  it is **encouraged** that the indentation be standardized first
  (with a commit solely devoted to reindentation), and it is otherwise
  **required** that the existing indentation be exactly followed otherwise.

[`[CO.03]`](#CO03) <span id="CO03">**[−−]**
  The use of editor-specific directives to describe the indentation settings
  is **discouraged** because of the editor-specificity.

[`[CO.04]`](#CO04) <span id="CO04">**[++]**
  The use of [K&R style of brackets](https://en.wikipedia.org/wiki/Indentation_style#K.26R_style)
  is **encouraged**.


### Specific for CAF libraries and tools

[`[CO.21]`](#CO21) <span id="CO21"> **[+++]**
  `CAFMaker_module.fcl` is intended to access _art_ data products, 
  create `StandardRecord` objects, and call filling functions only. 

[`[CO.22]`](#CO22) <span id="CO22">**[+++]**
  All computations for filling CAF branches and calculations
  are **required** to live in the corresponding `Fill<specifier>Vars.cxx` script.

[`[CO.23]`](#CO23) <span id="CO23">**[−−−]**
  `StandardRecord` is intended to hold the structure of CAF files only.
  Any dependence to LArSoft packages in `StandardRecord` is **forbidden**.


##  [CS] Source file metadata  #############################################

_Rationale_: we want every piece of code associated to one or more authors,
both to facilitate its use and maintenance by allowing to ask to its authors,
and as a recognition and acknowledgement.

[`[CS.01]`](#CS01) <span id="CS01"> **[+++]**
  Every source file is **required** to report in a header
  the author(s) and possibly a contact mean (e-mail is **suggested**).

[`[CS.02]`](#CS02) <span id="CS02"> **[++]**
  Doxygen format is **encouraged**:
  ```cpp
  /**
   * @file   TrackBloating/TrackBloatAlg.h
   * @brief  Algorithm to double the memory required by a track.
   * @author Mark Johnson (mjohnson@fnal.gov), John Markson (jmarkson@fnal.gov)
   */
  ```

[`[CS.03]`](#CS03) <span id="CS03"> **[++]**
  Authors other than the ones in the headers are **encouraged**
  to report their name (and contact) upon major additions (including
  rewritten algorithm implementations) in a C++ comment;
  it is **encouraged** that this information be added in the Doxygen
  documentation of the function or class being modified with the same
  `@author` syntax as for the file header.


##  [CE] Error handling and message logging  ###############################

_Rationale_: users should be immediately reported errors stemming from faulty
configuration or input. Code should prioritize reporting dangerous or dubious
conditions over automatic mitigation.


[`[CE.01]`](#CE01) <span id="CE01"> **[++]**
  The liberal use of `assert()` or C++ `concept` constructs is **encouraged**
  to document assumptions that the code is making and is not (formally)
  verifying; e.g. a function documented to require as argument a non-empty list
  of tracks may include as first line a `assert(!tracks.empty());`.

[`[CE.02]`](#CE02) <span id="CE02"> _**[++]**_
  C++ exceptions are **encouraged** as tools for reporting error;
  using `cet::exception` as base of exceptions where available is **encouraged**
  as a recognizable pattern and because of the convenience of the class.
  
  > The text above is the original thought by G. Petrillo.
  > C. Backhouse proposes the exact opposite.
  > Which practice is best for us should be considered
  > [under discussion](https://github.com/PetrilloAtWork/SBNSoftware.github.io/pull/5).

[`[CE.03]`](#CE03) <span id="CE03"> **[−−]**
  "Catch-all" constructs (`catch (...)`) are **strongly discouraged** as they
  have repeatedly been found to hide essential errors.

[`[CE.04]`](#CE04) <span id="CE04"> **[++]**
  Messages reporting unusual conditions are **encouraged** to be routed into
  specific streams for easy filtering; examples include the use of
  `mf::LogError`/`mf::LogProblem` when `messagefacility` library is available,
  or `std::cerr`.

[`[CE.05]`](#CE05) <span id="CE05"> **[++]**
  Within _art_ jobs, message facility library is **strongly encouraged** for message logging.

[`[CE.06]`](#CE06) <span id="CE06"> **[−−]**
  Likewise, the use of C++ output stream to console
  (`std::cout`, `std::cerr`) is **strongly discouraged** unless the code is
  expected to be run in an environment where message facility is not available.
  In that case, it is still **suggested** that template output classes be used.

[`[CE.07]`](#CE07) <span id="CE07"> **[−−−]**
  Inclusion of `<iostream>` in a header file is **forbidden**: if output to
  C++ standard streams is _really_ needed, it should be placed into the
  implementation file rather than in the header.

[`[CE.08]`](#CE08) <span id="CE08"> **[++]**
  When using message facility (or Python `logging` module), the **encouraged**
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
  too frequently, consider to route it in a different message category.
  It is then possible for the users to set a limit so that a few messages
  are logged, but then additional ones are progressively discarded.

[`[CE.09]`](#CE09) <span id="CE09"> _**[+++]**_
  When a module fails to load a data product that is specified by configuration,
  it is assumed that there is either a configuration error or a defective input,
  and as such the module is **required** to emit a fatal error.
  This behaviour can be optionally disabled by a flag as an additional configuration
  parameter or, in alternative, by a parameter listing the mandatory input,
  where missing data not in the required categories does not trigger a fatal
  error. In these cases it is **recommended** that the number of missing data
  products be tracked and reported at the end of the job.


##  [CC] Configuration and experiment-specific features  ###################

_Rationale_: code must work for all SBN experiments with the least possible changes,
ideally limited to configuration files. The explicit lack of support for one
of the experiments is still preferable to code that gives for that experiment
wrong results.

[`[CC.01]`](#CC01) <span id="CC01"> **[−−−]**
  Presence in the code of constants describing the specific detectors are
  **strongly discouraged** in the experiment code repositories, and
  **forbidden** in the repositories with SBN-shared code.
  Configuration parameters, via FHiCL or other objects at class construction
  or via member function calls, should be used instead.

[`[CC.02]`](#CC02) <span id="CC02"> **[+++]**
  If it proves unfeasible to support a feature for a specific experiment,
  the attempt to use that feature with that experiment is **required**
  to trigger a fatal error.

[`[CC.03]`](#CC03) <span id="CC03"> **[++]**
  The use of LArSoft services is **strongly encouraged** when they provide
  the needed features. The loss in flexibility is offset by the wider testing
  of that code and the promise of interoperability with other experiments,
  including the other SBN ones. Examples of this include the detector
  geometry description and the properties and timings of the detectors.


##  [CL] LArSoft and _art_  ################################################

[`[CL.01]`](#CL01) <span id="CL01"> **[++]**
  In general, the use of the practices recommended by _art_ is **encouraged**.

[`[CL.02]`](#CL02) <span id="CL02"> **[++]**
  The **encouraged** form for reading a data product from `art::Event` depends on
  the case. The most common ones are:
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
  The use of `art::InputTag` in place of plain `std::string` for identifying
  data products is **strongly encouraged**.
  Example:
  ```cpp
  // ... at declaration ...
  
    std::string fTRKHMproducer;
    
  // ... at initialization ...
    
      fTRKHMproducer= p.get<std::string>("TRKHMproducer", "");
  
  // ... at utilization ...
    
    art::InputTag thm_label = (fTRKHMproducer.size() ? art::InputTag(fTRKHMproducer) : fTRKproducer);
  ```
  should be:
  ```cpp
  // ... at declaration ...
  
    art::InputTag fTRKHMproducer;
    
  // ... at initialization ...
    
      fTRKHMproducer= p.get<art::InputTag>("TRKHMproducer", {});
  
  // ... at utilization ...
    
    art::InputTag thm_label = fTRKHMproducer.empty()? fTRKproducer: fTRKHMproducer;
  ```

[`[CL.04]`](#CL04) <span id="CL04"> **[−]**
  Alternatives to `art::FindManyP` are **suggested** if possible. For example,
  if there is the prescription that associations are ordered, like in
  `art::Assns<recob::Cluster, recob::Hit>`, and sequential iterations are needed,
  [`art::for_each_group_with_left()`](https://nusoft.fnal.gov/larsoft/doxsvn/html/namespaceart.html#af20019c68ad469044f2ce12ed469441d) or
  [`util::associated_groups_with_left()`](https://nusoft.fnal.gov/larsoft/doxsvn/html/ForEachAssociatedGroup_8h.html)
  (`lardata/Utilities/ForEachAssociatedGroup.h`) are suitable and more efficient.

[`[CL.05]`](#CL05) <span id="CL05"> **[+]**
  The use of `art::ProductToken` is **suggested** for simple data product reading.

[`[CL.06]`](#CL06) <span id="CL06"> **[++]**
  The use of `consumes()` calls in module constructors is **encouraged**.

[`[CL.07]`](#CL07) <span id="CL07"> **[++]**
  The use of [configuration validation](https://cdcvs.fnal.gov/redmine/projects/fhicl-cpp/wiki/Configuration_validation_and_fhiclcpp_types)
  is **encouraged** as it adds greatly to both usability and robustness.

[`[CL.08]`](#CL08) <span id="CL08"> **[++]**
  When data structures indexed by a plane or TPC are needed, the containers provided
  by [`geo::GeometryCore::makePlaneData()`](https://nusoft.fnal.gov/larsoft/doxsvn/html/classgeo_1_1GeometryCore.html#a4133ed1f337780925ac5e2d7f7a2ddeb)
  and similar are **encouraged** and should be preferred over a nested array.

[`[CL.09]`](#CL09) <span id="CL09"> **[++]**
  For iteration through TPC, planes etc., the use of
  `geo::GeometryCore::IterateXxxx()` methods
  (e.g. [`IteratePlanes()`](https://nusoft.fnal.gov/larsoft/doxsvn/html/classgeo_1_1GeometryCore.html#ae8ca7d464c8c3e1095ca64a640094367))
  is **encouraged**.



##  [CF] Language features  ################################################

C++ is now a relatively fast-paced standard, adding both language features
and library components every three years.
We are a bit behind that, in part because of the constraints from _art_ and
of supporting two different compilers (GCC and Clang).

[`[CF.001]`](#CF001) <span id="CF001"> **[++]**
  In general, motivated adoption of well-supported new features is **encouraged**;
  still, if the feature is considered too obscure a clarification comment
  is **suggested**. An example:
  ```cpp
  unsigned int n = 0;
  for (Data_t const& elem: data) {
      (void) elem; // prevent "unused variable" warnings
      ++n;
  }
  ```
  (replace `(void) elem;` with `std::ignore = elem;` if you prefer).


### `auto` keyword

_Rationale_: The `auto` keyword has the magic ability of decreasing with its sole
appearance the readability of the code by a few marks.
It should be used judiciously (and sparsely).

[`[CF.005]`](#CF005) <span id="CF005"> **[−−]**
  In general, the use of `auto` is **discouraged**

[`[CF.006]`](#CF006) <span id="CF006"> **[+]**
  The `auto` keyword can be safely used when the underlying type is _obvious_
  from the code in the same line or the previous one.
  In doubt, spell the type out instead.


##### `auto` examples

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
* statements that already spell out the type elsewhere:
  ```cpp
  auto const& vertices
    = event.getByLabel<std::vector<recob::Vertex>>(vertexTag);
  ```
  In this case `art::Event::getByLabel()` (which should be reasonably
  well known anyway) returns the type written in its template argument.
* in lambda types, of course, `auto` is acceptable when no other option is available:
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
  but using a stable type offering that interface is still **endorsed**.
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
   * { ... }
   * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   */
  auto getParticles() const;
  ```


### Namespaces

_Rationale_: namespaces are a tool to provide context to "foreign" identifiers
(cf. `Track` vs. `recob::Track`). Language rules automatically allow omitting
them in many situations, and they actually increase the understandability of
the code. Shortcuts to omit them should be considered critically because they
make it harder for non-experts to interpret the code and increase the chances
of unexpected behaviour.

[`[CF.011]`](#CF011) <span id="CF011"> **[−−]**
  Importing a namespace (e.g. `using namespace std;`) is *discouraged*;
  it is *strongly discouraged* in global scope;
  an exception is namespaces containing exclusively
  [user-defined literal operators](https://en.cppreference.com/w/cpp/language/user_literal)
  (e.g. `using namespace std::string_literals`);

[`[CF.012]`](#CF012) <span id="CF012"> **[−−−]**
  `using namespace` directives are nevertheless always thoroughly
  **forbidden** in global scope of header files.
  You may import specific symbols at local scope (i.e. within the body of your `class`)
  if absolutely necessary for readability
  (`using Iterator_t = std::vector<std::vector<std::pair<int, int>>>::const_iterator;`)
  or for functionality (e.g. `using std::begin, std::end;`).

[`[CF.013]`](#CF013) <span id="CF013"> **[++]**
  In header files, it is **encouraged** that functions and variables
  that are considered implementation details be enclosed in a namespace;
  a standard choice is a specific namespace for that functionality,
  the namespace `details`, or both nested (e.g. `sbn::details::vtxStubs`).
  A similar recommendation still holds for code in implementation files
  (non-header).


### Variables and parameters

[`[CF.021]`](#CF021) <span id="CF021"> **[+++]**
  It is **required** that variables be defined
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

[`[CF.022]`](#CF022) <span id="CF022"> **[+]**
  The use of a single collection of structured elements is **suggested**
  over multiple collections of simple elements,
  when no other performance issue is involved.
  For example:
  ```cpp
  std::vector<double> time(MaxHits, 0.0);
  std::vector<float> charge(MaxHits, -5.f);
  for (recob::Hit const& hit: hits) {
    std::size_t const id = hitToID(hit);
    time.at(id) = hit.PeakTime();
    charge.at(id) = hit.Integral();
  }
  ```
  is better written as:
  ```cpp
  struct HitInfo_t {
    double time = 0.0;
    float charge = -5.f;
  };
  std::vector<HitInfo_t> hitInfo(MaxHits);
  for (recob::Hit const& hit: hits)
    hitInfo.at(hitToID(hit)) = { hit.PeakTime(), hit.Integral() };
  ```
  This improves the ahderence of the code to the concepts it represents
  (the relation of times and charges).
  It is easier to pass to other functions, and the result is easier
  to expand with more information (e.g. hit amplitude).
  It is less error-prone (it prevents mismatching between charge and time elements),
  although the constructor syntax in the example has its own risks, relying
  of a known order for `HitInfo_t` data members
  (C++20 will allow naming each element to prevent this mismatch).
  It may also be more efficient (here just a single allocation rather than two),
  but it may prevent speed optimization too.



### C++ best practices

[`[CF.051]`](#CF051) <span id="CF051"> **[−−−]**
  Pointer variables _never_ own their memory.
  The use of `new` operator is **forbidden**.
  Data arrays should be stored in collections like `std::vector`.
  Dynamic memory should be allocated via `std::make_unique()`.
  In case of interface with external libraries which do not follow this rule
  and return a pointer owning memory, if that memory is requested to be freed
  with `delete`, immediately wrapping it into a `std::unique_ptr`
  is **encouraged** and encapsulation in a custom handle object **suggested**.

[`[CF.052]`](#CF052) <span id="CF052"> **[++]**
  More in general, resources that need to be acquired and eventually released
  are **encouraged** to be managed by a specific object following the
  [RAII](https://en.wikipedia.org/wiki/Resource_acquisition_is_initialization) pattern,
  that is an object that automatically books the resource on construction
  and releases on destruction.

[`[CF.053]`](#CF053) <span id="CF053"> **[++]**
  It is **encouraged** that the most information be given
  to the compiler pinning down the intended features of the code. That includes
  constantness (next point), attributes (e.g. `[[fallback]]`), the `override` keyword.

[`[CF.054]`](#CF054) <span id="CF054"> **[+++]**
  It is **required** that the type and constantness of the variables
  be reflecting its quantity. For example, an item count should be an `unsigned int`,
  an index of STL array or vector should be `std::size_t`
  (because that is the native type of `std::vector::operator[]` parameter),
  or `std::ptrdiff_t` or, better yet, a [`gsl::index`](https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md#gslutil-utilities) (the type of indices is a known C++ issue).

[`[CF.055]`](#CF055) <span id="CF055"> **[++]**
  It is **encouraged** that "variables" that are not expected to be changed
  be _always_ declared constant, so that accidental changes are spotted by
  the compiler (e.g. `int const nParticles = mcTruth.NParticles();`).

[`[CF.056]`](#CF056) <span id="CF056"> **[++]**
  The use of temporary variables is **strongly encouraged** to avoid code repetitions
  that are both questionable in terms of performance
  (although compilers may be "smart" enough to figure it out)
  and a maintenance liability.
  The strong recommendation still holds, even stronger, when adding 
  lines to existing code which does not support this pattern yet.
  For example:
  ```cpp
  for (recob::Hit const& hit: hits) {
    ++n;
    // BAD: repetition of complex code
    x += geom.Wire(hit.WireID()).GetCenter<geo::Point_t>().X();
    y += geom.Wire(hit.WireID()).GetCenter<geo::Point_t>().Y();
    z += geom.Wire(hit.WireID()).GetCenter<geo::Point_t>().Z();
  }
  ```
  should be:
  ```cpp
  for (recob::Hit const& hit: hits) {
    geo::Point_t const& wireCenter
      = geom.Wire(hit.WireID()).GetCenter<geo::Point_t>();
    ++n;
    x += wireCenter.X();
    y += wireCenter.Y();
    z += wireCenter.Z();
  }
  ```
  and likewise
  ```cpp
  protonRecoLen = sr.reco.trk[iTrk].len;
  
  protonTrueE = sr.reco.trk[iTrk].truth.p.startE; // BAD: repetition of complex code
  protonTrueLen = sr.reco.trk[iTrk].truth.p.length;
  protonTrueContained = sr.reco.trk[iTrk].truth.p.contained;
  ```
  should be:
  ```cpp
  caf::SRTrack const& track = sr.reco.trk[iTrk];
  protonRecoLen = part.len;
  
  caf::SRTrueParticle const& truePart = track.truth.p;
  protonTrueE = truePart.startE;
  protonTrueLen = truePart.length;
  protonTrueContained = truePart.contained;
  ```

[`[CF.057]`](#CF057) <span id="CF057"> **[−−−]**
  The use of `const_cast` and `reinterpret_cast` is **forbidden**
  except when interfacing with broken external library code,
  in which case a large and thorough comment is required.

[`[CF.058]`](#CF058) <span id="CF058"> **[−−]**
  The use of `dynamic_cast` is **discouraged**, as there is usually a way to design
  interfaces without the need for this type of cast.
  Plain C-style casts are also **discouraged** in favor of the more expressive
  (and easier to recognise and understand) `static_cast`.

[`[CF.059]`](#CF059) <span id="CF059"> **[−−−]**
  The use of labels and `goto` statement are **forbidden** except for the
  specific purpose of jumping out of deeply-nested loops
  when all other alternatives have been considered and judged worse.

[`[CF.060]`](#CF060) <span id="CF060"> **[+]**
  Initialization syntax with braces is **suggested** as it is the most universally
  applicable (a famous exception is the initialization of a `std::vector` of
  numbers with its size, which ends up being ambiguous:
  `std::vector{ 3, 1 }` contains two elements, `3` and `1`,
  while `std::vector(3, 1)` contains three elements, all set to `1`;
  likewise, `std::vector{ 3 }` contains one element, `3`,
  while `std::vector(3)` contains three elements initialized to `0`).

[`[CF.061]`](#CF061) <span id="CF061"> **[+++]**
  Logic operators are **required** to be spelled symbolically
  (`&&`, `||`, `!`) rather than in word (`and`, `or`, `not`),
  as it is a better known syntax. Digraphs and trigraphs are **forbidden**.


##### Examples of C++ best practices

###### Examples of resource manager objects

| resource                               | manager class        | library and header                 | replaces               |
| -------------------------------------- | -------------------- | ---------------------------------- | ---------------------- |
| memory: dynamic object allocation      | `std::unique_ptr`    | `<memory>`                         | `new T`                |
| memory: sequence of data               | `std::vector`        | `<vector>`                         | `new T[n]`             |
| memory: delayed object initialisation  | `std::optional`      | `<optional>`                       | `new T`                |
| input file                             | `std::ifstream`      | `<fstream>`                        | `FILE* f = open(...)`  |
| output file                            | `std::ofstream`      | `<fstream>`                        | `FILE* f = open(...)`  |
| ROOT histogram or tree                 | `TFileService`       | `"art_root_io/TFileService.h"`     | `new TTree` ...        |
| critical section/mutex                 | `std::scoped_lock`   | `<mutex>`                          | `mtx.lock()`           |
| `gDirectory`                           | `TDirectoryChanger`  | `icarusalg/Utilities/ROOTutils.h`  | `gDirectory = ...`     |


###### Examples of variable types for quantities

| description                                 | suggested types                   | notes                             |
| ------------------------------------------- | --------------------------------- | --------------------------------- |
| counter                                     | `unsigned int`                    | integral number, start from 0 up  |
| detector coordinate                         | `double`                          | needs dynamic range >10⁷          |
| array index                                 | `int`, `gsl::index`               | used in C-style arrays            |
| array index                                 | `std::size_t`                     | only used to index `std::vector`  |
| ADC sample                                  | `unsigned short int`              | reduced size, no sign bit         |
| timestamp in nanoseconds from 01/01/1970    | `long long int`                   | `double` loses precision!         |
| time manipulation in LArSoft                | `detinfo::timescales` quantities  | not straightforward to use yet    |



#### References vs. pointers

_Rationale_: references and pointers share the same performance, but have different
features that make them appropriate for different usage patterns:
a reference, compared to a pointer:

1. can't be copied or reassigned to a different object
2. can't point to the null memory address (while a pointer can be `nullptr`)

[`[CF.101]`](#CF101) <span id="CF101"> **[++]**
  As consequence, use of pointers is **endorsed** only if a variable is allowed to point
  to "no object" (`nullptr`), or if reassignments are required
  (note that a class holding a reference data member becomes itself non-copiable —
  and non-moveable — by default).
  For example:
  ```cpp
  assert(!sr.reco.trk.empty());
  auto iTrack = sr.reco.trk.begin();
  auto const tend = sr.reco.trk.end(), 
  caf::SRTrack const* shortestTrack = &*iTrack;
  for (; iTrack != tend; ++iTrack) {
    if (iTrack->len < shortestTrack->len) shortestTrack = &*iTrack;
  }
  ```
  (reassignment required). Or:
  ```cpp
  struct TrackQuality {
      
      QualityParams_t const fParams;
      
      TrackQuality(QualityParams_t params): fParams(std::move(params)) {}
      
      bool isGood(caf::SRTrack const& track, QualityParams const* params = nullptr) const
        { return isGoodAccordingTo(track, params? *params: fParams); }
      
      static bool isGoodAccordingTo
        (caf::SRTrack const& track, QualityParams const& params);
  };
  ```
  Here `TrackQuality::isGood()` can choose between using its own parameters set
  or one passed by the caller, so its `params` argument is supported to be `nullptr`.
  The static function `TrackQuality::isGoodAccordingTo()` on the other end requires
  a `params` object, so its interface does not allow it to be `nullptr`.
  It should be noted that a better implementation for the above is to have two
  overloads of `isGood()`: `isGood(caf::SRTrack const& track) const`
  and `isGood(caf::SRTrack const& track, QualityParams const&) const`,
  and that the concept of an optional parameter is properly rendered by the
  aptly named [`std::optional`](https://en.cppreference.com/w/cpp/utility/optional) data type.

[`[CF.102]`](#CF102) <span id="CF102"> **[+]**
  Mixed use is also **suggested** when suitable for the use case.
  For example, we may want an object to hold a reference to an object, but to be copiable.
  In this case, a possible pattern is:
  ```cpp
  class Matcher {
      geo::GeometryCore const* fGeom;
      
          public:
      Matcher(geo::GeometryCore const& geom): fGeom(&geom) {}
      // ...
  };
  ```
  which forces the caller to provide an object, but it stores it as pointer so that
  it stays copiable and moveable. Again, a copiable reference-like object
  ([`std::reference_wrapper`](https://en.cppreference.com/w/cpp/utility/functional/reference_wrapper)) is also provided
  by [`std::ref()` and `std::cref()`](https://en.cppreference.com/w/cpp/utility/functional/ref)
  (defined in `<functional>` header).


#### Memory usage and avoiding unnecessary copy of data

_Rationale_: copying large chunks of data has deleterious effects,
and has been a common cause of excessive use of memory
(for example, a temporary copy of a 1-GB data structure may be
almost negligible in the overall memory balance, but it may make
a remote job cross a 2 GB memory hard limit and have the job killed).
There are well known patterns that prevent unnecessary copies.


[`[CF.111]`](#CF111) <span id="CF111"> **[++]**
  It is **required** to avoid copies of return values. For example:
  ```cpp
  auto digits = event.getByLabel<std::vector<raw::RawDigits>>(WaveformTag); // BAD
  ```
  should become
  ```cpp
  auto const& digits
    = event.getByLabel<std::vector<raw::RawDigits>>(WaveformTag);
  ```
  to avoid copying the returned vector.

[`[CF.112]`](#CF112) <span id="CF112"> **[+++]**
  Function arguments of large non-trivial types are **required** to be
  declared as constant references
  (with "large" being indicatively larger than 32 bytes,
  or any involving dynamic memory allocation):
  ```cpp
  class HitProcessor {
  
    std::vector<recob::Hit> fRefHits; ///< Local copy of reference hits.
    
        public:
    
    /// Constructor: starts from initial hits.
    HitProcessor(std::vector<recob::Hit> initialHits);
    
    /// Returns the collection of compined hits.
    // BAD: will always copy the return value:
    std::vector<recob::Hit> combinedHits() const { return fRefHits; }
    
    /// Combines the specified `hits` with the existing ones.
    // BAD: will always copy the argument `hit`:
    void combineWith(std::vector<recob::Hit> hits);
    
  };
  ```
  should become:
  ```cpp
  class HitProcessor {
  
    std::vector<recob::Hit> fRefHits; ///< Local copy of reference hits.
    
        public:
    /// Constructor: starts from initial hits.
    HitProcessor(std::vector<recob::Hit> initialHits);
    
    /// Returns the collection of compined hits.
    std::vector<recob::Hit> const& combinedHits() const { return fRefHits; }
    
    /// Combines the specified `hits` with the existing ones.
    void combineWith(std::vector<recob::Hit> const& hits);
    
  }; 
  ```
  (the constructor is explained in a later point).
  Most typically the use of `combinedHits()` would be along the pattern:
  ```cpp
  std::vector<recob::Hit> const& combHits = hitProc.combinedHits();
  ```
  The bad example, returning the vector by value, will _always_ copy the hits.
  Likewise, in the bad example the argument of `combineWith()`
  will be always copied when calling that method, while in the good one
  it will not be copied by the method call (the method implementation
  may still copy it though).

[`[CF.113]`](#CF113) <span id="CF113"> **[+]**
  The **suggested** pattern for initialization of large data member from
  function arguments (and constructor's, where it is **endorsed**)
  is to copy the value into the function parameter, and then move it.
  The implementation of the constructor
  in the previous example following that pattern would be:
  ```cpp
  HitProcessor::HitProcessor(std::vector<recob::Hit> initialHits)
    : fRefHits(std::move(initialHits)) {}
  ```
  (`std::move()` is defined in `<utility>` header).
  This usually guarantees optimal performance even when
  the calling code pass a temporary vector
  (e.g. `HitProcessor hitProc { generateHits() };`).
  If in doubt, though, fall back to the constant reference rule above.

[`[CF.114]`](#CF114) <span id="CF114"> **[++]**
  Allocation of the memory for a data structure in advance is **encouraged** 
  if its _final_ size is known. For example:
  ```cpp
  std::vector<recob::Hit> normalizedHits;
  // BAD: many reallocations in case of large number of hits
  for (recob::Hit const& hit: hits)
      normalizedHits.push_back(normalize(hit));
  ```
  would be better as:
  ```cpp
  std::vector<recob::Hit> normalizedHits;
  normalizedHits.reserve(hits.size());
  for (recob::Hit const& hit: hits)
      normalizedHits.push_back(normalize(hit));
  ```
  Otherwise, each time `normalizedHits` needs to be expanded,
  say from size _M_ to size _N_, the code may be forced to first allocate room
  for _N_ objects (after which, _M_ + _N_ are allocated), then _copy_ the _N_
  original elements, then delete them.
  

#### Checked vs. unchecked element access (i.e. `at()` vs. `[]`)

_Rationale_: data collection objects like `std::vector` offer both a checked access
(`data.at(index)`) which throws an exception if the requested element
is not included in the collection, and an unchecked one (`data[index]`)
whose behaviour is undefined in such case.
Most often, the unchecked access should be preferred because faster,
but it is important to avoid indices out of range.
Conversely, the choice of one over the other conveys the underlining
consideration.

[`[CF.121]`](#CF121) <span id="CF121"> **[++]**
  Unchecked access is **encouraged** if the element is already known to be
  included; this can be achieved by a specific check. For example:
  ```cpp
  for (std::size_t i = 0; i < data.size(); ++i) {
      float const charge
        = processData(charges.at(i), data.at(i)); // BAD: `i` in `data` by construction
      if (charge > 0.0) charges.at(i) = charge;   // BAD: redundant check
  }
  ```
  should be
  ```cpp
  if (charges.size() != data.size()) {
      throw cet::exception("") << "Inconsistent charges ("
        << charges.size() << " vs. " << data.size() << " expected)\n";
  }
  for (std::size_t i = 0; i < data.size(); ++i) {
      float const charge = processData(charges[i], data[i]);
      if (charge > 0.0) charges[i] = charge;
  }
  ```

[`[CF.122]`](#CF122) <span id="CF122"> **[++]**
  Unchecked access is **encouraged** also when the element is expected
  by protocol to be present, in which case documenting the expectation
  (e.g. with an assertion) is also **encouraged**.
  If that applies to `charges` of the example above,
  because for example the documentation explicitly asserts that `data`
  is assumed to have the same size as `charge`, the snippet may become:
  ```cpp
  assert(charges.size() == data.size());
  for (std::size_t i = 0; i < data.size(); ++i) {
      double const charge = processData(charges[i], data[i]);
      if (charge > 0.0) charges[i] = charge;
  }
  ```


#### User class design

[`[CF.151]`](#CF151) <span id="CF151"> **[−−]**
  As a consequence of the resource management pattern described above ("RAII"),
  the use of destructors in classes is **strongly discouraged**;
  they should be unnecessary and omitted entirely
  (except for a polymorphic base class, where the definition should always be
  `virtual ~BaseClass() = default;`).

[`[CF.152]`](#CF152) <span id="CF152"> **[+]**
  For objects that will exist in large collections, and especially for data structures,
   an ordering of data members from the largest to the smallest is **suggested**,
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

[`[CF.153]`](#CF153) <span id="CF153"> **[++]**
  The initialization of configuration data members in the constructor
  initializer list is **encouraged**, as is their constantness
  if the class does not need to be copyable.
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

[`[CF.154]`](#CF154) <span id="CF154"> **[+++]**
  It is **required** that all member functions that do not modify the object
  be declared `const`.
  It is also recommended that class methods changing the class data members
  be factored so that the parts that do not change that data be on their own
  (`const`) member function.
  For example: an object with a collections of tokens (`fTokens`) allows to
  insert a separator after each instance of a certain token value, and makes
  the token next to the separator capitalised (`capitalize()`):
  ```cpp
  void Parser::insertSeparatorAfter(Token_t const& sep, std::string const& key) {
    iterator it { fTokens.cbegin() };
    const_iterator tend { fTokens.cend() };
    while (it != tend) {
      if (it->key() == key) {
        iterator new_it = fTokens.insert(++it, sep)
        it = ++new_it;
        tend = fTokens.cend();
        if (new_it != tend) capitalize(*new_it);
      }
      else {
        ++it;
      }
    } // while
  }
  ```
  This implementation can be factorised in a incremental search and an
  insertion/capitalization:
  ```cpp
  Parser::const_iterator Parser::findNextToken
    (std::string const& key, const_iterator first) const
  {
    auto const matchKey = [&key](Token_t const& t){ return t.key() == key; };
    return std::find_if(first, fTokens.end(), matchKey);
  }
  
  iterator Parser::insertSeparatorBeforeAndCapitalize
    (const_iterator token, Token_t const& sep)
  {
    iterator const newToken = std::next(fTokens.insert(token, sep));
    if (newToken != fTokens.cend()) capitalize(*newToken);
    return newToken;
  }
  
  void Parser::insertSeparatorAfter(Token_t const& sep, std::string const& key) {
    const_iterator next { fTokens.cbegin() };
    while (true) {
      const_iterator const itKey = findNextToken(key, next);
      if (itKey == fTokens.cend()) return;
      next = insertSeparatorBeforeAndCapitalize(std::next(itKey), sep);
    } // while
  }
  ```
  This approach is closer to "one function for one task" philosophy.
  As a side effect, we gain a lookup functionality (`findNextToken()`) that
  can be reused in other methods. But the main gain is the guarantee that
  non-const iterators are used only when the modification of the content is
  needed (`insertSeparatorAndCapitalize()`), and in addition we can't
  accidentally change the content of the object while looking for the key:
  the code is more robust.
  This specific example is simple enough that the advantage is not impressive,
  but in more complex functions this may make a difference.


[`[CF.155]`](#CF155) <span id="CF155"> **[++]**
  The assignment of a initialization value to all non-`const` data members
  in their declaration in the class is **encouraged**. For example:
  ```cpp
  struct FilterEfficiency {
    unsigned int fTotal;  ///< Number of events processed by the filter.
    unsigned int fPassed; ///< Number of events passed by the filter.
    
    FilterEfficiency(): fTotal(0), fPassed(0) {}
  };
  ```
  would be instead:
  ```cpp
  struct FilterEfficiency {
    unsigned int fTotal { 0 };  ///< Number of events processed by the filter.
    unsigned int fPassed { 0 }; ///< Number of events passed by the filter.
  };
  ```
  (in this simple case, the constructor can be omitted; in many other cases,
  it can at least be "defaulted": `FilterEfficiency() = default;`).
  This reduces the consequences of forgetting the initialization of a data member,
  for example when adding a new one to the class and there are many constructors.
  Note that `const` data members can follow the same pattern, but it's less
  critical because the compiler will ensure they are initialized at construction.

[`[CF.156]`](#CF156) <span id="CF156"> **[++]**
  The assignment of a known value to all data members of a class is **encouraged**.
  For example:
  ```cpp
  struct Data {
    short ADC[16]; // BAD (probably): not initialized
    int channel;   // BAD: not initialized
  };
  ```
  should probably be:
  ```cpp
  struct Data {
    short ADC[16] {}; // all initialized to `0`
    int channel { InvalidChannel };
  };
  ```
  unless there are good reasons not to initialize ADC counts.

[`[CF.157]`](#CF157) <span id="CF157"> **[−−−]**
  Empty constructors (with empty body and *and* no initialization list)
  are **forbidden**. For example:
  ```cpp
  struct FilterEfficiency {
    unsigned int fTotal;
    unsigned int fPassed;
    
    FilterEfficiency() {} // BAD: no pro, and deters initialization of data members
  };
  ```
  will make `fTotal` and `fPassed` uninitialised.
  The class should not have any default constructor, and it should
  initialize its members explicitly as shown in the previous point
  unless it is a *documented* intention to have them uninitialized.

[`[CF.158]`](#CF158) <span id="CF158"> **[++]**
  Moderate use of delegated constructors is **encouraged** for maintainability.
  For example:
  ```cpp
  struct WireInfo {
  
    geo::WireID const fWireID;
    raw::ChannelID_t const fChannel { raw::InvalidChannelID };
    bool fHasHits { false };
    
    WireInfo() = default;
    WireInfo(geo::WireID wireID, raw::ChannelID_t channel);
    
    WireInfo(recob::Hit const& hit)
        : WireInfo(hit.WireID(), hit.Channel())
        { fHasHits = true; }
    
  };
  ```

[`[CF.159]`](#CF159) <span id="CF159"> **[+]**
  For a newly defined data structure, the use of `struct` is **suggested**
  if there is no "invariant" to be preserved (e.g. for a list of points:
  `struct { std::vector<geo::Point_t> points; };`, any point is good),
  of `class` otherwise (e.g. a list of points sorted by _z_ coordinate,
  `class { std::vector<geo::Point_t> fPoints; /* ... */};` and then the
  interface to manage it with it staying sorted).



##  [CQ] Quantity types and their units  ###################################

_Rationale_: clarity and predictability are essential when interpreting data
values, and relying heavily on conventions facilitate it.


### Units

[`[CQ.01]`](#CQ01) <span id="CQ01"> **[+++]**
  The **required** units for data quantities are described in
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

_Rationale_: plain-English documentation should allow the use of an algorithm
without falling back to interpret the code, and should especially include
the assumptions and considerations that are relevant to the users and are
not expressed by the code.

[`[DF.01]`](#DF01) <span id="DF01"> **[++]**
  **Encouraged** for algorithm classes and function to include also
  
  1. description of their function
        (e.g. "applies proton ID algorithm based on track range")
  2. explanation of the input format
        (e.g. "`recob::Track` objects with track fit")
  3. explanation of the requirements and assumptions on the input
        (e.g. "tracks are expected to have been corrected for space charge
        effects")
  4. an explanation of the features of the output
        (e.g. "a list of `ana::ParticleID` objects is returned, one for each
        input track, in the same order; if the algorithm could not be applied,
        the track is assigned a negative score value")
  5. plus a reference to external documentation (e.g. SBN DocDB document)
        describing the physics of it when it applies

[`[DF.02]`](#DF02) <span id="DF02"> **[+++]**
  **Encouraged** inline documentation in Doxygen format, attached to the object
  being described (for example, to a `class` definition instead than to the file
  where the definition is stored).


##  [DC] Tracking of changes  ##############################################

_Rationale_: discovery of major changes to the functionality of the code or
"relevant" changes of working parameters should be achievable
without a systematic comparison the different versions of the code.

[`[DC.01]`](#DC01) <span id="DC01"> **[+++]**
  Each repository contains in its main directory a `changes.md` file;
  the start of the file includes information about the format, like the
  pattern used for each entry and the tag for breaking changes.

[`[DC.02]`](#DC02) <span id="DC02"> **[+++]**
  Authors are **required** to update the `changes.md` log when...
  * A new algorithm is added: mentioning the purpose of the new feature, e.g.
    ```
    [20210805] New algorithm `BloatTracks` available.
    ```
  * A change in parameters that may affect future results:
    ```
    [20210804] Changed hit finding threshold for `GausHit` (see issue #235)
    ```
  * A change makes existing samples unreadable or misinterpreted:
    ```
    [20210825] **BREAKING CHANGE** From now on all distances are returned in inches.
    ```

[`[DC.03]`](#DC03) <span id="DC03"> **[+++]**
  In the last case, the change is defined as breaking and the entry is
  **required** to explicitly state that with a standard tag
  (`**BREAKING CHANGE**` is the recommendation).

[`[DC.04]`](#DC04) <span id="DC04"> **[+]**
  A simple format like in the examples above is **suggested**, given that the
  purpose of this file is as a fast lookup to discover where to find additional
  information. Information about the author of the change can be tracked down
  via GIT so a reference is just **suggested**. 

[`[DC.05]`](#DC05) <span id="DC05"> **[++]**
  Information about the release
  version, especially for breaking change, is **strongly encouraged** but
  it is the duty of the release manager rather than of the author, as it is
  the compilation of a overview of the breaking changes in time.


#   [L] Linking and building  ##################################################


##  [LB] Build diagnostics ("warnings")  ###################################

_Rationale_: compilation warnings have proven to be a powerful tool in early
detection of program mistakes. Experience shows that a single ignored warning
both creates a habit, and makes it harder to spot additional ones.

[`[LB.01]`](#LB01) <span id="LB01"> **[+++]**
  Building warnings must be addressed. This is a **requirement**, although
  reviewers are not required to take the extra steps to verify it (i.e. checking
  the compilation output from the automatic build or downloading and building it
  themselves).
  The build system is set to give a medium level of diagnostics, and to treat
  all of them as errors, except for the deprecation one, which is supposed to
  allow a bit of time to maintainers to cope with interface changes:
  compilation will fail in the presence of diagnostics messages. Successfully
  completing a compilation in general makes the code compliant with the previous
  requirement.

[`[LB.02]`](#LB02) <span id="LB02"> **[++]**
  If the compiler reports as problematic an intended behaviour, it is
  **strongly encouraged** that the code be reviewed with other people to
  identify whether the report is correct (hint: it usually is). If the review
  concludes the diagnostic message is spurious, it is allowed to "acknowledge"
  it without removing its cause, for example in case of compiler bugs.

[`[LB.03]`](#LB03) <span id="LB03"> **[+++]**
  When it is assessed that a diagnostic message should be locally disabled,
  the **required** approach is to use `#pragma` directives specific to the
  diagnostics (that may be complicated by dependency on the compiler, e.g.
  Clang vs. GCC) and, in case of compiler bug, the fencing of the workaround
  in `#if` preprocessor directives that pin down the version of the buggy
  compiler; e.g.
  ```cpp
  #if defined(__clang__) && (__clang_major__ <= 7)
  # pragma clang diagnostic push
  # pragma clang diagnostic ignored "-Wunused-variable"
  #endif
  // ...
  #if defined(__clang__) && (__clang_major__ <= 7)
  # pragma clang diagnostic pop
  #endif
  ```
  In this example, though, if the variable detected as unused is _really_
  unused, and for some reason its definition is still desired, the correct
  acknowledgement is to attribute `[[maybe_unused]]` to that variable.
  A not uncommon situation requiring this gymnastic is for variables of
  staged and conditional initialization, when the compiler is not able to
  determine that the variable would be used only in the code paths where
  it is initialized (`-Wmaybe-uninitialized`) -- beware that this is usually
  a sign of a flawed design.

[`[LB.04]`](#LB04) <span id="LB04"> **[+++]**
  The resolution of deprecation warnings on new code is **required**.



