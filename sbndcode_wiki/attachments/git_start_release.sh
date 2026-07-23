#!/bin/bash

# --- Usage Instructions ---
# ./release_script.sh <version> [mode] [prod_branch]
# Modes: 
#    prod : Sets up sbndcode off a production branch (Default branch: sbnd-gen2)
#    util : Sets up sbndcode AND sbndutil off develop
#    base : (Default) Standard sbndcode setup off develop
#
# Examples:
#    ./release_script.sh v09_82_00 prod                  # Uses production/sbnd-gen2
#    ./release_script.sh v09_82_00 prod sbnd-gen1        # Uses production/sbnd-gen1

VERSION=$1
MODE=${2:-"base"}                          # Defaults to "base"
PROD_BRANCH_NAME=${3:-"sbnd-gen2"}          # Defaults to "sbnd-gen2"
PROD_BRANCH="production/$PROD_BRANCH_NAME"

# 1. Validation
if [[ $VERSION != v* ]]; then
    echo "Error: Version must start with 'v' (e.g., v09_82_00)"
    echo " --- Usage Instructions ---"
    echo " ./release_script.sh <version> [mode] [prod_branch]"
    echo " Modes: "
    echo "    prod : Sets up sbndcode off production branch (default: sbnd-gen2)"
    echo "    util : Sets up sbndcode AND sbndutil"
    echo "    base : (Default) Standard sbndcode setup"
    exit 1
fi

export LARDIR="lardev-$VERSION"
INSTALL_PATH="/exp/sbnd/data/users/nrowe/ReleaseManagement/releases/$LARDIR"

if [ -d "$INSTALL_PATH" ]; then
    echo "Error: Directory $INSTALL_PATH already exists."
    exit 1
fi

# 2. Environment Setup
source /cvmfs/sbnd.opensciencegrid.org/products/sbnd/setup_sbnd.sh
mkdir -p "$INSTALL_PATH"
cd "$INSTALL_PATH" || exit 1

echo "Initializing mrb for $VERSION in $MODE mode..."
mrb newDev -v "$VERSION" -q e26:prof
source localProducts*/setup

cd "$MRB_SOURCE" || exit 1

# 3. Logic Gate for Repository Checkouts
case $MODE in
    "prod")
        echo "--> Setting up PRODUCTION release using branch: $PROD_BRANCH"

        mrb g https://github.com/SBNSoftware/sbndcode
        cd "$MRB_SOURCE/sbndcode" || exit 1

        # Track the remote production branch locally

        git checkout "$PROD_BRANCH-master"
        git checkout "$PROD_BRANCH"

        echo "--> Running git flow init"
        # Initialize non-interactively using default flags
        git flow init -d
        git branches -a
        echo "--> Configuring branches"
        # Pre-configure git flow to use production branch as 'develop' and master as 'master'
        git config gitflow.branch.master "$PROD_BRANCH-master"
        git config gitflow.branch.develop "$PROD_BRANCH"

        echo "--> Starting release"
        git flow release start "$VERSION"
        ;;

    "util")
        echo "--> Setting up UTIL + CODE release"

        mrb g https://github.com/SBNSoftware/sbndutil
        mrb g https://github.com/SBNSoftware/sbndcode

        # Initialize sbndutil
        cd "$MRB_SOURCE/sbndutil" || exit 1
        git flow init -d
        git flow release start "$VERSION"

        # Initialize sbndcode
        cd "$MRB_SOURCE/sbndcode" || exit 1
        git flow init -d
        git flow release start "$VERSION"
        ;;

    "base")
        echo "--> Setting up STANDARD release"

        mrb g https://github.com/SBNSoftware/sbndcode
        cd "$MRB_SOURCE/sbndcode" || exit 1
        git flow init -d
        git flow release start "$VERSION"
        ;;

    *)
        echo "Invalid mode. Use 'prod', 'util', or leave blank for base."
        exit 1
        ;;
esac

echo "-------------------------------------------------------"
echo "Setup complete. Workspace located at: $INSTALL_PATH"
echo "Remember to run 'mrbsetenv' before building."
