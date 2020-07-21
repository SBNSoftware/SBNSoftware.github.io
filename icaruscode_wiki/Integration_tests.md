---
layout: page
title: Integration tests
---



Short user guide to integration tests in ICARUS
==================================================================================================================

> *This page was adapted from [SBND
> one](Integration_test_guide.html), and the adaptation is
> not complete yet.*

> *Note:* when the text refers to \"now\" or \"as of today\" or \"at the
> time of writing\", you can check the history of the web page to find
> out when that was.

-   **Table of contents**
-   [Short user guide to integration tests in
    ICARUS]
    -   [What are integration tests]
    -   [What an integration test does]
    -   [Introduction to test running]
        -   [TODO The output of a test in
            detail]
        -   [TODO Example of failure from resource
            usage]
    -   [Running the integration test with the Continuous Integration
        system]
        -   [TODO Automatic testing]
        -   [Testing of the code in the local working
            area]
        -   [TODO Remote testing of published
            code]
    -   [The reference result files]
        -   [Updating the reference
            files]
            -   [TODO Generating the reference files with a remote
                \"trigger\"]
            -   [Generating the reference files from a local working
                area]
    -   [TODO Available tests]
    -   [TODO Investigating test
        failures]
        -   [TODO Results are different from the
            reference]
    -   [Further resources]



What are integration tests 
------------------------------------------------------------------------

ICARUS has two levels of tests:

1.  *unit tests* are small tests targeting a single feature or module;
    you run it with `mrb test -j16` or equivalent^[1]^
2.  *integration tests* exercise a complete chain of processing

Before pushing code that has any remote chance of changing existing
results, you should run both. This guide is about the latter.\
When the release schedule will become reasonably synchronous with
LArSoft, an automatic trigger will be activated so that every time code
is pushed in `icaruscode` `develop` branch, tests are also automatically
triggered. This is not the case yet as of writing.



What an integration test does 
------------------------------------------------------------------------------

An integration test does what it is asked to by its configuration at
[[source:test/ci/ci\_tests.cfg](/redmine/projects/icaruscode/repository/entry/test/ci/ci_tests.cfg){.source}]{style="font-family: monospace;"}.\
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
[Integration
tests]
below).

The script `test_runner` will execute the requested integration tests.
Since it relies on the settings from the current UPS environment, no
particular setup is needed, except for the UPS product containing the
script, but you need to **[get a certificate
proxy](Get_a_certificate_proxy.html)** since the input is
read from dCache. So:

    setup lar_ci
    test_runner develop_test_icaruscode

will run the tests designed to be run during development.



### **TODO** The output of a test in detail 

The information of this section somehow depends on both the version of
the test SBND provides, and the version of `lar_ci`. The following
information was compiled using the latest `sbndcode`, `v06_68_00` and
the current `lar_ci`, `v3_3_0`.

We use as example the detector propagation test.\
The list of available tests is:

    $ test-runner -l
    The current parallel limit is: 5
    suite quick_test_sbndcode: (5 tests)
      ci_anatree_regression_quick_test_sbndcode
      ci_detsim_regression_quick_test_sbndcode
      ci_g4_regression_quick_test_sbndcode
      ci_gen_regression_quick_test_sbndcode
      ci_reco_basic_regression_quick_test_sbndcode
    suite seq_test_sbndcode: (5 tests)
      ci_anatree_regression_seq_test_sbndcode
      ci_detsim_regression_seq_test_sbndcode
      ci_g4_regression_seq_test_sbndcode
      ci_gen_regression_seq_test_sbndcode
      ci_reco_basic_regression_seq_test_sbndcode
    suite develop_test_sbndcode: (5 tests)
      ci_anatree_regression_quick_test_sbndcode
      ci_detsim_regression_quick_test_sbndcode
      ci_g4_regression_quick_test_sbndcode
      ci_gen_regression_quick_test_sbndcode
      ci_reco_basic_regression_quick_test_sbndcode
    Tests in no suites:

\
We have 10 tests, and three suites that may share them. We can ask
`test_runner` to run a single test, or a whole suite, or many of the
above.\
The detector propagation test is `ci_g4_regression_quick_test_sbndcode`:

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

\
(the `copy_out_results check point None false None None False` is debug
output that will be removed soon, see issue
[\#19068](/redmine/issues/19068 "Feature: Uninformative messages from test_runner (Closed)"){.issue
.tracker-2 .status-5 .priority-4 .priority-default .closed}).\
It shows a job failure, and the `errors.log` explains (in its own way)
that there is a authentication error\... I forgot to [get a certificate
proxy](Get_a_certificate_proxy.html)! I rerun after getting
one, to get:\

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

