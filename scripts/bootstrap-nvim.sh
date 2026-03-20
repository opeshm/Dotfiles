#!/usr/bin/env bash

set -euo pipefail

NVIM_CONFIG_REPO_URL="${NVIM_CONFIG_REPO_URL:-git@gitlab.com:opeshm/dotfiles-nvim-config.git}"
NVIM_CONFIG_DIR="${NVIM_CONFIG_DIR:-${XDG_CONFIG_HOME:-$HOME/.config}/nvim}"
NVIM_CONFIG_REF="${NVIM_CONFIG_REF:-}"

if command -v git >/dev/null 2>&1; then
  :
else
  printf 'Error: git is required but was not found in PATH.\n' >&2
  exit 1
fi

install_or_update() {
  if [ -d "$NVIM_CONFIG_DIR/.git" ]; then
    printf 'Updating nvim config in %s\n' "$NVIM_CONFIG_DIR"
    git -C "$NVIM_CONFIG_DIR" fetch --tags --prune origin

    if [ -n "$NVIM_CONFIG_REF" ]; then
      git -C "$NVIM_CONFIG_DIR" checkout "$NVIM_CONFIG_REF"
    else
      git -C "$NVIM_CONFIG_DIR" checkout main 2>/dev/null || git -C "$NVIM_CONFIG_DIR" checkout master
      git -C "$NVIM_CONFIG_DIR" pull --ff-only origin "$(git -C "$NVIM_CONFIG_DIR" rev-parse --abbrev-ref HEAD)"
    fi
  else
    printf 'Cloning nvim config into %s\n' "$NVIM_CONFIG_DIR"
    mkdir -p "$(dirname "$NVIM_CONFIG_DIR")"
    git clone "$NVIM_CONFIG_REPO_URL" "$NVIM_CONFIG_DIR"

    if [ -n "$NVIM_CONFIG_REF" ]; then
      git -C "$NVIM_CONFIG_DIR" checkout "$NVIM_CONFIG_REF"
    fi
  fi
}

install_or_update

printf 'nvim config ready at %s\n' "$NVIM_CONFIG_DIR"
