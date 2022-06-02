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
cloud_tools
├── playbook-main.yaml
├── README.md
└── workstation
    ├── files
    │   ├── aliases
    │   ├── shellcheck_install.sh
    │   ├── sops_install.sh
    │   └── sync_git.sh
    ├── tasks
    │   ├── aws_package.yaml
    │   ├── bat_package.yaml
    │   ├── docker_package.yaml
    │   ├── gcloud_package.yaml
    │   ├── golang_package.yaml
    │   ├── helm_docs_package.yaml
    │   ├── helmfile_package.yaml
    │   ├── helm_package.yaml
    │   ├── jj_package.yaml
    │   ├── k8splugins_package.yaml
    │   ├── krew_package.yaml
    │   ├── kubectl_package.yaml
    │   ├── kubectx_kubens_package.yaml
    │   ├── main.yaml
    │   ├── misc.yaml
    │   ├── os_packages.yaml
    │   ├── terraformdocs_package.yaml
    │   ├── tfenv_package.yaml
    │   ├── tgenv_package.yaml
    │   ├── vscode.yaml
    │   ├── yq_package.yaml
    │   └── zsh_package.yaml
    └── vars
        └── main.yaml

```

Informações Importantes
-------

- **Este playbook foi testado nas distros ```ubuntu 20.04``` e ```Linux Mint 20.3``` (que é uma variante da primeira).**
- Ele irá instalar o ZShell no host e configurá-lo como padrão com o tema powerlevel10k.
- Há opção de instalar o docker machine, mas é necessário alterar a opção no arquivo ```workstation/vars/main.yaml```
- O diretório ```workstation/files``` contém alguns scripts de instalação e os aliases customizados.
- Possivelmente haverá alguns bugs, necessidade de melhoria de código, então, sinta-se à vontade para corrigí-los; Juntos podemos deixá-lo melhor e mais eficiente.
- **Não esqueça do seu PR após alteração relevante**. :wink:

Licença de uso
------------------

O uso deste playbook é livre e pode ser modificado/melhorado conforme necessidade ;-)

Informações do Autor
------------------

Projeto criado por Marcelo Primo
