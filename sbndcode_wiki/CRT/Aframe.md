<b><u>A-frame Setup</u></b>

A-frame mounted with 7 CRT modules (0.96m x 2.73m) placed horizontally and vertically in coincidence for the purposes of module/FEB characterisation using cosmic ray muons. Characterisation tests involve measuring the ADC distribution from SiPMs for MIP muons passing through several modules in coincidence.

![image](https://user-images.githubusercontent.com/74778773/213795237-d53fb05a-e550-49a3-9da4-1f4d4470836f.png)
Figure 1 - Left: Picture of the A-frame setup in the SBN-ND building. Right: Diagram showing the orientation of CRTs with their FEB number (red arrows) and the daisy-chain connection between each FEB (pink arrows) with their respective cable length converted to ns signal delay.

A schematic of the A-frame is shown in figure 1, outlining the daisy-chained cabling between the FEBs connected to the CRTs. The cables connect the T<sub>0</sub>, T<sub>1</sub>, T<sub>in</sub> and T<sub>out</sub> inputs of the FEBs in the following order:

DAQ ----> 92 --2ns--> 73 --10ns--> 75 --6ns--> 76 --8ns--> 72 --6ns--> 71 --8ns--> 82

The T<sub>in</sub> and T<sub>out</sub> daisy-chain loops back from 82 to 92, whereas the T<sub>0</sub> and T<sub>1</sub> chain terminates at 82.

<b><u>Working Directory</u></b>
ssh into evb04, then run the crtnoise_launchdaq.sh script to set up A-frame working directory (DAQ_DevAreas/DAQ_23Sep2022CRTNoise/srcs/sbndaq/sbn-nd/DAQInterface).

The crt config file is crt01.fcl.
