#!/bin/bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

WORKDIR="$(pwd)"

git clone --branch master https://github.com/pspdev/psptoolchain.git
cd psptoolchain
git rev-parse --short HEAD > ${WORKDIR}/psptoolchain_rev.txt
./prepare-debian-ubuntu.sh -y
export PSPDEV=/usr/local/pspdev
export PATH=${PATH}:${PSPDEV}/bin
./toolchain.sh
cd ..
rm -rf psptoolchain