#!/bin/bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

WORKDIR="$(pwd)"

git clone https://bitbucket.org/DaveeFTW/psp-packer.git
cd psp-packer
git rev-parse --short HEAD > ${WORKDIR}/psp-packer_rev.txt
cmake .
make

if [ -z "${PSPDEV+x}" ]; then
    export PSPDEV="/usr/local/pspdev"
fi

cp psp-packer ${PSPDEV}/bin/
cd ..
rm -rf psp-packer