# AGENTS.md

## Repo Shape
- This is a GNU Stow dotfiles repo; each top-level directory is a stow package whose contents map into `$HOME`.
- `nvim` is intentionally absent from the stow package list: `scripts/bootstrap-nvim.sh` clones it into `${XDG_CONFIG_HOME:-$HOME/.config}/nvim` from `git@gitlab.com:opeshm/dotfiles-nvim-config.git`.
- `.gitmodules` is empty; external dependencies are cloned/updated by scripts, not submodules.

## Setup Commands
- Bootstrap required shell dependencies with `./scripts/bootstrap-bash-it.sh` and `./scripts/bootstrap-bash-utils.sh`; both support `*_REPO_URL`, `*_DIR`, and `*_REF` env overrides.
- Bootstrap Neovim config with `./scripts/bootstrap-nvim.sh`; use `NVIM_CONFIG_REF=...` to pin a version.
- Stow all documented packages with `stow --target="$HOME" alacritty bashrc conky hyprland i3 nitrogen picom polybar rofi stalonetray tmux wm-startup xmobar xmonad`.
- Unstow with `stow -D --target="$HOME" alacritty bashrc conky hyprland i3 nitrogen picom polybar rofi stalonetray tmux wm-startup xmobar xmonad`.

## Verification
- There is no CI, package manifest, central test runner, or formatter config in this repo.
- For shell edits, run focused syntax checks such as `bash -n scripts/bootstrap-bash-it.sh scripts/bootstrap-bash-utils.sh scripts/bootstrap-nvim.sh` and include any changed shell scripts.
- For XMonad edits, `xmonad --recompile` is the meaningful check, but it depends on the config being installed under `~/.config/xmonad` and local Haskell/XMonad packages.

## Config Entrypoints
- Hyprland entrypoint is `hyprland/.config/hypr/hyprland.conf`; it sources the split `hyprland-*.conf` files and then `UserConfigs/**.conf` for local overrides.
- Hyprland autostart runs `pam_kwallet_init`, `nm-applet`, `hyprpolkitagent`, `waybar & hyprpaper`, `swaync`, and `$HOME/.config/hypr/startup.sh`.
- XMonad entrypoint is `xmonad/.config/xmonad/xmonad.hs`; startup also sources `~/.config/wm-startup.sh` after launching `picom`, `nitrogen`, `nm-applet`, and `volumeicon`.
- X11 startup logic in `wm-startup/.config/wm-startup.sh` is hostname-specific (`nzxt`, `asusarch`, `archalpha`) and currently references a known stale `~/.config/polybar-nzxt/launch.sh` path for `nzxt`.

## Gotchas
- Several files intentionally still contain machine-specific `/home/opes`, hostname, monitor, and network-interface assumptions; see `TODO.md` before broad cleanup.
- Do not delete tracked backup/build-looking XMonad files like `xmonad.hs.fullbak`, `xmonad.hs.custombak`, or `lib/Colors/Aci.o` unless explicitly asked.
- Preserve executable bits and shebang behavior when changing scripts; existing scripts are a mix of `#!/usr/bin/env bash` and `#!/bin/bash`.
