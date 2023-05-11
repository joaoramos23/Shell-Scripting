#!/bin/bash 

memoria_total=$( free | grep -i mem | awk '{ print $2 }' )
memoria_usada=$( free | grep -i mem | awk '{ print $3 }' )
memoria_porcentagem=$( bc <<< "scale=2;$memoria_usada/$memoria_total * 100" | awk -F. '{ print $1 }' )

if [ $memoria_porcentagem -gt 5 ]
then 
mail -s "Consumo de memoria alto!" ekroongames@gmail.com<<del
O sistema está com um consumo de memoria muito grande! Atualmente o consumo é de $( free -h | grep -i mem | awk '{ print $3 }' )
del

fi
