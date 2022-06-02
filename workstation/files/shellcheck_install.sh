#!/bin/bash

cd /tmp
VERSION=$(curl -s https://api.github.com/repos/koalaman/shellcheck/releases/latest | grep tag_name | cut -d '"' -f 4)
curl -LO https://github.com/koalaman/shellcheck/releases/download/"$VERSION"/shellcheck-"$VERSION".linux.x86_64.tar.xz
tar xJvf shellcheck-"$VERSION".linux.x86_64.tar.xz
mv shellcheck-$VERSION/shellcheck /usr/bin/shellcheck
rm -rf /tmp/shellcheck-"$VERSION"/
rm /tmp/shellcheck-"$VERSION".linux.x86_64.tar.xz
shellcheck --version
cd -