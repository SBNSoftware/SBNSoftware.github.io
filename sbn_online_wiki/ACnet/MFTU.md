---
layout: page
title: Running CAEN DT5702 readout of CRT
---

## The Multi-Function Timing Unit (MFTU)

The MFTU is the latest interface between the ACnet timing systems (TCLK or MIBS) and users of their timing and control signals.   The MFTU replaces the previous Internet Rack Monitor (IRM).   The unit decodes the incoming TCLK (or MIBS) event stream and converts them into simple TTL digital outputs with a programmable delays and widths.  The unit can also accept fast asynchronous signals and use the TCLK events to gate the fast signals in order to select a subset of those signals.  For example, if one wants only BES booster extraction signals that are going to BNB, you can gate the BES with $1D TCLK events.  Before configuring the MFTU, be sure to read the docementation at <a href=https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=3578>MFTU documentation</A>. Related documenation can be found at <a href=https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=3701>Presenation by the Designer</A> and <A HREF=https://sbn-docdb.fnal.gov/cgi-bin/sso/ShowDocument?docid=19258>Fiber to TTL Converter</A>.

## Configuring the MFTU

The MFTU configuration is performed on page E35 of an ACnet console, SBN-ND tab, pages 3 and 4.   To open a console, ssh to either outland.fnal.gov or outback.fnal.gov ACnet gateway nodes and type "cnsrun".    If you are off-site without a good internet connection, we recommend launching the console on a VNC session.  Note that VNC sessions are not allowed on outland nor outback, you will need another VNC server host.  After typing "cnsrun" in a moment several new windows will appear, like this one below.

<img width="771" alt="E Menu Page" src="https://user-images.githubusercontent.com/25019296/139336810-e3daa1e2-244d-4788-9eaf-cf94c9a0c96a.png">

If the E menu is not shown, type the letter E in the upper left corner of the window and press return.   To display page E35, click on that entry in the list, or type E35, again in the upper left corner of the window and press return.    To select the correct pages, click on the SBN-ND tab (shown with a red rectangle) and enter page number 3 or 4 (shown with a red oval) and press return. Pages 1 and 2 configure the older IRM device, also available at SBN-ND and SBN-FD. 

<img width="752" alt="An MFTU control page" src="https://user-images.githubusercontent.com/25019296/139337240-76015d25-7d2b-45c9-aebe-656781c70389.png">

Each output has three parameters:  TCLK event, delay and vernier.  Vernier is not available on B channels (page 4).  By default, settings are disabled when you first connect to the ACnet console.  To enable settings temporarily, find the smaller "Utilities" window.    Click on "Settings" and choose a time -- choose the shortest time in which you can effectively do whatever work you need to do.   Note you must be connected from on site in order to enable settings. 

<img width="600" alt="Screen Shot 2021-10-28 at 4 28 18 PM" src="https://user-images.githubusercontent.com/25019296/139340926-d9e105b6-ad8b-4c38-ad50-f7efa4a88855.png">
<img width="600" alt="Settings Enabled" src="https://user-images.githubusercontent.com/25019296/139339453-525c1bff-f95d-46c9-973a-dc64781e6f9a.png">

The yellow columns show the last set value of the parameter.   The green numbers show the actual setting as read back from the device.   To change the setting, simply type over the yellow numbers and press return.  After a moment, the green column should show the new value when the setting was successful.   If you see another number in green or a red error code, the setting failed.  In case of failure, the reasons could be:  Settings are disabled in the Utilities window; you do not have privilege from your account to change these device sestting; or there could be a hardware fault.

When finished setting, be sure to disable Settings on the Utilities window.   When you are finished with your ACnet console session as a whole, be sure to log out by clicking "Shutdown Console" on the Utilities window.

(wb)
