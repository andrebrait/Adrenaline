#!/bin/bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

bash -c "cd buildscripts/docker_psptoolchain && ./build.sh"
bash -c "cd buildscripts/docker && ./build.sh"

docker run -v"$(pwd)":/root/Adrenaline --rm com.github.theflow0.adrenaline_build:latest ./build.sh