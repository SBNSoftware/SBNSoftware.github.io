# Release Management

## SBN Build instructions for an SBN software stack build


Helper scripts are kept as part of the sbnbuild repo(https://github.com/SBNSoftware/sbnbuild)
* `SBN/setup_build.sh` sets up local mrb area for testing a sbncode / SBN stack release build. Takes larsoft version number and qualifiers as argument.
* `SBN/setup_build_sbana.sh` sets up a local mrb area for testing a sbnana release build. Takes sbnana version number to use and qualifiers as argument.
* `SBN/copyToSciSoft_sbn.sh` pulls down from jenkins and pushes up to SciSoft the output of a successful release build for SBN software.
* `SBN/copyToSciSoft_sbnana.sh` pulls down from jenkins and pushes up to SciSoft the output of a successful release build for sbnana package.
* `ScisoftScripts` folder has copies of scripts from https://scisoft.fnal.gov/scisoft/bundles/tools/.

### Prepare release and test locally.

0. Login to one of the build nodes, move to a working area, and clone the sbnbuild repo.
1. Move into `sbnbuild` and do `source SBN/setup_build.sh <version> <quals>` where the version in the larsoft version, and the quals are a choice of quals for testing (e.g. `c7:debug`).
2. Do `mrb g <repo>` for the repositories that need to be updated. (Check release notes or use `ups active | grep lardataobj` to see if `lardataobj` has changed, and if you will need to change `sbnobj` or not).
3. For each repo, do `cd srcs/<repo>` and then `git flow init`. Use `main` as the 'production' branch, but use defaults for all the rest of the prompts.
4. In each repo, do `git flow release start vXX_YY_ZZ` where `vXX_YY_ZZ` is the new version number for this package. This will create a `release/vXX_YY_ZZ` in this repo based on `develop`.
5. Merge in any pull requests that were not already on develop. (E.g. `git merge origin/feature/username_MyImportantPR`.) Resolve any conflicts as needed.
6. Edit `ups/product_deps` to have the new version number (top of the file) and update versions of any dependencies (middle of file) as needed.
7. Commit all changes, and push up to the origin: `git commit -a -m 'my message'; git push origin release/vXX_YY_ZZ`
8. Do this for all needed repos.
9. Test locally: `cd $MRB_BUILDDIR; mrbsetenv; mrb i -j32; mrbslp`. Resolve any conflicts, and be sure to commit and push updates.

### Run build on Jenkins.
1. Login to buildmaster.fnal.gov (need to be on VNC and need to have certificate added), and go to the "sbn" tab.
2. Click on "sbn-release-build" (or just go here: https://buildmaster.fnal.gov/buildmaster/view/sbn/job/sbn-release-build/)
3. Click on "Build with Parameters" on the left, and modify the parameters as needed:
   - "SBN_VERSION" should be the version number of `sbncode` you are building.
   - "SBN", "SBNOBJ", "SBNANAOBJ", and "SBNDAQ_ARTDAQ_CORE" are the tags/branches/commits within those repositories that you want to build. If using the above this would be the appropriate `release/vXX_YY_ZZ` branch for that repository.
   - "SQUAL" is the matching s-qualifier for larsoft: see the Larsoft release notes (it doesn't change soo often).
4. Click the "Build" button, and make sure all build configs are successful. If one or more is unsuccessful, investigate by looking at the console output via jenkins webpage. Make updates in the code as necessary (in your local area), and commit/push them back up to the repo.

### Finalize the tag.
1. In your testing area, in each repo do `git flow release finish`. Make sure to include a message for the tag.
2. Do `git push origin main develop --tags` to push up the changes to main, develop, and the new tag.

### Distribute software.
#### SciSoft:
1. Create and empty directory (better in `data/` ) for each new release version for storing the trabals and manifests.
2. Fetch results of Jenkins from both e20 and c7 builds using

        perl copyFromJenkins -q e20 -q c7 sbn-release-build
from `ScisoftScripts` folder. This will fetch the build artifacts (tarballs and manifests, one per flavour).
3. Upload all files to scisoft

        perl copyToSciSoft *
(The script decides where to copy files based on name and type, the naming conventions from Jenkins should not be changed as they are understood by the script)

#### CVMFS:
1. Login to CVMFS: `ssh cvmfssbn@oasiscfs.fnal.gov`
2. Start a server transaction: `cvmfs_server transaction sbn.opensciencegrid.org`
3. Install the new software into cvmfs: `~/sbnbuild/CVMFS/install_on_cvmfs.sh sbn-XX.YY.ZZ` where `XX.YY.ZZ` is the sbncode version number (note dots instead of underscores!)
4. Publish the changes with a message and a tag: `cvmfs_server publish -m "Published sbn XX.YY.ZZ" -a XX.YY.ZZ sbn.opensciencegrid.org`

### Notify and distribute Release notes:
Send/post release notes (currently email/slack with changes) and let SBND and ICARUS release distributors know.

