#!/bin/bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

WORKDIR="$(pwd)"

git clone --branch master https://github.com/vitasdk/vdpm.git
cd vdpm
sed -i 's|wget -qO- https://github.com/vitasdk/vita-headers/raw/master/.travis.d/last_built_toolchain.py|echo "https://github.com/vitasdk/autobuilds/releases/download/master-linux-v990/vitasdk-x86_64-linux-gnu-2019-02-08_21-54-15.tar.bz2"|' include/install-vitasdk.sh
sed -i 's/ | python - $@//' include/install-vitasdk.sh
cat include/install-vitasdk.sh
git rev-parse --short HEAD > ${WORKDIR}/vdpm_rev.txt
./bootstrap-vitasdk.sh
export VITASDK=/usr/local/vitasdk
export PATH=${VITASDK}/bin:${PATH}
./install-all.sh
cd ..
rm -rf vdpm