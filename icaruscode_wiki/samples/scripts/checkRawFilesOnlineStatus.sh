####################################################################
# script to check how many raw files are staged/cached/online      #
# based on the run number and stream name                          #
# written by: Maya Wospakrik                                       #
#                                                                  #
# Note:                                                            #
# We have 8 streams from run 8460:                                 #
# bnbmajority, bnbminbias, numimajority, numiminbias,              #
# offbeambnbmajority, offbeambnbminbias, offbeamnumimajority,      # 
# offbeamnumiminbias                                               #
#                                                                  #
# We have 4 streams before run 8460:                               #
# bnb, numi, offbeambnb, offbeamnumi                               #
#                                                                  #
# Note that we also have the 'unknown' stream which isn't          #
# considered in the keepup processing, but this will be included   #
# in the accounting of the stream 'all' input arguments            #
#                                                                  #
# How to run the script:                                           #
# sh checkRawFilesOnlineStatus.sh -r <run number> -s <stream name> #
#                                                                  #
# e.g. sh checkRawFilesOnlineStatus.sh 8460 bnbmajority            #
####################################################################

#! /bin/bash

############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "To run checkRawFilesOnlineStatus.sh script."
   echo
   echo "Syntax: sh checkRawFilesOnlineStatus.sh [-r -s -l -L | -h ]"
   echo "options:"
   echo "r     Enter run number. Default is run 8460."
   echo "s     Enter stream name. Default is 'all'."
   echo "l     (optional) Enter file to write the list of available files in."
   echo "L     (optional) Enter file to write the list of unavailable files in."
   echo "h     Print this Help menu."
   echo
}

############################################################
# Process the input options.                               #
############################################################

# Set variables
run=8460
stream=all
availableList=''
notAvailableList=''

# Get the options
while getopts ":hr:s:l:L:" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      r) # Enter a run number
         run=$OPTARG;;
      s) # Enter a stream name
         stream=$OPTARG;;
      l) # Enter a file name
         availableList=$OPTARG;;
      L) # Enter a file name
         notAvailableList=$OPTARG;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

# break run number into subfolders
runstr="$(printf '%08d' "$run")"
r1="${runstr: -8:2}"
r2="${runstr: -6:2}"
r3="${runstr: -4:2}"
r4="${runstr: -2:2}"

# if stream name is specified as all, use wildcard
if [[ "${stream}" == "all" ]]; then
  stream="*"
fi

# make sure that any temporary outputfiles are removed before appending the new ones
# might exist when script is not run to completion
if [[ -f "listtotalrawfiles.temp" ]]; then
    rm listtotalrawfiles.temp
    rm listofonlinefiles.temp
fi

# find files with the appropriate run number and stream
ArchiveDir="/pnfs/icarus/archive/sbn/sbn_fd/data/raw/${stream}/v1_01_00/icarus_daq_v1_01_00/daq/${r1}/${r2}/${r3}/${r4}"
if [[ ! -d "$ArchiveDir" ]]; then
	echo "The archive directory for run ${run} stream ${stream} does not exist... presumably no file is staged."
	echo "The directory is: '${ArchiveDir}'."
	exit 1
fi

find "$ArchiveDir" -type f -name "data*.root" | awk -Fdata_dl '{print "data_dl"$2}' >& listtotalrawfiles.temp

# count total available files on tape area
n_total=`wc -l listtotalrawfiles.temp | awk '{print $1}'`

[[ -n "$availableList" ]] && [[ -r "$availableList" ]] && rm -f "$availableList"
[[ -n "$notAvailableList" ]] && [[ -r "$notAvailableList" ]] && rm -f "$notAvailableList"

# check if files online
for f in `cat listtotalrawfiles.temp`; do 
	cat "${ArchiveDir}/.(get)(${f})(locality)" | grep ONLINE >> listofonlinefiles.temp
	if [[ $? == 0 ]]; then
		if [[ -n "$availableList" ]]; then
			echo "${ArchiveDir}/${f}" >> "$availableList"
		fi
	else
		if [[ -n "$notAvailableList" ]]; then
			echo "${ArchiveDir}/${f}" >> "$notAvailableList"
		fi
	fi
done

# count how many are online
n_online=`wc -l listofonlinefiles.temp | awk '{print $1}'`

# translate back the stream name
if [[ "${stream}" == "*" ]]; then
  stream="all"
fi

# print result
echo "Online files for run number: ${run} and stream name: ${stream}: ${n_online} files out of available ${n_total} files"

if [[ -n "$availableList" ]]; then
	echo "List of available files written into '${availableList}'."
fi
if [[ -n "$notAvailableList" ]]; then
	echo "List of unavailable files written into '${notAvailableList}'."
fi

# clear the temporary output files
rm listtotalrawfiles.temp
rm listofonlinefiles.temp
