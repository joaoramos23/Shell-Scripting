#!/bin/bash

home=/home/ekroon123

cd $home

if [ ! -d backup  ]
then
	mkdir backup
fi

mysqldump -u root $1 > $home/backup/$1.sql
if [ $? -eq 0 ]
then 
	echo "Backup realizado com sucesso!"
else 
	echo "Backup NÂO realizado com sucesso!"
fi
