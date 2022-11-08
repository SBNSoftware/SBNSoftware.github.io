# List of DAQ components

| Name | Lead developers | Documentation | Documentation Complete |
| ---- | -------------- | ------------- | ---------------------- |
| CRT  | A.Aduszkiewicz, E.Yandel | [CAEN DT5702](CRT/CAEN_DT5702_readout.md) | ? |
| PMT  | D. Rivera, W. Badgett    |               |                        |
| TPC  |                |               |                        |
| ICARUS trigger | J.Zettlemoyer, D.Torretta, W.Ketchum |               |                        |
| SBND trigger |  J. Sensenig|               |                        |
| WR   | D.Torretta, W.Badgett | [White Rabbit Timing System](WR/WhiteRabbit.md) |                        |
| spectdc | G.Lukhanin | |                        |
| | | | |
| EventBuilders | | | |
| Dispatchers | | | |


# Description of the columns
## Lead developers
Persons familiar with the code, in particular the part responsible for communication with the hardware.

## Documentation
The documentation should include:
- overview of the communication with hardware,
- description of FHiCL parameters. The FHiCL files include 1-line documentation for each parameters, but this is often insufficient. Here we can expand it with necessary details, including information why certain parameters were chosen.

## ICARUS and SBND documentation
In many cases ICARUS and SBND documentation is mostely identical, and it's easier to maintain one version of documentation, with a separate section explaining the differences between the two experiments.


## Documentation complete
Realistically the documentation is considered complete if it can help to answer most of the questions that may arise about functioning of the boardreader.
