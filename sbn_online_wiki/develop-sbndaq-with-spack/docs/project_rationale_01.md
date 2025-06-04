## Rationale

This project departs from the conventional Spack development use case, which typically involves a single OS variant for development and execution. For SBNDDAQ, this is not feasible. Hardware/software dependencies necessitate the use of two Linux OS variants: AlmaLinux 9 (AL9) and Scientific Linux 7 (SL7). As of 06/25, Spack environments are limited to a single OS variant. Consequently, two Spack environments are required to support the SBNDDAQ use case: one for AL9 and one for SL7. Managing two such environments necessitates synchronizing settings, which is impractical. This project addresses this challenge. While retaining the two-environment concept, the project structure is designed to place the `srcs`, `spack_packages`, `spack_mirrors`, `spack-repos`, and `DAQInterface` directories outside the individual Spack environment directories. These shared directories are located one level above the respective Spack environment directories. This approach allows sharing all files between the two environments, with the exception of environment-specific configurations. During runtime, a helper script executes `cd my-$(os-name.sh)-env && spack env activate .` to activate the OS-specific environment.

### Example of the project structure that supports two OSes

```bash
─────────────────────────────────────────────────────────────────────────────────────────
│  # Two OS-specific environments
├── almalinux9-gcc13.1.0-c++20-s132    # AlmaLinux 9 (AL9)
├── scientific7-gcc13.1.0-c++20-s132   # Scientific Linux 7
│ # Shared sources and project configuration files
├── DAQInterface -> ./srcs/sbndaq/sbn-fd/DAQInterface2
├── spack
├── spack-repos
├── spack_mirrors
├── spack_packages
└── srcs
─────────────────────────────────────────────────────────────────────────────────────────
```
