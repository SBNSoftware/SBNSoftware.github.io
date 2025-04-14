---
layout: page
title: Updating the wiki for a new release
---

[Return to Release Management Workflow](https://sbnsoftware.github.io/sbndcode_wiki/Release_management_workflow.html)

Updating the wiki for a new release
==========================================================================================

-   Update the [release
    list](Releases/List_of_SBND_code_releases.html)

-   Automatically generate the release notes (and fill in the blanks)\

        cd < scratch >
        make_release_notes.sh < scratch > < new tag > < old sbndcode tag >
        python make_release_notes_sbnd.py #edit python file directly

-   The `make_release_notes.sh` is currently available at
    [https://github.com/SBNSoftware/SBNSoftware.github.io/tree/master/sbndcode_wiki/attachments](https://github.com/SBNSoftware/SBNSoftware.github.io/tree/master/sbndcode_wiki/attachments) and `make_release_notes_sbnd.py` is available in the same repo [here](https://github.com/SBNSoftware/SBNSoftware.github.io/blob/master/sbndcode_wiki/attachments/make_release_notes_sbnd.py)

-   Copy and paste the file into a new wiki page and link it to the
    release list (see [this
    example](https://sbnsoftware.github.io/sbndcode_wiki/Releases/ReleaseNotes092100.html))
