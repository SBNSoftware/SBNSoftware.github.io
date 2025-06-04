## This is the sample of the build log output produced by the [newSPACKDevArea.sh](https://github.com/SBNSoftware/spack-top/tree/main/sbndaq-spack-tools) script.

This log outlines setting up an SBNDAQ development environment using Spack. It details sourcing scripts, configuring packages, downloading sources, building and installing them, and pushing binaries to build caches for effective software management and deployment.

```
[DEBUG] Sourced logging-functions.sh
[DEBUG] Sourced signal-functions.sh
[DEBUG] Sourced ossupport-functions.sh
[DEBUG] Sourced common-functions.sh
[DEBUG] Sourced common-functions.sh
[DEBUG] Sourced config-functions.sh
[DEBUG] Sourced env-functions.sh
[DEBUG] Sourced pkg-functions.sh
[DEBUG] Sourced spack-unified.sh
[DEBUG] Setting up signal handlers
[DEBUG] Using existing configuration file: newSPACKDevArea.env
[INFO] Loading configuration from newSPACKDevArea.env
[DEBUG] Using version from DAQ_PKG_VERSIONS: migration_artdaqv3_13_02
[DEBUG] Parsed values: VERSION=migration_artdaqv3_13_02, QUALIFIERS=s=132 cxxstd=20, GCC_VERSION=13.1.0
[DEBUG] Setting up Spack environment with GCC 13.1.0
[DEBUG] Spack environment configured:
[DEBUG]   SPACK_HOME_DIR: /daq/software/spack_packages/spack/v1.0.1.sbnd
[DEBUG]   SPACK_DISTRO_NAME: almalinux9
[DEBUG]   SPACK_ARCH: linux-almalinux9-x86_64_v2
[DEBUG]   SPACK_BUILD_THREADS: 8
[DEBUG]   SPACK_GCC_VERSION: 13.1.0
[DEBUG]   SPACK_INSTALL_OPTIONS: -y -j8 --deprecated --fresh --no-cache --source
Enter version (default: migration_artdaqv3_13_02):

[INFO] Selected sbndaq-suite version: migration_artdaqv3_13_02
[DEBUG] package_name: sbndaq-suite, version: migration_artdaqv3_13_02, qualifiers: s=132 cxxstd=20, gcc: 13.1.0, arch: linux-almalinux9-x86_64_v2
[DEBUG] spack_dev_top_dir: DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02
[DEBUG] checkout_packages: sbndaq@upgrade_gcc13.1.0,sbndaq-artdaq@upgrade_gcc13.1.0,sbndaq-artdaq-core@upgrade_gcc13.1.0,wibtools@upgrade_gcc13.1.0
[INFO] Creating new Spack environment in DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132
[DEBUG] package: sbndaq-suite, version: migration_artdaqv3_13_02, qualifiers: s=132 cxxstd=20, gcc: 13.1.0
[CMD] spack env create --dir DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132
==> Created independent environment in: /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132
==> Activate with: spack env activate DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132
[INFO] Creating configuration directory structure...
[DEBUG] Creating upstreams.yaml file: DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack/linux/upstreams.yaml
[DEBUG] Creating config.yaml file: DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack/config.yaml
[DEBUG] Creating .clang-format file: DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/srcs/.clang-format
[DEBUG] Creating repos.yaml file: DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack/repos.yaml
[DEBUG] Creating packages.yaml file: DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack/linux/almalinux9/packages.yaml
[DEBUG] Creating compilers.yaml file: DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack/linux/almalinux9/None/compilers.yaml
[DEBUG] Creating mpd repo: DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack-repos/mpd
[CMD] unset SPACK_DISABLE_LOCAL_CONFIG
[CMD] export SPACK_USER_CONFIG_PATH=/home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack
[INFO] Activating Spack environment... in DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132
[CMD] spack env activate --prompt --dir DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132
[INFO] Adding sbndaq-suite@migration_artdaqv3_13_02 s=132 cxxstd=20 arch=linux-almalinux9-x86_64_v2 %gcc@13.1.0 to environment...
[CMD] spack add sbndaq-suite@migration_artdaqv3_13_02 s=132 cxxstd=20 arch=linux-almalinux9-x86_64_v2 %gcc@13.1.0
==> Adding sbndaq-suite@migration_artdaqv3_13_02%gcc@13.1.0 cxxstd=20 s=132 arch=linux-almalinux9-x86_64_v2 to environment /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132
[DEBUG] Working directory: /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02
[DEBUG] Downloading package sources for sbndaq-suite@migration_artdaqv3_13_02 s=132 cxxstd=20 arch=linux-almalinux9-x86_64_v2 %gcc@13.1.0
[CMD] spack spec sbndaq-suite@migration_artdaqv3_13_02 s=132 cxxstd=20 arch=linux-almalinux9-x86_64_v2 %gcc@13.1.0 > sbndaq-suite-migration_artdaqv3_13_02-almalinux9-gcc13.1.0-c++20-s132.pkgs.txt
[DEBUG] Setting up development environment...
[DEBUG] Setting up development environment for: sbndaq@upgrade_gcc13.1.0
[CMD] spack develop --clone --force FORCE --path ../srcs/sbndaq sbndaq@develop  cxxstd=20 %gcc@13.1.0
[CMD] ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -T git@github.com
[WARN] Failed to authenticate to github.com - setting ENABLE_GIT_PUSH to false
[INFO] Please check your ssh key configuration and try again
[CMD] git checkout feature/upgrade_gcc13.1.0
[INFO] Checked out feature/upgrade_gcc13.1.0 branch for sbndaq
[CMD] spack develop --no-clone --path ../srcs/sbndaq sbndaq@migration  cxxstd=20 %gcc@13.1.0
[DEBUG] Setting up development environment for: sbndaq-artdaq@upgrade_gcc13.1.0
[CMD] spack develop --clone --force FORCE --path ../srcs/sbndaq-artdaq sbndaq-artdaq@develop  cxxstd=20 %gcc@13.1.0
[CMD] ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -T git@github.com
[WARN] Failed to authenticate to github.com - setting ENABLE_GIT_PUSH to false
[INFO] Please check your ssh key configuration and try again
[CMD] git checkout feature/upgrade_gcc13.1.0
[INFO] Checked out feature/upgrade_gcc13.1.0 branch for sbndaq-artdaq
[CMD] spack develop --no-clone --path ../srcs/sbndaq-artdaq sbndaq-artdaq@migration  cxxstd=20 %gcc@13.1.0
[DEBUG] Setting up development environment for: sbndaq-artdaq-core@upgrade_gcc13.1.0
[CMD] spack develop --clone --force FORCE --path ../srcs/sbndaq-artdaq-core sbndaq-artdaq-core@develop  cxxstd=20 %gcc@13.1.0
[CMD] ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -T git@github.com
[WARN] Failed to authenticate to github.com - setting ENABLE_GIT_PUSH to false
[INFO] Please check your ssh key configuration and try again
[CMD] git checkout feature/upgrade_gcc13.1.0
[INFO] Checked out feature/upgrade_gcc13.1.0 branch for sbndaq-artdaq-core
[CMD] spack develop --no-clone --path ../srcs/sbndaq-artdaq-core sbndaq-artdaq-core@migration  cxxstd=20 %gcc@13.1.0
[DEBUG] Setting up development environment for: wibtools@upgrade_gcc13.1.0
[CMD] spack develop --clone --force FORCE --path ../srcs/wibtools wibtools@develop  cxxstd=20 %gcc@13.1.0
[CMD] ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -T git@github.com
[WARN] Failed to authenticate to github.com - setting ENABLE_GIT_PUSH to false
[INFO] Please check your ssh key configuration and try again
[CMD] git checkout feature/upgrade_gcc13.1.0
[INFO] Checked out feature/upgrade_gcc13.1.0 branch for wibtools
[CMD] spack develop --no-clone --path ../srcs/wibtools wibtools@migration  cxxstd=20 %gcc@13.1.0
[DEBUG] Created DAQInterface symbolic link
[CMD] spack env deactivate
[CMD] unset SPACK_DISABLE_LOCAL_CONFIG
[CMD] export SPACK_USER_CONFIG_PATH=/home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack
[CMD] spack env activate --prompt --dir /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132
[INFO] Concretizing environment...
[WARN] This step may take several minutes depending on NFS system speed
[CMD] spack concretize --quiet --force
==> Updating view at /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132/.spack-env/view
[INFO] Building packages for sbndaq-suite@migration_artdaqv3_13_02 s=132 cxxstd=20 arch=linux-almalinux9-x86_64_v2 %gcc@13.1.0
[WARN] This step may take several minutes depending on NFS system speed
[DEBUG] Working directory: /home/artdaq/DAQ_SPACK_DevAreas
[CMD] spack spec sbndaq-suite@migration_artdaqv3_13_02 s=132 cxxstd=20 arch=linux-almalinux9-x86_64_v2 %gcc@13.1.0 > DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/sbndaq-suite-migration_artdaqv3_13_02-almalinux9-gcc13.1.0-c++20-s132.pkgs.txt
[CMD] spack install -y -j8 --fresh --no-cache --source
[+] /usr (external glibc-2.34-mfjm4x3bzykiojsnqzlihb6tcrki34xp)
[+] /daq/software/spack_packages/gcc-runtime/13.1.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-gvqla437weejy7ohjtesa75uxougga7a
[+] /daq/software/spack_packages/unzip/6.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-hqbpdqt4nvsokwwkmolvjfyqqgmhohhe
[+] /daq/software/spack_packages/numactl/2.0.18/linux-almalinux9-x86_64_v2-gcc-13.1.0-a5kjmewgbaj2chjxusc3yedcuytunyv4
......
......
[+] /daq/software/spack_packages/artdaq-core/v3_10_02/linux-almalinux9-x86_64_v2-gcc-13.1.0-cthtx6qmxfwt54ruvbx4wuv65gqc2aos
[+] /daq/software/spack_packages/artdaq-database/v1_10_00/linux-almalinux9-x86_64_v2-gcc-13.1.0-crdcwxfq5vx76tnpybaaun7m2p2z2ydt
[+] /daq/software/spack_packages/artdaq-mfextensions/v1_09_00/linux-almalinux9-x86_64_v2-gcc-13.1.0-576vtmvrncjdodvjs7tzxw4bjx7dzkya
[+] /daq/software/spack_packages/artdaq-utilities/v1_09_00/linux-almalinux9-x86_64_v2-gcc-13.1.0-mxq4derjehr3c6y47u7ypfmr7ijv67mv
==> Installing sbndaq-artdaq-core-migration-3uizsxwd4jocyr7bsmskeivfirh3ysud [162/170]
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
==> No patches needed for sbndaq-artdaq-core
==> sbndaq-artdaq-core: Executing phase: 'cmake'
==> sbndaq-artdaq-core: Executing phase: 'build'
==> sbndaq-artdaq-core: Executing phase: 'install'
==> sbndaq-artdaq-core: Successfully installed sbndaq-artdaq-core-migration-3uizsxwd4jocyr7bsmskeivfirh3ysud
  Stage: 0.00s.  Cmake: 2.64s.  Build: 11.74s.  Install: 1.12s.  Post-install: 0.21s.  Total: 18.47s
[+] /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack_packages/[padded-to-255-chars]/sbndaq-artdaq-core/migration/linux-almalinux9-x86_64_v2-gcc-13.1.0-3uizsxwd4jocyr7bsmskeivfirh3ysud
[+] /daq/software/spack_packages/artdaq-core-demo/v1_11_00/linux-almalinux9-x86_64_v2-gcc-13.1.0-vuzhu2h5dcspxdodxrztvzmz7hebrjm4
[+] /daq/software/spack_packages/artdaq/v3_13_02/linux-almalinux9-x86_64_v2-gcc-13.1.0-k4kpl6mtnkej6cik62jlexeto7dm57uc
[+] /daq/software/spack_packages/artdaq-epics-plugin/v1_06_00/linux-almalinux9-x86_64_v2-gcc-13.1.0-yh5p3xzfu3lmie2kg2tsgqwig66mtbfa
[+] /daq/software/spack_packages/artdaq-demo/v3_13_00/linux-almalinux9-x86_64_v2-gcc-13.1.0-opwlpsg7v7nfsyvql54mtp7xxmdyvexw
==> Installing sbndaq-artdaq-migration-jqsa5jy2wc4lirrgmtwnes7ben6htjge [167/170]
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
==> No patches needed for sbndaq-artdaq
==> sbndaq-artdaq: Executing phase: 'cmake'
==> sbndaq-artdaq: Executing phase: 'build'
==> sbndaq-artdaq: Executing phase: 'install'
==> sbndaq-artdaq: Successfully installed sbndaq-artdaq-migration-jqsa5jy2wc4lirrgmtwnes7ben6htjge
  Stage: 0.00s.  Cmake: 8.05s.  Build: 1m 46.44s.  Install: 0.69s.  Post-install: 0.63s.  Total: 1m 59.92s
[+] /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack_packages/[padded-to-255-chars]/sbndaq-artdaq/migration/linux-almalinux9-x86_64_v2-gcc-13.1.0-jqsa5jy2wc4lirrgmtwnes7ben6htjge
[+] /daq/software/spack_packages/artdaq-suite/v3_13_02/linux-almalinux9-x86_64_v2-gcc-13.1.0-ftpwdfmjqyer64qxq2axawcoelwsf2tu
==> Installing sbndaq-migration-4pqf6pn33ukjsirb4pho2bzcp66uvl7u [169/170]
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
==> No patches needed for sbndaq
==> sbndaq: Executing phase: 'cmake'
==> sbndaq: Executing phase: 'build'
==> sbndaq: Executing phase: 'install'
==> sbndaq: Successfully installed sbndaq-migration-4pqf6pn33ukjsirb4pho2bzcp66uvl7u
  Stage: 0.00s.  Cmake: 7.50s.  Build: 0.20s.  Install: 0.14s.  Post-install: 1.12s.  Total: 13.55s
[+] /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack_packages/[padded-to-255-chars]/sbndaq/migration/linux-almalinux9-x86_64_v2-gcc-13.1.0-4pqf6pn33ukjsirb4pho2bzcp66uvl7u
==> Installing sbndaq-suite-migration_artdaqv3_13_02-vk6bslplsg3qq2dqvb2bt7j7gcozgjkw [170/170]
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
==> No patches needed for sbndaq-suite
==> sbndaq-suite: Executing phase: 'install'
==> sbndaq-suite: Successfully installed sbndaq-suite-migration_artdaqv3_13_02-vk6bslplsg3qq2dqvb2bt7j7gcozgjkw
  Stage: 0.00s.  Install: 0.00s.  Post-install: 0.19s.  Total: 4.33s
[+] /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack_packages/[padded-to-255-chars]/sbndaq-suite/migration_artdaqv3_13_02/linux-almalinux9-x86_64_v2-gcc-13.1.0-vk6bslplsg3qq2dqvb2bt7j7gcozgjkw
==> Updating view at /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132/.spack-env/view
[DEBUG] Build succeeded - creating buildcache
[INFO] Creating buildcache at: DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack_mirrors/sbndaq-suite/migration_artdaqv3_13_02
[CMD] spack find -lpd sbndaq-suite@migration_artdaqv3_13_02 s=132 cxxstd=20 arch=linux-almalinux9-x86_64_v2 %gcc@13.1.0
[CMD] spack buildcache push --unsigned --only package DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack_mirrors/sbndaq-suite/migration_artdaqv3_13_02 sbndaq-suite@migration_artdaqv3_13_02 /vk6bslp
==> Pushed sbndaq-suite@migration_artdaqv3_13_02/vk6bslp
[CMD] spack buildcache push --unsigned --only package DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack_mirrors/sbndaq-suite/migration_artdaqv3_13_02 sbndaq@migration /4pqf6pn
==> Pushed sbndaq@migration/4pqf6pn
[CMD] spack buildcache push --unsigned --only package DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack_mirrors/sbndaq-suite/migration_artdaqv3_13_02 sbndaq-artdaq@migration /jqsa5jy
==> Pushed sbndaq-artdaq@migration/jqsa5jy
[CMD] spack buildcache push --unsigned --only package DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack_mirrors/sbndaq-suite/migration_artdaqv3_13_02 sbndaq-artdaq-core@migration /3uizsxw
==> Pushed sbndaq-artdaq-core@migration/3uizsxw
[CMD] spack buildcache push --unsigned --only package DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack_mirrors/sbndaq-suite/migration_artdaqv3_13_02 wibtools@migration /lcv3efc
==> Pushed wibtools@migration/lcv3efc
[INFO] Updating buildcache index...
[CMD] spack buildcache update-index DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack_mirrors/sbndaq-suite/migration_artdaqv3_13_02
[INFO] Listing packages in buildcache...
[CMD] spack buildcache list -lva sbndaq-suite@migration_artdaqv3_13_02
==> 1 cached build.
-- linux-almalinux9-x86_64_v2 / gcc@13.1.0 ----------------------
vk6bslp sbndaq-suite@migration_artdaqv3_13_02~gdb+icarus+sbnd build_system=bundle cxxstd=20 s=132
[INFO] Commands log saved to: /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132/spack_commands-20250603-112034.txt
[SUCCESS] Setup completed successfully
[DEBUG] Running cleanup functions
[DEBUG] Removing temporary files
[DEBUG] Closing open file handles
```
