#!/bin/bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

if [ -z "${PSPDEV+x}" ]; then
    export PSPDEV=/usr/local/pspdev
    export PATH=$PATH:$PSPDEV/bin
fi

if [ -z "${VITASDK+x}" ]; then
    export VITASDK=/usr/local/vitasdk
    export PATH=$VITASDK/bin:$PATH
fi

./clean.sh

buildscripts/cef.sh
buildscripts/kernel.sh
buildscripts/vsh.sh
buildscripts/user.sh
buildscripts/updater.sh
buildscripts/bubble.sh
