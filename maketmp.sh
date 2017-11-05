wcx.jpgwcx.jph
#$1=result.*** $2=tmp.***
echo "analyzing "$1" ..."
cat -n $1 | awk '/vos.o\+/' | awk '{cmd="arm-linux-gnueabi-addr2line -e /home/z00201023/WLAN_V2R8C00_BASE/build/current/bin/vos.o "$3;print $0" ";system(cmd)}' > $2
