

# SPEC Fine-Delay

The SPEC FineDelay card is mounted on a FMC card in the bach of
sbnd-daq27.fnal.gov

See the FMC FineDelay User\'s Manual for details on gettin/compiling TDC
software and testing\
( \~sbnddaq/Documents/fine-delay-sw-v2014-04.pdf )

a\) get the FineDelay sotware from the CERN ohwr.org repository

git clone
git://ohwr.org/fmc-projects/fmc-delay-1ns-8cha/fine-delay-sw.git\
cd fine-delay-sw\
git submodule update \--init (to gel all dependencies, ZIO and fmc-bus )

a1) download the gateware binary files from the latest release

NOTE: unfortunately the gateware downloaded from the Web DID NOT WORK\
so we contacted the CERN experts and they sent us the latest gateware
file

svec-fine-delay-v2.0-20140331.bin

AND THIS IS THE ONE THAT NEEDS TO BE LOADED INTO THE KERNEL

    2) this   .bin file needs to be copied to /lib/firmware/fmc

~~bash-4.2\$ ls -l /lib/firmware/fmc\
-bash-4.2\$ ls -l /lib/firmware/fmc\
total 18972\
-rw-r\--r-~~ 1 torretta sbnd 1485788 Mar 20 11:09 spec_fdel_wrpc4.bin\
lrwxrwxrwx 1 root root 19 Mar 20 11:11 spec-fine-delay.bin ~~\>
spec_fdel_wrpc4.bin\
-rwxr-xr-x 1 root root 1486064 Feb 17 15:08
spec-fine-delay-v2.0-20140331.bin\
-rw-r\--r-~~ 1 root root 1486616 Jan 27 10:05
spec-fine-delay-v2.1-20141209.bin\
~~rw-r\--r-~~ 1 root sbnd 1484404 Feb 20 15:27 spec-init.bin\
lrwxrwxrwx 1 root root 33 Feb 17 15:08 svec-fine-delay.bin ~~\>
svec-fine-delay-v2.0-20140331.bin\
-rwxr-xr-x 1 root root 3860422 Feb 17 15:08
svec-fine-delay-v2.0-20140331.bin\
-rw-r\--r-~~ 1 root root 3900068 Jan 27 10:05
svec-fine-delay-v2.1-20141209.bin\
~~rw-r\--r-~~ 1 root root 1486064 Jan 24 11:55
wr_spec_tdc_17012017_rc2.bin\
~~rw-r\--r-~~ 1 root root 4223804 Jan 24 11:51
wr_svec_tdc_17012017_rc2.bin\
-bash-4.2\$

b\) compile/make code\
cd \~fine-delay-sw\
ksu\
make prereq_install\
make install

c\) load kernels

ksu\
\[rooot\@sbnd-daq27 \~\]\# modprobe spec\
\[root\@sbnd-daq27 \~\]\# modprobe fmc-fine-delay
gateware=fmc/spec-fine-delay-v2.0-20140331.bin

d\) dmesg (to check that there are no errors):\
\[ 528.305274\] zio-core had been unloaded\
\[ 541.715355\] zio-core had been loaded\
\[ 556.577544\] spec 0000:0c:00.0: probe for device 000c:0000\
\[ 556.649881\] spec 0000:0c:00.0: got file \"fmc/spec-init.bin\",
1484404 (0x16a674) bytes\
\[ 556.841522\] spec 0000:0c:00.0: FPGA programming successful\
\[ 557.189916\] spec 0000:0c:00.0: mezzanine 0\
\[ 557.189997\] Manufacturer: INCAA Computers BV\
\[ 557.190085\] Product name: FmcDelay1ns4cha\
\[ 557.190201\] spec 0000:0c:00.0: Gateware ()\
\[ 557.190272\] spec 0000:0c:00.0: reprogramming with
fmc/spec-fine-delay-v2.0-20140331.bin\
\[ 557.444262\] spec 0000:0c:00.0: FPGA programming successful\
\[ 557.449900\] spec 0000:0c:00.0: Gateware successfully loaded\
\[ 560.241756\] fd fd-0c00: device loaded\
\[ 560.247063\] spec 0000:0c:00.0: Found VIC @ 0x90000\
\[root\@sbnd-daq27 tools\]\#

NOW WE CAN TRY RUNNING SOME SIMPLE CODE provided in the
\~fine-delay-sw/tools directory

e\) cd \~fine-delay-sw/tools

