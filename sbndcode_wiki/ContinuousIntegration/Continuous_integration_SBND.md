---
layout: page
title: Continuous integration
---



Continuous integration
================================================================

-   For detailed information on the integration tests see
    [here](Integration_test_guide.html).
-   Every time someone pushes a commit to develop the integration tests
    will be triggered.
-   Sometimes larsoft/art folks will trigger builds to test changes in
    the upstream code.
-   They run the standard simulation and reconstruction chains and check
    for differences in the number of data products produced.
-   You should get emails from Jenkins with the output of these tests.
-   As with the commit emails, I recommend diverting them to a folder
    and checking them whenever you get around to it.
-   Each test will return as either a success, warning or failure.
-   Warnings either mean changes in data products or memory/cpu usage.
-   At the moment only one build (SLF7 e19:prof) will return successes
    for everything (call it the good build).

## Triggering the CI on your feature branch

If you have a feature branch, or a series of feature branches you want to test. This is the recipe for triggering the CI build.

First you need to ensure you have a proxy and setup the `lar_ci` package:

```
setup lar_ci
setup cigetcert
cigetcert -s 'fifebatch.fnal.gov'
voms-proxy-init -noregen -rfc -voms 'fermilab:/fermilab/sbnd/Role=Analysis'
```

You can then trigger the CI using the following command:

```
trigger --build-delay 0 --workflow sbndcode_wf --force-platform slf7 --revision "repo@branch"
```

Using the revision tag to specify the branch(es) you want to test, e.g.

```
--revisions "SBNSoftware/sbndcode@feature/hlay_vertexing henrylay97/LArContent>larpandoracontent@feature/hlay_vertex_bdt_changes"
```

would provide the two custom branches for `sbndcode` and `larpandoracontent` respectively. Note the different syntaxes for specifying a branch in the main repository and for using a branch in a forked repository and directing it towards the correct product name. The results will be available on [this](https://dbweb8.fnal.gov:8443/LarCI/app/ns:sbnd/view_builds/index) dashboard. To trigger a larger validation test please refer to [this](CI_Validation.md) page.

## How to interpret the test results

*Mainly for the release managers and CI teams*

### Memory/cpu usage

-   Different compilers and OS\'s tend to have different memory/cpu
    usage so don\'t worry about them if their different from the good
    build (same with debug vs prof)
-   If the memory/cpu usage changes for the good build make sure it
    hasn\'t increased/decreased massively from the set limits.
-   If it has then an investigation is needed.
-   If not the memory/cpu limits can be changed in
    `sbndcode/test/ci/ci_tests.cfg`
    -   Just find the relevant tests, change the limits and push the
        changes to develop.



### Data product changes


-   If the output data products change the warning will say \"Difference
    in product sizes\".
-   You can ignore any warnings about data product changes in all but
    the good build (I think different compilers/OS\'s might deal with
    random numbers differently and hence give different results where
    random numbers are used, but who knows)
-   You can click on the test which will take you to the test page and
    then click `stdout` to see the test output.
-   Scroll to the bottom of the file to see the differences in data
    products.
-   Try to work out whose changes (either in sbndcode or upstream) are
    responsible and shoot them an email to confirm if they are expected.
-   If the changes are expected then you can update the reference file,
    instructions [here](Integration_test_guide.html).



### Failures

-   You should always try to investigate failures for all builds.
-   If larsoft publish a new release you will start to get failures,
    these should go away when sbndcode is updated.
-   Sometimes the tests will fail when upstream people trigger builds
    for testing, if you see anything other than \"Code revision:
    LArSoft/larsoft\#-1\" in the email it\'s probably best to assume
    someone is just doing some testing and ignore it.
-   Sometimes the builds will just fail randomly, I usually just wait
    for a few successive failures before taking any action.
-   The `c7` compiler is a little stricter than `e19` so you will
    sometimes get failures from that.
    -   If it\'s something small like an unused variable it\'s often
        faster to quickly make the change yourself than emailing the
        person.

### Continuous Integration Validation Plots

- There is a new expanded continuous integration system in place which 
  compares validation plots from the current codebase to the reference plots. 
  See [here](CI_Validation.html) for more information.
