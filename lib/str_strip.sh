#!/usr/bin/bash
# 🔗 https://github.com/klapptnot/bash.sh

# Strip leading or trailing [:space:] from stdin input
# Usage:
#    str_strip start <<< "  Hi! UwU~  " # "Hi! UwU~  "
#    str_strip end   <<< "  Hi! UwU~  " # "  Hi! UwU~"
#    str_strip       <<< "  Hi! UwU~  " # "Hi! UwU~"
function str_strip {
  : "$(< /dev/stdin)"
  local s="${_}"
  [ "${1}" != "start" ] && s="${s%"${s##*[![:space:]\n]}"}"
  [ "${1}" != "end" ] && s="${s#"${s%%[![:space:]\n]*}"}"
  printf "%s" "${s}"
}
