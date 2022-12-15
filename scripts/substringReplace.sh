#!/usr/bin/env bash

echo ¿Qué subccadenas queres reemplazar en $(basename textos/prueba.txt)?
read -p "Primer subcadena: " CADENA1
CADENA2=$(echo $CADENA1 | tr '[:upper:][:lower:]' '[:lower:][:upper:]')



echo Texto con los cambios de $CADENA1 a $CADENA2: 

cambio=$(sed -e "s/$CADENA1/$CADENA2/g" $1)

echo $cambio

