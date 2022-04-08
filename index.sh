#!/bin/bash

set -euo pipefail

__main() {
  local -r version="$1"

  if [ "$version" = '' ]
  then
    printf -- '%s\n' 'version is empty.' >&2
    return 1
  fi

  if [ "$(git tag --list "$version")" != '' ]
  then
    return 0
  fi

  local -r repo=./release
  local -r dist=./release/dict

  mkdir -p "$dist"

  yarn --ignore-engines add -D ameba-color-palette.css@"$version"

  node index.js > "$dist/ameba-color-palette.dict"

  git --git-dir="$repo/.git" --work-tree="$repo" add .
  git --git-dir="$repo/.git" --work-tree="$repo" commit -m release --allow-empty
  git --git-dir="$repo/.git" --work-tree="$repo" tag "$version"
}
__main "$@"
