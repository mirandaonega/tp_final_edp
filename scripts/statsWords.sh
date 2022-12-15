#!/usr/bin/env bash


ARCHIVO=$1

CANTIDAD_PALABRAS=$(cat $ARCHIVO | wc -w)

PALABRA_LARGA=''

PALABRA_CORTA=''

REGEX="^[A-Za-z]+$"

SUMA_LONGITUDES_PALABRAS=0

LARGO_PALABRA_LARGA=1

LARGO_PALABRA_CORTA=99

for palabra in $(cat $ARCHIVO);
do
	if [[ $palabra =~ $REGEX ]]
	then
		LEN_PALABRA=$(echo -n "$palabra" | wc -m)
	else
		palabra=$(echo $palabra | tr -d [:punct:])
		LEN_PALABRA=$(echo -n "$palabra" | wc -m)
	fi

	let SUMA_LONGITUDES_PALABRAS=$SUMA_LONGITUDES_PALABRAS+$LEN_PALABRA

	if [[ $LEN_PALABRA -ge $LARGO_PALABRA_LARGA ]]
	then
		PALABRA_LARGA="$palabra"
		LARGO_PALABRA_LARGA=$(echo -n "$PALABRA_LARGA" | wc -m)
		
	elif [[ $LEN_PALABRA -le $LARGO_PALABRA_CORTA ]]
	then
		PALABRA_CORTA="$palabra"
		LARGO_PALABRA_CORTA=$(echo -n "$PALABRA_CORTA" | wc -m)
	else
		continue
	fi

done

let PROMEDIO=$SUMA_LONGITUDES_PALABRAS/$CANTIDAD_PALABRAS

echo "La palabra más larga es '$PALABRA_LARGA' que tiene $LARGO_PALABRA_LARGA letras"
echo "La palabra más corta es '$PALABRA_CORTA' que tiene $LARGO_PALABRA_CORTA letra/letras"
echo "El promedio de las longitudes de todas las palabras es $PROMEDIO"
