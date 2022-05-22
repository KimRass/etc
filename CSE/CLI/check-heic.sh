#!/bin/bash

YYYYMMDD="20220504"

path="D:/samples_pre/$YYYYMMDD"

find $path -name "*.heic" -or -name "*.HEIC" | sort > $path/input_files_list

cat /dev/null > $path/error_files_list

# wc -l $path/input_files_list

temp=$(wc -l $path/input_files_list | awk "{print $2}")

echo $temp

vi $path/input_files_list
#  | awk "{print $2}"