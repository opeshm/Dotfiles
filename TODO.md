# TODO - Dotfiles Improvements

This file tracks pending improvements after the migration to GNU Stow.

## P1 - High Priority

- [ ] Replace hardcoded `/home/opes` paths with `$HOME` or XDG variables.
  - Affected examples:
    - `bashrc/.bashrc`
    - `rofi/.config/rofi/config.rasi`
    - `xmobar/.config/xmobar/xmobarrc`
    - `nitrogen/.config/nitrogen/nitrogen.cfg`

- [ ] Fix startup path inconsistencies in `wm-startup`.
  - `wm-startup/.config/wm-startup.sh` references `~/.config/polybar-nzxt/launch.sh`, but the repo currently uses `polybar/.config/polybar/docky-nzxtarch/...`.

- [ ] Improve repository hygiene.
  - Add useful patterns to `.gitignore`.
  - Remove or relocate tracked backup files:
    - `xmonad/.config/xmonad/xmonad.hs.fullbak`
    - `xmonad/.config/xmonad/xmonad.hs.custombak`

## P2 - Medium Priority

- [ ] Standardize shell scripting conventions.
  - Prefer `#!/usr/bin/env bash`.
  - Use `set -euo pipefail` for scripts where safe.
  - Quote variables consistently.
  - Avoid fragile parsing patterns like `ls` in command substitution.

- [ ] Reduce machine-specific assumptions.
  - Externalize host-specific config (`HOSTNAME`, monitor scripts, network interfaces).
  - Replace hardcoded interface names (example: `wlo1` in xmobar config) with configurable values.

## P3 - Nice to Have

- [ ] Add a unified installer script.
  - Example: `scripts/install.sh` to validate dependencies, update submodules, and run stow.

- [ ] Add a health check script.
  - Example: `scripts/healthcheck.sh` to verify required commands, paths, and expected files.

- [ ] Improve documentation.
  - Add per-package notes (what each package configures, and machine-specific caveats).
  - Document optional components and compatibility notes (X11 vs Wayland).

## Workflow

- [ ] Keep this file updated whenever technical debt is found.
- [ ] Move completed items to a "Done" section with date.
