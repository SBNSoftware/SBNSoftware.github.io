---
layout: page
title: How to rsync products from FNAL to your local institution
---



How to rsync products from FNAL to your local institution
======================================================================================================================================

When setting up a remote **sbndaq** development station or test stand,
you need to install a large number of packages. The easiest way to do
this is the **rsync** command from FNAL to your local disk:

    rsync -arvtzl --del -e 'ssh -o "ProxyCommand ssh -A aaduszki@icarusgpvm01.fnal.gov -W %h:%p"' \
      aaduszki@sbnd-daq32.fnal.gov:/software/products/ /software/products/.  --delete-excluded \
      --exclude 'Xilinx*' --exclude 'Quartus'  --exclude="*.tar.bz2" --exclude "products/" 

Replace **aaduszki** with the appropriate user name, and
**icarusgpvm01.fnal.gov** with your own local node.
