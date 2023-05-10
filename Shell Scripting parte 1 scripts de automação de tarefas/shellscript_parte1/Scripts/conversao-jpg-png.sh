#!/bin/bash

converte_imagem(){
cd ~/shellscript_parte1/imagens-livros

if [ ! -d png ] 
then 
	mkdir png
fi

for imagem in *.jpg
do
	local img=$(ls $imagem | awk -F. '{ print $1 }')
	convert $img.jpg png/$img.png

done
}

converte_imagem 2>erros_converssao.txt
if [ $? -eq 0 ]
then 
	echo "Conversão realizada com sucesso."
else
	echo "Houve uma falha no processo."
fi


