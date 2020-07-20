---
lang: en
title: Small data files for SBND processing sbnd data
---



Small data files for SBND processing: `sbnd_data`
===================================================================================================================

-   **Table of contents**
-   [Small data files for SBND processing:
    sbnd\_data]
    -   [Availability and set up]
    -   [Content of the package]
    -   [Update procedures and
        policies]
        -   [Starting with the latest
            version]
        -   [Updating the content]
        -   [Choose the next version
            number]
        -   [Guidelines for updating \`CHANGE\`
            files]
        -   [Declare and pack the UPS
            product]
        -   [Deploy the new version]
    -   [Version number policy]

The UPS product `sbnd_data` contains small data files necessary to some
of the processing via `sbndcode` and others.

Being made of binary data, the content is not suitable for version
control systems.\
Therefore, it is updated by copying an existing version and changing it,
and no track of the changes is automatically kept.

The procedure is actually extremely simple, but we have a long wiki page
to impress people.



Availability and set up
------------------------------------------------------------------

The product `sbnd_data` is distributed in:

-   [CVMFS](Write_files_to_CVMFS.html):
    `/cvmfs/sbnd/opensciencegrid.org/products`
-   `/grid/fermiapp/products/sbnd` (not yet)

and it can be set up simply with its version number:

    setup sbnd_data v01_00_00

Also, if when `sbndcode` is set up the right version of `sbnd_data` is
available, it will be automatically set up. This might become
non-optional in the future.

> Note that only the base directory is added to `FW_SEARCH_PATH`
> directory list. You will have to **specify the complete relative path
> in your configuration**; for example,
> `"Response/sbnd_filters_v0.1.root"` instead of just
> `"sbnd_filters_v0.1.root"`.



Content of the package
----------------------------------------------------------------

-   `ups/`: contains the magics for this to be a legit UPS product;
    usually no need to change it
-   `Response/`: signal shape on the wires (\"electric field response\")
-   `README`: a short description of the content of the package (like
    this one)
-   `CHANGES`: a list of the changes to the content: **please update
    this whenever you change the content!** This is the only way we have
    to track it.



Update procedures and policies
--------------------------------------------------------------------------------

An update of the package happens in the following steps:

1.  [the latest version is taken as starting
    point]
2.  [content is updated]
3.  a [new version number] is
    decided
4.  `CHANGES` [files in the changed directories are
    updated]
5.  the [new UPS product is
    finished]
6.  the new UPS product is [Small data files for SBND processing
    sbnd\_data] to the [deployment
    sites]
7.  likely, a dependence update should be scheduled for the next release
    of `sbndcode`

These instructions are a detailed version of [the ones from
LArSoft](Procedure_to_create_a_new_version_of_larsoft_data.html).



### Starting with the latest version

Have a UPS area specific for this work.\
To create one:

1.  set up an existing UPS are (more convenient if it has also
    `sbnd_data`)

2.  copy from there the key files:

        cp -av /cvmfs/sbnd/opensciencegrid.org/products/setup /cvmfs/sbnd/opensciencegrid.org/products/.up* .

3.  \... and make the `sbnd_data` directory, which will turn out to be
    useful:

        mkdir -p sbnd_data

To start an update:

1.  set up an UPS product area with both UPS and `larutils`

2.  go into your private UPS area and set it up: `source "$(pwd)/setup"`
    (you need at least `ups` already set up)

3.  copy **the most recent** version of `sbnd_data`:

        declare LatestVersion="v01_00_00"   # for later occurrences in this tutorial
        cp -av "/cvmfs/sbnd/opensciencegrid.org/products/sbnd_data/${LatestVersion}" sbnd_data/

    (don\'t copy the `sbnd_data/v01_00_00.version` directory, which is
    not useful here)

You are ready to change the content.



### Updating the content

You just do your editing, copying and removing in the copy of the most
recent `sbnd_data/<latest_version>` [you just
created].\
Each new subdirectory of `sbnd_data` should have its own `CHANGES` file.



### Choose the next version number

The version format is `vMM-mm_pp`, with `MM` the major version, `mm` the
minor version, and `pp` the \"patch\" version, all with 2 digits,
0-padded.\
Try to follow [these
guidelines] if
possible.\
For the rest of the tutorial, the following is assumed to exist with the
new version:

    declare NewVersion="v01_01_00"



### Guidelines for updating \`CHANGE\` files

These guidelines try to cover all the information that in future we
might want to find out from a old (or current) release.\
For each change in a subdirectory `dir`, two or three files should be
updated:

-   [\`sbnd\_data/\<latest\_version\>/dir/CHANGES\` mentioning the
    changes, the author(s), the date, the new version, the description
    of the change and pointers to documentation (e.g. DocDB documents)
    if available]{style="color: red;"}
-   \`sbnd\_data/\<latest\_version\>/CHANGES\` if a change on the [minor
    version bump level] is being
    performed (e.g. if it is in a new directory or if it adds something
    for the first time)
-   \`sbnd\_data/\<latest\_version\>/README\` also if it is in a new
    directory or if it adds something for the first time

> One more time: this is the only way we have to keep record of the
> content of the package.



### Declare and pack the UPS product

We are going to produce a `tar` file with the new content. Note that you
need `larutils` set up, and you need to know a version of it
(`ups list -aK+ larutils`; pick the most recent one):

1.  work from the UPS main directory, which now contains the new
    `sbnd_data`

2.  rename the directory under `sbnd_data/${LatestVersion}` (the latest
    existing one) into the new version that you have just picked:

        mv -v "sbnd_data/${LatestVersion}" "sbnd_data/${NewVersion}"

3.  declare the new version (note that the `$NewVersion` value appears
    twice):

        ups declare sbnd_data "$NewVersion" -f NULL -m sbnd_data.table -r "sbnd_data/${NewVersion}"

4.  create a tar file:

        setup larutils v1_11_00   # newer is fine too
        makeDataTar.sh "$(pwd)" sbnd_data "$NewVersion"

You have now a shiny new `sbnd_data_${NewVersion#v}-noarch.tar.bz2`
(note for your scripts: there is no `v` in the file name before the
version number).



### Deploy the new version

The package needs to be propagated individually to the [deployment
sites].

For CVMFS, the [generic SBND CVMFS update
instructions](Write_files_to_CVMFS.html) work well. An
update of `sbnd_data` (that typically comes with a `sbndcode` update)
deserves a new major version number for tag (CVMFS tags grow faster than
the code in this scheme).

The deployment on `/grid` is still TODO.



Version number policy
--------------------------------------------------------------

These are generic guidelines to help in choosing how to bump the version
number:

-   *major version* increases for general reorganisation or particular
    milestones
-   *minor version* increases for addition of material and significant
    update of the existing files
-   *patch version* increases for bug fixes and changes not affecting
    physics

In doubt, ask the software coordinators.

------------------------------------------------------------------------

[Last update: December 22, 2016, by [Gianluca
Petrillo](mailto:petrillo@fnal.gov) .]{style="color: gray;"}
