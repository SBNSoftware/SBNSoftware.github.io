---
lang: en
title: RunConfig DB requirements notes
---

[]{#RunConfig-DB-requirements-notes}

RunConfig DB requirements notes[¶](#RunConfig-DB-requirements-notes){.wiki-anchor}
==================================================================================

[]{#Discussion-15-March-2019Bill-Ron-David-Wes-Gennadiy}

### Discussion 15 March 2019 (Bill, Ron, David, Wes, Gennadiy)[¶](#Discussion-15-March-2019Bill-Ron-David-Wes-Gennadiy){.wiki-anchor}

Want to separate specific technologies from concrete requirements:

-   Downloading/uploading configurations should take nearly negligible
    time (\< order 10 s for even large configurations necessary, \<
    order 1 s goal)
-   user-friendly interface for modifying and creating configurations
-   need ability to download/upload configurations into/from a set of
    local fcl files
-   historical configurations need to be retrievable forever
-   run configurations in database are immutable
-   name/version number for configuration defines a unique configuration
    set, and is immutable once made
-   hot failover/or reinstall from backup on order of hour (and would be
    done by expert that is accessible 24/7)
-   if a DB fails and we need to move to a local failover or backup,
    shouldn\'t lose more than 10 minutes of information from
    configuration or run history DB at a normal level of reliability
-   should have daily-to-weekly full backups to out of experiment hall
    (via TIBS?)
-   RunHistory DB either must be offline query-able or copied to
    someplace offline query-able
-   online configuration DB must be query-able (e.g. \'give me all
    configurations that have *x* parameter set to *y* value\') and it
    must \"pretty darn quick\"
-   need a utility to compare the difference between configurations
-   would be good to make a configuration \'taggable\', such that when
    you ask for a configuration by tag/alias, it gives an
    expert-identified one (note: while name/versions cannot be modified,
    aliases can be modified to point to different configuration)
-   there should be support for subconfigurations, and subconfigurations
    follow generally the same needs as configurations (immutable in
    history and once made, query-able, have names and versions, etc.)
