#!/bin/bash

# create a basic relase note page for a sbndcode release

# Subsidiary packages to be checked, These must be in order.
declare -a packages=(sbndcode)
declare -a extra_packages=()
declare -a util_packages=(sbndutil)
declare -a obj_packages=()

function get_working_dir() 
{
    cd ${currentDir}
    if [ -d ${working_dir}/${sbndcode_version} ]; then
            echo "ERROR: ${working_dir}/${sbndcode_version} already exists!"
            exit 5
    fi
    mkdir -p ${working_dir}/${sbndcode_version}
    # git the full path
    ( cd / ; /bin/pwd -P ) >/dev/null 2>&1
    if (( $? == 0 )); then
      pwd_P_arg="-P"
    fi
    my_working_dir=`cd ${working_dir}/${sbndcode_version} && /bin/pwd ${pwd_P_arg}`
}

function get_package_release()
{
  local pkg=$1
  pv=`grep    -e '^[  ]*'"$pkg"'[   ]\{1,\}' ${my_working_dir}/${last_pkg}/ups/product_deps | \
   sed -e 's/^[   ]*'"$pkg"'[   ]\{1,\}\(v[^  ]*\).*$/\1/'`
  if [[ -n "$pv" ]]; then
    echo "Found $package tag $pv corresponding to sbndcode tag $sbndcode_version."
  else
    echo "INFO: Could not find tag for package $package corresponding to sbndcode tag $sbndcode_version." 1>&2
    continue
  fi
  set -x
  cd ${my_working_dir}
  git clone https://github.com/SBNSoftware/${pkg} || { echo "ERROR: failed to clone ${pkg}"; exit 1; }
  cd ${my_working_dir}/${pkg}
  git checkout ${pv}
  relver=`grep '^[  ]*parent' ${my_working_dir}/${pkg}/ups/product_deps | tr "\t" " " | cut -f3 -d" "`
  echo >> ${relnote}
  echo "h2. ${pkg} ${relver}" >> ${relnote}
  echo >> ${relnote}
  git log --pretty=format:"* %ad  %an : %s" --date=short ${previous_version_string}..${relver} >> ${relnote}
  echo >> ${relnote}
  cd ${my_working_dir}
  set +x
}

function get_util_release()
{
  local pkg=$1
  set -x
  cd ${my_working_dir}
  git clone https://github.com/SBNSoftware/${pkg} || { echo "ERROR: failed to clone ${pkg}"; exit 1; }
  cd ${my_working_dir}/${pkg}
  relver=`grep '^[  ]*parent' ${my_working_dir}/${pkg}/ups/product_deps | tr "\t" " " | cut -f3 -d" "`
  echo >> ${relnote}
  echo "h2. ${pkg} ${relver}" >> ${relnote}
  echo >> ${relnote}
  git log --pretty=format:"* %ad  %an : %s" --date=short ${previous_util_version}..${relver} >> ${relnote}
  echo >> ${relnote}
  cd ${my_working_dir}
  set +x
}

################################################################################

prog=${0##*/}

function usage() {
    cat 1>&2 <<EOF

${prog} --help|-h|-\?
${prog} <working_directory> <tag> <previous tag>
EOF
}

getopt -T >/dev/null 2>&1
if (( $? != 4 )); then
  echo "ERROR: GNU getopt required! Check SETUP_GETOPT and PATH." 1>&2
  exit 1
fi

TEMP=`getopt -n "$prog" -o ':h\?' --long help -- "${@}"`
currentDir=${PWD}

eval set -- "$TEMP"
while true; do
  case $1 in
    --help|-h|-\?)
      usage
      exit 1
      ;;
    --)
      shift
      break
      ;;
    *)
      echo "Bad argument \"$1\"" 1>&2
      usage
      exit 1
  esac
done

[[ -z "$1" ]] && { 
  echo "Require working directory as non-option argument" 1>&2; usage; exit 1; }
[[ -z "$2" ]] && { echo "Require existing sbndcode tag as non-option argument" 1>&2; usage; exit 1; }
[[ -z "$3" ]] && { echo "Require previous sbndcode tag as non-option argument" 1>&2; usage; exit 1; }

