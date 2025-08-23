#!/usr/bin/bash

# Usage:
#  ansi_escape <<< $'\x1b[38;5;12mHello World!\x1b[0m' # '\x1b[38;5;12mHello World!\x1b[0m'
function ansi_escape {
  # Remove ANSI escape sequences
  sed -E 's/\\/\\\\/g;s/\x1b/\\x1b/g'
}
