<h1>Shell Scripting parte 1: scripts de automação de tarefas</h1>

Iremos converter as imagens dentro do arquivo 'imagens-livros' de jpg para png.
Utilizaremos shell scripting para isso.

Baixando a ferramenta ImageMagick pelo Ubuntu, podemos utilizar o comando "convert nome-arquivo.formato nome-arquivo.novoformato" para converter o arquivo entre formatos diferentes.

Criando o script utilizamos o comando "nano nome-do-arquivo.sh" o sh é o formato Shell.
Logo apos temos que informar qual será o interpretador desses comandos, utilizando o comando "#!/bin/bash".
Então iremos utilizar o "convert" mas colocando o caminho e cada arquivo que será convertido.
Os parametros passado pelo bash utilizamos os numeros como ordem de parametro e utilizamos o simbolo "$1".
Para criar constantes basta digitar o nome da constante e por o sinal de igual, atribuindo um valor a ela.
Podemos utilizar o comando cd dentro do Script para "caminhar" entre diretorios.
Para conseguir manipular a string utilizaremos o formato "awk". Exemplo "ls algoritmos.jpg | awk -F. '{ print $1 }'" ele mostrará a string antes do ".".
Para poder executar um comando e colocalo em um parametro utilizamos "$(comando)".

Codigo utilizado para realizar o script de converter o tipo do arquivo:
`
cd ~/Downloads/imagens-livros

for imagem in *.jpg
do
    imagem_sem_extensao=ls $imagem | awk -F. '{ print $1 }'
    convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png
done
`

Para que a variavel dentro de uma função so seja utilizada dentro da mesma colocamos "local" antes da variavel.
Para saber os status de saida, basta utilizar "$?" associado com um if. Se for igual a 0 a execução foi feita com exeto.

Apos chamar a função, podemos utilizar "funcao 2>erro.txt" para que as mensagens de erro sejam gravadas no arquivo txt. Esse parametro vai de 0 a 2. Sendo 0 execução feita com exeto. E o 1 e 2 são quando algum tipo de erro ocorre.
