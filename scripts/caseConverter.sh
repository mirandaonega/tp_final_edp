#!/usr/bin/env bash

echo "Texto con mayúsculas convertidas en minúsculas y viceversa: "
resultado= echo $(cat $1)| tr '[:upper:][:lower:]' '[:lower:][:upper:]' | sed -e 'y/áéíóúñüÁÉÍÓÚÑ/ÁÉÍÓÚÑÜáéíóúñ/'
