#!/bin/bash

VERSION_SOPS=$(curl -s https://api.github.com/repos/getsops/sops/releases/latest | grep tag_name | cut -d '"' -f 4)
curl -LO https://github.com/getsops/sops/releases/download/"$VERSION_SOPS"/sops-"$VERSION_SOPS".linux
mv sops-"$VERSION_SOPS".linux /usr/local/bin/sops
chmod +x /usr/local/bin/sops
