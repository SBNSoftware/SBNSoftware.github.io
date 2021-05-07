

# SPEC TDC h1. SPEC TDC

The SPEC TDC card is mounted on a FMC card in the bach of
sbnd-daq24.fnal.gov

See the FMC TDC User\'s Manual for details on gettin/compiling TDC
software and testing\
( \~sbnddaq/Documents/fmc-tdc.pdf )

a\) get the TDC sotware from the CERN ohwr.org repository

    git clone git://ohwr.org/fmc-projects/fmc-tdc/fmc-tdc-sw.git
       cd fmc-tdc-sw
       git submodule update --init    (to get all dependencies, ZIO and fmc-bus )

a1) download the gateware binary files from the latest release

<http://www.ohwr.org/projects/fmc-tdc-1ns-5cha-gw/wiki/Spec_tdc_release_7_0>

wr_spec_tdc_17012017_rc2.bin

NOTE: unfortunately this file DID NOT WORK\
so we contacted the CERN experts and they sent us the latest gateware
file

~~rw-r\--r-~~ 1 torretta sbnd 1486616 Mar 8 09:15
wr_spec_tdc_08032017.bin

AND THIS IS THE ONE THAT NEEDS TO BE LOADED INTO THE KERNEL

    2) this   .bin file needs to be copied to /lib/firmware/fmc

~~bash-4.2\$ ls -l /lib/firmware/fmc\
total 7340\
lrwxrwxrwx 1 root root 28 Feb 21 12:20 spec-fmc-tdc.bin -\>
wr_spec_tdc_17012017_rc2.bin\
-rw-r\--r-~~ 1 root root 1484404 Feb 20 15:27 spec-init.bin\
lrwxrwxrwx 1 root root 25 Feb 20 17:23 wr_nic_dio.bin ~~\>
wr_nic_dio.bin-2014-02-14\
-rw-r\--r-~~ 1 root root 1484960 Feb 20 17:22 wr_nic_dio.bin-2014-02-14\
lrwxrwxrwx 1 root root 29 Feb 20 17:23 wr_nic_dio-wrc.bin ~~\>
wr_nic_dio-wrc.bin-2014-02-14\
-rw-r\--r-~~ 1 root root 78060 Feb 20 17:22
wr_nic_dio-wrc.bin-2014-02-14\
~~rw-r\--r-~~ 1 torretta sbnd 1486616 Mar 8 09:15
wr_spec_tdc_08032017.bin\
~~rw-r\--r-~~ 1 root root 1486064 Jan 24 12:20
wr_spec_tdc_17012017_rc2.bin\
~~rw-r\--r-~~ 1 root root 1485788 Jan 11 12:51
wr_spec_tdc_release_6\_0.bin\
-bash-4.2\$

b\) compile/make TDC code\
cd \~fmc-tdc-sw\
ksu\
make prereq_install\
make install

c\) load kernels

    ksu
       modprobe spec
       modprobe -v fmc-tdc gateware=fmc/wr_spec_tdc_08032017.bin

d\) dmesg (to check that there are no errors):

\[163615.673603\] spec 0000:0c:00.0: remove\
\[163647.533101\] zio-core had been loaded\
\[163656.700449\] spec 0000:0c:00.0: probe for device 000c:0000\
\[163656.701543\] spec 0000:0c:00.0: got file \"fmc/spec-init.bin\",
1484404 (0x16a674) bytes\
\[163656.893050\] spec 0000:0c:00.0: FPGA programming successful\
\[163657.241446\] spec 0000:0c:00.0: mezzanine 0\
\[163657.241452\] Manufacturer: CERN\
\[163657.241453\] Product name: FmcTdc1ns5cha\
\[163709.941293\] in ft_init\
\[163709.941314\] successful ft_zio_register\
\[163709.941323\] called ft_probe\
\[163709.941328\] spec 0000:0c:00.0: Gateware ()\
\[163709.941331\] spec 0000:0c:00.0: reprogramming with
fmc/wr_spec_tdc_08032017.bin\
\[ spec 0000:0c:00.0: FPGA programming successful\
\[163710.134276\] fmc_tdc FmcTdc1ns5cha-0c00: Gateware successfully
loaded\
\[163710.134278\] fmc_tdc FmcTdc1ns5cha-0c00: Un-resetting FMCs\...\
\[163710.139824\] fmc_tdc FmcTdc1ns5cha-0c00: Base addrs: core 0x42000,
irq 0x43000, 1wire 0x41000, buffer/DMA 0x45000\
\[163710.139829\] fmc_tdc FmcTdc1ns5cha-0c00: calib:
zero_offset^[0]^ = 0 ps\
\[163710.139831\] fmc_tdc FmcTdc1ns5cha-0c00: calib:
zero_offset^[1]^ = 86 ps\
\[163710.139833\] fmc_tdc FmcTdc1ns5cha-0c00: calib:
zero_offset^[2]^ = 481 ps\
\[163710.139834\] fmc_tdc FmcTdc1ns5cha-0c00: calib:
zero_offset^[3]^ = 449 ps\
\[163710.139836\] fmc_tdc FmcTdc1ns5cha-0c00: calib:
zero_offset^[4]^ = 329 ps\
\[163710.139838\] fmc_tdc FmcTdc1ns5cha-0c00: calib: vcxo_default_tune
45175\
\[163710.139840\] fmc_tdc FmcTdc1ns5cha-0c00: calib: wr offset = 291305
ps\
\[163710.139842\] fmc_tdc FmcTdc1ns5cha-0c00: ft_acam_init: initializing
ACAM TDC\...\
\[163710.140246\] fmc_tdc FmcTdc1ns5cha-0c00: ft_acam_init: ACAM
initialization OK.\
\[163710.146098\] fmc_tdc FmcTdc1ns5cha-0c00: ft_onewire_init: Found
DS18xx sensor:\
\[163710.146099\] 28:86:33:12:06:00:00:62\
\[163710.907964\] fmc_tdc FmcTdc1ns5cha-0c00: ft_read_temp: Temperature
0x302 (12 bits: 48.125)\
\[163710.910020\] fmc_tdc FmcTdc1ns5cha-0c00: Setting TAI time to 0:0\
\[163710.910919\] tdc-1n5c tdc-1n5c-0c00: device loaded\
\[163710.910924\] spec 0000:0c:00.0: Found VIC @ 0x30000\
\[163710.911016\] successful ft_driver_register\
NOW WE CAN TRY RUNNING SOME SIMPLE CODE provided in the
\~fmc-tdc/sw/tools directory

e\) cd \~fmc-tdc-sw/tools

