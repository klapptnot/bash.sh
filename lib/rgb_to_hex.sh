#!/usr/bin/bash

# SPDX-License-Identifier: AGPL-3.0-or-later
# Copyright (c) 2025-present Klapptnot

# Usage
#   rgb_to_hex <<< "rgb(120,77,255)" # #784dFF
function rgb_to_hex {
  : "$(< /dev/stdin)"
  : "${_//\ /}"
  local rgb="${_:4:${#_}-2}"
  # This works as long as printf will print the result
  # instead of just exiting with a stderr message
  # shellcheck disable=SC2086
  printf '#%02x%02x%02x' ${rgb//,/\ } 2> /dev/null
  return 0 # Mask the return status code (printf will return > 0)
}
