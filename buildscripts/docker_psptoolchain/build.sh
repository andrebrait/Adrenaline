#!/bin/bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

if [ -z "$(docker images -q com.github.theflow0.psp_toolchain:latest 2> /dev/null)" ]; then
    TOOLCHAIN_REV="$(git ls-remote https://github.com/pspdev/psptoolchain.git refs/heads/master | awk '{ print substr($1,1,7) }')"
    docker build . \
        -t "com.github.theflow0.psp_toolchain:${TOOLCHAIN_REV}" \
        -t com.github.theflow0.psp_toolchain:latest
fi