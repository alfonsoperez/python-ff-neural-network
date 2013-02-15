#!/bin/bash

function signal_mata_cam(){
   kill -s 9 $PIDcam
   kill -s 9 $PIDscript

}

trap signal_mata_cam SIGINT

echo "[[[[[[[ TRAINING SET CONSTRUCTOR v1.50 by fon and tony ]]]]]]]]]"\n\n
echo "ABRIENDO WEBCAM"
PIDscript=$$
python2.7 camdesk.py &
PIDcam=$!

ARPOS=( "frente" )
AROJOS=( "gafas" )
ARGESTO=( "lengua" )
persona="fon"

I=5

foto="test"


for posicion in ${ARPOS[@]}; do

for ojos in ${AROJOS[@]}; do

for gesto in ${ARGESTO[@]}; do

echo $persona $posicion $gesto $ojos $foto

echo "AHORA PULSA F3 y ENTER"
read aaa

convert temp.jpeg -resize 30x30 -colorspace gray -compress none -depth 8 $foto/$persona-$posicion-$ojos-$gesto-`echo $RANDOM`.pgm
rm temp.jpeg

done
done
done 


kill -9 $PIDcam  
