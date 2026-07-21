#!/bin/bash

# --- Usage Instructions ---
# ./release_script.sh <version> [mode]
# Modes: 
#   prod : Sets up sbndcode with production/sbnd-gen2
#   util : Sets up sbndcode AND sbndutil
#   base : (Default) Standard sbndcode setup

VERSION=$1
MODE=${2:-"base"} # Defaults to base if no 2nd arg provided

# 1. Validation
if [[ $VERSION != v* ]]; then
    echo "Error: Version must start with 'v' (e.g., v09_82_00)"

echo " --- Usage Instructions ---"
echo " ./release_script.sh <version> [mode]"
echo " Modes: "
echo "   prod : Sets up sbndcode with production/sbnd-gen2"
echo "   util : Sets up sbndcode AND sbndutil"
echo "   base : (Default) Standard sbndcode setup"

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
cd "$INSTALL_PATH"

echo "Initializing mrb for $VERSION in $MODE mode..."
mrb newDev -v "$VERSION" -q e26:prof
source localProducts*/setup

cd "$MRB_SOURCE"

# 3. Logic Gate for Repository Checkouts
case $MODE in
    "prod")
        echo "--> Setting up PRODUCTION release"
        echo "--> Use production/sbnd-gen2-master for initial prompt"
        echo "--> Use production/sbnd-gen2 branch for second prompt"
        echo "--> Use defaults for everything else"
        mrb g https://github.com/SBNSoftware/sbndcode
        cd sbndcode
        git checkout production/sbnd-gen2
        git flow init
        git flow release start "$VERSION"
        ;;
    "util")
        echo "--> Setting up UTIL + CODE release"
        echo "--> Use master for initial prompt"
        echo "--> Use develop branch for second prompt"
        echo "--> Use defaults for everything else"
        mrb g https://github.com/SBNSoftware/sbndutil
        mrb g https://github.com/SBNSoftware/sbndcode

        # Initialize sbndutil
        cd "$MRB_SOURCE/sbndutil"
        git flow init -d
        git flow release start "$VERSION"

        # Initialize sbndcode
        cd "$MRB_SOURCE/sbndcode"
        git flow init -d
        git flow release start "$VERSION"
        ;;

    "base")
        echo "--> Setting up STANDARD release"
        echo "--> Use master for initial prompt"
        echo "--> Use develop branch for second prompt"
        echo "--> Use defaults for everything else"

        mrb g https://github.com/SBNSoftware/sbndcode
        cd sbndcode
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

