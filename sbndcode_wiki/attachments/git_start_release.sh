cd "$MRB_SOURCE" || exit 1

# 3. Logic Gate for Repository Checkouts
case $MODE in
    "prod")
        echo "--> Setting up PRODUCTION release using branch: $PROD_BRANCH"

        mrb g https://github.com/SBNSoftware/sbndcode
        cd "$MRB_SOURCE/sbndcode" || exit 1

        # Track the remote production branch locally
        git checkout "$PROD_BRANCH"

        # Pre-configure git flow to use production branch as 'develop' and master as 'master'
        git config gitflow.branch.master "$PROD_BRANCH-master"
        git config gitflow.branch.develop "$PROD_BRANCH"

        # Initialize non-interactively using default flags
        git flow init -d
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

