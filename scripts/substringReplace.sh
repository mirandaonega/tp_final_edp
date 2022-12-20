#!/usr/bin/env bash


echo ¿Qué subcadenas queres reemplazar en $(basename $1)?

read -p "Primer subcadena: " CADENA1
CADENA2=$(echo $CADENA1 | tr '[:upper:][:lower:]' '[:lower:][:upper:]')



echo Texto con los cambios de $CADENA1 a $CADENA2: 

cambio=$(sed -e "s/$CADENA1/$CADENA2/g" $1)

echo $cambio

