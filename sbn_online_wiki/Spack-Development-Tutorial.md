# Spack Development Tutorial

This tutorial guides you through setting up a development environment using Spack. We'll cover setting up the Spack product repository, creating a new Spack environment, adding required packages, building and installing the environment, and optionally editing and building code. Finally, we’ll see how to deactivate the Spack environment and provide examples of interacting with Spack.

## Step 0: Setup Spack Product Repository

Before creating the Spack environment, you need to set up the Spack product repository which provides necessary tools and configurations.

```sh
source /daq/software/spack_packages/setup-env.sh
```

This command sources the `setup-env.sh` script located at `/daq/software/spack_packages/`. It sets up the paths and environment variables required for Spack to function correctly.

## Step 1: Create a Spack Environment

To begin, create a Spack environment. This environment will manage the software packages and dependencies required for your project.

```sh
spack env create --dir <my-dev-area> [<spack.lock>|<spack.yaml>]
```

- `<my-dev-area>`: Replace this with the path to your development area.
- `[<spack.lock>|<spack.yaml>]`: Optionally, specify a `spack.lock` or `spack.yaml` file to define the environment. The `spack.lock` file locks the versions of the packages, while the `spack.yaml` file defines the environment configuration.

If no configuration file is provided, Spack will create an empty environment.

## Step 2: Activate the Spack Environment

After creating the environment, activate it:

```sh
spack env activate --prompt --dir <my-dev-area>
```

- `--prompt`: Updates your shell prompt to indicate that you are inside a Spack environment.
- `--dir <my-dev-area>`: Specifies the path to the directory where the environment was created.

Activating an environment allows Spack to manage the packages and configurations specific to your development area.

## Step 3: Change to Your Development Directory

Navigate to your development directory:

```sh
cd <my-dev-area>
```

This step ensures your current working directory is the environment directory you created in step 1.

## Step 4: Add and Develop Packages

Add the `sbndaq-suite` package and its specific configuration, and set up the `sbndaq-artdaq` package for development:

```sh
spack add sbndaq-suite@v1_10_01 s=128 %gcc@12.2.0 arch=x86_64_v2
spack develop sbndaq-artdaq@v1_10_01
```

- `spack add sbndaq-suite@v1_10_01`: Adds the `sbndaq-suite` package version `v1_10_01` to the environment.
- `s=128`: Specifies the package variants or options.
- `%gcc@12.2.0`: Specifies the compiler to use (GCC version 12.2.0).
- `arch=x86_64_v2`: Specifies the target architecture.
- `spack develop sbndaq-artdaq@v1_10_01`: Marks the `sbndaq-artdaq` package version `v1_10_01` for development, meaning its source code will be added to the environment for easy editing.

## Step 5: Concretize the Environment

Concretization resolves and locks all the dependencies and configurations for the packages in your environment:

```sh
spack concretize -f
```

- `-f`: Forces re-concretization, even if the environment was previously concretized.

This step ensures that all dependencies are correct and compatible with your specified configuration.

## Step 6: Install the Environment

Install the environment with all its packages and dependencies:

```sh
spack install -j6
```

- `-j6`: Specifies the number of parallel jobs (`6` implies that six jobs will run in parallel) to speed up the installation process. Adjust this number based on your CPU capabilities for optimal performance.

This step may take some time depending on the number and size of the packages and their dependencies.

## Optional Step: Edit and Build Code

If you need to edit and build the code of a specific package, follow these steps:

1. Enter the build environment for the package:

    ```sh
    spack build-env sbndaq-artdaq -- bash
    ```

    This command sets up the environment variables and paths needed to build the package using Spack.

2. Run the `make` command to compile the package:

    ```sh
    make -j6
    ```

    The `-j6` option speeds up the build process by using six parallel jobs.

3. Exit the build environment:

    ```sh
    exit
    ```

## Step 7: Deactivate the Spack Environment

Exit the Spack environment to return to your default shell environment:

```sh
despacktivate
```

Alternatively, you can use:

```sh
spack env deactivate
```

This command deactivates the current Spack environment. Always remember to deactivate the environment to avoid conflicts with other projects or system-wide settings.

## Spack Command Examples

Here are some useful examples of interacting with Spack after setting up and working within the environment.

### Example 1: Find Installed Packages

To list all installed versions of the `sbndaq-suite` package with detailed information:

```sh
spack find -lpvf sbndaq-suite@v1_10_01
```

- `-l`: Displays package hashes.
- `-p`: Shows install paths.
- `-v`: Verbose output.
- `-f`: Display compiler flags.

### Example 2: Load a Package

To load the specified version of the `sbndaq-suite` package into your current shell environment:

```sh
spack load sbndaq-suite@v1_10_01 %gcc@12.2.0 s=128
```

- `%gcc@12.2.0`: Specifies the compiler version.
- `s=128`: Specifies the package variant.

### Example 3: Find Loaded Packages

To list all currently loaded Spack packages with detailed information:

```sh
spack find -ldvf --loaded
```

- `-l`: Displays package hashes.
- `-d`: Shows dependencies.
- `-v`: Verbose output.
- `-f`: Display compiler flags.
- `--loaded`: Restricts the output to currently loaded packages.

### Example 4: Unload All Packages

To unload all Spack-loaded packages from your current shell environment:

```sh
spack unload -a
```

- `-a`: Unloads all currently loaded packages.

By following these steps and examples, you should be able to create, manage, and develop within a custom Spack environment, enabling a smooth and efficient workflow for your software projects.
