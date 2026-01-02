#!/usr/bin/bash
# termux only
# SPDX-License-Identifier: AGPL-3.0-or-later
# Copyright (c) 2025-present Klapptnot


function sys-sh {
  # Prefer Shizuku
  if command -v rish >/dev/null 2>&1; then
    local args=("${@:2}")
    rish -c "${1} ${args[*]@Q}" && return 0
  fi

  echo "trying adb..." >&2

  # Fallback to adb
  if ! ADB_DEV=$(adbc 2>/dev/null); then
    echo "sys-sh: no rish, no adb :/" >&2
    return 1
  fi

  adb -s "${ADB_DEV}" shell "${@}"
}