\
This is a winner. A local directory
`ci_g4_regression_quick_test_sbndcode` was created, with:

  ---------------------------------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------
  `histocmp.html`                                would contain rendering of comparison plots; empty because this test does not extract plots
  `memory.db`                                    *art* output (from `MemoryTracker` service)
  `cputime.db`                                   *art* output (from `TimeTracker` service)
  `hist-sbnd_ci_sbndcode_quick_single_g4.root`   *art* output (from `TFileService` service)
  `messages.log`                                 main output of LArSoft job on screen (*art* output from message facility service, as configured in SBND)
  `errors.log`                                   error output stream of LArSoft job (*art* output from message facility service, as configured in SBND)
  `stdout.log`                                   output to screen of (most of) the test\_runner script, including also \"event dumps\" for both new and reference results, and some error messages from LArSoft job
  `data_production_stats.log`                    encoded error information *(only on error)*
  `stderr.log`                                   error output stream of (most of) the test\_runner script
  `result.log`                                   test validation output
  `avgevent_times.log`                           average CPU times (broken when using `TimeTracker`)
  ---------------------------------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------



### **TODO** Example of failure from resource usage 

This is the output of `test_runner` after a successful LArSoft job has
used more resources (or less!) than expected:\

    The current parallel limit is: 5
    Test Suite:  ci_g4_regression_quick_test_sbndcode
    Expanded:  ci_g4_regression_quick_test_sbndcode
    Memory usage 285648.000000 not in 200000.000000:210000.000000 range
    Statistic: ci_g4_regression_quick_test_sbndcode exitcode 102
    [...]

\
To obtain it, I artificially decreased the limit of (resident size)
memory for the test to about 210 MB.



Running the integration test with the Continuous Integration system 
----------------------------------------------------------------------------------------------------------------------------------------------------------

There are mainly three ways to run an integration test:

1.  automatically, by pushing into a `develop` branch
2.  locally, testing the code in the local development area
3.  remotely, testing the code in the GIT remote repositories

Currently tests are run on SLF6 and SLF7 with GCC compiler (Clang
compiler, and OSX are also potentially available).



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

