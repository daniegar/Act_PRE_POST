#!/bin/bash

servidores=$(cat servidores.txt)

for i in $servidores; do
   nmap $i -p 3389 |grep -q open
   if [ $? -eq 0 ]; then
      echo "Servidor $i: Windows"
   else;
      echo "Servidor $i: Linux u otro"
   fi
done 
