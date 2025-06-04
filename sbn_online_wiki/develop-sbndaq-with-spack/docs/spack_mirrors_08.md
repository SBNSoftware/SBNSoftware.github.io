## **spack_mirrors** directory listing

This is a Spack build cache mirror containing precompiled binary packages for the SBNDAQ software suite's artDAQ v3.13.02 migration. It stores `.spack` binary files and `.spec.json` metadata for the AlmaLinux 9 x86_64 architecture using the GCC 13.1.0 compiler.

```bash
───────────────────────────────────────────────────────────────────────────────────────────────────
$ pwd
${HOME}/DAQ_SPACK_DevAreas/DAQ_2025-06-03_EFG2_migration_artdaqv3_13_02/spack_mirrors

$ exa --tree --level 7
└── sbndaq-suite
   └── migration_artdaqv3_13_02
      └── build_cache
         ├── index.json
         ├── index.json.hash
         ├── linux-almalinux9-x86_64_v2
         │  └── gcc-13.1.0
         │     ├── sbndaq-artdaq-core-migration
         │     │  └── linux-almalinux9-x86_64_v2-gcc-13.1.0-sbndaq-artdaq-core-migration-3uizsxwd4j
         │     ├── sbndaq-artdaq-migration
         │     │  └── linux-...3.1.0-sbndaq-artdaq-migration-jqsa5jy2wc4lirrgmtwnes7ben6htjge.spack
         │     ├── sbndaq-migration
         │     │  └── linux-almalinux9-x8...sbndaq-migration-4pqf6pn33ukjsirb4pho2bzcp66uvl7u.spack
         │     ├── sbndaq-suite-migration_artdaqv3_13_02
         │     │  └── linux-almalinux9-x86_64_v2-gcc-13.1.0-sbndaq-suite-...qvb2bt7j7gcozgjkw.spack
         │     └── wibtools-migration
         │        └── linux-almalinux9-x86_64_v2-gcc-13.1.0-wibtools-migration-lc...zhcnooufd.spack
         ├── linux-almalinux9-x86_64_v2-gcc-13.1.0-sbndaq-artdaq-core-migration...rh3ysud.spec.json
         ├── linux-almalinux9-x86_64_v2-gcc-13.1.0-sbndaq-artdaq-migration-jqsa5jy...tjge.spec.json
         ├── linux-almalinux9-x86_64_v2-gcc-13.1.0-sbndaq-migration-4pqf6pn33ukjsi...vl7u.spec.json
         ├── linux-almalinux9-x86_64_v2-gcc-13.1.0-sbndaq-suite-migration_artdaqv3_1...kw.spec.json
         └── linux-almalinux9-x86_64_v2-gcc-13.1.0-wibtools-migration-lcv3efcitbmz5m...fd.spec.json
───────────────────────────────────────────────────────────────────────────────────────────────────
```
