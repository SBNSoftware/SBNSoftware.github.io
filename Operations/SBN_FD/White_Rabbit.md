

# White Rabbit

Software written by CERN and Seven Solutions has been downloaded\
and packaged for our convenience in the sbnddaq repository at:

    sbnddaq-readout/projects/wr/

With the device driver and applications in the

    wr-starting-kit

directory. The device driver and applications can be compiled and\
installed from the **wr** directory:

    cd sbnddaq-readout/projects/wr/
    make
    ksu
    make install

Access to the root account is necessary for the installation. The
process\
also creates and rpm file that can be used for installation on other
Linux machines with\
the same kernel installed. A file **spec** is installed in the\
/etc/init.d directory so that the spec and wr-nic device drivers are\
installed automatically at boot time. The drivers can be activated\
or deäctivated via the standard RedHat procedures:

    /sbin/service spec status
    /sbin/service spec start
    /sbin/service spec stop

The start and stop commands require root access. Note that kernel
upgrades\
usually require a rebuild and reïnstall of the device drivers.

A number of executables are installed in the /usr/bin area with their
\"stick bit\"\
set so that one not need to log in as root to run them:

    spec-cl
    spec-fwloader
    spec-vuart
    specmem
    wr-dio-cmd
    wr-dio-pps
    wr-dio-agent
    wr-dio-ruler
    stamp-frame

The attached file outlines the procedure that was used to create the
Makefile and\
spec.spec files.
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
[PDF](White_Rabbit.pdf){.pdf}
[HTML](White_Rabbit.html){.html}
[TXT](White_Rabbit.txt){.txt}

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
