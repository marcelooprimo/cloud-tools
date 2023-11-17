#!/bin/bash

#
# sync_git.sh - Realiza a sincronização dos repositórios git presentes em um diretório
#               específico
#
# Autor: Marcelo Primo
# Data: 21/05/22


# Procura e realiza o sync dos repositórios
# no diretório encontrado
# Para criar um alias customizado: 
# alias = 'find "$1" -maxdepth 3 -name .git -type d | rev | cut -c 6- | rev | xargs -I {} bash -c \'echo "Updating repo {}"; git -C {} pull\''
if [[ $# -eq 0 ]];
then
	echo "------------------------------"
	echo "Não foi informado um diretório"
	echo -e "------------------------------\n"
	echo "MODO DE USO: ./sync_git.sh CAMINHO/DIRETORIO_1 CAMINHO/DIRETORIO_2 CAMINHO/DIRETORIO_N"
	exit 1
fi

while [[ -n $1 ]]
do
	while read diretorio;
	do
		echo -e "\n\033[1;32m*** Sincronizando o repositório ${diretorio/\/.git/} ***\033[0m"
		git -C "${diretorio/\/.git/}" pull
		
	done <<< "$(find "$1" -maxdepth 3 -type d -name .git)"

	shift
done
