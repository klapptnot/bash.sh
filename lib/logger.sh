#!/usr/bin/bash

# SPDX-License-Identifier: AGPL-3.0-or-later
# Copyright (c) 2025-present Klapptnot

declare -gra LOGGER_LOG_COLORS=(
  ''
  '\x1b[30m\x1b[41m'
  '\x1b[31m'
  '\x1b[33m'
  '\x1b[34m'
  '\x1b[32m'
)
declare -gra LOGGER_LEVEL_NAMES=(
  'OFF'   # 0
  'CRIT'  # 1
  'ERROR' # 2
  'WARN'  # 3
  'INFO'  # 4
  'DEBUG' # 5
)
declare -grA LOGGER_LEVEL_NUMS=(
  ['o']=0
  ['c']=1
  ['e']=2
  ['w']=3
  ['i']=4
  ['d']=5
)

# Print (or not) to output info based on the LOGGER_LEVEL env var
# LOGGER_LEVEL is set to `i` by default
# Usage:
#   log <level> <fmt> [args...]
# Example:
#   $ some_fun_or_script() {
#   >   log d 'Given %d params' ${#}
#   >  }
#   $
#   $ some_fun_or_script a b c d # does not print
#   $ LOGGER_LEVEL=d some_fun_or_script a b c d # prints the info
#   Given 4 params
function log {
  [[ -z "${1}" ]] && return

  : "${1:0:1}"
  local -ri level="${LOGGER_LEVEL_NUMS[${_,,}]:-0}"
  local -ri log_level="${LOGGER_LEVEL:-0}"
  ((0 == log_level || level > log_level)) && return

  # shellcheck disable=SC2059
  printf -v message "${2}" "${@:3}"

  local color="${LOGGER_LOG_COLORS[level]}"
  if ((${#1} > 1)); then
    printf '%b[%(%F %T)T] %5s: %s\x1b[0m\n' "${color}" -1 "${LOGGER_LEVEL_NAMES[level]}" "${message}"
  else
    printf '%b%s\x1b[0m\n' "${color}" "${message}"
  fi
}
