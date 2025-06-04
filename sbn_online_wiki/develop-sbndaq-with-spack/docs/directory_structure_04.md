## Spack project directory structure

The SBNDDAQ project structure is designed to accommodate two OS variants (AL9/SL7), a use case not fully supported by single-OS Spack environments. Key directories are shared outside environment directories, requiring the specific Spack-activation approach.

The structure follows the [SBNDAQ](https://sbnsoftware.github.io/sbn_online_wiki/sbndaq_Wiki) development workflow using [Spack](https://spack.readthedocs.io/en/latest/index.html):

**Core Environment**: The `./almalinux9-gcc13.1.0-c++20-s132` directory contains the [Spack environment](https://spack.readthedocs.io/en/latest/environments.html) configuration files (`spack.yaml`, `spack.lock`) targeting AlmaLinux 9 with GCC 13.1.0 and the C++20 standard.

**Configuration Management**: The `./spack` directory contains a custom repository (`./spack-repos/mpd`) for developing SBNDAQ using [MPD](https://github.com/FNALssi/spack-mpd).

**Development Sources**: The `./srcs` directory contains sources of SBNDAQ packages (`sbndaq`, `sbndaq-artdaq`, `sbndaq-artdaq-core`, `wibtools`), all on the `feature/upgrade_gcc13.1.0` branch, enabling simultaneous development across the entire SBNDAQ software stack.

**Build Infrastructure**: The setup installed 170 packages, creating binary caches in `./spack_mirrors` for faster rebuilds and `./spack_packages` for installations with placeholder paths to handle long directory names.

**Integration**: The `./DAQInterface` symlink provides direct access to the SBNDAQ RunControl startup scripts, while the `.pkgs.txt` files document the complete Spack dependency tree.

### Example of the project structure that supports two OSes

```bash
─────────────────────────────────────────────────────────────────────────────────────────
$ pwd
${HOME}/DAQ_SPACK_DevAreas/DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02

$ exa --tree --level 2
├── almalinux9-gcc13.1.0-c++20-s132
│  ├── spack.lock
│  └── spack.yaml
├── scientific7-gcc13.1.0-c++20-s132
│  ├── spack.lock
│  └── spack.yaml
├── DAQInterface -> ./srcs/sbndaq/sbn-fd/DAQInterface2
├── sbndaq-suite-migration_artdaqv3_13_02-almalinux9-gcc13.1.0-c++20-s132.pkgs.txt
├── sbndaq-suite-migration_artdaqv3_13_02-scientific7-gcc13.1.0-c++20-s132.pkgs.txt
├── spack
│  ├── config.yaml
│  ├── linux
│  └── repos.yaml
├── spack-repos
│  └── mpd
├── spack_mirrors
│  └── sbndaq-suite
├── spack_packages
│  ├── __spack_path_placeholder__
│  └── bin
└── srcs
   ├── sbndaq
   ├── sbndaq-artdaq
   ├── sbndaq-artdaq-core
   └── wibtools
─────────────────────────────────────────────────────────────────────────────────────────
```
