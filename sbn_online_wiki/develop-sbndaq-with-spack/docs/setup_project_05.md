## Follow these steps to activate (setup) your SBNDAQ project area.

The SBNDDAQ project structure is designed to accommodate two OS variants (AL9/SL7), a use case not fully supported by single-OS Spack environments. Key directories are shared outside environment directories, requiring this specific activation approach.

The bash script below sets up the environment necessary for activating a specific Spack project related to your SBNDAQ work. It begins by setting and exporting the name of the Spack project you wish to use and designates your development area within the home directory. It then sources a specified Spack setup script, temporarily disables local Spack configuration, and sets a user configuration path. Finally, it navigates to the designated OS-specific development directory and activates the Spack environment located there.

### Example of Bash commands to activate the OS-specific environment

```bash
─────────────────────────────────────────────────────────────────────────────────────────
export MY_SPACK_PROJECT=DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02

## Activate your Spack project area
export MY_SPACK_DEV_AREA=${HOME}/DAQ_SPACK_DevAreas/${MY_SPACK_PROJECT}
export SPACK_DISABLE_LOCAL_CONFIG=true
source /daq/software/spack_packages/spack/v1.0.1.sbnd/setup-env.sh
unset SPACK_DISABLE_LOCAL_CONFIG
export SPACK_USER_CONFIG_PATH=${MY_SPACK_DEV_AREA}/spack
cd ${MY_SPACK_DEV_AREA}/$(spack arch -o)-gcc13.1.0-c++20-s132
spack env activate --prompt .
─────────────────────────────────────────────────────────────────────────────────────────
```