\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\# ./fmc-fdelay-board-time get\
WR Status: disabled.\
Time: 149580.249577728\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\# ./fmc-fdelay-board-time wr\
Locking the card to WR: .. locked!\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\#\
\[

TO INITIALIZE THE CONNECTION TO THE WR YOu need to run the
\~fine-delay-sw/spec-sw/spec-vusrt.sh code

d\) run the spec-vuart.sh code

    need to find out the WR-Periph-UART and its offset :

\[root\@sbnd-daq27 tools\]\# cat
/sys/kernel/debug/FmcDelay1ns4cha-0c00/dump_sdb\
FMC: 0000:0c:00.0 (SPEC), slot 0, device FmcDelay1ns4cha-0c00\
00000651:e6a542c9 WB4-Crossbar-GSI\
0000ce42:f19ede1a Fine-Delay-Core (00080000-000807ff)\
00000651:eef0b198 WB4-Bridge-GSI (bridge: 000c0000)\
00000651:e6a542c9 WB4-Crossbar-GSI\
0000ce42:66cfeb52 WB4-BlockRAM (000c0000-000d5fff)\
00000651:eef0b198 WB4-Bridge-GSI (bridge: 000e0000)\
00000651:e6a542c9 WB4-Crossbar-GSI\
0000ce42:ab28633a WR-Mini-NIC (000e0000-000e00ff)\
0000ce42:650c2d4f WR-Endpoint (000e0100-000e01ff)\
0000ce42:65158dc0 WR-Soft-PLL (000e0200-000e02ff)\
0000ce42:de0d8ced WR-PPS-Generator (000e0300-000e03ff)\
0000ce42:ff07fc47 WR-Periph-Syscon (000e0400-000e04ff)\
0000ce42:e2d13d04 WR-Periph-UART (000e0500-000e05ff)\
0000ce42:779c5443 WR-Periph-1Wire (000e0600-000e06ff)\
0000ce42:779c5445 WR-Periph-AuxWB (000e0700-000e07ff)\
0000ce42:00000013 WB-VIC-Int.Control (00090000-000900ff)\
Bitstream \'spec-fine-delay\' synthesized 20140326 by twlostow (ISE
version 145), commit a8a78408c341\
Synthesis repository:
git://ohwr.org/fmc-projects/fmc-delay-1ns-8cha.git\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\#

LOOK at the line:\
0000ce42:e2d13d04 WR-Periph-UART (000e0500-000e05ff)

    the UART offset for the card is e0500

    f) cd ~fine-delay-sw/spec-sw/tools

ot\@sbnd-daq27 tools\]\# ./spec-vuart -u 0xe0500\
\[press C-a to exit\]\
WR Core: starting up\...\
get_persistent_mac: Using W1 serial number\
ID: cafebabe\
PPSi for WRPC. Commit ppsi-v2013.11.1-1-g76d6d83, built on Mar 12 2014\
t24p read from EEPROM: 2147483647 ps\
Loops per jiffy: 20818\
Locking PLL\
Slave Only, clock class set to 255\
executing: ptp stop\
executing: sfp detech\
executing: sfp match\
Run sfp detect first\
executing: ptp start\
Slave Only, clock class set to 255\
wrc\#\
wrc\#\
wrc\#\
wrc\#\
wrc\#\
wrc\# gui

