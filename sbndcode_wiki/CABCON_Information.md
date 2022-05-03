## CABCON (HDMI->RJ45 Converter Board) Notes

_(Notes from tests done at PAB 10/12/21)_

Settings (for all tests): Connected G (HDMI and CAT5):
	(J also plugged in with HDMI but unused basically)

### Ver. 2019 A2 (we have 2 of them) - do NOT work 
Symptoms: 
- Does not read trim voltage when unbiased (values ~0 V)
- When bias board to 49.5 V with GUI, adc reading is ~33 V and voltmeter reads ~0 V

### 2016 A1 single HDMI to CAT5 also doesn't work (same symptoms)

### March2020 A1 works (the one we used with Stella tests)
- When not biased and check voltage with CAT5 breakout board, we read values ~4 V (trim voltage?)
- When bias to 49.5 V with GUI, adc reading is 49.3 V, measure with voltmeter and see ~51 V (all positive 51)

### 2020 B2 (we have 2 of them)
- Were wrapped in packaging (unused)
- When not biased and check voltage with CAT5 breakout board, we read values ~4 V (trim voltage?)
	- BUT CAT5 channels are positive for 1+2, negative for 4+5, positive for 3+6, positive for 7+8
	- When bias to 49.5 V with GUI, adc reading is 49.3 V, measure with voltmeter and see ~51 V (-51 V on 4+5)
- When take data with monitor SiPM (connected on first channel, which for Stella tests was 1+2 on breakout board), we see a light pulse on channel 2 (corresponding to 4+5 on breakout board) (see schematics on next page)
 - Has worked with only 1 channel connected (monitor sipm) - this was the negative bias one!
- Why does this work with negative bias??
	- Tested this with just channel 3 as well, does bias properly (up to 49.5 V) and sees a light pulse
	- Tried cable with all 4 channels connected: voltage doesn't bias all the way (stops at 33 V)
- Definitely can't use channel 1 (our Stella channel 2) with the other ones bc it's negative bias
- Tried with just 2, 3 positive channels connected, still only see light on one channel... 
- Tried with the one negative bias channel and one positive bias channel, saw light on both...
