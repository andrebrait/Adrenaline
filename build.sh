#!/bin/bash

./clean.sh

if [ -z "${PSPDEV+x}" ]; then
    export PSPDEV=/usr/local/pspdev
    export PATH=$PSPDEV/bin:$PATH
fi

if [ -z "${VITASDK+x}" ]; then
    export VITASDK=/usr/local/vitasdk
    export PATH=$VITASDK/bin:$PATH
fi

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

bash -c "cd cef && make"
bash -c "cd kernel && mkdir build && cd build && cmake .. && make all pkg updater && make install"
bash -c "cd vsh && mkdir build && cd build && cmake .. && make all pkg"
bash -c "cd user && mkdir build && cd build && cmake .. && make all pkg updater"
bash -c "cd cef && make -C updater"
bash -c "cd bubble && mkdir build && cd build && cmake .. && make"
