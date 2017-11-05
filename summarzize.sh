#!/bin/bash
#run ./summarzize.sh to make summary.log from result2.***
echo "starting reading result2.***"
find . -name result2.* | awk '{cmd="cat "$1 ">>./result2all.log";system(cmd)}'
echo "result2all read"
echo "staring creating summary.log"
cat result2all.log | sed -n '{/ERROR/p;/vos.o+/p;/READ/p;/\.c/p;}' | sed '{/22ff9b/d;/overlap/d}' > summary.log
sed -i '/^$/d' summary.log
echo "summary.log created."
#sed -i '{N;/vos.o\+/{s/\n/\t/g}}' > summary.log
rm -f result2all.log
echo "result2all.log removed"
echo "finish !!!"
