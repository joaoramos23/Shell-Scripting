<h1>Shell Scripting parte 2: fazendo monitoramento, agendando tarefas e backup</h1>

<h3>Verificando uma pasta de log:</h3>

- Para verificar o endereço IP presente na pasta de loga basta digitar: "cat apache.log | grep 47.86.228.66".
- Agora iremos montar um Script para poder visualizar todos os ip's do arquivo log.

<h3>Utilizando "case" Shell:</h3>

```

case $1 in
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

```

<h3>Tratando Strings:</h3>

- Para fazer tratamento de String de minusculo para maiusculo basta utilizar o comando "awk".
- Exemplo: "echo get | awk '{ print toupper($1) }'"

<h3>Verificar o status HTTP:</h3>

- Utilizamos o curl via terminal para pordemos verificar o status HTTP.
- Exemplo: " curl --write-out %{http_code} --silent --output /dev/null http://localhost "
- Codigo utilizado para verificação: 

```

status_servidor(){
	
	local respota_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)
	
	if [ $respota_http -eq 200 ]
	then
		echo "Status Servidor: ON"
	else	
		echo "Status Servidor: OFF"
		systemctl restart apache2
		status_servidor
	fi
}

status_servidor

```
- Mas para que o sevidor estaja sempre rodando temos que por um temporizador para rodar esse script em alguns momentos. Utilizaremos o crontab.
- Primeiro temos que mudar o status de permissão do script. Com: "chmod +x nome-do-script".
- Depois abriremos o crontab: " sudo crontab -e ".
- "*/1 * * * * /home/ekroon123/shellscript_parte2/Scripts2/monitoracao_servidor.sh" esse comando ira rodar o script a cada 1 minuto.

<h3>Enviado email com status HTTP:</h3>

- Fazer o download das ferramentas para enviar o email: o SSMTP e o Mail utils.
	- SSMTP: "$ sudo apt-get install ssmtp" 
		- Para configurar o email que vai mandar os emais use esse comando: "sudo gedit /etc/ssmtp/ssmtp.conf".
		- Dentro do gedit utilize esse codigo:
		```
		root=EMAIL_USUARIO
		mailhub=smtp.gmail.com:587
		AuthUser=EMAIL_USUARIO
		AuthPass=EMAIL_SENHA
		UseSTARTTLS=yes
		```
	- Mail utils: " sudo apt-get install mailutils ".
- Codigo do script: 
```
local respota_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)
	
if [ $respota_http -ne 200 ]
then	
mail -s "Problema no servidor" huckdoggamer@gmai.com<<del
Houve um problema no servidor e os usuarios pararam de ter acesso ao conteudo web.
del
systemctl restart apache2
	
fi
```

<h3>Consumo de memória do sistema:</h3>

- Conseguimos visualizar o consumo de memoria do sistema utilizando o comando: "free | grep -i mem".

<h3>Fazendo backup do banco:</h3>

- Para acessar o banco utilizamos o codigo "sudo mysql -u root".
- Para popular as tabelas utilize o comando "sudo mysql -u root nome-data-base < ~/local-onde-esta".
- Para usar o banco de dados utilize o comando "use nome-do-banco-de-dados".
