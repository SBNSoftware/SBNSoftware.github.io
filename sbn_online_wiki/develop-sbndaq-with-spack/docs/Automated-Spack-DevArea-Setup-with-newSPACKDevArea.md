#### Slide 1
### Automated DevArea Setup with newSPACKDevArea.sh

#### Slide 2
### Rationale: Addressing the Dual-OS Challenge

* Standard Spack use case: Single OS variant for development/running.
  * SBNDAQ requires two OS variants: AlmaLinux 9 & Scientific Linux 7.
  * Hardware/software dependencies enforce this need.
* Current Spack environments: Limited to one OS variant.
  * Requires two separate Spack environments for SBNDAQ.
  * Synchronizing settings between two environments is impractical.
* Project Solution: Shared directories outside environment.
  * `srcs`, `spack_packages`, `spack_mirrors`, `spack-repos`, `DAQInterface` are shared.
  * Environment-specific configs remain separate.
  * Helper script activates OS-specific environment at runtime.

#### Slide 3
### Automated DevArea Setup with newSPACKDevArea.sh
* Based on Spack Development Tutorial guidelines.
  * Automates SBNDAQ environment setup for AL9 and SL7.
  * Uses shared Spack installation (`/daq/software/spack_packages/spack/v1.0.1.sbnd`).
  * Minimizes rebuilds of approximately 200 dependent packages (saves ~8 hours).
* Script workflow:
  * Creates OS-specific directory structure.
  * Adds Spack configs (install location, upstream repo overrides).
  * Downloads SBNDAQ source code to `./srcs`.
  * Executes build, installation, and creates Spack build caches.
* Configuration via `newSPACKDevArea.env` file.
  * Specifies project directory, packages to checkout, build options (s-qual, GCC, C++ standard).

#### Slide 4
### Customization with Command Line Options
* `newSPACKDevArea.sh` accepts several command line options.
  * `--dev-name NAME`: Sets developer identifier for directory name (default 'ALICE').
  * `--default-version VER`: Specifies a particular version of `sbndaq-suite`.
  * `--non-interactive`: Runs script without user prompts (default false).
  * `--config FILE`: Provides a specific path for the configuration file.
  * `-h`, `--help`: Displays usage message and exits.
* Environment Variable Override: `MY_SPACK_PROJECT`.
  * Setting this variable overrides DevArea name, e.g DAQ_2025-06-04_ALICE_sbndaq_v1_11_00
  * If target directory exists, script skips config/source setup.
  * Proceeds directly to building, installing, and cache creation.

#### Slide 5
### Spack Project Directory Structure Explained
* Structure accommodates dual-OS requirement (AL9/SL7).
  * Addresses use case not fully supported by standard single-OS Spack.
  * Key directories shared outside individual environment folders.
  * Requires specific Spack activation approach via helper script.
* Spack Environment (`./almalinux9-gcc13.1.0-c++20-s132`):
  * Contains `spack.yaml`, `spack.lock` for AL9, GCC 13.1.0, C++20.
  * Corresponding directory exists for SL7 environment configuration.
