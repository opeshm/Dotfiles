#!/usr/bin/env bash

set -euo pipefail

BASH_IT_REPO_URL="${BASH_IT_REPO_URL:-https://github.com/Bash-it/bash-it.git}"
BASH_IT_DIR="${BASH_IT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/bash-it}"
BASH_IT_REF="${BASH_IT_REF:-}"

if command -v git >/dev/null 2>&1; then
  :
else
  printf 'Error: git is required but was not found in PATH.\n' >&2
  exit 1
fi

install_or_update() {
  if [ -d "$BASH_IT_DIR/.git" ]; then
    printf 'Updating bash-it in %s\n' "$BASH_IT_DIR"
    git -C "$BASH_IT_DIR" fetch --tags --prune origin

    if [ -n "$BASH_IT_REF" ]; then
      git -C "$BASH_IT_DIR" checkout "$BASH_IT_REF"
    else
      git -C "$BASH_IT_DIR" checkout main 2>/dev/null || git -C "$BASH_IT_DIR" checkout master
      git -C "$BASH_IT_DIR" pull --ff-only origin "$(git -C "$BASH_IT_DIR" rev-parse --abbrev-ref HEAD)"
    fi
  else
    printf 'Cloning bash-it into %s\n' "$BASH_IT_DIR"
    mkdir -p "$(dirname "$BASH_IT_DIR")"
    git clone "$BASH_IT_REPO_URL" "$BASH_IT_DIR"

    if [ -n "$BASH_IT_REF" ]; then
      git -C "$BASH_IT_DIR" checkout "$BASH_IT_REF"
    fi
  fi
}

install_or_update

printf 'bash-it ready at %s\n' "$BASH_IT_DIR"
