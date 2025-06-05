## This is the sample of the build log output produced by the [newSPACKDevArea.sh](https://github.com/SBNSoftware/spack-top/tree/main/sbndaq-spack-tools) script.

This log outlines setting up an SBNDAQ development environment using Spack. It details sourcing scripts, configuring packages, downloading sources, building and installing them, and pushing binaries to build caches for effective software management and deployment.

```txt
[artdaq@vm-51]$ ./newSPACKDevArea.sh
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
[DEBUG] Found default config file: ./newSPACKDevArea.env
[DEBUG] Using existing configuration file: ./newSPACKDevArea.env
[INFO] Using configuration file: ./newSPACKDevArea.env
[INFO] Loading configuration from ./newSPACKDevArea.env
[DEBUG] Using version from DAQ_PKG_VERSIONS: migration_artdaqv3_13_02
[DEBUG] Setting up Spack environment with GCC 13.1.0
[DEBUG] Spack environment configured:
[DEBUG]   SPACK_HOME_DIR: /daq/software/spack_packages/spack/v1.0.1.sbnd
[DEBUG]   SPACK_DISTRO_NAME: almalinux9
[DEBUG]   SPACK_ARCH: linux-almalinux9-x86_64_v2
[DEBUG]   SPACK_BUILD_THREADS: 8
[DEBUG]   SPACK_GCC_VERSION: 13.1.0
[DEBUG]   SPACK_INSTALL_OPTIONS: -y -j8 --deprecated --fresh --no-cache --source
Enter version (default: migration_artdaqv3_13_02): [WARN] Input timeout after 5s - using default: migration_artdaqv3_13_02

[INFO] Selected sbndaq-suite version: migration_artdaqv3_13_02
[DEBUG] package_name: sbndaq-suite, version: migration_artdaqv3_13_02, qualifiers: s=132 cxxstd=20, gcc: 13.1.0, arch: linux-almalinux9-x86_64_v2
[DEBUG] spack_dev_top_dir: DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02
[DEBUG] checkout_packages: sbndaq@upgrade_gcc13.1.0,sbndaq-artdaq@upgrade_gcc13.1.0,sbndaq-artdaq-core@upgrade_gcc13.1.0,wibtools@upgrade_gcc13.1.0
[INFO] Creating new Spack environment in DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132
[DEBUG] package: sbndaq-suite, version: migration_artdaqv3_13_02, qualifiers: s=132 cxxstd=20, gcc: 13.1.0
[CMD] spack env create --dir DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132
==> Created independent environment in: /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132
==> Activate with: spack env activate DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132
[INFO] Creating configuration directory structure...
[DEBUG] Creating upstreams.yaml file: DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack/linux/upstreams.yaml
[DEBUG] Creating config.yaml file: DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack/config.yaml
[DEBUG] Creating .clang-format file: DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/srcs/.clang-format
[DEBUG] Creating repos.yaml file: DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack/repos.yaml
[DEBUG] Creating packages.yaml file: DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack/linux/almalinux9/packages.yaml
[DEBUG] Creating compilers.yaml file: DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack/linux/almalinux9/None/compilers.yaml
[DEBUG] Creating mpd repo: DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack-repos/mpd
[CMD] unset SPACK_DISABLE_LOCAL_CONFIG
[CMD] export SPACK_USER_CONFIG_PATH=/home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack
[INFO] Activating Spack environment... in DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132
[CMD] spack env activate --prompt --dir DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132
[INFO] Adding sbndaq-suite@migration_artdaqv3_13_02 s=132 cxxstd=20 arch=linux-almalinux9-x86_64_v2 %gcc@13.1.0 to environment...
[CMD] spack add sbndaq-suite@migration_artdaqv3_13_02 s=132 cxxstd=20 arch=linux-almalinux9-x86_64_v2 %gcc@13.1.0
==> Adding sbndaq-suite@migration_artdaqv3_13_02%gcc@13.1.0 cxxstd=20 s=132 arch=linux-almalinux9-x86_64_v2 to environment /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132
[DEBUG] Working directory: /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02
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
[CMD] export SPACK_USER_CONFIG_PATH=/home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack
[CMD] spack env activate --prompt --dir /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132
[INFO] No spack.lock file, concretizing environment...
[WARN] This step may take several minutes or even tens of minutes depending on NFS system speed
[CMD] spack concretize --quiet --force
==> Updating view at /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132/.spack-env/view
[INFO] Building packages for sbndaq-suite@migration_artdaqv3_13_02 s=132 cxxstd=20 arch=linux-almalinux9-x86_64_v2 %gcc@13.1.0
[WARN] This step may take several minutes or even tens of minutes depending on NFS system speed
[DEBUG] Working directory: /home/artdaq/DAQ_SPACK_DevAreas
[CMD] spack spec sbndaq-suite@migration_artdaqv3_13_02 s=132 cxxstd=20 arch=linux-almalinux9-x86_64_v2 %gcc@13.1.0 > DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/sbndaq-suite-migration_artdaqv3_13_02-almalinux9-gcc13.1.0-c++20-s132.pkgs.txt
[CMD] spack install -y -j8 --fresh --no-cache --source
[+] /usr (external glibc-2.34-mfjm4x3bzykiojsnqzlihb6tcrki34xp)
[+] /daq/software/spack_packages/gcc-runtime/13.1.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-gvqla437weejy7ohjtesa75uxougga7a
[+] /daq/software/spack_packages/abseil-cpp/20240722.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-hgm6efdoblblxznid3y2pfgjrwqkkprn
[+] /daq/software/spack_packages/nghttp2/1.64.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-7pg4cqjmr47jp2qjx63pehbbtkeqztxc
[+] /daq/software/spack_packages/double-conversion/3.3.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-yl5hq6ehjuzbjnu4364aryyzhqu32nwf
[+] /daq/software/spack_packages/libuuid/1.0.3/linux-almalinux9-x86_64_v2-gcc-13.1.0-f2ulfrstfdlq664gny7mrsqefg5z34ld
[+] /daq/software/spack_packages/json-c/0.18/linux-almalinux9-x86_64_v2-gcc-13.1.0-ppawjwmb4kyplqtzw5xx53whyx5hsphc
[+] /daq/software/spack_packages/libsodium/1.0.20/linux-almalinux9-x86_64_v2-gcc-13.1.0-qi3s37lfbqtluif2qvw5ndll3oddajsz
[+] /daq/software/spack_packages/zstd/1.5.6/linux-almalinux9-x86_64_v2-gcc-13.1.0-hv6hea2lsivg4cromjay5gikqx57gvfw
[+] /daq/software/spack_packages/clhep/2.4.7.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-4neusvfjkbsq5u7eriz6o4xhkpxjgfsf
[+] /daq/software/spack_packages/xz/5.4.6/linux-almalinux9-x86_64_v2-gcc-13.1.0-cqcfhk7vboytfj2esd3y53mrhxxtqbaz
[+] /daq/software/spack_packages/icu4c/74.2/linux-almalinux9-x86_64_v2-gcc-13.1.0-k3l6e355nebeppigztibkpegfd6e7ihj
[+] /daq/software/spack_packages/vdt/0.4.4/linux-almalinux9-x86_64_v2-gcc-13.1.0-zshygmo4tsgqkomrwz7erf33dujhna6m
[+] /daq/software/spack_packages/xextproto/7.3.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-ta4qmra7775es2eo6dukj4lvnhn7vrq4
[+] /daq/software/spack_packages/xxhash/0.8.3/linux-almalinux9-x86_64_v2-gcc-13.1.0-f5kw4fe7odwmilaickdqkleacph7lh37
[+] /daq/software/spack_packages/randrproto/1.5.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-q5ytncezw2xg5zwtukqs65gujnrelita
[+] /daq/software/spack_packages/zlib/1.3.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-oswrerxnndcpid4jnjjfk6pwvcyw2kuy
[+] /daq/software/spack_packages/gsl/2.7.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-6btdzhwfcn7dtkqah6x3uf7vv4kp67bu
[+] /daq/software/spack_packages/libjpeg-turbo/3.0.3/linux-almalinux9-x86_64_v2-gcc-13.1.0-borxytadivi2rirmx5t3ykjq22nl62w7
[+] /daq/software/spack_packages/font-util/1.4.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-vr3igaizx3ir4a6pttuq4ne6tuu3c6wz
[+] /daq/software/spack_packages/unzip/6.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-hqbpdqt4nvsokwwkmolvjfyqqgmhohhe
[+] /daq/software/spack_packages/libpthread-stubs/0.5/linux-almalinux9-x86_64_v2-gcc-13.1.0-dqdkh23il2fjmkulfeie6eqbelcrq4sf
[+] /daq/software/spack_packages/cetlib-except/1.10.00/linux-almalinux9-x86_64_v2-gcc-13.1.0-4jdjnqos6xli2qqgqsnfajmtrq7ofx2w
[+] /daq/software/spack_packages/nlohmann-json/3.11.3/linux-almalinux9-x86_64_v2-gcc-13.1.0-vykeimncenyy4sytgutn36dzhnnclhyu
[+] /daq/software/spack_packages/hiredis/1.1.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-oll3v7xcfhuljckegw5rnyjxcdpqgvnb
[+] /daq/software/spack_packages/ncurses/6.5/linux-almalinux9-x86_64_v2-gcc-13.1.0-nobfqgirlxndnujn2ed77exqtomthz3e
[+] /daq/software/spack_packages/numactl/2.0.18/linux-almalinux9-x86_64_v2-gcc-13.1.0-a5kjmewgbaj2chjxusc3yedcuytunyv4
[+] /daq/software/spack_packages/kbproto/1.0.7/linux-almalinux9-x86_64_v2-gcc-13.1.0-dxuprotuzmggc4yb2vwrufppbsjw3avl
[+] /daq/software/spack_packages/lzo/2.10/linux-almalinux9-x86_64_v2-gcc-13.1.0-lknje6jmxrfjvw3z4eneu5su2z5t5olb
[+] /daq/software/spack_packages/libusb/1.0.27/linux-almalinux9-x86_64_v2-gcc-13.1.0-anvdi4xgcctvj55575r3cdhnwidwksrp
[+] /daq/software/spack_packages/redis/7.4.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-ru3c2nhcuevnmopejyridyyuuxxhvrvu
[+] /daq/software/spack_packages/pcre2/10.44/linux-almalinux9-x86_64_v2-gcc-13.1.0-h2pknkctevop25sisa6c5za5dhbvo2ud
[+] /daq/software/spack_packages/lz4/1.10.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-mvvbsow3x43cyphe5aa3qiazn5m7o3t3
[+] /daq/software/spack_packages/xtrans/1.5.2/linux-almalinux9-x86_64_v2-gcc-13.1.0-npnqtn5vf7hq7cuamse7eywmcwlteeu5
[+] /daq/software/spack_packages/pcre/8.45/linux-almalinux9-x86_64_v2-gcc-13.1.0-ojebsh3q46y6jgt6wbgdxhezoyifrjfj
[+] /daq/software/spack_packages/libunwind/1.8.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-7ir6p2rwvijxqh5jhgmg47inucfzuqgz
[+] /daq/software/spack_packages/zlib-ng/2.2.3/linux-almalinux9-x86_64_v2-gcc-13.1.0-xjk5rdwll5wuqai4zwiylezfztjjhlb7
[+] /daq/software/spack_packages/catch2/3.3.2/linux-almalinux9-x86_64_v2-gcc-13.1.0-ql4hz6quzy2elibzmbvge6uiygaaatba
[+] /daq/software/spack_packages/util-macros/1.20.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-x5vvnxgca6zobpx54okm5s5mjovme35g
[+] /daq/software/spack_packages/gmake/4.4.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-uau636nzu6rrtcedparpiaqhyebnkz2s
[+] /daq/software/spack_packages/windriver/v12_06_00/linux-almalinux9-x86_64_v2-gcc-13.1.0-3sxexyilzuvgzuixgejd63jay6c433ts
[+] /daq/software/spack_packages/readline/8.2/linux-almalinux9-x86_64_v2-gcc-13.1.0-t7ouo4k2auozroxv4ri2kjerznxbs65w
[+] /daq/software/spack_packages/libedit/3.1-20240808/linux-almalinux9-x86_64_v2-gcc-13.1.0-cugnevuppchlpid67y5k4d27i7wbjkly
[+] /daq/software/spack_packages/binutils/2.43.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-old5p3oopkqvek4ujp6ikanl67bbjc5h
[+] /daq/software/spack_packages/glproto/1.4.17/linux-almalinux9-x86_64_v2-gcc-13.1.0-jp67725it63wp6gthmxz5cvo4rb3fe7w
[+] /daq/software/spack_packages/xproto/7.0.31/linux-almalinux9-x86_64_v2-gcc-13.1.0-n47nt3tp6ydm6ikheovl7ghzuwd3sqo3
[+] /daq/software/spack_packages/rapidjson/1.2.0-2024-08-16/linux-almalinux9-x86_64_v2-gcc-13.1.0-hjkmoyfj5ezkb3uzsqng5dx3erbqwyia
[+] /daq/software/spack_packages/renderproto/0.11.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-h4jgpf5eep6c2ecznuutoty6q7rw5hvz
[+] /daq/software/spack_packages/pythia6/6.4.28/linux-almalinux9-x86_64_v2-gcc-13.1.0-6f533motwkrxfhzyuxwneyytinthzrfc
[+] /daq/software/spack_packages/libpng/1.6.39/linux-almalinux9-x86_64_v2-gcc-13.1.0-y7uxxdv22idbslphx52e4rdhwcjbbloi
[+] /daq/software/spack_packages/libmd/1.0.4/linux-almalinux9-x86_64_v2-gcc-13.1.0-zk365rvde3z7mxyskvnh72f7my6jxfln
[+] /daq/software/spack_packages/berkeley-db/18.1.40/linux-almalinux9-x86_64_v2-gcc-13.1.0-gcpg3p2bwz62yukf5tx7tdeolyv65nau
[+] /daq/software/spack_packages/libffi/3.4.6/linux-almalinux9-x86_64_v2-gcc-13.1.0-k3frxfy7e7y3ybvecwwk5t4624tevhbn
[+] /daq/software/spack_packages/openblas/0.3.23/linux-almalinux9-x86_64_v2-gcc-13.1.0-ifzupnpqljwdvbnyi7262fij4p4occob
[+] /daq/software/spack_packages/libtiff/4.7.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-hmvq4ouwbv6r425qclzvvq4auu6mew5q
[+] /daq/software/spack_packages/jsoncpp/1.9.6/linux-almalinux9-x86_64_v2-gcc-13.1.0-pj2coas53sfbuwvdzkb4drgi2ix4e6vx
[+] /daq/software/spack_packages/range-v3/0.12.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-mtbjbjk4kijeztfooslswhpbaliz25lx
[+] /daq/software/spack_packages/libxcrypt/4.4.35/linux-almalinux9-x86_64_v2-gcc-13.1.0-zqlbtwpfhw2rql7kb3oadufb5yrpmxca
[+] /daq/software/spack_packages/protobuf/3.28.2/linux-almalinux9-x86_64_v2-gcc-13.1.0-cz55ozciv72yyqjlyi6k4kgcwfl4zhv2
[+] /daq/software/spack_packages/caenvmelib/4.0.2/linux-almalinux9-x86_64_v2-gcc-13.1.0-pspfuxfzbkxjh22rphz442qytcfwecsb
[+] /daq/software/spack_packages/pkg-config/0.29.2/linux-almalinux9-x86_64_v2-gcc-13.1.0-7ts6z5tdvtiw33mxlloy4iqkl3ehgq3t
[+] /daq/software/spack_packages/pigz/2.8/linux-almalinux9-x86_64_v2-gcc-13.1.0-qjfp3det2e7oxbtqkottkfgzlv4e2vk7
[+] /daq/software/spack_packages/fcgi/2.4.4/linux-almalinux9-x86_64_v2-gcc-13.1.0-thmes6gkkwfzrwlmmckrfhcw5a5ufzpw
[+] /daq/software/spack_packages/bzip2/1.0.8/linux-almalinux9-x86_64_v2-gcc-13.1.0-kuf3k2jf5cztkzpto5lnoxdzsk5b6ud3
[+] /daq/software/spack_packages/openssl/3.4.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-uxuhpv7ewvcgz6dezq5s6qqojos2ojkp
[+] /daq/software/spack_packages/rngstreams/1.0.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-b6ti4hx2podwxghti4hq53hwotvsmwty
[+] /daq/software/spack_packages/sqlite/3.40.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-z54v4i44atkoci2geqehxyn6jq32sxgd
[+] /daq/software/spack_packages/gdbm/1.23/linux-almalinux9-x86_64_v2-gcc-13.1.0-lgkk4s46dxb6wwrdfpsbaqu25ogffxyj
[+] /daq/software/spack_packages/libbsd/0.12.2/linux-almalinux9-x86_64_v2-gcc-13.1.0-bwgfgz5m6u7rw6jzesztsjtwvjok7tcn
[+] /daq/software/spack_packages/lcms/2.16/linux-almalinux9-x86_64_v2-gcc-13.1.0-gj6vo657h5fokpok4ay4rmdq2aoghaas
[+] /daq/software/spack_packages/caencomm/1.7.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-7676i2cya6t4oekvk3ed45tz4gdved7e
[+] /daq/software/spack_packages/libxau/1.0.12/linux-almalinux9-x86_64_v2-gcc-13.1.0-4rrf5hfqie6jm5mplwzgjw4oaixqnx4r
[+] /daq/software/spack_packages/pixman/0.44.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-uw4o2yzxy6b4spjgxo5xd6d6hchnw5gc
[+] /daq/software/spack_packages/libpciaccess/0.17/linux-almalinux9-x86_64_v2-gcc-13.1.0-uiznzhuljfddl7ka5iqrikalhviudvju
[+] /daq/software/spack_packages/libxml2/2.9.14/linux-almalinux9-x86_64_v2-gcc-13.1.0-65wb343c35dah3dqvho34mofmum2kjww
[+] /daq/software/spack_packages/swig/4.1.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-7qidliy5hy3ey34sxuxztdxuszhcz37g
[+] /daq/software/spack_packages/tar/1.35/linux-almalinux9-x86_64_v2-gcc-13.1.0-xxpy3mvyh4s7iqtrm24tux2yfsyy3bwi
[+] /daq/software/spack_packages/boost/1.82.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-hts4r4czktqyim2cfxfotml4tpxlz2sh
[+] /daq/software/spack_packages/freetype/2.13.2/linux-almalinux9-x86_64_v2-gcc-13.1.0-zvd7tjp5xeheirtd3xvrlnt5hjsbfnwl
[+] /daq/software/spack_packages/libevent/2.1.12/linux-almalinux9-x86_64_v2-gcc-13.1.0-yz55fz75sifdx7svuhe5o47hmtn745pe
[+] /daq/software/spack_packages/curl/8.11.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-6sd43ofni4xsm4dovxazlsqgwkbli3re
[+] /daq/software/spack_packages/postgresql/15.2/linux-almalinux9-x86_64_v2-gcc-13.1.0-tfgsitnnn2bvno572k3xviwcrqjwtjzi
[+] /daq/software/spack_packages/unuran/1.8.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-gjnoxu6gsnlbd6mqtdycky7buxu47xce
[+] /daq/software/spack_packages/perl/5.40.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-4xhrko4atkor44fpxodfqmskjufrhl3i
[+] /daq/software/spack_packages/expat/2.6.4/linux-almalinux9-x86_64_v2-gcc-13.1.0-wd2vu7yebknp3qad3f5eksxdjz4uj5nx
[+] /daq/software/spack_packages/libzmq/4.3.5/linux-almalinux9-x86_64_v2-gcc-13.1.0-pl527gkazn3nmf5cxbs6psnxvzupuvgj
[+] /daq/software/spack_packages/libice/1.1.2/linux-almalinux9-x86_64_v2-gcc-13.1.0-cupfv5u7d32zwzdtz4vmnktdoccwfwoi
[+] /daq/software/spack_packages/libxdmcp/1.1.5/linux-almalinux9-x86_64_v2-gcc-13.1.0-4jkmyhzkwmryillypnhvqr7qnyagrluf
[+] /daq/software/spack_packages/libmng/2.0.3/linux-almalinux9-x86_64_v2-gcc-13.1.0-lyarg2frjrwzqqxuwjzcgam2jxqhgxls
[+] /daq/software/spack_packages/caendigitizer/2.17.3/linux-almalinux9-x86_64_v2-gcc-13.1.0-a3bqsjnmbypjuv52bnjvfxo7dkw7hxsz
[+] /daq/software/spack_packages/hwloc/2.11.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-2ohwbp5ywj5b5q3zifec3nt6ejfpwbun
[+] /daq/software/spack_packages/gettext/0.23.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-7uad7d5txeqptlht4bjimjkkf4dmtuol
[+] /daq/software/spack_packages/fontconfig/2.15.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-gwtdazzl5ryz2rk2axdux763hs35gsq6
[+] /daq/software/spack_packages/davix/0.8.10/linux-almalinux9-x86_64_v2-gcc-13.1.0-nizlw4ltsg35zufiz4xk4woqtjh2pbvn
[+] /daq/software/spack_packages/librdkafka/2.8.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-q4jytq4rt2zacvqqtwsyo3wz6l7b4hjp
[+] /daq/software/spack_packages/lua/5.3.6/linux-almalinux9-x86_64_v2-gcc-13.1.0-aloyucg4wl2xehvgnkxmzrjxovigcbes
[+] /daq/software/spack_packages/cmake/3.31.5/linux-almalinux9-x86_64_v2-gcc-13.1.0-g224o7g6w6e4gfbuwlgi4vbi7vk6hmvh
[+] /daq/software/spack_packages/xmlrpc-c/1.51.06/linux-almalinux9-x86_64_v2-gcc-13.1.0-uzm6f4ybn324xpevfkfy3csmr3vqx26n
[+] /daq/software/spack_packages/epics-base/7.0.6.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-od2x65glvkbjoy7oq66vrwtxbaqrlheb
[+] /daq/software/spack_packages/libsm/1.2.5/linux-almalinux9-x86_64_v2-gcc-13.1.0-35qnbcu52pkk4ux7l4soqpnyscb3lqez
[+] /daq/software/spack_packages/libxcb/1.17.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-pchn44mj7ukw6gduzleq2bympxtawaub
[+] /daq/software/spack_packages/pmix/5.0.5/linux-almalinux9-x86_64_v2-gcc-13.1.0-dm6vmapzpts2uotfv53lunswzx6dglxk
[+] /daq/software/spack_packages/python/3.9.15/linux-almalinux9-x86_64_v2-gcc-13.1.0-ehxmbymuo5j3lx7jtbvzpsqfsrun75t6
[+] /daq/software/spack_packages/krb5/1.21.3/linux-almalinux9-x86_64_v2-gcc-13.1.0-uavgiey4cmm3dqhhwvd2k2slvinhv5ga
[+] /daq/software/spack_packages/elfutils/0.192/linux-almalinux9-x86_64_v2-gcc-13.1.0-wgui433xhulpat7zx4u4mble7rjb2qlv
[+] /daq/software/spack_packages/xrootd/5.5.5/linux-almalinux9-x86_64_v2-gcc-13.1.0-r5amwd7wy5ne5eyrxd64nk7xn7za7l7m
[+] /daq/software/spack_packages/cppzmq/4.10.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-l67kieb76z7ajhxitigxqkbmlvutygqs
[+] /daq/software/spack_packages/cetlib/3.19.00/linux-almalinux9-x86_64_v2-gcc-13.1.0-r7fljxcgodhztiseirtq23ekrmxl5r4u
[+] /daq/software/spack_packages/intel-tbb-oneapi/2021.9.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-jshscfkp6hlikzfb3vxdi6r6ub7apnfg
[+] /daq/software/spack_packages/cetmodules/3.26.00/linux-almalinux9-x86_64_v2-gcc-13.1.0-k3dsmnb3a64v7znzfcmwegois2qabml7
[+] /daq/software/spack_packages/libpqxx/7.10.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-rwltlxkghtv72oz42r7tu3yff5ipmdbx
[+] /daq/software/spack_packages/xcb-util/0.4.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-z7o32xartxnzbkltyx3gafpervj6bx7j
[+] /daq/software/spack_packages/xcb-util-wm/0.4.2/linux-almalinux9-x86_64_v2-gcc-13.1.0-6o3ttfktk5igh25tfijbdfrvsamsmhpy
[+] /daq/software/spack_packages/xcb-util-keysyms/0.4.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-ah7diqdjgl4rmad7bg5exlzjik22u6qt
[+] /daq/software/spack_packages/xcb-util-renderutil/0.3.10/linux-almalinux9-x86_64_v2-gcc-13.1.0-6wdfpm5ji6at5z2z4rg5g7vrukvs5af5
[+] /daq/software/spack_packages/libx11/1.8.10/linux-almalinux9-x86_64_v2-gcc-13.1.0-oogksy3ffcwuvh4azdjbozp46lb4ig55
[+] /daq/software/spack_packages/python-venv/1.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-l7itzvyazeuf5dcxicjwkzwcg46z5sjc
[+] /daq/software/spack_packages/llvm/17.0.6/linux-almalinux9-x86_64_v2-gcc-13.1.0-lftmeetsjiwudj2xbynjucvwahovrh47
[+] /daq/software/spack_packages/openssh/9.9p1/linux-almalinux9-x86_64_v2-gcc-13.1.0-wadbp4xf6yfvf4fpkxyvjiutzppy4udn
[+] /daq/software/spack_packages/fhicl-cpp/4.19.00/linux-almalinux9-x86_64_v2-gcc-13.1.0-zbkgrhubbov6gx3fhkp4ci3mqiyo4hq7
[+] /daq/software/spack_packages/hep-concurrency/1.10.00/linux-almalinux9-x86_64_v2-gcc-13.1.0-irhephb3hk2rppown2eg47hcbyp6an5c
[+] /daq/software/spack_packages/artdaq-daqinterface/v3_14_00/linux-almalinux9-x86_64_v2-gcc-13.1.0-ffp6yiamdycgul6kbi3dxvcg2ipqnadt
[+] /daq/software/spack_packages/xcb-util-image/0.4.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-xx5xuquoyeh4kaauzbfxwgsdgegnjgmw
[+] /daq/software/spack_packages/xkeyboard-config/2.34/linux-almalinux9-x86_64_v2-gcc-13.1.0-6gatv6pox2cdjof2hq44boetixby6bbt
[+] /daq/software/spack_packages/libxt/1.3.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-4db6htjeiihykiqqmey4xgw2os6o4zld
[+] /daq/software/spack_packages/libxext/1.3.6/linux-almalinux9-x86_64_v2-gcc-13.1.0-oebwz7wq5mt4a7oojnmvtr42rrrxgklo
[+] /daq/software/spack_packages/libxpm/3.5.17/linux-almalinux9-x86_64_v2-gcc-13.1.0-ljrfxxe6uwsmkng3b5sahhroqgnsebui
[+] /daq/software/spack_packages/libxrender/0.9.11/linux-almalinux9-x86_64_v2-gcc-13.1.0-frrspccotczayweh3fxmqnolcsepokio
[+] /daq/software/spack_packages/glib/2.82.2/linux-almalinux9-x86_64_v2-gcc-13.1.0-l5wfdbhpcwnxvgxs5cx6l4lq2n5fqny5
[+] /daq/software/spack_packages/py-pybind11/2.10.4/linux-almalinux9-x86_64_v2-gcc-13.1.0-yf7l5yj5ouyioniq2jhxn62o5zhejxzc
[+] /daq/software/spack_packages/py-setuptools/63.4.3/linux-almalinux9-x86_64_v2-gcc-13.1.0-jfwc4pmudsowniw3jdifcyofq2nlcjkn
[+] /daq/software/spack_packages/openmpi/5.0.6/linux-almalinux9-x86_64_v2-gcc-13.1.0-6w7pdgp7ysklhwuw476pwurxs2jwunwn
[+] /daq/software/spack_packages/libxkbcommon/1.7.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-q7jzwokre2uumci6wuxbsa3g6jafectj
[+] /daq/software/spack_packages/libxrandr/1.5.4/linux-almalinux9-x86_64_v2-gcc-13.1.0-f3bkxozfovkj257utsz3qfjnlvyc23qc
[+] /daq/software/spack_packages/libxft/2.3.8/linux-almalinux9-x86_64_v2-gcc-13.1.0-u5abgs7svplwvxtfzhfdprzl76lievnf
[+] /daq/software/spack_packages/cairo/1.18.2/linux-almalinux9-x86_64_v2-gcc-13.1.0-i5wzx5q6mmf7wnovj6nq2nlieicdludx
[+] /daq/software/spack_packages/messagefacility/2.11.00/linux-almalinux9-x86_64_v2-gcc-13.1.0-7qxrwkhscesgx5eww6fsjh64vx3wtqiu
[+] /daq/software/spack_packages/py-numpy/1.24.3/linux-almalinux9-x86_64_v2-gcc-13.1.0-cm52wbtdyhdjcyqbrdocze3k5qzx5zfk
[+] /daq/software/spack_packages/fftw/3.3.10/linux-almalinux9-x86_64_v2-gcc-13.1.0-ddjwo7ttqsjx3uitfpipaxe5rku3oswd
[+] /daq/software/spack_packages/xrandr/1.5.3/linux-almalinux9-x86_64_v2-gcc-13.1.0-ydhw536n3i3vqgg2wvxmzk7u2arcnggb
[+] /daq/software/spack_packages/gobject-introspection/1.78.1/linux-almalinux9-x86_64_v2-gcc-13.1.0-hbyspo2nfqv26afjkjwuzjganplik5sn
[+] /daq/software/spack_packages/canvas/3.17.00/linux-almalinux9-x86_64_v2-gcc-13.1.0-s5hcvfvizg3a7psoljyfab3mk2xhswot
[+] /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36
[+] /daq/software/spack_packages/mesa/23.3.6/linux-almalinux9-x86_64_v2-gcc-13.1.0-kgd5s7jfuu2s7q66q3gfrltmopigzbaz
[+] /daq/software/spack_packages/harfbuzz/10.2.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-yzvkobervxg4yv4dgp7c7jbalocaaw7v
[+] /daq/software/spack_packages/art/3.15.00/linux-almalinux9-x86_64_v2-gcc-13.1.0-m2srguupayrilnnylu7cjevh3xb3cfil
==> Installing wibtools-migration-i7ewgeucr7vbgsfiigkt2kwxku6io4hu [147/171]
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
==> No patches needed for wibtools
==> wibtools: Executing phase: 'cmake'
==> wibtools: Executing phase: 'build'
==> wibtools: Executing phase: 'install'
==> wibtools: Successfully installed wibtools-migration-i7ewgeucr7vbgsfiigkt2kwxku6io4hu
  Stage: 0.00s.  Cmake: 1.05s.  Build: 23.93s.  Install: 0.38s.  Post-install: 0.17s.  Total: 25.83s
[+] /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack_packages/[padded-to-255-chars]/wibtools/migration/linux-almalinux9-x86_64_v2-gcc-13.1.0-i7ewgeucr7vbgsfiigkt2kwxku6io4hu
[+] /daq/software/spack_packages/glx/1.4/linux-almalinux9-x86_64_v2-gcc-13.1.0-q2ofcj2jie67taac3kf3b7kwfophntz6
[+] /daq/software/spack_packages/qt/5.15.16/linux-almalinux9-x86_64_v2-gcc-13.1.0-p7syfjxwbljmgzjjtfk7jumt5p3j7ycx
[+] /daq/software/spack_packages/gl2ps/1.4.2/linux-almalinux9-x86_64_v2-gcc-13.1.0-gevvr742aqf7sr25sw5gy64rglkqdizn
[+] /daq/software/spack_packages/mesa-glu/9.0.2/linux-almalinux9-x86_64_v2-gcc-13.1.0-jkbshftnqtm6rhz7o5mh33x6pn22pyqs
[+] /daq/software/spack_packages/glew/2.2.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-7sc3dg5s72odjf3jcmesl43pur4oauuv
[+] /daq/software/spack_packages/artdaq-runcontrol-gui/v1_03_06/linux-almalinux9-x86_64_v2-gcc-13.1.0-k5zck4hnyradk5bjxapabtr66bwjpk5j
[+] /daq/software/spack_packages/ftgl/2.4.0/linux-almalinux9-x86_64_v2-gcc-13.1.0-cwywqhzdi7m4p6265seeywklove5e6xl
[+] /daq/software/spack_packages/root/6.30.06/linux-almalinux9-x86_64_v2-gcc-13.1.0-azya5pq7gpap53k4vuriz5lotgwyvvj3
[+] /daq/software/spack_packages/canvas-root-io/1.14.00/linux-almalinux9-x86_64_v2-gcc-13.1.0-tsjqe6ui6x53jqchbbwks63czjeajnsm
[+] /daq/software/spack_packages/art-root-io/1.14.00/linux-almalinux9-x86_64_v2-gcc-13.1.0-pkzgmso27moghsttnjzqb5uz67fmqytp
[+] /daq/software/spack_packages/art-suite/s132/linux-almalinux9-x86_64_v2-gcc-13.1.0-3ifz55tjh7gklczyqlphmfrmtpevo7ni
[+] /daq/software/spack_packages/artdaq-database/v1_10_00/linux-almalinux9-x86_64_v2-gcc-13.1.0-crdcwxfq5vx76tnpybaaun7m2p2z2ydt
[+] /daq/software/spack_packages/artdaq-core/v3_10_02/linux-almalinux9-x86_64_v2-gcc-13.1.0-cthtx6qmxfwt54ruvbx4wuv65gqc2aos
[+] /daq/software/spack_packages/artdaq-mfextensions/v1_09_00/linux-almalinux9-x86_64_v2-gcc-13.1.0-576vtmvrncjdodvjs7tzxw4bjx7dzkya
[+] /daq/software/spack_packages/artdaq-utilities/v1_09_00/linux-almalinux9-x86_64_v2-gcc-13.1.0-mxq4derjehr3c6y47u7ypfmr7ijv67mv
==> Installing sbndaq-artdaq-core-migration-rbjmzxbn4oyq7w5apv7z2rmpmi6k76ej [163/171]
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
==> No patches needed for sbndaq-artdaq-core
==> sbndaq-artdaq-core: Executing phase: 'cmake'
==> sbndaq-artdaq-core: Executing phase: 'build'
==> sbndaq-artdaq-core: Executing phase: 'install'
==> sbndaq-artdaq-core: Successfully installed sbndaq-artdaq-core-migration-rbjmzxbn4oyq7w5apv7z2rmpmi6k76ej
  Stage: 0.00s.  Cmake: 2.80s.  Build: 11.45s.  Install: 1.14s.  Post-install: 0.21s.  Total: 18.46s
[+] /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack_packages/[padded-to-255-chars]/sbndaq-artdaq-core/migration/linux-almalinux9-x86_64_v2-gcc-13.1.0-rbjmzxbn4oyq7w5apv7z2rmpmi6k76ej
[+] /daq/software/spack_packages/artdaq-core-demo/v1_11_00/linux-almalinux9-x86_64_v2-gcc-13.1.0-vuzhu2h5dcspxdodxrztvzmz7hebrjm4
[+] /daq/software/spack_packages/artdaq-epics-plugin/v1_06_00/linux-almalinux9-x86_64_v2-gcc-13.1.0-yh5p3xzfu3lmie2kg2tsgqwig66mtbfa
[+] /daq/software/spack_packages/artdaq/v3_13_02/linux-almalinux9-x86_64_v2-gcc-13.1.0-k4kpl6mtnkej6cik62jlexeto7dm57uc
==> Installing sbndaq-artdaq-migration-dezbi4mqj232afl5ojbshf3uu6rzvbd2 [167/171]
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
==> No patches needed for sbndaq-artdaq
==> sbndaq-artdaq: Executing phase: 'cmake'
==> sbndaq-artdaq: Executing phase: 'build'
==> sbndaq-artdaq: Executing phase: 'install'
==> sbndaq-artdaq: Successfully installed sbndaq-artdaq-migration-dezbi4mqj232afl5ojbshf3uu6rzvbd2
  Stage: 0.00s.  Cmake: 8.25s.  Build: 1m 47.78s.  Install: 0.66s.  Post-install: 0.69s.  Total: 2m 1.64s
[+] /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack_packages/[padded-to-255-chars]/sbndaq-artdaq/migration/linux-almalinux9-x86_64_v2-gcc-13.1.0-dezbi4mqj232afl5ojbshf3uu6rzvbd2
[+] /daq/software/spack_packages/artdaq-demo/v3_13_00/linux-almalinux9-x86_64_v2-gcc-13.1.0-opwlpsg7v7nfsyvql54mtp7xxmdyvexw
==> Installing sbndaq-migration-jidd7q6b62jdxmuwhaowd4qlo7cjq72b [169/171]
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
==> No patches needed for sbndaq
==> sbndaq: Executing phase: 'cmake'
==> sbndaq: Executing phase: 'build'
==> sbndaq: Executing phase: 'install'
==> sbndaq: Successfully installed sbndaq-migration-jidd7q6b62jdxmuwhaowd4qlo7cjq72b
  Stage: 0.00s.  Cmake: 7.40s.  Build: 0.21s.  Install: 0.15s.  Post-install: 1.16s.  Total: 13.61s
[+] /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack_packages/[padded-to-255-chars]/sbndaq/migration/linux-almalinux9-x86_64_v2-gcc-13.1.0-jidd7q6b62jdxmuwhaowd4qlo7cjq72b
[+] /daq/software/spack_packages/artdaq-suite/v3_13_02/linux-almalinux9-x86_64_v2-gcc-13.1.0-ftpwdfmjqyer64qxq2axawcoelwsf2tu
==> Installing sbndaq-suite-migration_artdaqv3_13_02-xonb5fxrfjoxsfzphrwtlh3eloi7zifq [171/171]
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
source /daq/software/spack_packages/trace/v3_17_11/linux-almalinux9-x86_64_v2-gcc-13.1.0-qnszr2ru3dwz6juznj2xjr54elkmrv36/bin/trace_functions.sh
==> No patches needed for sbndaq-suite
==> sbndaq-suite: Executing phase: 'install'
==> sbndaq-suite: Successfully installed sbndaq-suite-migration_artdaqv3_13_02-xonb5fxrfjoxsfzphrwtlh3eloi7zifq
  Stage: 0.00s.  Install: 0.00s.  Post-install: 0.19s.  Total: 4.67s
[+] /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack_packages/[padded-to-255-chars]/sbndaq-suite/migration_artdaqv3_13_02/linux-almalinux9-x86_64_v2-gcc-13.1.0-xonb5fxrfjoxsfzphrwtlh3eloi7zifq
==> Updating view at /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132/.spack-env/view
[DEBUG] Build succeeded - creating buildcache
[INFO] Creating buildcache at: DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack_mirrors/sbndaq-suite/migration_artdaqv3_13_02
[CMD] spack find -lpd sbndaq-suite@migration_artdaqv3_13_02 s=132 cxxstd=20 arch=linux-almalinux9-x86_64_v2 %gcc@13.1.0
[CMD] spack buildcache push --unsigned --only package DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack_mirrors/sbndaq-suite/migration_artdaqv3_13_02 sbndaq-suite@migration_artdaqv3_13_02 /xonb5fx
==> Pushed sbndaq-suite@migration_artdaqv3_13_02/xonb5fx
[CMD] spack buildcache push --unsigned --only package DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack_mirrors/sbndaq-suite/migration_artdaqv3_13_02 sbndaq@migration /jidd7q6
==> Pushed sbndaq@migration/jidd7q6
[CMD] spack buildcache push --unsigned --only package DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack_mirrors/sbndaq-suite/migration_artdaqv3_13_02 sbndaq-artdaq@migration /dezbi4m
==> Pushed sbndaq-artdaq@migration/dezbi4m
[CMD] spack buildcache push --unsigned --only package DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack_mirrors/sbndaq-suite/migration_artdaqv3_13_02 sbndaq-artdaq-core@migration /rbjmzxb
==> Pushed sbndaq-artdaq-core@migration/rbjmzxb
[CMD] spack buildcache push --unsigned --only package DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack_mirrors/sbndaq-suite/migration_artdaqv3_13_02 wibtools@migration /i7ewgeu
==> Pushed wibtools@migration/i7ewgeu
[INFO] Updating buildcache index...
[CMD] spack buildcache update-index DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/spack_mirrors/sbndaq-suite/migration_artdaqv3_13_02
[INFO] Listing packages in buildcache...
[CMD] spack buildcache list -lva sbndaq-suite@migration_artdaqv3_13_02
==> 1 cached build.
-- linux-almalinux9-x86_64_v2 / gcc@13.1.0 ----------------------
xonb5fx sbndaq-suite@migration_artdaqv3_13_02~gdb+icarus+sbnd build_system=bundle cxxstd=20 s=132
[INFO] Commands log saved to: /home/artdaq/DAQ_SPACK_DevAreas/DAQ_2025-06-04_ALICE_migration_artdaqv3_13_02/almalinux9-gcc13.1.0-c++20-s132/spack_commands-20250604-234526.txt
[SUCCESS] Setup completed successfully
[DEBUG] Running cleanup functions
[DEBUG] Removing temporary files
[DEBUG] Closing open file handles
```
