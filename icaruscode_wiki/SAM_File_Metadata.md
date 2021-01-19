---
layout: page
title: SAM File Metadata
---



SAM File Metadata
======================================================

-   **Table of contents**
-   [SAM File Metadata]
    -   [Running list of comments]
        -   [29 January 2018]
    -   [Useful links]



Running list of comments
--------------------------------------------------------------------



### 29 January 2018

(From Wes)

-   SCD is setting up a SAM station for us and they need to know what
    file metadata values we may want to add. See
    [here](https://cdcvs.fnal.gov/redmine/projects/sam-web/wiki/Metadata_format)
    for a list of the default parameters

<!-- -->

-   Ideally this would be the same as SBND, but SBND has no special
    parameters yet.

<!-- -->

-   Talking to Marc Mengel (<mengel@fnal.gov>), we can add new
    parameters at any time, they just will be \'unset\' in older files.
    Values can be set on older files one-at-a-time, or using helper
    scripts based on other queries of the files.

<!-- -->

-   Tracy and I reviewed the MicroBooNE metadata parameters with Herb
    Greenlee. See
    [here](http://samweb.fnal.gov:8480/sam/uboone/api/values/parameters)
    for MicroBooNE\'s custom parameters. Ones we would likely like to
    keep:
    -   The \'name\', \'stage\', and \'version\' on the ub\_project
        parameters. This is used for specifying names of production
        jobs, stages in which they were run, and the version of software
        used to run them. Note: if/when we update to POMS, we will want
        to make sure this matches well with that production system.
    -   The \'name\' and \'version\' for the fcl parameters. Currently
        only \'name\' is really used in MicroBooNE, but there\'s an
        option for having a distinct fcl version if desired (which may
        be nice).
    -   The \'start\_time\_usec\' and \'end\_time\_usec\' are useful for
        providing finer time precision than the defaults in SAM (which
        are one second?).
    -   The \'blinding\' parameters, which can be used to mark files for
        read protection as an option for implementing a blindness
        procedure. The \'blind\' parameter is used to determine whether
        a file is or isn\'t \"blind\", and the \'processed\' parameter
        is used as a flag if a file has been checked to see if it should
        be blind.

<!-- -->

-   Herb also suggested to think about trigger and run configuration
    parameters, as this is something MicroBooNE does not have but would
    make use of if it had thought it through from the beginning. This is
    probably more an \'online\' thing to apply to data, but should be
    noted. (Also to note: file\_type, file\_format, data\_tier,
    data\_stream, and run\_type can be used for organizing files in such
    ways.)



Useful links
--------------------------------------------

-   [SAM User\'s
    Guide](https://cdcvs.fnal.gov/redmine/projects/sam/wiki/User_Guide_for_SAM)

<!-- -->

-   [Built-in SAM
    metadata](https://cdcvs.fnal.gov/redmine/projects/sam-web/wiki/Metadata_format)

<!-- -->

-   [MicroBooNE\'s custom parameter
    fields](http://samweb.fnal.gov:8480/sam/uboone/api/values/parameters)
