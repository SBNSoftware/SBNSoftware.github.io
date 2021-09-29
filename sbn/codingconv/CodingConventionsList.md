---
title:       SBN analysis code conventions
description: Summary of code conventions as guidelines for SBN authors and reviewers.
breaks:      false
layout:      page_TOC_1_3
toc:         true
---

----

Quick links to the introductory sections:

* [Purpose & Scope](CodingConventions.md#purpose--scope)
* [Definitions](CodingConventions.md#definitions)
* [Compliance and procedures](CodingConventions.md#compliance-and-procedures)

----

#   Naming conventions   #######################################################

_Rationale_: naming should:
* be predictable to facilitate code discovery and automatic maintenance
* facilitate the understanding of the code
* not replace the documentation
* bear consistent style


##  Libraries and packages  ###############################################

Naming of libraries can be almost completely automated by `cet_build_tools`.
A "package" is a branch of the source tree in a repository.

**[R]** It is **required** that the implicit rules are
  followed for all code that is built under `cet_build_tools`.

**[E]** It is **encouraged** that the same implicit rules
  are followed for all code in SBN repositories.

**[E]** It is **encouraged** that only one library is generated per source code
  directory (i.e. per package), and that if multiple libraries are desired,
  they be placed in their own subdirectories (sub-packages).

**[R]** Use of CamelCase and single string (no `-` nor `_` ) in package and library
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


##  Source files  ##########################################################

[_explanations_](CodingConventionsExplained.md#source-files)

**[E]** Use `.cc` suffix for C++ source files
  containing the definition of _art_ plugin classes (modules, services, tools).

**[R]** For the other files, stick to the existing
  convention in the source directory or its parent, if any is present.

**[E]** Match names of source files hosting a main algorithm or class with
  the name of that algorithm or class (e.g. `sbn::Track` source file should
  be called `Track.h`/`Track.cxx`).

**[S]** File suffixes:

| type of source               | name pattern                       | example                       |
| ---------------------------- | ---------------------------------- | ----------------------------- |
| _art_ plugin source file     | `*_module.cc`, `*_service.cc`, ... | `PCAngleKinkFinder_module.cc` |
| C++ header                   | `*.h`                              | `Track.h`                     |
| C++ source                   | `*.cxx`                            | `Track.cxx`                   |
| C++ template implementation  | `*.txx`                            | `Track.txx`                   |


##  Capitalization  ########################################################

[_explanations_](CodingConventionsExplained.md#capitalization)

**[E]** "CamelCase" is **encouraged** for composite names (e.g. `PhotonLibrary`).

**[R]** _art_ plugin name is **required** to match the file it is defined in.


##  Variables and other identifiers  #######################################

[_explanations_](CodingConventionsExplained.md#variables-and-other-identifiers)

**[R]** Descriptive control variable name in any loop longer than five lines.

**[D]** Avoid identifiers starting with an underscore (e.g. `_i`).

**[F]** No declaration of identifiers starting with two or more underscores (e.g. `__i`).

**[F]** No identifiers with different capitalization in the same scope is
  except (**[D]**) if the capitalization follows a physics formula.

**[E]** Private data member names start with `f` and use CamelCase.
  Public data members and local variables follow simple camelCase
  (as above; e.g. `trackLength`).

[_Example_](CodingConventionsExplained.md#identifiers-example)


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



##  CAF-Specific Naming Conventions ########################################

[_explanations_](CodingConventionsExplained.md#caf-specific-naming-conventions)

**[E]** When adding branches or data products to the CAF files,
  follow the standards for nomenclature and numbering already existing in the file
  (e.g.: initialize empty variables to `-5`).

**[R]** Use `k` and CamelCase for names for `Cuts` and `Vars` in CAFAna macros
  is **required**.

**[E]** Use namespaces to tag the names/versions of the cuts.
  For example:
  ```cpp
  namespace SBNworkshop2020 {
    
    Cut kEnergy;
    
  } // namespace SBNworkshop2020
  ```
  instead of `Cut kEnergy_SBNworkshop2020`.

**[R]** Names of cuts and vars for a frozen analysis end
  with a corresponding `_tag` unless defined in a namespace
  (e.g. `kEnergyCut_2020PAC`).

**[R]** When editing cuts and vars from frozen analyses, create a new copy
  of the cut or var and leave the old one untouched.

**[E]** Store cuts and vars in sensibly corresponding scripts
  (e.g. keep numu analysis cuts in `Cuts/NumuCuts.cxx`).

**[E]** Remove unused CAF branches.



#   Coding   ###################################################################

##  Organization, layout and style  ########################################

[_explanations_](CodingConventionsExplained.md#organization-layout-and-style)

Rationale: protect the modularity of the code and control the dependency tree.

**[E]** One header and source file per class.

**[R]** Indent via spaces (2 per level **suggested**).

**[D]** Avoid editor-specific directives to describe the indentation settings.

**[E]** Use [K&R style of brackets](https://en.wikipedia.org/wiki/Indentation_style#K.26R_style)


### Specific for CAF libraries and tools

[_explanations_](CodingConventionsExplained.md#specific-for-caf-libraries-and-tools)

**[R]** `CAFMaker_module.fcl` is intended to access _art_ data products,
  create `StandardRecord` objects, and call filling functions only. 

**[R]** All computations for filling CAF branches and calculations live
  in the corresponding `Fill<specifier>Vars.cxx` script.

**[F]** No dependence to LArSoft packages in `StandardRecord`.


##  Source file metadata  #################################################

[_explanations_](CodingConventionsExplained.md#source-file-metadata)

Rationale: we want every piece of code associated to one or more authors,
both to facilitate its use and maintenance by allowing to ask to its authors,
and as a recognition and acknowledgement.

**[R]** Report author(s) and possibly a contact mean on every source file.

**[E]** Use Doxygen format for file metadata.
  ```cpp
  /**
   * @file   TrackBloating/TrackBloatAlg.h
   * @brief  Algorithm to double the memory required by a track.
   * @author Mark Johnson (mjohnson@fnal.gov), John Markson (jmarkson@fnal.gov)
   */
  ```

**[E]** Authors of major changes add their name (and contact).


##  Error handling and message logging  ###################################

[_explanations_](CodingConventionsExplained.md#error-handling-and-message-logging)

Rationale: users should be immediately reported errors stemming from faulty
configuration or input. Code should prioritize reporting dangerous or dubious
conditions over automatic mitigation.

**[E]** Use `assert()` to document assumptions (e.g. `assert(!tracks.empty());`).
  
**[E]** Use C++ exceptions to reporting errors (`cet::exception` where available)
  
  > The guideline above is the original thought by G. Petrillo.
  > C. Backhouse proposes the exact opposite.
  > Which practice is best for us should be considered
  > [under discussion](https://github.com/PetrilloAtWork/SBNSoftware.github.io/pull/5).

**[D]** Avoid "catch-all" constructs (`catch (...)`). Really.

**[E]** Route reports of unusual conditions into specific message streams
  (use `mf::LogError`/`mf::LogProblem` where available, or `std::cerr`).

**[E]** Use message facility library for message logging in _art_ code
  (e.g. `LOG_MF_INFO()`, `mf::LogVerbatim()`, ...).

**[D]** Avoid C/C++ output streams to console (`std::cout`, `std::cerr`)
  when logging libraries are available.

**[F]** Do not include `<iostream>` in header files.

**[E]** With message facility (or Python `logging` module):

* `DEBUG` level: messages that may help tracking bugs
* `INFO` level: one-time (terse) configuration messages, summary messages
  at the end of the job, and possibly per-event or per-run summary
  (e.g. `67 tracks produced from 1267 hits in C:0 T:1.`).
* `WARNING` level: _exceptional_ conditions that might compromise the result.
* `ERROR` level: _exceptional_ conditions which compromise the result.
  Most often, the program should be interrupted.
* `FATAL` level: avoid; the program should be interrupted.


##  Configuration and experiment-specific features  #######################

[_explanations_](CodingConventionsExplained.md#configuration-and-experiment-specific-features)

Rationale: code must work for all SBN experiments with the least possible changes,
ideally limited to configuration files. The explicit lack of support for one
of the experiments is still preferable to code that gives for that experiment
wrong results.

**[F]** No constants describing the specific detectors in SBN-shared code,
  and avoid those in experiment-specific coed too.
  
**[R]** Attempt to use a feature of shared code with a detector/experiment that
  does not support it must trigger a fatal error.
  
**[E]** Use LArSoft services to gain information and functionality specific to
  the detector if possible.


##  LArSoft and _art_  ####################################################

[_explanations_](CodingConventionsExplained.md#larsoft-and-art)

**[E]** In general, try to adopt the practices recommended by _art_
  if not conflicting with these guidelines.

**[E]** Depending on the context, read a _art_ data product using:

* if no _art_ associations are needed:
  ```cpp
  auto const& hits = event.getByLabel<std::vector<recob::Hit>>(fHitTag);
  ```
* if associations are needed, and therefore `art::Ptr` or `art::Handle`:
  ```cpp
  auto const hitHandle = event.getValidHandle<std::vector<recob::Hit>>(fHitTag);
  std::vector<recob::Hit> const& hits = *hitHandle;
  ```

**[E]** Use `art::InputTag` data type to identify data products.

**[S]** Consider alternatives to `art::FindManyP` if available.

**[S]** Use of `art::ProductToken` for simple data product reading.

**[E]** Declare input data products to _art_ by calling `consumes()`
  in module constructors.

**[E]** Use [configuration validation](https://cdcvs.fnal.gov/redmine/projects/fhicl-cpp/wiki/Configuration_validation_and_fhiclcpp_types)
  in place of plain `fhicl::ParameterSet` access.

**[E]** Use the containers provided by LArSoft `Geometry` service to store data
  by geometry plane, TPC etc.

**[E]** Use `Geometry` service methods to iterate through detector TPC, planes etc.


##  Language features  ####################################################

[_explanations_](CodingConventionsExplained.md#language-features)

**[E]** Motivated adoption of well-supported new features is **encouraged**;
  still, if the feature is considered too obscure a clarification comment
  is **suggested**.


### `auto` keyword

[_explanations_](CodingConventionsExplained.md#auto-keyword)

The `auto` keyword has the magic ability of decreasing with its sole
appearance the readability of the code by a few marks.
It should be used judiciously (and sparsely).

**[D]** In general, avoid using `auto`.

**[S]** As an exception, use `auto` keyword when the underlying type is _obvious_
  from the code in the same line or the previous one.
  In doubt, spell the type out instead.

[_examples_](CodingConventionsExplained.md#auto-examples)


### Namespaces

[_explanations_](CodingConventionsExplained.md#namespaces)

**[D]** Avoid importing a namespace (e.g. `using namespace std;`), especially
  in global scope.

**[F]** Never ever use `using namespace` directives in global scope of header files.

**[E]** Consider using a namespace to enclose a large self-contained group of
  utilities and to enclose implementation details.


### Variables and parameters

[_explanations_](CodingConventionsExplained.md#variables-and-parameters)

**[R]** Define variables in the lowest scope they are needed in,
  and as close as where they are needed as possible

**[S]** Prefer a single collection of structured elements over multiple collections
  of simple elements when no other performance issue is involved.


### C++ best practices

[_explanations_](CodingConventionsExplained.md#c-best-practices)


**[F]** Pointer variables _never_ own their memory. Do not use `new` operator.

**[E]** Manage a resource by using a wrapping object that follows
  [RAII](https://en.wikipedia.org/wiki/Resource_acquisition_is_initialization) pattern
  ([_examples_](CodingConventionsExplained.md#examples-of-resource-manager-objects)).

**[E]** Profusely use decorations explaining your intentions to the compiler
  (e.g. `const` qualifier, `[[fallback]]` annotation on `switch`, `override` methods).
  
**[R]** Use the most appropriate and descriptive type for each variable and quantity
  (e.g. use an unsigned type for a counter
  — many examples [here](CodingConventionsExplained.md#examples-of-c-best-practices) —,
  use `const` for all variables that are not supposed to be modified, etc.).

**[E]** Qualify as `const` _all_ "variables" that are not expected to changed value.
  
**[E]** Use temporary variables to avoid code repetitions.

**[F]** Do not use `const_cast` nor `reinterpret_cast`.

**[D]** Avoid `dynamic_cast`.
  
**[F]** Avoid `goto` statements.

**[S]** Consider using braces as initialization syntax
  (e.g. `DataEntry data { 5.0, 7.0 };`).

**[R]** Do not use word-spelling of logical operators
  (use `&&`, `||`, `!` rather than `and`, `or`, `not`).


[_examples_](CodingConventionsExplained.md#examples-of-c-best-practices)


#### References vs. pointers

[_explanations_](CodingConventionsExplained.md#references-vs-pointers)

_Rationale_: references and pointers share the same performance, but have different
features that make them appropriate for different usage patterns.

**[E]** Choose a pointer type if a variable is allowed to point to "no object"
  (`nullptr`), or if reassignments are required.

**[S]** In class definitions, consider mixed use to gain the safety of a
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


**[E]** Prevent unnecessary copy of values returned by functions
  (e.g. `auto const& digits = event.getByLabel<std::vector<raw::RawDigits>>(WaveformTag);`).

**[R]** Declare function arguments of large non-trivial types as constant references.

**[S]** Consider, as pattern for initialization of large data members from
  function arguments, to pass the argument by value and then `std::move()` that value.

**[E]** When the final size of a collection is known in advance,
  allocate its memory at once.


#### Checked vs. unchecked element access (i.e. `at()` vs. `[]`)

[_explanations_](CodingConventionsExplained.md#checked-vs-unchecked-element-access-ie-at-vs-)

_Rationale_: most often, the unchecked access should be preferred because faster,
but it is important to avoid indices out of range.
Conversely, the choice of one method over the other reflects the underlining
consideration.

**[E]** Use unchecked access when the element is already known to be in range

**[E]** Use unchecked access also when the element is expected and requested
  to be present, in which case request should be documented.


#### User class design

[_explanations_](CodingConventionsExplained.md#user-class-design)

**[D]** You should not _need_ destructors in your classes.

**[S]** For objects that will exist in large collections,
  and especially for data structures, consider ordering data members
  from the largest to the smallest to avoid waste of memory from data alignment.

**[E]** Initialize configuration data members in the constructor initializer list
  (and mark them `const` if feasible).

**[R]** Mark all member functions that do not modify the object as `const`,
  and consider factoring out the parts of non-`const` methods which do not
  modify the object as new `const` methods.

**[E]** Initialize all non-`const` data members in their declaration in the class.

**[E]** All data members of a class should be assigned a known value on construction.

**[F]** Never write empty constructors.

**[E]** Consider using delegated constructors to improve maintainability.

**[S]** Consider declaring a type a `class` if there is an "invariant"
  (i.e. constraints on the data members) to be preserved, `struct` otherwise.


##  Quantity types and their units  #######################################

_Rationale_: clarity and predictability are essential when interpreting data
values, and relying heavily on conventions facilitate it.


### Units

**[R]** Mandatory units for data quantities are described in
[`StandardRecord` documentation in `sbnanaobj`](https://github.com/SBNSoftware/sbnanaobj/blob/develop/sbnanaobj/StandardRecord/README.md).
Existing exceptions should be treated as a bug rather than a precedent.


### Data types

**[E]** The following C++ data types are encouraged for storage of some quantities:

| Unit type                                       | data type  |
| ----------------------------------------------- | ---------- | 
| momentum, energy, energy density                | `float`    |
| charge, charge density                          | `float`    |
| space coordinate <br> (added precision reduces rounding errors of geometry calculations)  | `double`   |
| time, relative to a reference within the event  | `double`   |
| absolute time <br>(achieves _(barely)_ nanosecond precision on UTC times)    | `long double`   |


>
> Here Gianluca collapsed while editing.
> The following text will be reduce to a summary like the one above was.
>



#   Documentation   ############################################################


##  Functionality documentation  ##########################################

[_explanations_](CodingConventionsExplained.md#functionality-documentation)

_Rationale_: plain-English documentation should allow the use of an algorithm
without falling back to interpret the code, and should especially include
the assumptions and considerations that are relevant to the users and are
not expressed by the code.

**[E]** Algorithm classes and function should include also

1. description of their function
2. explanation of the input format
3. explanation of the requirements and assumptions on the input
4. an explanation of the features of the output
5. plus a reference to external documentation (e.g. SBN DocDB document)

**[R]** Add documentation in the source code, in Doxygen format,
  attached to the object being described.


##  Tracking of changes  ##################################################

[_explanations_](CodingConventionsExplained.md#tracking-of-changes)

_Rationale_: discovery of major changes to the functionality of the code or
"relevant" changes of working parameters should be achievable
without a systematic comparison the different versions of the code.

**[R]**  Each repository contains in its main directory a `changes.md` file;
  the start of the file includes information about the format, like the
  pattern used for each entry and the tag for breaking changes.

**[R]** Authors are **required** to update the `changes.md` log when...

* ... a new algorithm is added: mentioning the purpose of the new feature.
* ... a change in parameters that may affect future results.
* ... a change makes existing samples unreadable or misinterpreted.


**[R]** In the last case, the change is defined as breaking and the entry is
  **required** to explicitly state that with a standard tag
  (`**BREAKING CHANGE**` is the recommendation).

**[S]** Consider keeping the format of the change log simple.

**[E]** The information about the release version of a change,
  should be added by the release manager.


#   Linking and building  #####################################################


##  Build diagnostics ("warnings")  #######################################

[_explanations_](CodingConventionsExplained.md#build-diagnostics-warnings)

_Rationale_: compilation warnings have proven to be a powerful tool in early
detection of program mistakes. Experience shows that a single ignored warning
both creates a habit, and makes it harder to spot additional ones.

**[R]** Building warnings must be addressed.

**[R]** The build system must be set to give a medium level of diagnostics,
  and to treat all of them as errors, except for the deprecation one.

**[E]** If the compiler reports an intended behaviour as problematic, the code
  should be reviewed with other people to identify whether the report is correct.
  If the review concludes the diagnostic message is spurious, the diagnostic
  message can be "acknowledges".

**[R]** Acknowledgement of a diagnostic message, when decided, must target only
  the line of code triggering it, must disable only the diagnostic message that
  needs to be acknowledged, and must be exhaustively documented in a comment.

**[R]** Deprecation warnings on new code must be resolved.

