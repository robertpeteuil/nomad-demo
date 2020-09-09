#!/usr/bin/env bash

set -e

# Only works on macOS
[ `uname -s` != "Darwin" ] && return

# open additional terminal shells
open -a iTerm "$PWD"
open -a iTerm "$PWD"
