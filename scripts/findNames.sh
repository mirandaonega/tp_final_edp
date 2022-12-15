#!/usr/bin/env bash


ARCHIVO=$1

PALABRAS="^[A-Za-z]+$"

NOMBRE_PROPIO="^[A-Z][a-z]+"

echo "Nombres propios en $(basename $1):" 
for palabra in $(cat $ARCHIVO);
do
	if [[ $palabra =~ $PALABRAS ]]
	then
		palabra="$palabra"
	else
		palabra=$(echo $palabra | tr -d [:punct:])
	fi

	if [[ $palabra =~ $NOMBRE_PROPIO ]]
	then
		echo $palabra
	fi
done
