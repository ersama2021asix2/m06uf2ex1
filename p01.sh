#!/bin/bash

while [ true ]
do
clear

echo -n "Escriu el nom de l'usuari al qual canviarem la contrasenya: "
read nomusuari

echo -n "Escriu la nova contrasenya per l'usuari seleccionat: "
read novacontrasenya

echo

echo "$nomusuari:$novacontrasenya" | sudo chpasswd

echo "Contrasenya validada"

echo ""
        echo "Vols continuar?: (s/n)"
        read sino
        case $sino in
                s)      clear
                        ;;
                n)      exit 2
                        ;;
                *)      echo "Selecciona s o n"
                        ;;
        esac
done
exit 1
