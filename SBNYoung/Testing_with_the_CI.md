---
layout: page
title: Using the CI
---

# Testing your code with the Continuous Integration system

Testing you code as you go along is key to picking up errors and failures before they are too hard to unravel. The CI & Validation system is designed to ensure that we test code before it is allowed to be included in release versions of our repositories. 

### Simple Local Testing

The first thing to ensure you code is working is to test it yourself locally, there are two checks that you will almost certainly be doing anyway as you go along: 
- The most basic test is to make sure it compiles and runs without any errors
- If you are developing some physics code you will also be checking the relevant physics outputs look sensible (does it have the desired effect? are there any knock-on impacts?)

You can also utilise a local version of the CI system. First you need to setup the `lar_ci` package:

```
setup lar_ci
```

You now have the test_runner command at your disposal. This will allow you to run the CI tests in your development area. I would recommend making a new dirctory to perform this test in as it creates a series of output folders for each test. By running `test_runner -l` you can see all the tests available to you. To use the  test suite we use as standard for release management you should use:

```
test_runner -v develop_test_sbndcode
```

or 

```
test_runner -v develop_test_icaruscode
```


You will get a read out telling you the results from each test. Tests can either pass, fail or produce warnings. A failure means the test couldn't complete with your code whilst a warning means the resource usage or the products created have changed. Depending on what your code is doing / changing a warning may not be a problem. Detailed information, including the output logs will be produced in folders for each test in your directory. Note that these tests are done against a reference set of files and resource ranges which are set and managed by your experiment's CI team so if you see warnings or failures you don't understand liase with them and they may be able to either help you with the warnings *or* tell you the references are not up to date.

### Using the online CI & Validation System

Before approving a PR the release management team will trigger the online CI tests and may also run a larger validation test (runs a full sample of events and checks the physics outputs against reference histograms). There is a large amount of information about the system provided by the CI & Validation group:  

- A very detailed explaination of all the integration tests can be found [here](../sbn/sbnci_wiki/Continuous_integration.md)
- An explanation of how to use the validation tests can be found [here](../sbn/sbnci_wiki/CI_Validation.md)
- There are further pages for [developing validation tests](../sbn/sbnci_wiki/Developing_Validation_Tests.md) and a couple of pages useful if you are managing any of the CI tests.
