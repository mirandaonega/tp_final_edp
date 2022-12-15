#!/usr/bin/env bash

M_LARGA=""
CANT_LARGA=0

M_CORTA=""
CANT_CORTA=0

oracion=""
punto='[.]$'

CONTADOR_ORACIONES=0
TOTAL_PAL=0


contador(){

    CANT=$(echo $1 | wc -w)
    if [[ $CONTADOR_ORACIONES -eq 0 ]];then
        CANT_LARGA=$CANT
        CANT_CORTA=$CANT
        M_LARGA="$1"
    elif [[ $CANT -gt $CANT_LARGA ]];then
        CANT_LARGA=$CANT
        M_LARGA="$1"
    elif [[ $CANT -lt $CANT_CORTA ]];then
        CANT_CORTA=$CANT
        M_CORTA="$1"
    fi

    ((CONTADOR_ORACIONES++))
    
}

detector_oracion (){
for pal in $1; do
    ((TOTAL_PAL++))

    if [[ $pal =~ $punto ]]; then
        oracion="$oracion $pal"
        contador "$oracion"
        #vacío la variable para empezar a analizar otra oracion 
        oracion="" 
	else
        oracion="$oracion $pal"

    fi
     
done

}


detector_oracion  "$(echo $(cat $1)| sed 's/\r$//')"

echo La oración mas larga: \"$M_LARGA\" tiene $CANT_LARGA palabras
echo La oración mas corta: \"$M_CORTA\" tiene $CANT_CORTA palabras
let PROMEDIO=$TOTAL_PAL/$CONTADOR_ORACIONES
echo La cantidad de palabras promedio por oración es $PROMEDIO





