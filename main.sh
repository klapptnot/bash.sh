#!/usr/bin/env bash

set -euo pipefail

read -r SCRIPT_PATH < <(realpath "${BASH_SOURCE[0]}")
readonly SCRIPT_DIR="${SCRIPT_PATH%/*}"
readonly LOCAL_BIN="${HOME}/.local/bin"
readonly LOCAL_LIB="${HOME}/.local/lib/bash.sh"

function main {
  cd "${SCRIPT_DIR}"

  echo "Installing bash tools using bstow..."

  mkdir -p "${LOCAL_BIN}" "${LOCAL_LIB}"

  echo "Downloading barg.sh to ${SCRIPT_DIR}/lib/..."
  curl -fsSL https://raw.githubusercontent.com/klapptnot/barg.sh/main/barg.sh -o "${SCRIPT_DIR}/lib/barg.sh"
  echo "Downloading bstow to ${SCRIPT_DIR}/bin/..."
  curl -fsSL https://raw.githubusercontent.com/klapptnot/bstow/main/bstow -o "${SCRIPT_DIR}/bin/bstow"

  chmod 755 "${SCRIPT_DIR}/bin/bstow"

  if [[ ! -x "${SCRIPT_DIR}/bin/bstow" ]]; then
    echo "Error: bstow not found in ${SCRIPT_DIR}/bin/" >&2
    exit 1
  fi

  echo "Linking bin/ to ${LOCAL_BIN}..."
  "${SCRIPT_DIR}/bin/bstow" -Sv -t "${LOCAL_BIN}" -d "${SCRIPT_DIR}/bin"

  echo "Linking lib/ to ${LOCAL_LIB}..."
  "${SCRIPT_DIR}/bin/bstow" -Sv -t "${LOCAL_LIB}" -d "${SCRIPT_DIR}/lib"

  echo "Linking .bash_env to ${HOME}..."
  ln -sf "${SCRIPT_DIR}/.bash_env" ~/.bash_env

  echo "Installation complete!"
  echo "Add ${LOCAL_BIN} to your PATH if not already present"
}

main "${@}"
