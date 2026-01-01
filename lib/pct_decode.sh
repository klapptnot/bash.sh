#!/usr/bin/bash
# 🔗 https://github.com/klapptnot/bash.sh

# Usage:
#   pct_decode <<< "I%20%F0%9F%92%9C%20bash" # I 💜 bash
function pct_decode {
  : "$(< /dev/stdin)"
  printf "%b" "${_//\%/\\x}"
}
