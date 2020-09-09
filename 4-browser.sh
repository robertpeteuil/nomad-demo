#!/usr/bin/env bash

set -e

# Only works on macOS
[ `uname -s` != "Darwin" ] && return

# apply licenses
sleep 10
consul license put "$CONSUL_LICENSE"
echo $NOMAD_LICENSE | nomad license put -

# open browser tabs
open http://localhost:8500
open http://localhost:4646
open http://localhost:8080
