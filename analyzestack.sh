#!/bin/bash
#analyzestack.sh
#run as ./analyzestack.sh
echo "starting analyzestack..."
#make tmp files
find ./ -name result.* | awk '{print $1" "$1}'| awk 'gsub("result","tmp",$2)' | awk '{cmd = "./maketmp.sh " $1 " " $2;system(cmd)}'
#make result2.***
find ./ -name result.* | awk '{print $1" " $1 " " $1}'| awk 'gsub("result","tmp",$2)'|awk 'gsub("result","result2",$3)' | awk '{cmd = "python analyzestack.py " $1 " " $2 " " $3;system(cmd)}'
#rm tmp files
#find ./ -name tmp.* | awk '{system("rm -f "$1)}'
echo "finish analyzestack !!!"
