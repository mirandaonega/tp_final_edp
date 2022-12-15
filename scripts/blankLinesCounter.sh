#!/usr/bin/env bash

TOTAL_BLANCO=$(grep -cv '\S' $1 )


echo "El texto $(basename $1) tiene $TOTAL_BLANCO líneas en blanco."
