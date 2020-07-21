---
layout: page
title: Updating the wiki for a new release
---



Updating the wiki for a new release
==========================================================================================

-   Update the [release
    list](List_of_SBND_code_releases.html)

-   Update the [settings/versions
    page](https://cdcvs.fnal.gov/redmine/projects/sbndcode/settings/versions){.external}

-   Automatically generate the release notes (and fill in the blanks)\

        cd < scratch >
        make_release_notes.sh < scratch > < new tag > < old sbndcode tag >

-   The make\_release\_notes.sh is currently available at
    /nashome/t/tbrooks/scripts

-   Copy and paste the file into a new wiki page and link it to the
    release list and settings/versions page (see [this
    example](ReleaseNotes051201MCC.html))
