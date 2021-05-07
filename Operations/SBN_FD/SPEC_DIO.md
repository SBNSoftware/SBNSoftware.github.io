

# SPEC DIO a) download the software from sbnd repository

git clone ssh://<p-sbnddaq@cdcvs.fnal.gov>/cvs/projects/sbnddaq-readout

b\) move to the working directory

    cd sbnddaq-readout/projects/wr/

    Build the software
       make
       make install

PS: Spec board must be installed into computer to allow the \" Make\"
and \"Make Install\" to succeed.\
\"make install\" must be run as **root**

c\) load kernels

ksu\
modprobe spec\
modprobe wr_nic gateware=fmc/wr_nic_dio.bin-2014-02-14

d\) dmesg (to check that there are no errors):

\[173965.698869\] spec 0000:0c:00.0: probe for device 000c:0000\
\[173965.700311\] spec 0000:0c:00.0: got file \"fmc/spec-init.bin\",
1484404 (0x16a674) bytes\
\[173965.891832\] spec 0000:0c:00.0: FPGA programming successful\
\[173966.239083\] spec 0000:0c:00.0: mezzanine 0\
\[173966.239086\] Manufacturer: CERN\
\[173966.239087\] Product name: FmcDio5cha\
\[174221.361926\] spec 0000:0c:00.0: reprogramming with
fmc/wr_nic_dio.bin-2014-02-14\
\[174221.554328\] spec 0000:0c:00.0: FPGA programming successful\
\[174221.554814\] spec 0000:0c:00.0: Gateware successfully loaded\
\[174221.765320\] wr_nic wr_nic.0: White Rabbit NIC driver

NOW WE CAN TRY RUNNING SOME SIMPLE CODE provided in the
\~fmc-tdc/sw/tools directory
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
[PDF](SPEC_DIO.pdf){.pdf}
[HTML](SPEC_DIO.html){.html}
[TXT](SPEC_DIO.txt){.txt}

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
