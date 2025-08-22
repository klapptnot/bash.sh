#!/usr/bin/bash

# Usage:
#   str_unescape <<< 'A string\n\tThat will be \"unescaped\"'
function str_unescape {
  : "$(< /dev/stdin)"
  : "${_//\\\"/\"}"
  printf "%s" "${_@E}"
}
