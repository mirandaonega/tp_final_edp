#!/usr/bin/env bash


ARCHIVO=$1

cat $ARCHIVO | grep [.]$ >> parrafos.txt

TOTAL_PARRAFOS=$(cat parrafos.txt | wc -l)

FIN_ORACION='[.]$'
anterior_palabra=""

for palabra in $(cat parrafos.txt); 
do
	if [[ $palabra =~ $FIN_ORACION ]]
	then
		echo "$palabra" >> oraciones.txt
	elif [[ $anterior_palabra =~ $FIN_ORACION ]]
	then
		echo -n
		echo -n "$palabra " >> oraciones.txt
	else
		echo -n "$palabra " >> oraciones.txt
	fi
                        
        anterior_palabra="$palabra"
done

TOTAL_ORACIONES=$(cat oraciones.txt | wc -l)

PS3='Elija> '
select opcion in "SALIR" "ORACIÓN" "PÁRRAFO"
do
	[ -e $opcion ] && echo "Opción no válida" && continue
	if [ $REPLY == 1 ]
	then
		break
	elif [ $REPLY == 2 ]
	then	
		if [[ $TOTAL_ORACIONES == 0 ]]
		then
			echo "Archivo vacío"
		else
			read -p "Introduzca el número de oración que desea ver: " numero_oracion
		fi

		if [[ $numero_oracion -gt $TOTAL_ORACIONES ]]
		then
			echo "El número ingresado supera la cantidad de oraciones que tiene $ARCHIVO"
		else
			for num in $(seq $TOTAL_ORACIONES);
			do
				if [[ $numero_oracion -eq $num ]]
				then
					sed -n $(echo $numero_oracion)p oraciones.txt
				fi
			done
		fi

	elif [ $REPLY == 3 ]
	then
		if [[ $TOTAL_PARRAFOS == 0 ]]
		then
			echo "Archivo vacío"
		else
			read -p "Introduzca el número de párrafo que desea ver: " numero_parrafo
		fi

		if [[ $numero_parrafo -gt $TOTAL_PARRAFOS ]]
		then
			echo "El número ingresado supera la cantidad de párrafos que tiene $ARCHIVO"
		else
			for num in $(seq $TOTAL_PARRAFOS);
			do
				if [[ $numero_parrafo -eq $num ]]
				then
					sed -n $(echo $numero_parrafo)p parrafos.txt
				fi
			done
		fi
	fi
done

rm -f oraciones.txt
rm -f parrafos.txt
