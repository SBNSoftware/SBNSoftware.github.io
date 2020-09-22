---
layout: page
title: Integration tests
description: How to run integration ("CI") tests for ICARUS
toc: true
---


Short user guide to integration tests in ICARUS
==================================================================================================================

> *This page was adapted from [SBND one](../sbndcode_wiki/Integration_test_guide.md), and the adaptation is
> not complete yet.*

> *Note:* when the text refers to "now" or "as of today" or "at the time of writing",
> you can check the history of the web page to find out when that was.


What are integration tests 
------------------------------------------------------------------------

ICARUS has two levels of tests:

1.  *unit tests* are small tests targeting a single feature or module;
    you run it with `mrb test -j16` or equivalent[¹](#footnotes)
2.  *integration tests* exercise a complete chain of processing

Before pushing code that has any remote chance of changing existing
results, you should run both. This guide is about the latter.

When the release schedule will become reasonably synchronous with
LArSoft, an automatic trigger will be activated so that every time code
is pushed in `icaruscode` `develop` branch, tests are also automatically
triggered. This is not the case yet as of writing.



What an integration test does 
------------------------------------------------------------------------------

An integration test does what it is asked to by its configuration at
`test/ci/ci_tests.cfg`.
Each test may include:

1.  run a LArSoft job
2.  compare the size of the output (in particular, the length of the
    data product collections) with a reference result
3.  compare selected histograms from the output with reference results

If any of the steps fails, the test fails and the failure is reported.
For failures in running the job, the solution is for the author to just
fix the code. For failures in the comparison with the reference results,
the mismatch must be studied to determine whether the change is
acceptable or not. In the former case the reference results need to be
updated, in the latter again the code must be fixed.



Introduction to test running
----------------------------------------------------------------------------

For this introduction we run the tests in the local area (as in
[the instructions below](#testing-of-the-code-in-the-local-working-area)).

The script `test_runner` will execute the requested integration tests.
Since it relies on the settings from the current UPS environment, no
particular setup is needed, except for the UPS product containing the
script, but you need to [**get a certificate proxy**](Get_a_certificate_proxy.md) since the input is
read from dCache. So:

    setup lar_ci
    test_runner develop_test_icaruscode

will run the tests designed to be run during development.



### **TODO** The output of a test in detail 

The information of this section somehow depends on both the version of
the test SBND provides, and the version of `lar_ci`. The following
information was compiled using the latest `icaruscode`, `v09_02_00` and
the current `lar_ci`, `v3_7_0`.

We use as example the detector propagation test.
The list of available tests is:

    $ test-runner -l
    [...]
    The current parallel limit is: 5
    suite single_quick_test_icaruscode: (4 tests)
      single_detsim_quick_test_icaruscode
      single_g4_quick_test_icaruscode
      single_gen_quick_test_icaruscode
      single_reco_quick_test_icaruscode
    suite single_seq_test_icaruscode: (4 tests)
      single_detsim_seq_test_icaruscode
      single_g4_seq_test_icaruscode
      single_gen_seq_test_icaruscode
      single_reco_seq_test_icaruscode
    suite generate_reference_single_test_icaruscode: (4 tests)
      single_detsim_seq_test_icaruscode
      single_g4_seq_test_icaruscode
      single_gen_seq_test_icaruscode
      single_reco_seq_test_icaruscode
    suite nucosmics_quick_test_icaruscode: (4 tests)
      nucosmics_detsim_quick_test_icaruscode
      nucosmics_g4_quick_test_icaruscode
      nucosmics_gen_quick_test_icaruscode
      nucosmics_reco_quick_test_icaruscode
    [...]
    
We have about 10 tests, and loads of test suites that may share them. We can ask
`test_runner` to run a single test, or a whole suite, or many of the above.
The detector propagation test is `ci_g4_regression_quick_test_icaruscode`:

    $ setup lar_ci
    $ mkdir -p run_ci
    $ cd run_ci
    $ test-runner --statistics ci_g4_regression_quick_test_sbndcode
    The current parallel limit is: 5
    Test Suite:  ci_g4_regression_quick_test_sbndcode
    Expanded:  ci_g4_regression_quick_test_sbndcode
    Statistic: ci_g4_regression_quick_test_sbndcode exitcode 5120
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_user_cpu 21.190000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_scaled_user_cpu 118.647048
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_system_cpu 5.180000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_scaled_system_cpu 29.003856
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_elapsed 213.580000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_%cpu 12.000000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_avgtext 0.000000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_avgdata 0.000000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_maxrss 221176.000000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_inputs 3982312.000000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_outputs 2368.000000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_major_faults 17999.000000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_minor_faults 495733.000000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_swaps 0.000000
    Statistic: ci_g4_regression_quick_test_sbndcode valerrs 0
    Statistic: ci_g4_regression_quick_test_sbndcode success False
    Fcopy_out_results check point None false None None False

    0 tests passed (0%), 1 tests failed, 0 tests with warnings, 0 tests skipped, out of 1
    Not updating any reference files

It shows a job failure, and the `errors.log` explains (in its own way)
that there is a authentication error... I forgot to [get a certificate proxy](Get_a_certificate_proxy.md)!
I rerun after getting one, to get:

    $ test_runner --statistics ci_g4_regression_quick_test_sbndcode
    The current parallel limit is: 5
    Test Suite:  ci_g4_regression_quick_test_sbndcode
    Expanded:  ci_g4_regression_quick_test_sbndcode
    Statistic: ci_g4_regression_quick_test_sbndcode exitcode 0
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_user_cpu 19.650000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_scaled_user_cpu 110.024280
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_system_cpu 2.750000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_scaled_system_cpu 15.397800
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_elapsed 25.810000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_%cpu 86.000000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_avgtext 0.000000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_avgdata 0.000000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_maxrss 285528.000000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_inputs 1708616.000000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_outputs 4800.000000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_major_faults 7626.000000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_minor_faults 267986.000000
    Statistic: ci_g4_regression_quick_test_sbndcode rusage_swaps 0.000000
    Statistic: ci_g4_regression_quick_test_sbndcode valerrs 2
    Statistic: ci_g4_regression_quick_test_sbndcode success True
    .copy_out_results check point None false None None False

    1 tests passed (100%), 0 tests failed, 0 tests with warnings, 0 tests skipped, out of 1
    Not updating any reference files

This is a winner. A local directory
`ci_g4_regression_quick_test_sbndcode` was created, with:

| file                                         |                                                                                                                                                                       |
| -------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `histocmp.html`                              | would contain rendering of comparison plots; empty because this test does not extract plots
| `memory.db`                                  | *art* output (from `MemoryTracker` service)
| `cputime.db`                                 | *art* output (from `TimeTracker` service)
| `hist-sbnd_ci_sbndcode_quick_single_g4.root` | *art* output (from `TFileService` service)
| `messages.log`                               | main output of LArSoft job on screen (*art* output from message facility service, as configured in SBND)
| `errors.log`                                 | error output stream of LArSoft job (*art* output from message facility service, as configured in SBND)
| `stdout.log`                                 | output to screen of (most of) the test\_runner script, including also \"event dumps\" for both new and reference results, and some error messages from LArSoft job |
| `data_production_stats.log`                  | encoded error information *(only on error)*
| `stderr.log`                                 | error output stream of (most of) the test\_runner script
| `result.log`                                 | test validation output
| `avgevent_times.log`                         | average CPU times (broken when using `TimeTracker`)




### **TODO** Example of failure from resource usage 

This is the output of `test_runner` after a successful LArSoft job has
used more resources (or less!) than expected:

    The current parallel limit is: 5
    Test Suite:  ci_g4_regression_quick_test_sbndcode
    Expanded:  ci_g4_regression_quick_test_sbndcode
    Memory usage 285648.000000 not in 200000.000000:210000.000000 range
    Statistic: ci_g4_regression_quick_test_sbndcode exitcode 102
    [...]

To obtain it, I artificially decreased the limit of (resident size)
memory for the test to about 210 MB.



Running the integration test with the Continuous Integration system 
----------------------------------------------------------------------------------------------------------------------------------------------------------

There are mainly three ways to run an integration test:

1.  automatically, by pushing into a `develop` branch
2.  locally, testing the code in the local development area
3.  remotely, testing the code in the GIT remote repositories

Currently tests are run on SLF7 with GCC compiler (Clang compiler is also potentially available).



### **TODO** Automatic testing 

Whenever a commit is pushed into a `develop` branch, a test is
automatically triggered. The test starts 15 minutes after the first push
to `develop`, to give the user the time to push into different
repositories as needed.

-   if the push is in `sbndcode`, only `sbndcode` is built and tested
-   if the push is (also) in the `develop` branch of a LArSoft
    repository, the C.I. system will check out and build all LArSoft,
    `sbndcode` and also the code from the other LArSoft-based
    experiments; this is to ensure that one experiment\'s change does
    not disrupt the others

The result of the test can be checked in the [C.I. dashboard](https://dbweb0.fnal.gov/LarCI/app/ns:ICARUS/view_builds/index)
(on the top raw, you can select LArSoft or SBND to monitor the respective tests).

In this case, the quick test suite is executed (`quick_test_icaruscode`,
chosen by the SBND `lar_ci` workflow configuration).


### Testing of the code in the local working area 

Before pushing the code anywhere, integration tests may be executed
locally from the MRB area[²](#footnotes) where the code has just been
compiled (see also above, the [introduction to test running](#introduction-to-test-running).
The commands to do so are:

    setup lar_ci
    test_runner --verbose develop_test_icaruscode

Among the useful options: `--parallel-limit=12` will run at most 12
tests in parallel, instead than one after the other.


### **TODO** Remote testing of published code 

The Continuous Integration system can build and test any publicly
available branch. To ask for the SBND integration tests, use the
`sbndcode_wf` workflow:

    setup lar_ci
    trigger --build-delay 0 --workflow sbndcode_wf

This will run the "quick" test, just like if it had been triggered
automatically. The `--build-delay 0` option tells the system to start as
soon as possible (instead of waiting for 15 minutes, which would be
pointless since we are not pushing anything any more).

In general, the supported workflows are listed in the
[list of supported ICARUS workflows](LArCI_Workflows.html#ICARUS-CI-Workflows).

TODO: document how to run on branches\
TODO: document how to run other tests



The reference result files 
------------------------------------------------------------------------

The reference result files are currently stored in dCache:

    /pnfs/icarus/persistent/ContinuousIntegration/reference

(see the `XROOTD_REFERENCEFILEDIR_ICARUSCODE` key in the `DEFAULT` section of
`test/ci/ci_tests.cfg` and the related keys `BASEFILERELPATH_ICARUSCODE` and
`XROOTD_BASEFILEDIR_ICARUSCODE`).



### Updating the reference files 

When changes render the reference files obsolete, it's time to generate
new ones.
It is possible to do this both with a remote test trigger, or locally.
Remember that this action will affect the whole collaboration.



#### **TODO** Generating the reference files with a remote "trigger"

After having concluded there is the need to update reference files, a
single command will do the trick:

    trigger --build-delay 0 --workflow Update_ref_files_SBNDCODE_wf --force-platform slf6

(there is the usual requirement of having a grid proxy and `lar_ci` set
up).
The `Update_ref_files_SBNDCODE_wf` is a special workflow used for this
purpose only, and we use only one reference platform, assuming (wrongly)
that all platforms will give the same results.



#### Generating the reference files from a local working area

If a test (e.g. `single_g4_seq_test_icaruscode`) requires a new reference file,
a few steps need to be taken.
First, notice that the test may be part of a sequence of tests; for example,
`single_g4_seq_test_icaruscode` is part of one starting with
`single_gen_seq_test_icaruscode` and going forth through a "detsim" and a "reco" stage.
A look into the reference file repository (which can be found in pieces in the usual
`test/ci/ci_tests.cfg` file as `REFERENCEFILEDIR_ICARUSCODE`; at the time of writing,
it points to `/pnfs/icarus/persistent/stash/ContinuousIntegration/reference`)
shows a structure with a tag (e.g. `standard`) and within it test _stages_.
Within each stage directory there are reference files, a group for each test,
which for the most part carry timestamps. One file for each group does not carry
any timestamp, and that one is the current reference file.
Reference files are generated with:
    
    export build_identifier="-$(date +%Y%m%d%H%M)"
    test_runner --expcode=ICARUSCODE --statistics --update test_suite [test_suite2 ...]
    
The first line defines the suffix for each reference file
(but `test_runner` will not accept it empty). In the example, a timestamp is used.
The other like asks for updating the reference files, and in addition requests
extended resource usage statistics
(good if retuning the expected ranges in `test/ci/ci_tests.cfg`)
and sets the experiment code name tag (mandatory).
Note that the new reference files will be copied all together and all at
the end of the job, and that if one copy fails the script won't attempt
to copy the remaining new reference files.
At this point, if the new reference files are blessed, they need to be made current.
To do so, each one of the new files must be copied to a file without timestamp, e.g.:
    
    cp -vaf /pnfs/icarus/persistent/stash/ContinuousIntegration/reference/standard/reco/single_*_test_icaruscode_Reference{-202009212301,}.root
    
will make `single_reco_test_icaruscode_Reference-202009212301.root`
the new `reco` reference file.

> Note: so far it has proven to be a good idea to use the test sequence
> to generate the reference files. Quick tests are expected to produce
> the same results, except that they may process fewer events.


**TODO** Available tests 
----------------------------------------------------------------

The available tests can be printed with `test-runner --list-tests` (`-l` for short).
Test suites should be documented at the beginning of `test/ci/ci_tests.cfg` configuration file.
A summary of the test suites (which will fall sadly out of date with time):

| test suite name                 | description                                                                                    | run time         |
| ------------------------------- | ---------------------------------------------------------------------------------------------- | ---------------- |
| **`develop_test_sbndcode`**     | tests intended to be run during code development                                               | 4300/1200 kVs
| `complete_test_sbndcode`        | tests intended to be run before final push (take longer than `develop_test_sbndcode`)          | 12000/6200 kVs
| `quick_test_sbndcode`           | includes both single particle and data-like event quick tests                                  | 4300/1200 kVs
| `seq_test_sbndcode`             | includes both single particle and data-like event sequences tests                              | 7600/6200 kVs
| `single_quick_test_sbndcode`    | single particle (`prodsingle_sbnd.fcl`) 5-stage chain, each step from reference file           | 800/450 kVs
| `nucosmics_quick_test_sbndcode` | data-like neutrino and background (GENIE+CORSIKA) 5-stage chain, each step from reference file | 3500/1200 kVs
| `single_seq_test_sbndcode`      | data-like single particle (`prodsingle_sbnd.fcl`) 5-stage chain, in sequence                   | 1400/1400 kVs
| `nucosmics_seq_test_sbndcode`   | neutrino and background (GENIE+CORSIKA) 5-stage chain, in sequence                             | 6200/6200 kVs
| `gallery_test_sbndcode`         | runs tests related to the gallery examples in `sbndcode`                                       | 
| `generate_reference_sbndcode`   | reruns all the jobs generating output files that can be used as reference[³](#footnotes)       | 5800/5800 kVs
| `all_tests_sbndcode`            | reruns all tests (used for maintenance only)                                                   | 12000/6200 kVs

Most quick tests typically run just one or two events.
The run time in the table is the normalised one as reported by the C.I.
scripts, and it is heavily approximated. The first figure collects the
integrated time, while the second is the ideal run time when all tests
are run in parallel (for example, sequential tests can't be
parallelised). The figures were obtained from `sbndbuild01.fnal.gov`;
for reference, 1000 kVs on that machine take about 3 CPU minutes.



**TODO** Investigating test failures 
----------------------------------------------------------------------------------------



### **TODO** Results are different from the reference 

The reference files are normally generated with a special trigger, as
described above. These special jobs are shown in the
[dashboard](https://dbweb0.fnal.gov/LarCI/app/ns:ICARUS/view_builds/index)
as `icarus_ci` builds with workflow `Update_ref_files_ICARUSCODE`, and can
be recognised because they have a table header with more columns,
including a column `gen_ref_files`. A completed reference file job
replaces the previous reference files, so the current files come from
the most recent reference file job.

When comparing the result of a failed test, it may be useful to
precisely know the difference in the source code. The exact commit of
the code used to generate the reference result can be seen hovering the
mouse on the `checkout` column of the most recent reference file job.
For example, `sbnd_ci/32`, generating reference files on 2018-03-09
09:02, had:

    larana             LARSOFT_SUITE_v06_70_01
    larcore            LARSOFT_SUITE_v06_70_01
    larcorealg         LARSOFT_SUITE_v06_70_01
    larcoreobj         LARSOFT_SUITE_v06_70_01
    lardata            LARSOFT_SUITE_v06_70_01-6-g00d39317
    lardataobj         LARSOFT_SUITE_v06_70_01
    lareventdisplay    LARSOFT_SUITE_v06_70_01
    larevt             LARSOFT_SUITE_v06_70_01
    larexamples        LARSOFT_SUITE_v06_70_01
    larpandora         LARSOFT_SUITE_v06_70_01
    larpandoracontent  LARSOFT_SUITE_v06_70_01
    larreco            LARSOFT_SUITE_v06_70_01-2-g3db95cef
    larsim             LARSOFT_SUITE_v06_70_01
    larsoft            LARSOFT_SUITE_v06_70_01
    larsoftobj         LARSOFT_SUITE_v06_70_01
    larwirecell        LARSOFT_SUITE_v06_70_01
    sbndcode           v06_70_01-3-g28fc0d2

The codes shown there are from `git describe`, and `git` usually accepts
them where a commit hash of a tag would be required. If the failure was
from a remote job, you will get an e-mail with a history of recent
commits (for `sbndcode` only), and comparing to the reference tag for
`sbndcode` you can see which additional commits were used in your test.
In the example above, `v06_70_01-3-g28fc0d2` is the reference tag, which
is formed by an actual base tag (`v06_70_01`), the number of commits
beyond it (`3`) and the hash of the head commit (`28fc0d2`, introduced
by the `g` letter). In this case, the correct commit is commit:28fc0d2.



Further resources 
------------------------------------------------------

The hub for information on integration tests is the project
[`lar_ci`](https://cdcvs.fnal.gov/redmine/projects/lar_ci).\
The contact to that system is, at the time of writing,
[Vito Di Benedetto](mailto:vito@fnal.gov).

------------------------------------------------------------------------

##### Footnotes

[1] If the working area is already built, you can run all the tests with:

    cd "$MRB_BUILDDIR" 
    ctest -j16

You can also go to the subdirectory of `$MRB_BUILDDIR` that contains the
tests you care of, instead, and you\'ll end up running only the tests
under that directory.

[2] In fact, they can be run even without a MRB area, in an environment
where `icaruscode` is already set up.

[3] The test suite `generate_reference_sbndcode` is used by default by
the workflow to update reference files (`Update_ref_files_SBNDCODE_wf`).
To use a different one, `trigger` should be explicitly provided with a
`--gen-ref-tests` option.

------------------------------------------------------------------------

_[For questions, contact [Gianluca Petrillo](mailto:petrillo@slac.stanford.edu).]_
