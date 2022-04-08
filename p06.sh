#!/bin/bash

clear
if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb privilegis de l'usuari root"
  exit 1
fi

echo -n "Diguem el nom d'un arxiu del directori /etc/default: "
read etcdefault

cd /etc/default

if [[ -e $etcdefault ]]
then
    cp $etcdefault /media/$etcdefault.$(date +"%Y%m%d%H%M")
    exit 0
else 
    echo "ERROR: El fitxer demanat no existeix"
    exit 1
fi