* [MPD](https://github.com/FNALssi/spack-mpd) `./spack-repos/mpd`:
  * Custom repository for SBNDAQ development using the MPD extension.
* Development Sources (`./srcs`):
  * Contains SBNDAQ package sources (`sbndaq`, `sbndaq-artdaq`, etc.).
  * All on same feature branch (`feature/upgrade_gcc13.1.0`) for coherent development.

#### Slide 6
### Activating Your SBNDAQ Project Area
* SBNDAQ structure designed for AL9/SL7 duality.
  * Shared directories require specific activation method.
  * Bash script handles environment setup and activation.
* Activation script steps:
  * Sets and exports `MY_SPACK_PROJECT` variable.
  * Designates development area path (e.g., `${HOME}/DAQ_SPACK_DevAreas`).
  * Sources main Spack setup script.
* Configuration handling:
  * Temporarily disables local Spack user config.
  * Sets a specific user configuration path.
* [Final activation](https://sbnsoftware.github.io/sbn_online_wiki/develop-sbndaq-with-spack/docs/setup_project_05.html):
  * Navigates to the OS-specific development directory (`my-$(os-name.sh)-env`).
  * Executes `spack env activate .` within that directory.

#### Slide 7
### Walkthrough: Setting Up with newSPACKDevArea.sh (Part 1)
* Setup located in `${HOME}/DAQ_SPACK_DevAreas`.
  * Uses `newSPACKDevArea.sh` script.
  * Script path: `${SPACK_HOME_DIR}/sbndaq-spack-tools`.
* Ensure script is in your `${PATH}`.
  * Verify with `which newSPACKDevArea.sh`.
  * If `not found`, add path: `export PATH=${SPACK_HOME_DIR}/sbndaq-spack-tools:${PATH}`.
* Script uses command line options and `newSPACKDevArea.env` config.
  * Recommended to review config file periodically.
  * Location logic: `./`, `${HOME}/DAQ_SPACK_DevAreas`, `~/`, script directory.
  * Default file created in `./` if not found.
  * `--config FILE` option takes precedence over `MY_CONFIG_FILE` env var.

#### Slide 8
### Walkthrough: Customizing Setup & Prompts (Part 2)
* Share `${HOME}/DAQ_SPACK_DevAreas` among developers recommended.
  * Use `DEVNAME` variable for ownership identification.
  * `DEVNAME` in `newSPACKDevArea.env`: 4-5 char, UPPER case initials/name.
  * Can override with `--dev-name ALICE` command line option.
  * Keeping `newSPACKDevArea.env` updated is practical.
* `--default-version VERSION` option.
  * Specifies `sbndaq-suite` version (e.g., `migration_artdaqv3_13_02`, `sbndaqv1_11_00`).
  * Version *must* be declared in `package.py` in the `sbn-spack` repo.
  * Omitting option prompts for version (default + 10s timeout).
  * `--non-interactive` accepts default immediately.

#### Slide 9
### Walkthrough: Understanding Script Prompts (Part 3)
* Script may ask questions during execution.
  * `--non-interactive` option accepts defaults automatically.
* Prompt 1: `Build already succeeded - skip build? (Y/n):`
  * Appears if `*.build_lock.txt` found from previous successful build.
  * Default is `Y` (Yes), allows skipping rebuilds.
  * `n` initiates rebuild/install.
* Prompt 2: `Directory ... exists. Delete it? [y/N]:`
  * Appears if target dev area directory exists.
  * Default is `N` (No), avoids deletion.
  * Continues by creating missing configs or proceeding to build.
* Prompt 3: `Do you want to set up the development environment? [Y/n]:`
  * Appears after Prompt 2 answer `N`, if Spack environment is missing.
  * Common if running on different OS variant, interrupted build, etc.
  * Default is `Y` (Yes), generally advisable to proceed.

#### Slide 10
### Troubleshooting and Rerunning Builds
* Build failures require log review.
  * Examine build log files to pinpoint errors.
  * Make necessary code changes to resolve issues.
* Rerunning `newSPACKDevArea.sh` after code fixes.
  * Key step: Export `MY_SPACK_PROJECT` variable first.
  * Example: `export MY_SPACK_PROJECT=DAQ_2025-06-03_ALICE_migration_artdaqv3_13_02`.
  * This prevents the script from asking to delete the existing directory.
  * Script will then resume the process, typically starting the build again.

#### Slide 11
### Entering Interactive Build Mode (Part 1)
* Script enters interactive mode on build failure.
  * Allows quick iteration on compilation errors.
  * Presents list of packages that failed or need building.
* Example interactive prompt:
  ```bash
  [WARN] Build failed - entering interactive build mode
  Available packages:
  1. sbndaq@upgrade_gcc13.1.0
  2. sbndaq-artdaq@upgrade_gcc13.1.0
  ...
  0. Exit interactive build mode
  Select package to build (0-4):
  ```
* Select package number to troubleshoot/rebuild.
  * Entering '2' selects `sbndaq-artdaq` in this example.
  * Script prepares an interactive build environment for selected package.

#### Slide 12
### Working within Interactive Build Mode (Part 2)
* After selecting a package, script prepares environment.
  * Enters a dedicated interactive shell.
  * Shell environment is configured for the selected package build.
* Example commands shown by script:
  ```bash
  [INFO] Entering build environment for sbndaq-artdaq
  [INFO] Available commands in build environment:
  [INFO]   make    # Build the package
  [INFO]   exit 0  # Exit build environment
  [CMD] spack cd --build-dir sbndaq-artdaq
  [CMD] spack build-env sbndaq-artdaq -- bash
  ```
* Primary command inside: `make`.
  * Run `make` to attempt building the package.
  * Examine `make` output for specific errors.
  * Directly modify problematic source files in shared `./srcs`.

#### Slide 13
### Exiting Interactive Mode and Continuing (Part 3)
* Resolve errors and successfully build package using `make`.
  * Type `exit` to leave the interactive build shell.
* Script prompts upon exiting interactive shell.
  * `Did the build succeed? (y/N):`
  * Respond `n` (No) to continue rebuilding other packages if needed.
  * Respond `y` (Yes) once all necessary packages are built.
  * Answering `y` exits the overall interactive *session*.
* Final script prompt: `Continue with buildcache creation? (Y/n):`
  * Answer `y` if builds were successful to create caches.
  * Answer `n` to exit script without creating caches.
* Script exits, can be restarted later.

#### Slide 14
### Spack Build Cache Mirror (`spack_mirrors`)
* Directory: `./spack_mirrors`.
  * Located outside individual OS environment directories (shared).
* Contains Spack build cache mirror.
  * Stores precompiled binary packages (`.spack` files).
  * Includes associated metadata (`.spec.json` files).
* Purpose: Facilitates faster rebuilds.
  * Provides binaries for dependencies.
  * Reduces need to compile packages from source repeatedly.
* Specific to architecture/compiler/OS.
  * Contains caches for AlmaLinux 9 x86_64.

#### Slide 15
### Upcoming Enhancements: MPD Integration
* MPD functionality integration is in progress.
  * [MPD](https://github.com/FNALssi/spack-mpd) framework.
  * Being integrated into the build process.
* Expected benefits:
  * Expedite rebuilding during active development.
  * Potentially improves efficiency for iterative code changes.
* Stay tuned for updates.
