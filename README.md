# Cloud Tools

[![CI](https://github.com/marcelooprimo/cloud-tools/actions/workflows/ci.yaml/badge.svg)](https://github.com/marcelooprimo/cloud-tools/actions/workflows/ci.yaml)
[![Release](https://github.com/marcelooprimo/cloud-tools/actions/workflows/release.yaml/badge.svg)](https://github.com/marcelooprimo/cloud-tools/actions/workflows/release.yaml)
[![Latest tag](https://img.shields.io/github/v/tag/marcelooprimo/cloud-tools?label=vers%C3%A3o)](https://github.com/marcelooprimo/cloud-tools/tags)
[![License: GPL-2.0](https://img.shields.io/badge/license-GPL--2.0-blue)](LICENSE)

Playbook Ansible que provisiona uma estação de trabalho completa de engenharia Cloud/DevOps em uma única execução: ferramentas de containers, Kubernetes, IaC, CLIs de nuvem (AWS, GCP, OCI) e shell — com as versões das ferramentas gerenciadas pelo [mise](https://mise.jdx.dev).

## Destaques

- **Detecção por família de S.O.** (`ansible_os_family`) com codinome upstream dinâmico — funciona em qualquer derivado Ubuntu/Debian sem hardcode de release.
- **Versionamento unificado via mise**: kubectl, terraform, terragrunt, go, node, helm, tflint, pre-commit, helm-docs, terraform-docs, helmfile, yq e oci-cli declarados em um único `config.toml`.
- **Idempotente**: reexecuções não refazem trabalho já concluído (validado no CI com dupla execução).
- **Testado em CI** com containers Ubuntu 24.04 e Linux Mint 22 a cada PR (ansible-lint + converge + verificação de idempotência).

## Distros suportadas

| Família | Distros testadas |
|---|---|
| Debian/Ubuntu | Ubuntu 22.04/24.04 · Linux Mint 21.x/22.x · Pop!_OS 22.04 |
| Suse | openSUSE Leap 15.6 |

> Para Ubuntu 20.04 / Mint 20.x utilize a [release 1.0.0](https://github.com/marcelooprimo/cloud-tools/releases/tag/1.0.0).

## O que é instalado

| Domínio | Ferramentas |
|---|---|
| Containers | Docker CE (+ buildx, compose) |
| Kubernetes | kubectl, krew (tree, node-shell), kubectx/kubens, kubefwd, kubepug, kubent, Lens¹ |
| Helm | helm 3, helm-diff, helm-secrets, helm-docs, helmfile |
| IaC | terraform, terragrunt, terraform-docs, tflint |
| Cloud CLIs | AWS CLI v2 (+ SSM plugin, aws-iam-authenticator), gcloud, oci-cli |
| Linguagens | Go, Node.js (via mise) |
| Segurança | trivy, sops, pre-commit |
| Shell & editor | zsh + oh-my-zsh + powerlevel10k, fontes MesloLGS NF, Tilix, VS Code + extensões, bat, jq, yq, fzf, shellcheck |
| Utilitários | Postman, meld, flameshot, htop, mtr, wireshark, entre outros (`vars/<família>.yaml`) |

¹ Itens marcados são opcionais/controlados por variável.

## Requisitos

- Ansible ≥ 2.15 e git no host de destino:

```sh
# Ubuntu/Mint/Debian
sudo apt install ansible git

# openSUSE Leap
sudo zypper install ansible git
```

## Uso

```sh
git clone https://github.com/marcelooprimo/cloud-tools.git
cd cloud-tools
ansible-playbook -i inventories/inventory.ini playbook-main.yaml --ask-become-pass
```

O playbook roda contra `localhost` (conexão local) e usa `become` apenas nas tarefas de sistema.

## Configuração

As variáveis ficam em `roles/workstation/defaults/main.yml`. Principais:

| Variável | Default | Efeito |
|---|---|---|
| `os_upgrade` | `"yes"` | Executa `dist-upgrade` no início (use `"no"` para runs rápidas/CI) |
| `mise_install` | `"yes"` | Instala o mise e o toolchain declarado |
| `golang_version` / `terraform_version` / `terragrunt_version` | pinadas | Versões fixas por reprodutibilidade |
| `kubectl_version` / `node_version` | `latest` / `lts` | Acompanham a última versão |
| `zsh_install` / `powerlevel10k` | `"yes"` | Shell zsh + tema |
| `trivy_install` | `"yes"` | Scanner de vulnerabilidades |
| `install_vscode_plugins` | `"yes"` | Extensões do VS Code |
| `jj_install` / `yq_install` | `"no"` | Utilitários opcionais |

Listas de pacotes por família de S.O.: `roles/workstation/vars/Debian.yaml` e `roles/workstation/vars/Suse.yaml`.

## Testes

O CI executa em cada PR: `ansible-lint`, convergência em containers (Ubuntu 24.04 e Mint 22) e **verificação de idempotência** (a segunda execução deve terminar com `changed=0`). Para reproduzir localmente:

```sh
docker run --rm -v "$PWD":/pb ubuntu:24.04 bash -c '
  apt-get update -qq && apt-get install -y -qq ansible git curl sudo unzip python3-apt
  useradd -m -s /bin/bash tester && echo "tester ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/tester
  cp -r /pb /home/tester/pb && chown -R tester: /home/tester/pb
  su - tester -c "cd ~/pb && ansible-playbook -i inventories/inventory.ini playbook-main.yaml -e os_upgrade=no -e install_vscode_plugins=no"
'
```

## Versionamento e contribuição

Releases seguem [SemVer](https://semver.org/lang/pt-BR/) e são geradas automaticamente por [semantic-release](https://github.com/semantic-release/semantic-release) a partir de commits/PRs no padrão [Conventional Commits](https://www.conventionalcommits.org/pt-br/) (`feat:`, `fix:`, `ci:`...). Contribuições são bem-vindas via pull request.

## Licença

Distribuído sob a licença [GPL-2.0](LICENSE).

## Autor

Marcelo Primo — [@marcelooprimo](https://github.com/marcelooprimo)
