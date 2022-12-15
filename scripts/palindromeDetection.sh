#!/usr/bin/env bash
ARCHIVO=$1

echo "Palíndromos en $(basename $ARCHIVO):"

for palabra in $(cat $ARCHIVO);
do
	palabra=$(echo $palabra | tr -d [:punct:] | tr [:upper:] [:lower:])

	palabra_2=$(echo $palabra | sed 'y/áéíóú/aeiou/') 

	palabra_rev=$(echo $palabra_2 | rev) 

	if [[ $palabra_2 =~ $palabra_rev ]]
	then
		echo $palabra >> palabras_palindromos.txt
	else
		continue
	fi
done

cat palabras_palindromos.txt | sort | uniq >> palindromos.txt

cat palindromos.txt

rm -f palabras_palindromos.txt
rm -f palindromos.txt
