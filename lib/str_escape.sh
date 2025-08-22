#!/usr/bin/bash

# Usage:
#  str_escape <<< $'A string\n\tThat will be "escaped"'
function str_escape {
  : "$(< /dev/stdin)"
  local s="${_@Q}"
  [ "${s:0:1}" == '$' ] && s="${s:1}"
  # remove sorrounding 'string'
  s="${s:1:-1}"
  # `'\''` (close, add quote, reopen)
  s="${s//\'\\\'\'/\'}"
  printf "%s" "${s//\"/\\\"}"
}
