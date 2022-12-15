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
   echo "Syntax: sh checkRawFilesOnlineStatus.sh [-r -s | -h ]"
   echo "options:"
   echo "r     Enter run number. Default is run 8460."
   echo "s     Enter stream name. Default is 'all'."
   echo "h     Print this Help menu."
   echo
}

############################################################
# Process the input options.                               #
############################################################

# Set variables
run=8460
stream=all

# Get the options
while getopts ":hr:s:" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      r) # Enter a run number
         run=$OPTARG;;
      s) # Enter a stream name
         stream=$OPTARG;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

# break run number into subfolders
r1=`echo ${run:0:2}`
r2=`echo ${run:2:2}`

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
find /pnfs/icarus/archive/sbn/sbn_fd/data/raw/${stream}/*/icarus_daq_*/daq/00/00/${r1}/${r2} -type f -name "data*.root" | awk -Fdata_dl '{print "data_dl"$2}' >& listtotalrawfiles.temp

# count total available files on tape area
n_total=`wc -l listtotalrawfiles.temp | awk '{print $1}'`

# check if files online
for f in `cat listtotalrawfiles.temp`; do 
	cat /pnfs/icarus/archive/sbn/sbn_fd/data/raw/${stream}/*/icarus_daq_*/daq/00/00/${r1}/${r2}/".(get)(${f})(locality)" | grep ONLINE >> listofonlinefiles.temp; 
done

# count how many are online
n_online=`wc -l listofonlinefiles.temp | awk '{print $1}'`

# translate back the stream name
if [[ "${stream}" == "*" ]]; then
  stream="all"
fi

# print result
echo "Online files for run number: ${run} and stream name: ${stream}: ${n_online} files out of available ${n_total} files"

# clear the temporary output files
rm listtotalrawfiles.temp
rm listofonlinefiles.temp
