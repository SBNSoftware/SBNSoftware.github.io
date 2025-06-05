## Walkthrough Guide for Running **newSPACKDevArea.sh**

This guide will walk you through the automated process of setting up the SBNDAQ development environment in the `${HOME}/DAQ_SPACK_DevAreas` directory using the **newSPACKDevArea.sh** script, located in the `${SPACK_HOME_DIR}/sbndaq-spack-tools` directory.

***Important:*** Ensure the **newSPACKDevArea.sh** script is accessible via the `${PATH}`. Use the `which newSPACKDevArea.sh` command to verify. If it returns `not found`, add `${SPACK_HOME_DIR}/sbndaq-spack-tools` to your `${PATH}` by using: `SPACK_HOME_DIR=/daq/software/spack_packages/spack/v1.0.1.sbnd; export PATH=${SPACK_HOME_DIR}/sbndaq-spack-tools:${PATH}`.

The **newSPACKDevArea.sh** script uses a combination of command line options and the configuration file **newSPACKDevArea.env**. It's crucial to review these options periodically, as they may change.

The location of the configuration file **newSPACKDevArea.env** can vary depending on the user's needs, and the **newSPACKDevArea.sh** script uses the following logic to locate it. It tries the current directory first `./`, then it looks in `${HOME}/DAQ_SPACK_DevAreas`, followed by the user's home directory `~/`, and finally in the same directory where the **newSPACKDevArea.sh** script is located. If the configuration file is not found, a default file will be created in the home directory (`~/newSPACKDevArea.env`). Users can specify a different configuration file using the command line option `--use-config ~/myconfig.env`. If the specified file does not exist, the script will report an error and exit. Alternatively, users can set the `export MY_CONFIG_FILE=~/myconfig.env` environment variable; the `--use-config` option takes precedence over this environment variable.

It is generally recommended to share the `${HOME}/DAQ_SPACK_DevAreas` directory among all developers. Users should leverage the `DEVNAME` variable to identify ownership of the development area. The configuration file **newSPACKDevArea.env** contains the `DEVNAME` variable, representing the developer's initials or a short name (4-5 characters, in **UPPER** case) for identifying the owner of the development environment. Users can override this in the configuration file by providing a command line option `--dev-name ALICE`. Keeping the configuration file updated is advisable for practical reasons.

Another important command line option is `--default-version migration_artdaqv3_13_02`, indicating the version of the `sbndaq-suite` package for the development area setup. This version must be correctly declared in `${SPACK_HOME_DIR}/spack-repos/sbn-spack/packages/sbndaq-suite/package.py` before use. If the `--default-version` option is omitted, the script prompts for `Enter version (default: migration_artdaqv3_13_02):`, allowing the user to accept the default or specify a different version, like `v1_11_00`, provided that it is declared in the mentioned path. The script accepts the default version automatically after a `5-second` timeout, or immediately if the `--non-interactive` option is used.

During execution, the **newSPACKDevArea.sh** script may ask the user the following questions:

***Note*** If the `--non-interactive` option is used, the script will automatically accept the default answers as described below.

1. `Build already succeeded - skip build? (Y/n):` — This appears if the `*.build_lock.txt` file is found from a previous successful build. The default is `Y`, but users can choose to build and install the software again.

2. `Directory DAQ_2025-06-03_ALICE_migration_artdaqv3_13_02 exists. Delete it? [y/N]:` — This appears if a development area already exists, possibly created on another OS variant or re-run after a code change. The default answer is `N`, so the script will continue and create only the missing configuration files for the current OS variant or proceed directly to building and installation.

3. `Do you want to set up the development environment? [Y/n]:` — This arises when the previous question was answered `N`, and the [Spack environment](https://spack.readthedocs.io/en/latest/environments.html) is missing, possibly due to running on a different OS variant, an interrupted build, or another issue. It is generally advisable to proceed here.

Finally, run the **newSPACKDevArea.sh** script and observe the output; it should provide sufficient information if something breaks or goes wrong.

```bash
# Adds newSPACKDevArea.sh to the ${PATH}
command -v newSPACKDevArea.sh > /dev/null 2>&1 || \
{ SPACK_HOME_DIR=/daq/software/spack_packages/spack/v1.0.1.sbnd; export PATH=${SPACK_HOME_DIR}/sbndaq-spack-tools:${PATH}; }

# Points to your configuration file
export MY_CONFIG_FILE=${HOME}/DAQ_SPACK_DevAreas/myconfig-ALICE.env

#newSPACKDevArea.sh --non-interactive
newSPACKDevArea.sh
```

## Operating the SBNDAQ from the Spack Development Environment

Operating the SBNDAQ from the Spack development environment is similar to how it's currently done, and [setup_daqinterface_spackenv.sh](https://github.com/SBNSoftware/sbndaq/blob/feature/upgrade_gcc13.1.0/sbn-fd/DAQInterface2/setup_daqinterface_spackenv.sh) and [setup_sbn_artdaq_spackenv.sh](https://github.com/SBNSoftware/sbndaq/blob/feature/upgrade_gcc13.1.0/sbn-fd/DAQInterface2/setup_sbn_artdaq_spackenv.sh) should be used instead.

## Troubleshooting Build Errors

If the build fails, review the build log files to identify any errors and make the necessary code changes to resolve the issues. Once the issues have been addressed, rerun the newSPACKDevArea.sh script as shown below.

Please note that you will need to export the `MY_SPACK_PROJECT` variable with the following command: `export MY_SPACK_PROJECT=DAQ_2025-06-03_ALICE_migration_artdaqv3_13_02`. This ensures the script does not prompt you to delete the existing directory.

```bash
# Adds newSPACKDevArea.sh to the ${PATH}
command -v newSPACKDevArea.sh > /dev/null 2>&1 || \
{ SPACK_HOME_DIR=/daq/software/spack_packages/spack/v1.0.1.sbnd; export PATH=${SPACK_HOME_DIR}/sbndaq-spack-tools:${PATH}; }

# Points to your configuration file
export MY_CONFIG_FILE=${HOME}/DAQ_SPACK_DevAreas/myconfig-ALICE.env
# Points to your project directory
export MY_SPACK_PROJECT=DAQ_2025-06-03_ALICE_migration_artdaqv3_13_02
#newSPACKDevArea.sh --non-interactive
newSPACKDevArea.sh
```

## Heads Up

The integration of [MPD functionality](https://github.com/FNALssi/spack-mpd) into the build process is currently underway. This enhancement is expected to expedite rebuilding during active development.
