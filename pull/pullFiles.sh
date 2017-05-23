#!/bin/bash 
adb forward tcp:4444 localabstract:/adb-hub
adb connect 127.0.0.1:4444


# ----------------------------------------------------------
# Finds .csv files. "tr" removes trailing carriage returns
# ----------------------------------------------------------
# Unix
# ----------------------------------------------------------
adb -s 127.0.0.1:4444 shell ls /sdcard/watchData/*.csv | tr '\r' ' ' | xargs -n1 adb -s 127.0.0.1:4444 pull
# ----------------------------------------------------------
# Windows
# ----------------------------------------------------------
# adb shell ls /sdcard/gps*.trace | tr "\n\r" " " | xargs -n1 adb pull


# ----------------------------------------------------------
# Move previous .csv files to "old" directory
# ----------------------------------------------------------
adb -s 127.0.0.1:4444 shell mv /sdcard/watchData/*.csv /sdcard/watchData/old/


# ----------------------------------------------------------
# Reference
# ----------------------------------------------------------
# To list files in target directory, use:
# adb -s 127.0.0.1:4444 shell ls /sdcard/watchData
# ----------------------------------------------------------
# To retrieve old data files from watch, use:
# adb -s 127.0.0.1:4444 pull /sdcard/watchData/old
# ----------------------------------------------------------
# To remove old data files from watch, use:
# adb -s 127.0.0.1:4444 shell rm /sdcard/watchData/old/*