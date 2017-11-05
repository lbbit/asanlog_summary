#!/bin/bash
#run it with ./makeprepattern.sh ./***/asan.log
cat $1 | sed -n '/ERROR/p' | sort |uniq | sed 's/\[/\\\[/g' | sed 's/)/\\)/g' | sed 's/\]/\\\]/g' | sed 's/(/\\(/g' > $2
