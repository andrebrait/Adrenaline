#!/bin/bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

script_root="$(dirname "$(readlink -f $0)")"
parent_dir="$(dirname "${script_root}")"
. "${parent_dir}/utils.sh"
WORKDIR="$(pwd)"
cd "${script_root}"

git clone --branch master https://github.com/frangarcj/vita-shader-collection.git
cd vita-shader-collection
store_git_rev "${WORKDIR}"

git clone --branch master https://github.com/JagerDesu/vita-shaders.git
cd vita-shaders
store_git_rev "${WORKDIR}"
make CFLAGS="-std=gnu99 -Wall -O1 -mfloat-abi=hard -march=armv7-a -mtune=cortex-a9 -mfpu=neon -fsingle-precision-constant"
cp *.bin ../

cd ..
sed -i -e 's|./gcc-linaro-4.9-2015.02-3-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/libc|/usr/arm-linux-gnueabihf|g' Makefile
make
cp libvitashaders.a "${VITASDK}/arm-vita-eabi/lib/"
cp shaders/*.h "${VITASDK}/arm-vita-eabi/include/"