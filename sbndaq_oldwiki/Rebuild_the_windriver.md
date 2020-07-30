---
lang: en
title: Rebuild the windriver
---

[]{#Instructions-for-rebuilding-the-windriver-package-into-UPS}

Instructions for rebuilding the windriver package into UPS.[¶](#Instructions-for-rebuilding-the-windriver-package-into-UPS){.wiki-anchor}
=========================================================================================================================================

1\. ssh -X sbn-daq01.fnal.gov -l artdaq and run the xterm.\
2. Download the windriver installation package from
<https://www.jungo.com/st/products/windriver/> or copy
WD1260LNX86_64.tar from <artdaq@sbn-daq01.fnal.gov>:/home/nfs/artdaq and
unpack it into an empty directory (wdtest).\
3. Change directory to the directory where the windriver installation
was unpacked.\
4. export WD_BASEDIR=\$HOME/wdtest/WinDriver\
5. Start windriver wizard with \$(find ./ -name wdwizard -type f)\
6. In the wizard tool choose "New host driver project."\
7. Add NEVIS PCIe device to your project by clicking on the Altera
device ID:0x0004 in the presented device list.\
8. Find the wizard icon (wand w/ star) in the toolbar of DriverWizard
and click on it; and then select the "Linux Makefile" option in the Code
Generation Options dialog; leave additional options unchecked and click
on the "OK".\
9. Save your project into the directory where the windriver installation
was unpacked (\$HOME/wdtest). You will need to change the directory in
the wizard. For the project name use "nevispci"; read the message and
then click on the "OK". Exit the windriver wizard tool.\
10. cd \$HOME/wdtest/nevispci/nevispci_installation/redist; run
./configure and then make, which builds the linux kernel module that
should be installed with the wdreg utility.\
11. As an alternate solution the linux kernel module can be built and
installed from the default source located in \$WD_BASEDIR/redist.
\$HOME/wdtest/nevispci/nevispci_installation/redist/\*/nevispci.ko is
likely equivalent to \$WD_BASEDIR/redist/\*/windrvr1260.ko

12\. cd \$HOME/wdtest/nevispci/linux and run make, which creates a test
program called nevispci.\
13. Run nevispci and confirm that its output lists a device with the
vendor id 0x1172; exit it.\
14. Edit makefile in \$HOME/wdtest/nevispci/linux

> a\. add "-fPIC" to CFLAGS;\
> b. add "-fPIC -shared" to LFLAGS;\
> c. change target to libnevispci.so\
> d. save file

15\. Edit nevispci_diag.c in \$HOME/wdtest/nevispci

> a\. Rename the function called main to main_not_used\
> b. save file

16\. Confirm that nevispci_lib.c has the correct license key with the
following command "grep WD1260 nevispci_lib.c"\
17. Rebuild the shared library by running "make clean; make";\
18. cd into the local_product_installation/windriver directory.\
19. export MYWDVER=v12_06_00a, where v12_06_00a is the new UPS product.\
20. mkdir -p
\$MYWDVER/{include{,/samples/shared},source,slf7.x86_64.debug/{lib,bin},ups}\
21. cp -r \$WD_BASEDIR/include \$MYWDVER/\
22. cp -r \$WD_BASEDIR/samples/shared \$MYWDVER/include\
23. cp -r \$WD_BASEDIR{,/../nevispci} \$MYWDVER/source/\
24. cp \$(find \$WD_BASEDIR/../nevispci -name libwdapi\*.so)
\$MYWDVER/slf7.x86_64.debug/lib/\
25. cp \$( find \$WD_BASEDIR/../nevispci -name libnevispci.so)
\$MYWDVER/slf7.x86_64.debug/lib/\
26. cp \$( find \$WD_BASEDIR/../nevispci -name wdreg)
\$MYWDVER/slf7.x86_64.debug/bin/\
27. Copy the table file from
<https://cdcvs.fnal.gov/redmine/attachments/48137/windriver.table> to
\$MYWDVER/ups/ and update the version in it. See below.\
28. Copy the Linux64bit+3.10-2.17\_ file from
<https://cdcvs.fnal.gov/redmine/attachments/48138/Linux64bit+3.10-2.17_>
into the products/windriver/v12_06_00.version directory and update the
version in it. See attached files below.

    -bash-4.2$ . /daq/software/products/setup
    -bash-4.2$ ups list -aK+ windriver
    "windriver" "v12_06_00" "Linux64bit+3.10-2.17" "debug" "" 
    "windriver" "v12_06_00" "Linux64bit+3.10-2.17" "prof" "" 

    -bash-4.2$ cd /daq/software/products/windriver/
    -bash-4.2$ ls -al
    total 20
    drwxr-sr-x  8 artdaq P-1052   200 Apr 26 14:37 .
    drwxr-sr-x 82 artdaq P-1052 12288 Apr 25 15:03 ..
    -rwxr-xr-x  1 artdaq P-1052  2294 Apr 26 10:39 configureOnBoot-windriver.sh
    drwxr-sr-x  7 artdaq P-1052   119 Apr 16 16:37 v12_06_00
    drwxr-sr-x  2 artdaq P-1052    73 Apr 16 16:45 v12_06_00.version
    -bash-4.2$ echo $PRODUCTS
    /daq/software/products

29\. Ask the SLAM group to add the lines below to /etc/rc.local on all
DAQ servers with Nevis PCIe cards.\

    #install windriver
    /daq/software/products/windriver/configureOnBoot-windriver.sh

\
30. Finally, edit
/daq/software/products/windriver/configureOnBoot-windriver.sh and add
all DAQ servers to the list at the top.\

    install_windriver1260="\
    sbn-daq01 \
    sbn-daq02 \
    sbn-daq03" 
