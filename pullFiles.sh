#!/bin/bash 
adb forward tcp:4444 localabstract:/adb-hub
adb connect 127.0.0.1:4444

# Finds .csv files. tr -d removes the DOS carriage return
#for i in $( adb -s 127.0.0.1:4444 shell ls /sdcard/watchData | tr -d '\r' ); do
#	adb -s 127.0.0.1:4444 shell pull $i .
#done

#for i in $( adb -s 127.0.0.1:4444 shell ls /sdcard/watchData | tr -d '\r' ); do
#	adb -s 127.0.0.1:4444 shell mv $i /sdcard/watchData/old/
#done

adb -s 127.0.0.1:4444 pull /sdcard/watchData/*.csv
adb -s 127.0.0.1:4444 shell mv /sdcard/watchData/*.csv /sdcard/watchData/old/

# To list files in target directory, use:
# adb -s 127.0.0.1:4444 shell ls /sdcard/watchData

# To remove old data files from watch, use:
# adb -s 127.0.0.1:4444 shell rm -r /sdcard/watchData/*