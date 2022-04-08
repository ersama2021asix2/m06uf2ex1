#!/bin/bash

clear
if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb privilegis de l'usuari root"
  exit 1
fi

comprova(){

    if [[ -d /mnt/cpseg ]]
        echo "Si existeix el directori"
    else
        echo "Creant el directori..."
        mkdir /mnt/cpseg
    fi
}

copia(){
    echo "Fent la copia de seguretat..."
    cp /etc/crontab /mnt/cpseg
    cp /etc/hosts /mnt/cpseg
    tar -cvzf backup$(date +"%Y%m%d%H%M").tar.gz /mnt/cpseg/crontab /mnt/cpseg/hosts

}

esborra(){

    rm -r /mnt/cpseg/crontab
    rm -r /mnt/cpseg/hosts
    echo "Esborrant els fitxers..."
}

echo -n "Vols continuar? (s/n) "
read sino

case $sino in
                s)      clear
                        ;;
                n)      exit 0
                        ;;
esac
