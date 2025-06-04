## Automated development area setup with **newSPACKDevArea.sh**

The [Spack Development Tutorial](https://sbnsoftware.github.io/sbn_online_wiki/Spack-Development-Tutorial.html) guides you through setting up a development environment using Spack. It is still applicable today and can be used for developing SBNDAQ in a single OS variant for development purposes.

The instructions from the tutorial were used to create an automated script called `newSPACKDevArea.sh`. This script automates the setup of an SBNDAQ development area, supporting both AlmaLinux 9 (AL9) and Scientific Linux 7 (SL7). The script uses Spack software available through the shared installation at `/daq/software/spack_packages/spack/v1.0.1.sbnd`, which helps minimize the need for rebuilding approximately 200 dependent packages, a process that can take up to 8 hours.

The script workflow includes the following steps: it creates a directory structure supporting both operating systems, adds Spack configuration files with overrides for install location and the upstream Spack repository, downloads SBNDAQ source code into the `./srcs` directory, and executes a build and installation process. If the build and installation are successful, it then creates tarballs of each SBNDAQ subproject and copies them into the Spack build cache directory.

The script uses a configuration file named `newSPACKDevArea.env`, which is in the [env](https://github.com/env-lang/env/blob/main/env.md) format. Apart from specifying the directory location where the development area should be created, it includes a list of SBNDAQ packages to be checked out from Git into `./srcs` and build options such as the s-qualifier, GCC version, and C++ standard to use. It's a good practice to review this file prior to running the `newSPACKDevArea.sh` script.

The `newSPACKDevArea.sh` script accepts the following options:

```bash
Options:
    --dev-name NAME       Set developer name for directory naming (default: XYZ)
    --default-version VER Set specific version instead of latest available
    --non-interactive     Run without user prompts (default: false)
    -h, --help            Display this help message and exit
```

Users can also override the name of the development area by setting the `MY_SPACK_PROJECT` environment variable, so the script will use it instead of creating a new one. If the area pointed to by `MY_SPACK_PROJECT` exists, the `newSPACKDevArea.sh` script will not override the configuration files and sources and will proceed to building, installation, and creating Spack build caches.
