---
lang: en
title: Write files to grid
---



Write files to `/grid/fermiapp/products/sbnd`(#Write-files-to-gridfermiappproductssbnd)
========================================================================================================

-   **Table of contents**
-   [Write files to
    /grid/fermiapp/products/sbnd](#Write-files-to-gridfermiappproductssbnd)
    -   [Access privileges](#Access-privileges)
    -   [Deploying a UPS product](#Deploying-a-UPS-product)

The procedure to deploy UPS packages into `/grid/fermiapp/products/sbnd`
is very simple:

1.  get a Kerberos ticket as usual:

        kinit -R "${USER}@FNAL.GOV" || kinit "${USER}@FNAL.GOV"

    (this is just a trick so that it renews if available, otherwise it
    asks for a password and creates a new one)

2.  log in `sbndgpvm01.fnal.gov` as `sbnd` user (you need to [be
    authorised](#Access-privileges)):

        ssh sbnd@sbndgpvm01.fnal.gov

    (note that `sbndgpvm02.fnal.gov` can\'t write into `/grid` at all)

3.  do what it takes to modify the `/grid/fermiapp/products/sbnd` area:
    copy files, move files, expand files, edit files\...

        tar xvvf sbnd_data-01.00.00-noarch.tar.bz2 -C /grid/fermiapp/products/sbnd

4.  log out

> Note that, differently from CVMFS, **this file system is not
> versioned**. If you mess with it, it will stay messed up until you fix
> it by hand.



Access privileges(#Access-privileges)
------------------------------------------------------

To earn the ability to log in as `sbnd` in a SBND GPVM machine, you need
to be added on a specific list. A [Fermilab service desk
ticket](Computing_resources.html#Opening-a-ticket-in-Fermilab-Service-Desk)
is required to start that process.



Deploying a UPS product(#Deploying-a-UPS-product)
------------------------------------------------------------------

> **NOTE**: these instructions need to be properly tested.

These instructions explain how to add a new UPS product to
`/grid/fermiapp/products/sbnd`.\
The starting point is:

-   a directory structure *complete of everything* should end into the
    UPS product (included a UPS \"table file\")
-   the user can write to that area (see above)
-   the UPS product to be installed is:
    -   name: `myproduct` (avoid underscores and hyphens as much as you
        can)
    -   version: `v1_2_3_p9` (any version string should be ok\... just
        don\'t get creative)
    -   flavor: `Linux-WhateverVersion`
    -   table file: `ups/myproduct.table`

The correct flavor can be sometimes inferred from a directory name
(usually the library directory, or the one that contains it). For UPS
products with no binary file, flavor is usually declared `NULL`.

Once that information is known, the steps to deploy the UPS products
are:

1.  set up the target UPS area:\

        source /grid/fermiapp/products/sbnd

2.  copy the product directory into the UPS database:\

        cd /grid/fermiapp/products/sbnd
        mkdir -p 'myproduct'
        cp -a 'wherever/myproduct/is' 'myproduct/v1_2_3_p9'

3.  check if there are symbolic links that have been broken; if so, fix
    them by making them local to the UPS product directory (or else they
    just won\'t work)

4.  declare the product to UPS with
    `ups declare <productName> <productVersion> -f <productFlavor> -m tableFileName.table -r path/to/content`:\

        ups declare myproduct v1_2_3_p9 -f Linux-WhateverVersion -m myproduct.table -r myproduct/v1_2_3_p9

5.  verify that it works by:\

        ups list -z . -a myproduct

    \
    which should include something like:\

        DATABASE=.
            Product=myproduct    Version=v1_2_3_p9    Flavor=Linux-WhateverVersion
                Qualifiers=""    Chain="" 

    \
    with one entry for known qualifier (they are specified in the table
    file). Another good check is to verify the dependencies:\

        ups depend myproduct v1_2_3_p9 -f Linux-WhateverVersion -q ""

    (one command per supported qualifier - in this case, `-q ""` is
    superfluous).
