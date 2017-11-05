import os
import sys

#analyzestack.py
#open result file
#argv[1] is result.***
result_path = sys.argv[1] 
if not os.path.isfile(result_path):
    raise TypeError(result_path + "does not exist")
result_file = open(result_path,'r')
result_lines = result_file.readlines()
result_file.close()

#open tmp file
#argv[2] is tmp.***
tmp_path =sys.argv[2]
if not os.path.isfile(tmp_path):
    raise TypeError(tmp_path + "does not exist")
tmp_file = open(tmp_path,'r')
tmp_lines = tmp_file.readlines()
tmp_file.close()

#dict to save tmpfile info,[{linenum:stackinfo},...]
tmp_dict = {}
count = 1;
for line in tmp_lines:
#get linenum
    if count % 2 == 1:
        linewords = line.split('\t')
        #print linewords
        tmp_num = int(linewords[0])
        #print tmp_num
#get stackinfo and add to dict
    else:
        tmp_dict[tmp_num] = line
    count = count + 1

#add stackinfo to result
result2_lines = ""
count = 1
for line in result_lines:
    if count in tmp_dict.keys():
        result2_lines = result2_lines + line + tmp_dict[count]
    else:
        result2_lines = result2_lines + line
    count = count + 1

#write result to new file
#argv[3] is result2.***
result2_path = sys.argv[3]
result2_file = open(result2_path,'w')
result2_file.write(result2_lines)
print "creating " + result2_path
result2_file.close()
