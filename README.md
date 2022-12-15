# tp_final_edp
Entorno de Programación R1 - TP Final (Arce, Onega)

PASOS A SEGUIR PARA LA EJECUCIÓN DEL PROGRAMA
Descargá el repositorio tp_final_edp (ej: /home/tuia/Documentos/tp_final_edp).

Descomprimilo.
Posicionate en el directorio donde lo descomprimiste 
En tu consola: 

(Para correr la imagen en Docker)
sudo docker build -t edpfinal . 
(poner contraseña)
sudo docker run -it -v /rutaabsolutadelarchivolocal/nombredetuarchivo.txt:/textos/nombredetuarchivo.txt edpfinal 