working_dir=$1
sbndcode_version=$2
previous_version=$3
previous_util_version=$3

# create ${working_dir}/${sbndcode_version}
get_working_dir

today=`date '+%d %b %Y'`
dotver=`echo ${sbndcode_version} | sed -e 's%_%.%g'`
version_string=`echo ${sbndcode_version} | sed -e 's/_//g' | sed -e 's/^v//'`

previous_version_string=${previous_version}
if [[ ${previous_version} == *_rc* ]]; then
  echo "${previous_version} is a release candidate"
  previous_version_string=${previous_version}
fi

relnote=${my_working_dir}/ReleaseNotes-${sbndcode_version}
rm -f ${relnote}
echo "---" > ${relnote}
echo "layout: page" >> ${relnote}
echo "title: ReleaseNotes${version_string}" >> ${relnote}
echo "---" >> ${relnote}
echo >> ${relnote}
echo "-----------------------------------------------------------------------------" >> ${relnote}
echo "| ${dotver} | ${today} | [ReleaseNotes](ReleaseNotes${version_string}.html) |" >> ${relnote}
echo "| --- | --- | --- |" >> ${relnote}
echo >> ${relnote}
echo >> ${relnote}
echo >> ${relnote}
echo "sbndcode ${sbndcode_version} Release Notes" >> ${relnote}
echo "=======================================================================================" >> ${relnote}
echo >> ${relnote}
echo "-   **Table of contents**" >> ${relnote}
echo "-   [sbndcode ${sbndcode_version} Release Notes]" >> ${relnote}
echo "    -   [Purpose]" >> ${relnote}
echo "    -   [New features]" >> ${relnote}
echo "    -   [Bug fixes]" >> ${relnote}
echo "    -   [Updated dependencies]" >> ${relnote}
echo "-   [Change List]" >> ${relnote}
echo "    -   [sbndcode v08\_51\_00]" >> ${relnote}
echo "    -   [sbndutil v08\_51\_00]" >> ${relnote}
echo >> ${relnote}
echo "[List of sbndcode releases](List_of_SBND_code_releases.html)" >> ${relnote}
echo "Download instructions for [sbndcode ${sbndcode_version}](http://scisoft.fnal.gov/scisoft/bundles/sbnd/${sbndcode_version}/sbndcode-${sbndcode_version}.html)" >> ${relnote}
echo >> ${relnote}
echo "Purpose" >> ${relnote}
echo "---------------------------------------------------" >> ${relnote}
echo >> ${relnote}
echo "New features" >> ${relnote}
echo "---------------------------------------------------" >> ${relnote}
echo >> ${relnote}
echo "Bug fixes(Bug-fixes)" >> ${relnote}
echo "---------------------------------------------------" >> ${relnote}
echo >> ${relnote}
echo "Updated dependencies" >> ${relnote}
echo "---------------------------------------------------" >> ${relnote}
echo >> ${relnote}
echo "Change List" >> ${relnote}
echo "==========================================" >> ${relnote}
echo >> ${relnote}

set -x
cd ${my_working_dir}
pkg=sbndcode
git clone https://github.com/SBNSoftware/${pkg} || { echo "ERROR: failed to clone ${pkg}"; exit 1; }
cd ${my_working_dir}/${pkg}
git checkout ${sbndcode_version}
relver=`grep '^[  ]*parent' ${my_working_dir}/${pkg}/ups/product_deps | tr "\t" " " | cut -f3 -d" "`
echo "${pkg} ${relver}" >> ${relnote}
echo "---------------------------------------------------" >> ${relnote}
echo >> ${relnote}
git log --pretty=format:"* %ad  %an : %s" --date=short ${previous_version_string}..${larsoft_version} >> ${relnote}
echo >> ${relnote}
cd ${my_working_dir}
set +x
last_pkg=sbndcode

for package in "${extra_packages[@]}"; do
  last_pkg=sbndcode
  get_package_release ${package}
done
last_pkg=sbndcode

for package in "${packages[@]}"; do
  get_package_release ${package}
  last_pkg=${package}
done

for package in "${obj_packages[@]}"; do
  get_util_release ${package}
done

for package in "${util_packages[@]}"; do
  get_util_release ${package}
done