\[root\@sbnd-daq27 tools\]\# ./fmc-fdelay-status\
Channel 1: disabled\
Channel 2: disabled\
Channel 3: disabled\
Channel 4: disabled\
\[root\@sbnd-daq27 tools\]\# ./fmc-fdelay-pulse ~~h\
./fmc-fdelay-pulse: Use \"./fmc-fdelay-pulse \[-V\] \[-i \<index\>\]
\[-d \<dev\>\] \[\<opts\>\]\
options:\
-o \<output\> ouput channel: 1..4 (default 1)\
-c \<count\> default is 0 and means forever\
-m \<mode\> \"pulse\" (default), \"delay\", \"disable\"\
-r \<reltime\> relative time, e.g. \"10m+20u\" -~~ use m,u,n,p and
add/sub\
~~D \<date\> absolute time, \<secs\>:\<nano\>\
-T \<period\> period, e.g. \"50m-20n\" -~~ use m,u,n,p and add/sub\
-w \<width\> like period; defaults to 50% period\
-t wait for trigger before exiting\
-p pulse per seconds (sets -D -T -w)\
-1 10MHz (sets -D -T -w)\
-v verbose (report action)\
By default, the tool generates a continuous train of pulses (10 Hz
frequency) on a given output.\
\[root\@sbnd-daq27 tools\]\#\
\[r

\[root\@sbnd-daq27 tools\]\# ./fmc-fdelay-pulse ~~o 1 -p -c 0\
Channel 1: pulse generator mode\
start at: 1491397445:000,000,000,000 ps\
pulse width: 0:010,000,000,000 ps\
repeat: infinite\
period: 1:000,000,000,000 ps\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\# ./fmc-fdelay-pulse -o 1 -p -c 0\
Channel 1: pulse generator mode\
start at: 1491397445:000,000,000,000 ps\
pulse width: 0:010,000,000,000 ps\
repeat: infinite\
period: 1:000,000,000,000 ps\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\# ./fmc-fdelay-pulse -o 2 -p -c 0\
Channel 2: pulse generator mode\
start at: 1491397459:000,000,000,000 ps\
pulse width: 0:010,000,000,000 ps\
repeat: infinite\
period: 1:000,000,000,000 ps\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\# ./fmc-fdelay-status\
Channel 1: pulse generator mode (triggered)\
start at: 1491397445:000,000,000,000 ps\
pulse width: 0:010,000,000,000 ps\
repeat: infinite\
period: 1:000,000,000,000 ps\
Channel 2: pulse generator mode (triggered)\
start at: 1491397459:000,000,000,000 ps\
pulse width: 0:010,000,000,000 ps\
repeat: infinite\
period: 1:000,000,000,000 ps\
Channel 3: disabled\
Channel 4: disabled\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\# ./fmc-fdelay-status\
Channel 1: disabled\
Channel 2: disabled\
Channel 3: disabled\
Channel 4: disabled\
\[root\@sbnd-daq27 tools\]\# ./fmc-fdelay-pulse -h\
./fmc-fdelay-pulse: Use \"./fmc-fdelay-pulse \[-V\] \[-i \<index\>\]
\[-d \<dev\>\] \[\<opts\>\]\
options:\
-o \<output\> ouput channel: 1..4 (default 1)\
-c \<count\> default is 0 and means forever\
-m \<mode\> \"pulse\" (default), \"delay\", \"disable\"\
-r \<reltime\> relative time, e.g. \"10m+20u\" -~~ use m,u,n,p and
add/sub\
~~D \<date\> absolute time, \<secs\>:\<nano\>\
-T \<period\> period, e.g. \"50m-20n\" -~~ use m,u,n,p and add/sub\
-w \<width\> like period; defaults to 50% period\
-t wait for trigger before exiting\
-p pulse per seconds (sets -D -T -w)\
-1 10MHz (sets -D -T -w)\
-v verbose (report action)\
By default, the tool generates a continuous train of pulses (10 Hz
frequency) on a given output.\
\[root\@sbnd-daq27 tools\]\#\
\[r

\[root\@sbnd-daq27 tools\]\# ./fmc-fdelay-pulse -o 1 -p -c 0\
Channel 1: pulse generator mode\
start at: 1491397445:000,000,000,000 ps\
pulse width: 0:010,000,000,000 ps\
repeat: infinite\
period: 1:000,000,000,000 ps\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\# ./fmc-fdelay-pulse -o 2 -p -c 0\
Channel 2: pulse generator mode\
start at: 1491397459:000,000,000,000 ps\
pulse width: 0:010,000,000,000 ps\
repeat: infinite\
period: 1:000,000,000,000 ps\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\# ./fmc-fdelay-status\
Channel 1: pulse generator mode (triggered)\
start at: 1491397445:000,000,000,000 ps\
pulse width: 0:010,000,000,000 ps\
repeat: infinite\
period: 1:000,000,000,000 ps\
Channel 2: pulse generator mode (triggered)\
start at: 1491397459:000,000,000,000 ps\
pulse width: 0:010,000,000,000 ps\
repeat: infinite\
period: 1:000,000,000,000 ps\
Channel 3: disabled\
Channel 4: disabled\
\[root\@sbnd-daq27 tools\]\#\
\[root\@sbnd-daq27 tools\]\#
:::

Files (0)

::: {style="display: none;"}
::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](SPEC_Fine-Delay.pdf){.pdf}
[HTML](SPEC_Fine-Delay.html){.html}
[TXT](SPEC_Fine-Delay.txt){.txt}

::: {style="clear:both;"}
:::
:::
:::
:::

::: 
Loading\...
:::

::: 
:::

::: 
::: {.bgl}
::: {.bgr}
Powered by [Redmine](https://www.redmine.org/) © 2006-2019 Jean-Philippe
Lang
:::
:::
:::
:::
:::
