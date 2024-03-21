---
layout: page
title: TITUS Event Display
---


# TITUS Event Display

TITUS is python-based event displays for the neutrino experiments at Fermilab.
It is currently used by MicroBooNE, SBND and ICARUS.


## Quickstart

From an sbndgpvm, run

    source /sbnd/app/users/twester/static_evd/setup.sh

For SBND, start the event display with

    evd.py -s

For ICARUS, use

    evd.py -i

For the pre-2024 versions of TITUS (<1.3.1), source the following script instead

    source /sbnd/app/users/mdeltutt/static_evd/setup.sh

## Basic usage

To open a file, either pass it as a command line argument, e.g.,

    evd.py -s <filename.root>

or use the File menu from the GUI.

The default view is the TPC view. Use the radio buttons on the right panel to select `RawDigits` or `Wires`. For ICARUS `stage0` files, you can also select Channel ROIs.

The wire views can be zoomed and panned. To reset the view, use either the "Reset view" button or right-click (double-click on Mac) and press "View all" from the popup menu.

The different control panels can be detached from the main GUI and repositioned, or closed entirely. To restore the run controls, go to the "Run" menu and choose "Restore controls". To restore closed controls from the active view (TPC, optical, CRT, etc.), go to the "View" menu and press "Restore controls". 

## New features (2024+)

The latest build of TITUS has several additional features:

 - SBND CRT view
 - Updated user interface with configurable layout
 - High-resolution screenshots
 - Multiple modes for automatic file switching
 - Persistent user settings between sessions
 - Many bug fixes and optimizations

### Automatic event scanning and file switching

Under the "File" menu, choose "Open directory" and navigate to the folder with files and press "Choose" to confirm. You should see the "Scan dir.:" label update on the GUI. Press the "Auto advance" button below the label to start scanning events.

You can change the auto-advance rate in the settings. Go to the "Edit" menu then click "Preferences". Click on the "Run" tab to set the auto-advance interval. You can also choose to have the event display move to the next file sequentially (the default) or to always skip to the newest file. After changing the settings, you will need to restart the auto-advance sequence by un-checking and re-checking the "Auto advance" button. You can also change the frequency at which the event display scans for new files.

### Composing screenshots

Under the File menu, there are two buttongs: "Screenshot (View)" and "Screenshot (Window)". The first option will capture just the central TITUS panel excluding the window controls. The second option will capture the whole window.

By default, screenshots are saved to the user's clipboard and can be pasted into any application which supports pasting images. This can be changed to save to a .png file instead within the preferences menu.

The main view window can be scaled beyond its displayed resolution when capturing a screenshot. Setting a higher value of the screenshot scale value within the preferences menu will result in higher-resolution screenshots.

Each experiment's logo can be added to the wire plane views using the "Logo" button on the TPC view. You can also add a scale bar which either displays the number of wires or the equivalent measurement in centimeters by clicking the "Scale bar" and "Use cm" buttons, respectively. Both the logo and the scale bar can be moved around the view by hovering over them until a highlight appears, then dragging with the mouse.

## For developers: How to Build and Install your Copy of TITUS

### Current official, pre-2024 version

TITUS requires `gallery` and `sbndcode`. You can obtain both pulling the
ups products.

It also needs PyQt and pyqtgraph. You should be using python3. In
python3, you can `pip install pyqt pyqtgraph`.

Then

    git clone https://github.com/coreyjadams/gallery-framework.git
    cd gallery-framework
    source config/setup.sh
    make -j

    cd UserDev/EventDisplay/
    source setup_evd.sh
    make -j

That\'s it!


### Preview build, 2024+

Setup one or both of `sbndcode` and `icaruscode` via UPS, then also set up `cetmodules` via UPS.

TITUS's build system will be switched to `cmake`. Currently, you must check out a feature branch `feature/twester_gui`

    git clone https://github.com/coreyjadams/gallery-framework.git
    cd gallery-framework
    git checkout feature/twester_gui


Next, create a folder for build files and run `cmake`:

    cd /path/to/titus/build
    cmake /path/to/gallery-framework -DCMAKE_INSTALL_PREFIX=/path/to/install
    cmake --build .
    cmake --install .


As before, TITUS requires Python with ROOT support and several additional packages. If you have set up `sbndcode` from UPS, you should already have Python with ROOT support. From there, additional packages may be installed via `pip`. To stay organized, it is recommended to first create a virtual environment via

    python -m venv ~/.venv/titus
    source ~/.venv/titus/bin/activate


Then install the additional packages with `pip install <package name>`:

    PyQt5
    pyqtgraph
    scipy
    pillow
