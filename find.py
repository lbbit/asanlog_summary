'''
find.py
run this file with:
python find.py 'asan logfile path' 'prepare pattern file path' 'result file path'

'''
import re
import os
import sys

#open asanlog
log_path = sys.argv[1]
print log_path
if not os.path.isfile(log_path):
    raise TypeError(log_path + " does not exist")
all_text = open(log_path).read()
all_text = all_text + "\n===\n"

#open pattern pre file
prepa_path = sys.argv[2]
print prepa_path
if not os.path.isfile(prepa_path):
    raise TypeError(prepa_path + " does not exist")
prepa_file = open(prepa_path)

result = ""
#search errors using each line as pattern
for line in prepa_file:
    pattern1 = line + ".+?=="
    matcher1 = re.search(pattern1,all_text,re.S)
    if matcher1:
        #print 'added one result ...'
        result = result + matcher1.group(0) + "\n"
    else:
        print 'no search'

#write result to file
result_path = sys.argv[3]
result_file = open(result_path,'w')
result_file.write(result)
print "creating "+ result_path
#close all file
prepa_file.close()
result_file.close()

