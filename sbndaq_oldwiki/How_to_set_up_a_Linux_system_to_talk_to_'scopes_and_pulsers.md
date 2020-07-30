---
layout: page
title: 'How to set up a Linux system to talk to \''scopes and pulsers'
---



How to set up a Linux system to talk to \'scopes and pulsers
==========================================================================================================================================



The New Way
==========================================

-   Service desk ticket for SLAM group to enable NI repo on the computer

-   Turn on dkms
    -   `systemctl dkms enable`
    -   `systemctl dkms start`

-   Install NI packages
    -   `touch /tmp/smap_install_ni_anyway`
    -   `yum install ni-daqmx --nogpgcheck`
    -   `yum install ni-visa --nogpgcheck`

-   Start nipal module
    -   `service nipal start`

-   Install pyvisa
    -   `pip install -U pyvisa`

-   Test\

        >>> import pyvisa
        >>> rm = pyvisa.ResourceManager()
        >>> print(rm.list_resources())



The Old Way
==========================================

[NB: Suspect a missing step here]{style="color:red;"}

1.  Ask SLAM to add the National Instruments Linux yum repositories to
    the system

2.  Look for the device drivers file **NIKAL175.iso** on National
    Instruments site
    \[\[<http://www.ni.com/download/ni-kal-17.5.1/7685/en/>\]\]

3.  This is a disk image file for some unknown reason. To unpack as
    root:\

        mkdir /mnt/nikal175 
        mount -t iso9660 -o loop NIKAL175.iso /mnt/nikal175

4.  Run the **INSTALL** script in /mnt/nikal175, you may need to copy
    the files to a writeable area

5.  Run the commands to verify device driver installation:\

        [root@icarus-vst02 badgett]# lsmod | grep ni
        nipxirmk              304763  0 
        nimru2k               772286  1 
        nimxdfk               592969  2 nimru2k
        nimdbgk               469751  4 nipxirmk,nimru2k,nimxdfk
        nidimk                381139  3 nipxirmk,nimru2k
        niorbk                125271  5 nipxirmk,nimdbgk,nimru2k,nimxdfk,nidimk
        nipalk               1253264  9 nipxirmk,NiViPciK,nimdbgk,nimru2k,nimxdfk,nidimk,niorbk
        nismbus               237357  0 
        nikal                 117166  8 nipxirmk,nimdbgk,nimru2k,nimxdfk,nismbus,nidimk,nipalk,niorbk
        ghash_clmulni_intel    13273  0 
        aesni_intel           189456  1 
        lrw                    13286  1 aesni_intel
        glue_helper            13990  1 aesni_intel
        ablk_helper            13597  1 aesni_intel
        cryptd                 21190  3 ghash_clmulni_intel,aesni_intel,ablk_helper

1.  The first ten entries look good.

2.  Go to NI for install instructions here
    \[\[<http://www.ni.com/product-documentation/54754/en/>\]\]

3.  Go to
    \[\[<http://www.ni.com/en-us/support/downloads/drivers/download.ni-linux-device-drivers.html>\]\]
    for downloads

4.  Download the file marked as **RHEL7/CentOS7 RPM**

5.  Install the RPM file as root:\

        rpm -i ni-software-2019-19.2.0.49152-0+f0.el7.noarch.rpm

6.  Install the remaining software here:\

        yum install ni-daqmx --nogpgcheck
        yum install ni-visa --nogpgcheck

7.  You can now run their commands

8.  For simpler access to devices, install PyVISA package:
    \[\[<https://pypi.org/project/PyVISA-py/>\]\]
