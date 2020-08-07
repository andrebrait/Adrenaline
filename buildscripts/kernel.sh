#!/bin/bash

# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

cd kernel && mkdir build && cd build && cmake .. && make && make pkg && make updater && make install