The result of the test can be checked in the [C.I.
dashboard](http://dbweb5.fnal.gov:8080/LarCI/app/ns:icarus/view_builds){.external}
(on the top raw, you can select LArSoft or SBND to monitor the
respective tests).

In this case, the quick test suite is executed (`quick_test_sbndcode`,
chosen by the SBND `lar_ci` workflow configuration).



### Testing of the code in the local working area 

Before pushing the code anywhere, integration tests may be executed
locally from the MRB area^[1]^ where the code has just been
compiled (see also above, the [introduction to test
running]. The
commands to do so are:\

    setup lar_ci
    test_runner --verbose develop_test_icaruscode

\
Among the useful options: `--parallel-limit=12` will run at most 12
tests in parallel, instead than one after the other.

^1^ In fact, they can be run even without a MRB area, in an environment
where `icaruscode` is already set up.



### **TODO** Remote testing of published code 

The Continuous Integration system can build and test any publicly
available branch. To ask for the SBND integration tests, use the
`sbndcode_wf` workflow:\

    setup lar_ci
    trigger --build-delay 0 --workflow sbndcode_wf

\
This will run the \"quick\" test, just like if it had been triggered
automatically. The `--build-delay 0` option tells the system to start as
soon as possible (instead of waiting for 15 minutes, which would be
pointless since we are not pushing anything any more).

In general, the supported workflows are listed in the [list of supported
SBND workflows](LArCI_Workflows.html#SBND-CI-Workflows).

TODO: document how to run on branches\
TODO: document how to run other tests



The reference result files 
------------------------------------------------------------------------

The reference result files are currently stored in dCache:\

    /pnfs/icarus/persistent/ContinuousIntegration/reference

\
(see the `XROOTD_REFERENCEFILEDIR_ICARUSCODE` key in the `DEFAULT`
section of
[[source:test/ci/ci\_tests.cfg](/redmine/projects/icaruscode/repository/entry/test/ci/ci_tests.cfg){.source}]{style="font-family: monospace;"}
and the related keys `BASEFILERELPATH_ICARUSCODE` and
`XROOTD_BASEFILEDIR_ICARUSCODE`).



### Updating the reference files 

When changes render the reference files obsolete, it\'s time to generate
new ones.\
It is possible to do this both with a remote test trigger, or locally.\
Remember that this action will affect the whole collaboration.



#### **TODO** Generating the reference files with a remote \"trigger\"

After having concluded there is the need to update reference files, a
single command will do the trick:\

    trigger --build-delay 0 --workflow Update_ref_files_SBNDCODE_wf --force-platform slf6

(there is the usual requirement of having a grid proxy and `lar_ci` set
up).\
The `Update_ref_files_SBNDCODE_wf` is a special workflow used for this
purpose only, and we use only one reference platform, assuming (wrongly)
that all platforms will give the same results.



#### Generating the reference files from a local working area

If a test (e.g. `single_g4_seq_test_icaruscode`) requires a new
reference file, a few steps need to be taken.\
First, notice that the test may be part of a sequence of tests; for
example, `single_g4_seq_test_icaruscode` is part of one starting with
`single_gen_seq_test_icaruscode` and going forth through a \"detsim\"
and a \"reco\" stage. The outdated reference files of *all* the stages
in the chain need to be *manually deleted* from storage, but *the
directory structure must be left intact*. The reason being:

-   `test_runner` will not overwrite existing files, but will rather
    fail
-   `test_runner` will not created the needed directory which do not
    exist, but will rather fail
-   the tests following the one being updated (in the example,
    `single_detsim_seq_test_icaruscode` and
    `single_reco_seq_test_icaruscode`) will almost surely need to be
    updated because their input has been
-   `test_runner` will repeat all the tests preceding the one being
    updated (in the example, `single_gen_seq_test_icaruscode`) and
    attempt to update their reference files too

The `test_runner` script needs to be tricked to believe it is in a
workspace environment\... this means in practice that we need to
manually assure the environment looks right.\
Currently, we just need to make sure the environment variable
`CI_EXP_CODE` is set to the right value (which can be found in
[source:test/ci/ci\_tests.cfg](/redmine/projects/icaruscode/repository/entry/test/ci/ci_tests.cfg){.source}
and is `ICARUSCODE`).\

    # remove all the old reference files pertaining the suite(s) this test belongs to, then:
    export CI_EXP_CODE='ICARUSCODE'
    test_runner --update test_suite [test_suite2 ...]

\
Note that the new reference files will be copied all together and all at
the end of the job, and that if one copy fails the script won\'t attempt
to copy the remaining new reference files.



**TODO** Available tests 
----------------------------------------------------------------

The available tests can be printed with `test-runner --list-tests` (`-l`
for short).\
Test suites should be documented at the beginning of
[[source:test/ci/ci\_tests.cfg](/redmine/projects/icaruscode/repository/entry/test/ci/ci_tests.cfg){.source}]{style="font-family: monospace;"}
configuration file.\
A summary of the test suites (which will fall sadly out of date with
time):

  --------------------------------- ------------------------------------------------------------------------------------------------ ----------------
  **test suite name**               **description**                                                                                  **run time**
  **`develop_test_sbndcode`**       tests intended to be run during code development                                                 4300/1200 kVs
  `complete_test_sbndcode`          tests intended to be run before final push (take longer than `develop_test_sbndcode`)            12000/6200 kVs
  `quick_test_sbndcode`             includes both single particle and data-like event quick tests                                    4300/1200 kVs
  `seq_test_sbndcode`               includes both single particle and data-like event sequences tests                                7600/6200 kVs
  `single_quick_test_sbndcode`      single particle (`prodsingle_sbnd.fcl`) 5-stage chain, each step from reference file             800/450 kVs
  `nucosmics_quick_test_sbndcode`   data-like neutrino and background (GENIE+CORSIKA) 5-stage chain, each step from reference file   3500/1200 kVs
  `single_seq_test_sbndcode`        data-like single particle (`prodsingle_sbnd.fcl`) 5-stage chain, in sequence                     1400/1400 kVs
  `nucosmics_seq_test_sbndcode`     neutrino and background (GENIE+CORSIKA) 5-stage chain, in sequence                               6200/6200 kVs
  `gallery_test_sbndcode`           runs tests related to the gallery examples in `sbndcode`                                         
  `generate_reference_sbndcode`     reruns all the jobs generating output files that can be used as reference^[1]^             5800/5800 kVs
  `all_tests_sbndcode`              reruns all tests (used for maintenance only)                                                     12000/6200 kVs
  --------------------------------- ------------------------------------------------------------------------------------------------ ----------------

^1^ The test suite `generate_reference_sbndcode` is used by default by
the workflow to update reference files (`Update_ref_files_SBNDCODE_wf`).
To use a different one, `trigger` should be explicitly provided with a
`--gen-ref-tests` option.

Most quick tests typically run just one or two events.\
The run time in the table is the normalised one as reported by the C.I.
scripts, and it is heavily approximated. The first figure collects the
integrated time, while the second is the ideal run time when all tests
are run in parallel (for example, sequential tests can\'t be
parallelised). The figures were obtained from `sbndbuild01.fnal.gov`;
for reference, 1000 kVs on that machine take about 3 CPU minutes.



**TODO** Investigating test failures 
----------------------------------------------------------------------------------------



### **TODO** Results are different from the reference 

The reference files are normally generated with a special trigger, as
described above. These special jobs are shown in the
[dashboard](http://dbweb5.fnal.gov:8080/LarCI/app/ns:sbnd/view_builds/index){.external}
as `sbnd_ci` builds with workflow `Update_ref_files_SBNDCODE`, and can
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

\
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
[lar\_ci](/redmine/projects/lar_ci){.project}.\
Our contact to that system is, at the time of writing, [Vito Di
Benedetto](mailto:vito@fnal.gov).

------------------------------------------------------------------------

^1^ If the working area is already built, you can run all the tests
with:

    cd "$MRB_BUILDDIR" 
    ctest -j16

You can also go to the subdirectory of `$MRB_BUILDDIR` that contains the
tests you care of, instead, and you\'ll end up running only the tests
under that directory.

------------------------------------------------------------------------

[For questions, ask [Gianluca
Petrillo](mailto:petrillo@slac.stanford.edu).]{style="color: gray;font-style: italic;"}
