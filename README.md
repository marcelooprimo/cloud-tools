Cloud Tools
=========

Este playbook tem por finalidade facilitar a preparação da estação de trabalho instalando as ferramentas de DevOps que são necessárias no trabalho do dia a dia.


Requisitos
------------

Para executar este playbook é necessário ter instalado o ansible no host. Para instalar o ansible, digite:

**Ubuntu based distro**
```sh
sudo apt install ansible git bzip2
```

**Opensuse distro**
```sh
sudo zypper install ansible git bzip2
```

> Nas distro baseadas em **ubuntu**, recomendo que se utilize a versão mais recente do Ansible, para isso é necessário instalar o Ansible via repositório PPA. Para use os comandos abaixo:

```bash
sudo apt install software-properties-common
sudo add-apt-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
```

> Para mais informações, acesse: https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu

Para executar basta digitar o comando abaixo:

```sh
ansible-playbook playbook-main.yaml -i inventories/inventory.yaml --ask-become-pass
```

Variáveis
--------------

Em ```roles/workstation/defaults/main.yaml``` estão todas as variáveis que permitem a parametrização deste playbook. 

**É importante conferí-lo para realizar as alterações de versão de software e também alterar algumas outras opções**.


Estrutura
------------

Este projeto possui a seguinte estrutura de diretórios:

```sh
cloud-tools
├── LICENSE
├── README.md
├── inventories
│   └── inventory.yaml
├── library
├── module_utils
├── playbook-main.yaml
└── roles
    └── workstation
        ├── README.md
        ├── defaults
        │   └── main.yml
        ├── files
        │   ├── aliases
        │   ├── shellcheck_install.sh
        │   ├── sops_install.sh
        │   └── sync_git.sh
        ├── meta
        │   └── main.yml
        ├── tasks
        │   ├── asdf.yaml
        │   ├── aws_package.yaml
        │   ├── bat_package.yaml
        │   ├── docker_package.yaml
        │   ├── gcloud_package.yaml
        │   ├── golang_package.yaml
        │   ├── helm_docs_package.yaml
        │   ├── helm_package.yaml
        │   ├── helmfile_package.yaml
        │   ├── jj_package.yaml
        │   ├── k8splugins_package.yaml
        │   ├── krew_package.yaml
        │   ├── kubectx_kubens_package.yaml
        │   ├── main.yaml
        │   ├── misc.yaml
        │   ├── os_packages.yaml
        │   ├── terraformdocs_package.yaml
        │   ├── tfenv_package.yaml
        │   ├── tgenv_package.yaml
        │   ├── trivy.yaml
        │   ├── vscode.yaml
        │   ├── yq_package.yaml
        │   └── zsh_package.yaml
        └── vars
            └── main.yaml

```

Quebra de compatibilidade
-------

> - **Este playbook foi atualizado e testado nas distros ```ubuntu 22.04```, ```ubuntu 24.04```, ```Linux Mint 21``` , ```Pop!_OS 22.04``` (estas últimas versões são uma variante do ubuntu 22.04, então nada muda :wink: ) e Opensuse Leap 15.6.**
> - **Para utilizar este playbook, nas versões ```ubuntu 20.04``` e ```Linux Mint 20.3```, baixe a release 1.0.0.**

Informações Importantes
-------

- Este playbook irá instalar o ZShell no host e configurá-lo como padrão com o tema powerlevel10k (Caso não seja seu shell padrão, basta apenas inserir os novos valores das variáveis no arquivo ```roles/workstation/vars/main.yaml``` ou alterar o valor delas diretamento no arquivo ```roles/workstation/defaults/main.yaml```).
- Há opção de instalar o docker machine, mas é necessário alterar a opção no arquivo ```roles/workstation/defaults/main.yaml```
- O diretório ```roles/workstation/files``` contém alguns scripts importantes e aliases customizados..
- Possivelmente haverá alguns bugs, necessidade de melhoria de código, então, sinta-se à vontade para corrigí-los; Juntos podemos deixá-lo melhor e mais eficiente.
- **Não esqueça do seu PR após alteração relevante**. :wink:

Comportamentos conhecidos
-------

- Algumas vezes, durante a instalação dos plugins do VSCode o servidor dá timeout, a suspeita é que isso ocorra devido ao número de requisições, mas basta executar o playbook apenas com essa tarefa que a instalação ocorrerá tranquilamente.

Licença de uso
------------------

O uso deste playbook é livre e pode ser modificado/melhorado conforme necessidade :wink:

Informações do Autor
------------------

Projeto criado por Marcelo Primo
