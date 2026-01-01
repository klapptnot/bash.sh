#!/usr/bin/bash

function nucompletion-adapter {
  local s='' res=() o="${IFS}"
  while IFS=$'\t\n' read -r value desc; do
    value="${value@Q}" # escape string
    value="${value/#\$/}" # remove leading $ (if found)
    value="${value:1:-1}" # remove '...' quotes added
    # display="${display@Q}"
    # display="${display/#\$/}"
    # display="${display:1:-1}"
    desc="${desc@Q}"
    desc="${desc/#\$/}"
    desc="${desc:1:-1}"
    printf -v s '{"value":"%s", "display": "%s", "description": "%s", "style": {"fg": "green"}}' "${value}" "${value}" "${desc}"
    res+=("${s}")
  done
  IFS=',' s="${res[*]}"
  IFS="${o}"
  printf '[%s]' "${s}"
}
