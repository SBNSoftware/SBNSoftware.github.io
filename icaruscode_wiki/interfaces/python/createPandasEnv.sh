#! /usr/bin/env bash
#
# Usage:  createPandasEnv.sh [WorkingAreaPath]
# 
# If not specified, the area is created in the current directory.
# 

# will install via pip the following "additional" Python modules:
declare -a PythonModules=(
  'urllib3<2' # urllib3 v2 requires a OpenSSL newer than the one installed with SLF 7
  'numpy' 'matplotlib' 'pandas'
  'tables' # PyTables: required by Pandas to support HDF5 I/O
  'jupyter-server' 'notebook' 'nbconvert'
  )

declare WorkDir="${1:-.}"

echo "Creating a new Python environment in '${WorkDir}'"

python -m venv --upgrade-deps "$WorkDir" || exit $?

# let's enter the environment immediately, before installing the modules
source "${WorkDir}/bin/activate" || exit $?
pip --require-virtualenv install "${PythonModules[@]}" || exit $?

cat <<EOM

New Python environment created in '${WorkDir}'.
Run \`source '${WorkDir}/bin/activate'\` to activate it.

EOM

