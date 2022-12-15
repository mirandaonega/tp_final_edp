#!/usr/bin/env bash

SCRIPTS=$( ls scripts | grep .sh$ )
CANT_SCRIPTS=$(echo -n "$SCRIPTS" | wc -w)


buscador_texto (){
    echo "¿Con qué texto desea ejecutar el $opcion?"
    CANT_TEXTOS=$(ls textos | wc -l)
	select texto in $(ls textos) "VOLVER"
    do
        case $REPLY in 
            [1-$CANT_TEXTOS])
            	echo "Ejecutando $opcion con $texto"
                bash ./scripts/$opcion textos/$texto
		break
            ;;
            
            $[ $CANT_TEXTOS + 1 ])
		break
            ;;

            *)
                echo "La opcion está fuera del rango."
                read -p "Presione cualquier tecla para VOLVER al menú de textos"
            ;;



        esac
			
	done
}

menu (){
    echo "Bienvenid@! ¿Qué quieres hacer?"
    
    select opcion in $SCRIPTS "SABER QUE HACEN LOS SCRIPTS" "SALIR"
        do 

            case $REPLY in
            [1-$CANT_SCRIPTS])
                echo "Seleccionaste $opcion "
                buscador_texto
                read -p "Presione ENTER para VOLVER al menú."
            ;;

            $[ $CANT_SCRIPTS + 1 ]) 
                cat opciones.txt
                echo 
                read -p "Presione ENTER para VOLVER al menú."
            ;;  

            $[ $CANT_SCRIPTS + 2 ]) 
                echo $opcion seleccionada
                clear
                echo "Se borró la pantalla. ¡Hasta Luego!"
                break
                ;;

            *)
                echo ""
                echo $opcion No es una opción válida.
                read -p "Presione ENTER para VOLVER al menú. " 
                ;;  
    
            esac

        done


}


menu

