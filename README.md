Cloud Tools
=========

Este playbook tem por finalidade facilitar a preparação da estação de trabalho instalando as ferramentas necessárias ao trabalho do dia a dia.


Requisitos
------------

Para executar este playbook é necessário ter instalado o ansible no host. Para instalar o ansible, digite:

```sh
sudo apt install ansible git
```

Para executar basta digitar o comando abaixo:

```sh
ansible-playbook playbook-main.yaml --ask-become-pass
```

Variáveis
--------------

Em ```workstation/vars/main.yaml``` estão todas as variáveis que permitem a parametrização deste playbook. 

**É importante conferí-lo para realizar as alterações de versão de software e também alterar algumas outras opções**.


Estrutura
------------

Este projeto possui a seguinte estrutura de diretórios:

```sh
cloud-tools
├── LICENSE
├── README.md
├── inventories
│   └── inventory.yaml
├── library
├── module_utils
├── playbook-main.yaml
└── roles
    └── workstation
        ├── README.md
        ├── defaults
        │   └── main.yml
        ├── files
        │   ├── aliases
        │   ├── shellcheck_install.sh
        │   ├── sops_install.sh
        │   ├── sync_git.sh
        │   └── tgenv-list-remote
        ├── meta
        │   └── main.yml
        ├── tasks
        │   ├── aws_package.yaml
        │   ├── bat_package.yaml
        │   ├── docker_package.yaml
        │   ├── gcloud_package.yaml
        │   ├── golang_package.yaml
        │   ├── helm_docs_package.yaml
        │   ├── helm_package.yaml
        │   ├── helmfile_package.yaml
        │   ├── jj_package.yaml
        │   ├── k8splugins_package.yaml
        │   ├── krew_package.yaml
        │   ├── kubectl_package.yaml
        │   ├── kubectx_kubens_package.yaml
        │   ├── main.yaml
        │   ├── misc.yaml
        │   ├── os_packages.yaml
        │   ├── terraformdocs_package.yaml
        │   ├── tfenv_package.yaml
        │   ├── tgenv_package.yaml
        │   ├── vscode.yaml
        │   ├── yq_package.yaml
        │   └── zsh_package.yaml
        └── vars
            └── main.yaml

```

Quebra de compatibilidade
-------

> - **Este playbook foi atualizado e testado nas distros ```ubuntu 22.04``` e ```Linux Mint 21``` (esta última é uma variante da primeira, então nada muda :wink: ).**
> - **Para utilizar este playbook, nas versões ```ubuntu 20.04``` e ```Linux Mint 20.3```, baixe a release 1.0.0.**

Informações Importantes
-------

- Este playbook irá instalar o ZShell no host e configurá-lo como padrão com o tema powerlevel10k (Caso não seja seu shell padrão, basta apenas comentar a linha import_task respectiva presente no arquivo ```workstation/tasks/main.yaml```).
- Há opção de instalar o docker machine, mas é necessário alterar a opção no arquivo ```workstation/vars/main.yaml```
- O diretório ```workstation/files``` contém alguns scripts importantes e aliases customizados.
- Ainda no diretório ```workstation/files```, o script `tgenv-list-remote` contém um fix para a paginação dos repositórios do tgenv (atualmente ele lista 2 páginas).
- Possivelmente haverá alguns bugs, necessidade de melhoria de código, então, sinta-se à vontade para corrigí-los; Juntos podemos deixá-lo melhor e mais eficiente.
- **Não esqueça do seu PR após alteração relevante**. :wink:

Comportamentos conhecidos
-------

- Algumas vezes, durante a instalação dos plugins do VSCode o servidor dá timeout, a suspeita é que isso ocorra devido ao número de requisições, mas basta executar o playbook com essa tarefa apenas que a instalação ocorrerá tranquilamente.

Licença de uso
------------------

O uso deste playbook é livre e pode ser modificado/melhorado conforme necessidade :wink:

Informações do Autor
------------------

Projeto criado por Marcelo Primo
