#!/bin/bash
#run.sh
#run as ./run.sh
#makeprepattern
echo "starting transform..."
find ./ -name asan.* | awk '{print $1" "$1}'| awk 'gsub("asan","prepattern",$2)' | awk '{cmd = "./makeprepattern.sh " $1 " " $2;system(cmd)}'
#make result log
find ./ -name asan.* | awk '{print $1" " $1 " " $1}'| awk 'gsub("asan","prepattern",$2)'|awk 'gsub("asan","result",$3)' | awk '{cmd = "python find.py " $1 " " $2 " " $3;system(cmd)}'
#rm prepattern
find ./ -name prepattern.* | awk '{system("rm -f "$1)}'
echo "finish!!!"
