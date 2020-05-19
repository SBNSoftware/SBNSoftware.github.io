---
lang: en
title: Using LArSoft on a local machine
---



Using LArSoft on a local machine(#Using-LArSoft-on-a-local-machine)
====================================================================================

-   **Table of contents**
-   [Using LArSoft on a local
    machine](#Using-LArSoft-on-a-local-machine)
    -   [Getting the software](#Getting-the-software)
    -   [Supported platforms](#Supported-platforms)
        -   [List of platforms](#List-of-platforms)
    -   [Downloading a binary distribution with
        pullProducts](#Downloading-a-binary-distribution-with-pullProducts)
        -   [Updating the local product
            repository](#Updating-the-local-product-repository)

This is a collection of hints and tips to allow you to develop and run
with `sbndcode` (and LArSoft) on a local machine, be it a server in your
institution or your own laptop.



Getting the software(#Getting-the-software)
------------------------------------------------------------

The \"software stack\" `sbndcode` relies upon is big, and it includes
among others LArSoft, *art*, *nutools*, Geant4, GENIE, ROOT\... even
GCC.\
There are three main ways to have it available on your computer:

1.  read it from the network via [CVMFS (with a few
    hops\...)](Computing_resources.html#CVMFS); the main
    disadvantage is that the network may be slow (use a large cache!
    e.g. `CVMFS_QUOTA_LIMIT=20000`, that is 20 GB^[1](#fn1)^), and it
    does not work on the airplane, which surely disrupts your first
    choice of entertainment on flight;
2.  [download it all in binary
    form](#Downloading-a-binary-distribution-with-pullProducts)
    from SciSoft;
3.  download it all in source form and compile it; nobody alive I know
    ever did that, which somehow supports the natural selection model.
    You don\'t want this, and if you are forced to, because your
    platform is not supported, you are still better served by using a
    container (e.g. docker) or virtual machine hosting a supported
    platform (e.g. the sorry SLF6) and go the `pullProducts` way. Did I
    mention that if ROOT version changes you have to do the whole thing
    again?



Supported platforms(#Supported-platforms)
----------------------------------------------------------

[![SBND user poll on used
platform](/redmine/attachments/download/44806/201711-SBNDuserPlatforms.png "SBND user poll on used platform")]{style="float:right"}

Binary distributions are provided for the supported platforms. A
platform can be supported at two levels:

-   supported by LArSoft: LArSoft provides quite some information about
    the quirks of [supported and \"best effort\"
    platforms](_Supported_Platforms_.html): read the one
    pertaining your system carefully
-   supported by SBND: necessarily a subset of LArSoft\'s: [Scientific
    Linux Fermi 6]{style="color: green;"}, [Scientific Linux Fermi
    7]{style="color: green;"}, and [OSX 10.11 (\"El
    Capitan\")]{style="color: green;"} and [OSX 10.12
    (\"Sierra\")]{style="color: green;"}; once again, read the
    [information on LArSoft support to your
    platform](_Supported_Platforms_.html) carefully.

If your platform is supported by LArSoft but not by SBND, do not
despair: follow the instructions to get the LArSoft version you want
(e.g. from [SciSoft](Installation_procedures.html)), set up
a MRB working area and check out `sbndcode` repository\... if you can
compile it in the usual way, you are set already.\
The `sbnd_data` and `sbndutil` packages are platform-independent (they
do not contain compiled code), so you can get them from
[SciSoft](http://scisoft.fnal.gov/scisoft/bundles/sbnd){.external} as
well, and unpacking the tarball in the products area may be already
enough.



### List of platforms(#List-of-platforms)

This platform was updated on October 13, 2017 (which is not the best
time to do so, since OSX 10.10 is going to fall off the table no later
than November). LArSoft support is documented on [LArSoft official
support page](_Supported_Platforms_.html).

Platform name

Magic keyword

Type of LArSoft support

Type of SBND support

Linux

Scientific Linux Fermi 6

`slf6`

[supported]{style="color: green;"}

[supported]{style="color: green;"}

Scientific Linux Fermi 7

`slf7`

[supported]{style="color: green;"}

[supported from v06\_55\_01]{style="color: green;"}

Ubuntu Linux 16.04 (LTS)

`u16`

[best effort]{style="color: orange;"}

[not supported]{style="color: gray;"}

OSX

10.10 (\"Yosemite\")

`d14`

[support ended November 10, 2017 (last version:
`v06_55_00`)]{style="color: red;"}

10.11 (\"El Capitan\")

`d15`

[best effort]{style="color: orange;"}

[supported from v06\_55\_01]{style="color: green;"}

10.12 (\"Sierra\")

`d16`

[best effort]{style="color: orange;"}

[supported from v06\_55\_01]{style="color: green;"}

10.13 (\"High Sierra\")

`d17`

[in progress]{style="color: red;"}

[not supported]{style="color: gray;"}

[OSX 10.10 (\"Yosemite\") support has ended on November 10,
2017!]{style="color: yellow;background-color: red;font-weight: bold;font-size: large;padding: 7px;border-style: solid;border-color: yellow;border-width: 3px;"}



Downloading a binary distribution with `pullProducts`(#Downloading-a-binary-distribution-with-pullProducts)
----------------------------------------------------------------------------------------------------------------------------

The general [instructions from
LArSoft](Installation_procedures.html) on how to get a
software distribution are basically all you need to know.\
We are reproducing them here with some SBND twist, but the ones on
LArSoft are likely to stay more up to date.

1.  *the first time only*:
    1.  create and enter your new product area:

            mkdir -p "${HOME}/SBND/products" 
            cd "${HOME}/SBND/products"

    2.  then you need to download [the `pullProduct`
        script](http://scisoft.fnal.gov/scisoft/bundles/tools/pullProducts){.external}:

            curl -O 'http://scisoft.fnal.gov/scisoft/bundles/tools/pullProducts'
            chmod a+x pullProducts

2.  set up this and all the UPS areas you regularly use (by sourcing
    their `setup` script) so that `pullProducts` will skip UPS products
    that are already available somewhere

3.  decide [which release
    version](List_of_SBND_code_releases.html) you want; if
    you don\'t know your options, you can also find the ones currently
    available at [SBND SciSoft
    page](http://scisoft.fnal.gov/scisoft/bundles/sbnd){.external} (this
    is the [LArSoft
    equivalent](http://scisoft.fnal.gov/scisoft/bundles/larsoft){.external},
    for your convenience); you need to know:
    -   the version of `sbndcode`, e.g. `v06_52_00`
    -   the type of build you want: profiling (`prof`) or debugging
        (`debug`)
    -   the qualifier of the currently supported compiler (e.g. `e14`):
        there is usually only one
    -   which platform you have (see the [supported platform
        table](#List-of-platforms)), e.g. `d14`

4.  run the `pullProduct` script; if you are in your product area:

        pullProducts "$(pwd)" d14 sbndcode-v06_53_00 e14 prof

5.  be patient\...



### Updating the local product repository(#Updating-the-local-product-repository)

To update a version, you can follows the instructions above and run the
same `pullProducts` (that script rarely changes) on the same directory.\
Set up the product area(s) you have locally! If a product is already
available, it will not be downloaded again, which makes updates way
faster.\
There are no tools I am aware of to clean up packages that are not
useful any more.

------------------------------------------------------------------------

^1^ The binary distribution of `sbndcode` `v06_52_00` including
profiling *and* debugging versions together is a bit short of 10 GB,
which grow to about 15 GB when adding all supported experiments (DUNE,
MicroBooNE, etc.).
