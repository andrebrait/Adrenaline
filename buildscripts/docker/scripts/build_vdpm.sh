#!/bin/bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

WORKDIR="$(pwd)"

git clone --branch master https://github.com/vitasdk/vdpm.git
cd vdpm
cat include/install-vitasdk.sh
git rev-parse --short HEAD > ${WORKDIR}/vdpm_rev.txt
./bootstrap-vitasdk.sh
export VITASDK=/usr/local/vitasdk
export PATH=${VITASDK}/bin:${PATH}
./install-all.sh
cd ..
rm -rf vdpm