---
layout: page
title: How to Visualize the Geometry
---

In order to visualize the geometry, you will need the file `Geometry/gdml/geoVis_sbnd.C`. It is not necessary LArSoft to run this file, you only need ROOT. Since visualizing the geometry requires ROOT to open a canvas, it is much faster to do it on your local machine.

Two options:

1. Visualize the entire geometry:

    ```
    root -l 'geoVis_sbnd.C("sbnd_v02_00_nowires.gdml")'
    ```
 
    The command above will open a canvas and display the entire geometry. We _highly_ reccomend that you visualize the `_nowires.gdml` file, since loading all the wires makes it very slow. 
    
2. Visualize a specific volume:

    ```
    root -l 'geoVis_sbnd.C("sbnd_v02_00_nowires.gdml","volCryostat")'
    ```
    
    Similarly to the previous option, the command above will open a canvas and display the volume that you chose. 
