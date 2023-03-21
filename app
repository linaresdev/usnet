#!/bin/bash
 . lib/style.sh
 . lib/table.sh

## echo -e "${blueColour}Hola mundo${endColour}"

data=$(cat data.txt | awk '{print $1}' | tail -n +2)
# uuf="cemilian"
# mino=$(echo "${data}" | grep "${uuf}" | wc -l )

# echo $mino
declare -A lista

for usr in $data 
do
   lista[$usr]="$(echo "${data}" | grep "${usr}" | wc -l )"
done

# Header Table
echo "Usuarios_Sessiones" > ./tmp/sess.tbl

# Contenido Table
for index in ${!lista[*]} 
do
    echo "${index}_${lista[$index]}" >> ./tmp/sess.tbl
done

printTable "_" "$(cat ./tmp/sess.tbl)"

# Eliminamos el fichero temporar de la tablas
rm ./tmp/sess.tbl