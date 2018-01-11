#!/bin/bash

ISCL=$(cat /opt/spazio/work/cfg/sprnode.ini | grep -E "QmName_1 = |CLineName_1 = " |grep -B1 "ISCL" |grep QmName |awk '{print $3}')
FTP=$(cat /opt/spazio/work/cfg/sprnode.ini | grep -E "QmName_1 = |CLineName_1 = " |grep -B1 "FTP" |grep QmName |awk '{print $3}')

for i in $ISCL; do
        qlist $i >/dev/null
        if [ $? -ne 0 ]; then
                echo "Servidor $i No está en uso"
                echo $i >> /opt/spazio/work/cfg/inactivos.txt
        else
                echo "Servidor $i Activo"
                echo $i >> /opt/spazio/work/cfg/activos.txt
        fi
done
