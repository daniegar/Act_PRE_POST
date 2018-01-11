#!/bin/bash

ISCL=$(cat [ruta alta cliente] | grep -E "QmName_1 = |CLineName_1 = " |grep -B1 "ISCL" |grep QmName |awk '{print $3}')
FTP=$(cat [ruta alta cliente] | grep -E "QmName_1 = |CLineName_1 = " |grep -B1 "FTP" |grep QmName |awk '{print $3}')

for i in $ISCL; do
        [listar colas] $i >/dev/null
        if [ $? -ne 0 ]; then
                echo "Servidor $i No está en uso"
                echo $i >> inactivos.txt
        else
                echo "Servidor $i Activo"
                echo $i >> activos.txt
        fi
done
