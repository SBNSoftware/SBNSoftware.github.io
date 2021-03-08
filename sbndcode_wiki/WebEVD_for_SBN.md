# WebEVD for SBN

WebEVD is available as a ups product. You will need to set it up, along with a compatible version of `sbndcode`/`icaruscode` (for service configurations).

    source /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh
    source /cvmfs/icarus.opensciencegrid.org/products/icarus/setup_icarus.sh
    setup webevd v09_05_01 -qe19:prof
    setup sbndcode v09_17_02 -qe19:prof
    setup icaruscode v09_17_02 -qe19:prof

These are the first versions for which WebEVD worked well for SBN, current as of March 2021. You may be able to use newer versions.

## Running

To run the event display, simply

    lar -c webevdjob_sbnd.fcl my_file.root
    
or

    lar -c webevdjob_icarus.fcl my_file.root

and follow on-screen instructions. The ssh command it prints is to be run on your local machine (where your browser window is).

## Tips

You can control which event the display starts on with the standard `--nskip` etc art command-line arguments. Once in the display, you can edit the run/subrun/event numbers in the bottom-left and press enter.

Rotate the view with the left mouse button, zoom with the mouse wheel, pan with the right mouse button. In 2D views, left mouse button pans.

## Developing WebEVD

WebEVD is maintained in the larsoft github at https://github.com/LArSoft/webevd

You can set up a new development environment as follows:

    mkdir mywebevd_dir
    cd mywebevd_dir
    source /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh
    mrb newDev -q e19:prof
    source localProducts*/setup
    mrb g webevd
    source localProducts*/setup
    mrbsetenv
    mrb i

NB if you edit the files in `WebEVD/web/` while the display is running, it is only necessary to refresh the web page to pick the changes up.

You should make any changes on a new feature branch, push the branch to a fork of the repository, and then make a pull request using the github web interface.

## Reporting bugs / suggesting features

The github issue tracker is at https://github.com/LArSoft/webevd/issues
