# Running Wavedump

From either a VPN or from a gpvm, ssh into the gateway and PDS server on the sbnd user:

``` bash
    ssh sbnd@sbnd-gateway01.fnal.gov # or sbnd-gateway02
    ssh sbnd@sbnd-pds03.fnal.gov # or whichever pds server you're using
```

Gateway01 is for the DAQ, and Gateway02 is for slow control. Navigate to the folder with the wavedump info:

``` bash
    cd wavedump-3.9.0-trig
    cd src 
```

Open and check the config file, for example: `w1.txt`, to see if the PCI corresponds to the right link. The number in the textfile name should correspond to the LINK number. If PDS03 is connected to LINK 1 for example, you should find this line:

``` text
    OPEN PCI 1 0 0 
```

The first number after PCI should be equal to the LINK number. If you want to use a more interesting test signal, you can access the `TEST_PATTERN` line and change it to `YES` to use a triangle wave signal.

The `caen` command... To run the wavedump, run (with the correct config file):

``` bash
    ./wavedump w1.txt 
```

and press `s` to start. There are a few options while the wavedump is running: `q` to quit, `T` to turn on the software trigger, `p` to plot a single event (Note: the plot option doesn't work for an external input? tbd), and `P` to enable/disable the continuous plotting. Press "space" to view more options.

## Change PLL (Phase Lock Loop)

NOTE: When choosing the configuration file for the clock, make sure to choose the file for the **1730S** and _NOT_ the 1730.

Similarly, ssh into the desired gateway and the pds server:

``` bash
    ssh sbnd@sbnd-gateway01.fnal.gov # or sbnd-gateway02
    ssh sbnd@sbnd-pds03.fnal.gov # or whichever pds server you're using
```

To start the GUI, use command `CAENUpgraderGUI`

In the GUI:

1. **To get Firmware Release:**

    a. choose board type: `V1730` (does not have "S")

    b. change the connection type: `OPTLINK` (not USB)

    c. check link number (`1` or `2`)

    d. all other options can be left as is (aka leave Board # empty)

    e. can click the "Get FW Rel"

2. **To upgrade PLL:**

    a. choose board type: `V1730`

    b. PPL Upgrade File: (internal clock `/etc/CAENUpgrader/PLL/v1730S_vcxo500_ref50_ppl_out62_5.rbf`) & (external clock: `/home/nfs/sbnd/caen/v1730s/v1730S_vcxo500_ref10_pll_out62_5.rbf` )

    c. change the connection type: `OPTLINK` (not USB)

    d. check link number (`1` or `2`)

    e. DO NOT TOUCH CONFIG OPTIONS

    f. can click "Upgrade"

The syntax clock config file is as follows: ...`ref<input_freq>_ppl_out<output_freq>`... In otherwords, the internal clock config has 50 MHz in and 62.5 MHz out.  
