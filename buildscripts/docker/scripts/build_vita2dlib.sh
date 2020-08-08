#!/bin/bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

WORKDIR="$(pwd)"

if [ -z "${VITASDK+x}" ]; then
    export VITASDK="/usr/local/vitasdk"
    export PATH="${VITASDK}/bin:${PATH}"
fi

git clone --branch fbo_but_faster https://github.com/andrebrait/vita2dlib.git # TODO: change this to upstream/fbo after https://github.com/frangarcj/vita2dlib/pull/7 gets merged
cd vita2dlib
git rev-parse --short HEAD > ${WORKDIR}/vita2dlib_fbo_rev.txt
cd libvita2d
make
make install
cd ../../
rm -rf vita2dlib