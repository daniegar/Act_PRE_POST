#!/bin/bash

servidores=$(cat /opt/spazio/work/cfg/sprnode.ini | grep -E "QmName_1 = |CLineName_1 = " |grep -B1 "ISCL" |grep QmName |awk '{print $3}')

for i in $servidores; do
   nmap $i -p 3389 |grep -q open
   if [ $? -eq 0 ]; then
      echo "Servidor $i: Windows"
      echo $i >> win.txt
   else
      echo "Servidor $i: Linux u otro"
      echo $i >> linux.txt
   fi
done
