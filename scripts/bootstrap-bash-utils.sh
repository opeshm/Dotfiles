#!/usr/bin/env bash

set -euo pipefail

BASH_UTILS_REPO_URL="${BASH_UTILS_REPO_URL:-https://gitlab.com/opeshm/bash-utils.git}"
BASH_UTILS_DIR="${BASH_UTILS_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/bash-utils}"
BASH_UTILS_REF="${BASH_UTILS_REF:-}"

if command -v git >/dev/null 2>&1; then
  :
else
  printf 'Error: git is required but was not found in PATH.\n' >&2
  exit 1
fi

install_or_update() {
  if [ -d "$BASH_UTILS_DIR/.git" ]; then
    printf 'Updating bash-utils in %s\n' "$BASH_UTILS_DIR"
    git -C "$BASH_UTILS_DIR" fetch --tags --prune origin

    if [ -n "$BASH_UTILS_REF" ]; then
      git -C "$BASH_UTILS_DIR" checkout "$BASH_UTILS_REF"
    else
      git -C "$BASH_UTILS_DIR" checkout main 2>/dev/null || true
      git -C "$BASH_UTILS_DIR" pull --ff-only origin "$(git -C "$BASH_UTILS_DIR" rev-parse --abbrev-ref HEAD)"
    fi
  else
    printf 'Cloning bash-utils into %s\n' "$BASH_UTILS_DIR"
    mkdir -p "$(dirname "$BASH_UTILS_DIR")"
    git clone "$BASH_UTILS_REPO_URL" "$BASH_UTILS_DIR"

    if [ -n "$BASH_UTILS_REF" ]; then
      git -C "$BASH_UTILS_DIR" checkout "$BASH_UTILS_REF"
    fi
  fi
}

install_or_update

printf 'bash-utils ready at %s\n' "$BASH_UTILS_DIR"
