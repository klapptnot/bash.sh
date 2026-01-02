#!/usr/bin/bash

# SPDX-License-Identifier: AGPL-3.0-or-later
# Copyright (c) 2025-present Klapptnot

# Usage:
#  xml_escape_all <<< "escape" # &#101;&#115;&#99;&#97;&#112;&#101;
function xml_escape_all {
  local encoded=""
  : "$(< /dev/stdin)"
  local s="${_}"
  for ((i = 0; i < ${#s}; i++)); do
    printf -v encoded "%s&#%d;" "${encoded}" "'${s:i:1}"
  done
  printf '%s' "${encoded}"
}
