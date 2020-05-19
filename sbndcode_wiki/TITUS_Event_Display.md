---
lang: en
title: TITUS Event Display
---



TITUS Event Display(#TITUS-Event-Display)
==========================================================

TITUS is python-based event displays for many of the neutrino
experiments at Fermilab. It is currently used by MicroBooNE, SBND and
ICARUS.



How to Use the Pre-built Copy of TITUS on the SBND gpvms(#How-to-Use-the-Pre-built-Copy-of-TITUS-on-the-SBND-gpvms)
------------------------------------------------------------------------------------------------------------------------------------

Log in to any SBND gpvm machine that use SL7. Then:\

    source /sbnd/app/users/mdeltutt/static_evd/setup.sh

\
That\'s it!



How to Run the Event Display(#How-to-Run-the-Event-Display)
----------------------------------------------------------------------------

Once you have done the setup above, you can run TITUS by typing:\

    evd.py -s /path/to/art-root-file.root

The flag `-s` means that it will use the SBND geometry. Use option `-s3`
on a file produced with 3 drift windows.

You can use this file as an example:\

    evd.py -s3 /sbnd/data/users/mdeltutt/titus_evd_files/prodoverlay_corsika_cosmics_proton_genie_nu_spill_gsimple-configf-v1_tpc_flashreco.root



How to Use the Event Display(#How-to-Use-the-Event-Display)
----------------------------------------------------------------------------

A demo is available here:
<https://cdcvs.fnal.gov/redmine/attachments/58762/titus_demo_tpc.mov>



How to Build and Install your Copy of TITUS(#How-to-Build-and-Install-your-Copy-of-TITUS)
----------------------------------------------------------------------------------------------------------

TITUS requires `gallery` and `sbndcode`. You can obtain both pulling the
ups products.

It also needs PyQt and pyqtgraph. You should be using python3. In
python3, you can `pip install pyqt pyqtgraph`.

Then\

    git clone https://github.com/coreyjadams/gallery-framework.git
    cd gallery-framework
    source config/setup.sh
    make -j

    cd UserDev/EventDisplay/
    source setup_evd.sh
    make -j

That\'s it!
