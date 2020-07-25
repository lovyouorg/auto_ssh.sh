#!/bin/sh
#auto exec commands
if    [ ! -f ip.txt ];then
      echo =e "\033[31mplease create ip.txt files,the ip.txt contents as follows: \033[0m"
cat <<EOF
192.168.0.1
192.168.0.2
EOF
      exit
if

if     [ -z "$*" ];then
       echo -e "\033[31mUsage: $0 command ,example {rm /tmp/test.txt |mkdir /tmp/20200728}} \033[0m"
       exit
fi
       count=`cat ip.txt |wc -l`
       rm -rf ip.txt.swp
       i=0
while  ((i<$count))

do
      i=`expr $i +1`
      sed "${i}s/^/&${i} /g" ip.txt >>ip.txt.swp
      
      IP=`awk -v I="$i" '{if(I==$1)print $2}' ip.txt.swp`
      
      ssh -q -l root $IP "$*;echo -e '===================\nThe $IP exec command:$* success!';sleep 2"
done
