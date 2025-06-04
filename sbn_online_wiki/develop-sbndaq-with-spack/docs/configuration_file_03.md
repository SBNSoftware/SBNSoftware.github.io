# Configuration Guide for **newSPACKDevArea.sh**

This document explains the configuration options available in the `newSPACKDevArea.env` file, which is used to set up Spack-based SBNDAQ development environments.

## Basic Configuration

| Option | Description |
|--------|-------------|
| `DEVNAME` | The developer's initials or short name (4-5 chars, all **UPPER** case) who owns this development environment. Example: `DEVNAME=ALICE` |

## SBNDAQ Suite Configuration

| Option | Description |
|--------|-------------|
| `DAQ_PKG_NAME` | The name of the DAQ software suite package (`sbndaq-suite` or `artdaq-suite`). Example: `DAQ_PKG_NAME=sbndaq-suite` |
| `DAQ_PKG_VERSIONS` | Specifies the versions of the DAQ software suite to be used. Format: `version:qualifier:compiler:standard`. Multiple versions can be specified with a comma separator. Example: `migration_artdaqv3_13_02:s132:gcc13.1.0:c++20` |
| `DAQ_PKG_SBNENV` | Specifies the SBN environment. Examples: `DAQ_PKG_SBNENV=sbn-fd` or `DAQ_PKG_SBNENV=sbn-nd` |
| `DAQ_PKG_CHECKOUT_PACKAGES` | Lists packages to be checked out from github, with their respective branches. Format: `package@branch`. Multiple packages can be specified with commas. Example: `sbndaq@upgrade_gcc13.1.0,sbndaq-artdaq@upgrade_gcc13.1.0` |

## Spack Configuration

| Option | Description |
|--------|-------------|
| `SPACK_SOFTWARE_BASE` | Base directory for all Spack-related software. Example: `/daq/software` |
| `SPACK_DIR` | Location of the Spack installation. Usually defined as `${SPACK_SOFTWARE_BASE}/spack_packages/spack` |
| `SPACK_VERSION` | Version of Spack being used. Example: `v1.0.1.sbnd` |
| `SPACK_MIRROR_BASE` | Location of Spack binary package mirrors. Usually defined as `${SPACK_SOFTWARE_BASE}/spack_mirrors/${DAQ_PKG_NAME}` |
| `SPACK_DAQ_AREAS` | Directory where SBNDAQ development areas will be created. Example: `${HOME}/DAQ_SPACK_DevAreas` |
| `SPACK_PACKAGES_TOP` | Top-level directory for installed Spack packages. Example: `${SPACK_SOFTWARE_BASE}/spack_packages` |
| `SPACK_USE_USER_CONFIG` | Enables the use of user-specific Spack configuration. Set to `true` or `false` |

## Build Options

| Option | Description |
|--------|-------------|
| `RUN_BUILD` | Enables the automatic build process when setting up the environment. Set to `true` or `false` |
| `BUILD_THREADS` | Number of parallel build threads to use. Example: `8` |
| `DEBUG_BUILD` | Enables or disables debug information in the build. Set to `true` or `false` |
| `ENABLE_TESTS` | Enables or disables building and running tests. Set to `true` or `false` |
| `ENABLE_GIT_PUSH` | Allows changes to be pushed back to the git repositories. Set to `true` or `false` |

## Access Control

| Option | Description |
|--------|-------------|
| `ALLOW_HOSTS` | Restricts execution to specific host machines. Multiple hosts can be specified with commas. Example: `vm-60,vm-51` |
| `ALLOW_USERS` | Restricts execution to specific users. Multiple users can be specified with commas. Example: `artdaq,icarus,sbnd` |

## Example Configuration

```bash
DEVNAME=ALICE
# DAQ suite configuration
DAQ_PKG_NAME=sbndaq-suite
DAQ_PKG_VERSIONS=migration_artdaqv3_13_02:s132:gcc13.1.0:c++20,migration_artdaqv3_13_02:s131:gcc13.1.0:c++20
DAQ_PKG_SBNENV=sbn-fd,sbn-nd
DAQ_PKG_CHECKOUT_PACKAGES=sbndaq@upgrade_gcc13.1.0,sbndaq-artdaq@upgrade_gcc13.1.0,sbndaq-artdaq-core@upgrade_gcc13.1.0

# Spack configuration
SPACK_SOFTWARE_BASE=/daq/software
SPACK_DIR=${SPACK_SOFTWARE_BASE}/spack_packages/spack
SPACK_VERSION=v1.0.1.sbnd
SPACK_MIRROR_BASE=${SPACK_SOFTWARE_BASE}/spack_mirrors/${DAQ_PKG_NAME}
SPACK_DAQ_AREAS=${HOME}/DAQ_SPACK_DevAreas
SPACK_PACKAGES_TOP=${SPACK_SOFTWARE_BASE}/spack_packages
SPACK_USE_USER_CONFIG=true

# Build options
RUN_BUILD=true
BUILD_THREADS=8
DEBUG_BUILD=false
ENABLE_TESTS=false
ENABLE_GIT_PUSH=true
ALLOW_HOSTS=vm-60,vm-51
ALLOW_USERS=artdaq,icarus,sbnd
```
