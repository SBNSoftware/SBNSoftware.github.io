---
layout: page
title: Deploying a release on fermigrid
---



Deploying a release on fermigrid
====================================================================================



Legacy
--------------------------------

-   We no longer deploy `sbndcode` and `sbndutil` on `/grid/fermiapp`.
-   It still exists but may not do forever.
-   There is very little space on there so best not to try to put any
    big files on it.
-   Currently still used as a staging area for `sbnd_data` but this will
    have to change if it disappears.



Old instructions
----------------------------------------------------

-   The method requires the script pullProducts from
    <http://scisoft.fnal.gov/scisoft/bundles/tools/>

-   Log in to the sbnd account on sbndgpvm01

-   Set up the SBND UPS are (IMPORTANT: Otherwise all dependencies will
    be pulled)\

        source /grid/fermiapp/products/sbnd/setup_sbnd.sh

-   Use the pullProducts script for each binary flavour that you want to
    install (NOTE: best to do this from a user directory as pullProducts
    copies the binary files and manifest to your current directory)\

        pullProducts /grid/fermiapp/products/sbnd slf6 sbnd-05.12.01 e9 debug
        pullProducts /grid/fermiapp/products/sbnd slf6 sbnd-05.12.01 e9 prof
        pullProducts /grid/fermiapp/products/sbnd d14 sbnd-05.12.01 e9 debug
        ...

-   Alternatively, All supported flavours can be installed using
    install\_from\_scisoft.sh (currently untested)\

        install_from_scisoft.sh sbnd-05.12.01
