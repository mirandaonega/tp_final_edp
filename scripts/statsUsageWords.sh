#!/usr/bin/env bash


ARCHIVO=$1

REGEX="^[A-Za-z]+$"

for palabra in $(cat $ARCHIVO);
do
	if [[ $palabra =~ $REGEX ]]
	then
		LEN_PALABRA=$(echo -n "$palabra" | wc -m)
	else
		palabra=$(echo $palabra | tr -d [:punct:])
		LEN_PALABRA=$(echo -n "$palabra" | wc -m)
	fi

	palabra=$(echo $palabra | tr [:upper:] [:lower:])

	if [ $LEN_PALABRA -ge 4 ]
	then
		echo  $palabra  >> palabras.txt
	fi
done

cat palabras.txt | tr '' '\n' | sort | uniq -c | sort -nr >> resultado.txt

echo "Top ten palabras con más repeticiones:"
head -10 resultado.txt

rm -f palabras.txt
rm -f resultado.txt
