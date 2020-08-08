#!/bin/bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

WORKDIR="$(pwd)"

if [ -z "${VITASDK+x}" ]; then
    export VITASDK="/usr/local/vitasdk"
    export PATH="${VITASDK}/bin:${PATH}"
fi

git clone --branch master https://github.com/frangarcj/vita-shader-collection.git
cd vita-shader-collection
git rev-parse --short HEAD > ${WORKDIR}/vita-shader-collection_rev.txt

git clone --branch master https://github.com/JagerDesu/vita-shaders.git
cd vita-shaders
git rev-parse --short HEAD > ${WORKDIR}/vita-shaders_rev.txt
make CFLAGS="-std=gnu99"
cp *.bin ../

cd ..
sed -i -e 's|./gcc-linaro-4.9-2015.02-3-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/libc|/usr/arm-linux-gnueabihf|g' Makefile
make
cp libvitashaders.a "${VITASDK}/arm-vita-eabi/lib/"
cp shaders/*.h "${VITASDK}/arm-vita-eabi/include/"
cd ../
rm -rf vita-shader-collection