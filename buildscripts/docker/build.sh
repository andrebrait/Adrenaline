#!/bin/bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

docker build . \
    -t "com.github.theflow0.adrenaline_build:$(git rev-parse --short HEAD)" \
    -t com.github.theflow0.adrenaline_build:latest \
    $@