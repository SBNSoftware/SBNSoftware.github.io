# List of BoardReaders

| Name | Lead developers | Documentation | Documentation Complete |
| ---- | -------------- | ------------- | ---------------------- |
| CRT  | A.Aduszkiewicz, E.Yandel | [CAEN DT5702](CRT/CAEN_DT5702_readout.md) | ? |
| PMT  |                |               |                        |
| TPC  |                |               |                        |
| trigger | J.Zettlemoyer, D.Torretta, W.Ketchum |               |                        |
| WR   | D.Torretta, W.Badgett, G.Lukhanin | [White Rabbit Timing System](WR/WhiteRabbit.md) |                        |

To add: EventBuilder, DataLogger, Dispatcher, add section for SBND as needed?


- **lead developer** – refers to person familiar with the code, in particular the part responsible for communication with the hardware.
- **documentation** – We yet need to define what should be included in the documentation, and what criteria it should fulfill to be called "complete" (85% qs can be answered) or "will be complete by" <date> (configuration parameters, how they affect data taking, what typical parameters are), systematically go through each parameter of configuration, short explanation in fhicl file, long explanation in wiki page incl. why a selection was made
