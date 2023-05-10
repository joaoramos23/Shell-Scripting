#!/bin/bash

if [ ! -d log ]
then 
	mkdir log
fi

processos_memoria(){
processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])
for processo in $processos
do
	nome_processo=$( ps -p $processo -o comm= )
	echo -n $(date +%F,%H:%M:%S,) >> log/$nome_processo.log
	tamanho=$( ps -p $processo -o size | grep [0-9] )
	calculo="$( bc <<< "scale=2;$tamanho/1024" ) MB"
	echo $calculo >> log/$nome_processo.log 
done
}

processos_memoria
if [ $? -eq 0 ]
then
	echo "Os arquivos foram salvos com sucesso."
else
	echo "Houve um problema na hora de salvar os arquivos."
fi