\[root\@sbnd-daq24 tools\]\# ./fmc-tdc-list\
Found 1 board(s):\
0c00, /dev/zio/tdc-1n5c-0c00, /sys/bus/zio/devices/tdc-1n5c-0c00\
fmctdc_exit: device /dev/zio/tdc-1n5c-0c00 was still open\
\[root\@sbnd-daq24 tools\]\#

\[root\@sbnd-daq24 tools\]\#\
\[root\@sbnd-daq24 tools\]\# ./fmc-tdc-temperature 0c00\
48.2 deg C\
\[root\@sbnd-daq24 tools\]\#

TO INITIALIZE THE CONNECTION TO THE WR YOu need to run the
\~fm-tdc-sw/spec-sw/spec-vusrt.sh code

d\) run the spec-vuart.sh code

    need to find out the WR-Periph-UART and its offset :

\[root\@sbnd-daq24 tools\]\# cat
/sys/kernel/debug/FmcTdc1ns5cha-0c00/dump_sdb\
FMC: 0000:0c:00.0 (SPEC), slot 0, device FmcTdc1ns5cha-0c00\
00000651:e6a542c9 WB4-Crossbar-GSI\
0000ce42:00000603 WB-SPEC.CSR (00020000-0002001f)\
0000ce42:00000013 WB-VIC-Int.Control (00030000-000300ff)\
00000651:eef0b198 WB4-Bridge-GSI (bridge: 00040000)\
00000651:e6a542c9 WB4-Crossbar-GSI\
0000ce42:00000602 WB-Onewire.Control (00041000-00041007)\
0000ce42:00000604 WB-TDC-Core-Config (00042000-000420ff)\
0000ce42:00000605 WB-FMC-TDC.EIC (00043000-0004300f)\
0000ce42:00000606 WB-I2C.Control (00044000-0004401f)\
0000ce42:00000622 WB-TDC-TsFIFO (00045000-000450ff)\
0000ce42:00000622 WB-TDC-TsFIFO (00045100-000451ff)\
0000ce42:00000622 WB-TDC-TsFIFO (00045200-000452ff)\
0000ce42:00000622 WB-TDC-TsFIFO (00045300-000453ff)\
0000ce42:00000622 WB-TDC-TsFIFO (00045400-000454ff)\
00000651:eef0b198 WB4-Bridge-GSI (bridge: 00080000)\
00000651:e6a542c9 WB4-Crossbar-GSI\
0000ce42:66cfeb52 WB4-BlockRAM (00080000-00095fff)\
00000651:eef0b198 WB4-Bridge-GSI (bridge: 000a0000)\
00000651:e6a542c9 WB4-Crossbar-GSI\
0000ce42:ab28633a WR-Mini-NIC (000a0000-000a00ff)\
0000ce42:650c2d4f WR-Endpoint (000a0100-000a01ff)\
0000ce42:65158dc0 WR-Soft-PLL (000a0200-000a02ff)\
0000ce42:de0d8ced WR-PPS-Generator (000a0300-000a03ff)\
0000ce42:ff07fc47 WR-Periph-Syscon (000a0400-000a04ff)\
0000ce42:e2d13d04 WR-Periph-UART (000a0500-000a05ff)\
0000ce42:779c5443 WR-Periph-1Wire (000a0600-000a06ff)\
0000ce42:779c5445 WR-Periph-AuxWB (000a0700-000a07ff)\
Synthesis repository: <http://svn.ohwr.org/fmc-tdc>\
Bitstream \'wr_spec_tdc\' synthesized 20150522 by twlostow (ISE version
147), commit 57aca088aefb\
\[root\@sbnd-daq24 tools\]\#\
LOOK at the line:\
0000ce42:e2d13d04 WR-Periph-UART (000a0500-000a05ff)

    the UART offset for the card is a0500

    f) cd ~fmc-tdc-sw/spec-sw/tools

./spec-vuart -u 0xa0500

Instructions in case of reboot of the PC with the TDC (daq24)

cd \~torretta/fmc-tdc-sw/tools

ksu

rmmod spec

rmmod fmc

modprobe spec

modprobe fmc-tdc gateware=fmc/wr_spec_tdc_08032017.bin

    dmesg  (add here dmesg next time)

To reboot type (as root):\
shutdown -r now
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
[PDF](SPEC_TDC.pdf){.pdf}
[HTML](SPEC_TDC.html){.html}
[TXT](SPEC_TDC.txt){.txt}

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
