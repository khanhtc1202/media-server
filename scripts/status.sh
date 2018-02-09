#!/bin/bash
#
# author: khanhtc
#
# script check system status
#

echo "--------- Process Status ---------"

ps -x -o pcpu,stat,cmd | grep -E "[n]odemon|[p]ython|[a]ria2"

echo "------- Hard Disk Capacity -------"

df -h | grep Filesystem -A 1

echo "----- Last downloaded status -----"

dwFiles=$(find ../media/* -ctime -0.5 | grep -E "mp4|mkv" | wc -l)
echo "Downloaded $dwFiles file(s) in the last time crawling service run"

echo "----------------------------------------"

echo "Time:" $(date '+%Y/%m/%d---%H:%M:%S')

hour=$(date +%H)
StartDate=$(date -u -d "$(date +%H:%M:%S)" +"%s")
FinalDate_1=$(date -u -d "06:04:28" +"%s")
FinalDate_2=$(date -u -d "18:04:28" +"%s")
if [ "$hour" -gt 17 ]
    then echo "Time to the next running turn of crawling process is $(date -u -d "0 $FinalDate_1 sec - $StartDate sec" +"%H:%M:%S")"
elif [ "$hour" -lt 5 ]
    then echo "Time to the next running turn of crawling process is $(date -u -d "0 $FinalDate_1 sec - $StartDate sec" +"%H:%M:%S")"
else
    echo "Time to the next running turn of crawling process is $(date -u -d "0 $FinalDate_2 sec - $StartDate sec" +"%H:%M:%S")"
fi
