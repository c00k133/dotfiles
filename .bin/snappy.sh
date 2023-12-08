#!/usr/bin/env nix-shell
#!nix-shell -i bash -p python310 python310Packages.python-snappy
OPTS="${1:-"--help"}"
python -m snappy "${OPTS}"
