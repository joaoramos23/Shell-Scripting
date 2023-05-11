#!/bin/bash

 home=/home/ekroon123

 cd $home

 if [ ! -d backup_muti ]
 then
	mkdir backup_muti
 fi

 backup=$home/backup_muti
 cd $backup
 date=$(date +%F)
 if [ ! -d $date ]
 then
 	mkdir $date
 fi
 

 tabelas=$(mysql -u root mutillidae -e "show tables;" | grep -v Tables)
 
 for tabela in $tabelas
 do
 	mysqldump -u root mutillidae $tabela > $backup/$date/$tabela.sql
 done
 
 
