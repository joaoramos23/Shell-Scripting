#!/bin/bash

cd ~/shellscript_parte2


if [ -z $1 ]
then 
while [ -z $requisicao ]; do
		read -p "Por gentileza digite o paramentro desejado (GET - PUT - DELETE - POST):" requisicao
done
	letra_verificacao=$( echo $requisicao | awk '{ print toupper($1) }' )
else
	letra_verificacao=$( echo $1 | awk '{ print toupper($1) }' )
fi


case $letra_verificacao in
	GET)
	cat apache.log | grep GET
	;;
	
	POST)
	cat apache.log | grep POST
	;;
	
	PUT)
		cat apache.log | grep PUT
	;;
	
	DELETE)
		cat apache.log | grep DELETE
	;;
	
	*)
	echo "O parametro passado não é valido."
	;;
esac

