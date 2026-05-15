# DotFiles

Repositorio para gestionar mis dotfiles usando GNU Stow.

# Instrucciones

## Dependencias

Enlaces a los proyectos de las dependencias:
- [github bash-it/bash-it](https://github.com/Bash-it/bash-it.git)
- [gitlab opeshm/bash-utils](https://gitlab.com/opeshm/bash-utils)
- [gitlab opeshm/wallpapers](https://gitlab.com/opeshm/wallpapers)
- [github ryanoasis/Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
- [SpaceVim](https://spacevim.org/)

Dependencias base para instalar los dotfiles:
- `git`
- `stow`

### Instalacion de dependencias obligatorias
- Instalar bash-it:
  ```bash
  ./scripts/bootstrap-bash-it.sh
  ```
- Instalar bash-utils:
  ```bash
  ./scripts/bootstrap-bash-utils.sh
  ```
- Instalar mis utilidades para bash-utils:
  ```bash
  git clone https://gitlab.com/opeshm/bu-custom-utils.git ~/.local/share/bash-utils/utils/bu-custom-utils
  ```

Opcionalmente puedes fijar una version concreta de `bash-utils`:
```bash
BASH_UTILS_REF=v1.2.3 ./scripts/bootstrap-bash-utils.sh
```

Opcionalmente puedes fijar una version concreta de `bash-it`:
```bash
BASH_IT_REF=v3.0.1 ./scripts/bootstrap-bash-it.sh
```

## Instalacion con GNU Stow

1. Clona el repositorio:
   ```bash
   git clone git@gitlab.com:opeshm/dotfiles.git ~/.dotfiles
   ```

2. Entra al repo:
   ```bash
   cd ~/.dotfiles
   ```

3. Instala dependencias:
   - bash-it:
     ```bash
     ./scripts/bootstrap-bash-it.sh
     ```
   - bash-utils:
     ```bash
     ./scripts/bootstrap-bash-utils.sh
     ```
   - configuración de Neovim:
     ```bash
     ./scripts/bootstrap-nvim.sh
     ```
     Puedes fijar una versión concreta con `NVIM_CONFIG_REF=v1.2.3`.

4. Crea symlinks en tu `$HOME` para todos los paquetes:
   ```bash
   stow --target="$HOME" alacritty bashrc conky ghostty hyprland i3 nitrogen picom polybar rofi stalonetray tmux wm-startup xmobar xmonad
   ```
   Nota: `nvim` no se instala con stow, ya que su configuración se clona directamente en `~/.config/nvim`.

Si prefieres aplicar solo algunos paquetes, pasa solo esos nombres a `stow`.

### Desinstalar symlinks

Para quitar los enlaces creados por stow:
```bash
stow -D --target="$HOME" alacritty bashrc conky ghostty hyprland i3 nitrogen picom polybar rofi stalonetray tmux wm-startup xmobar xmonad
```

# Enlaces de interes

- [Arch Linux wiki - Dotfiles](https://wiki.archlinux.org/title/Dotfiles)

# Known issues

## setlocale: LC_ALL
`-bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8): No such file or directory`

Por lo general, este error aparece en WSL. Para corregirlo, ejecuta la reconfiguracion de locales y sigue el asistente:
```bash
sudo dpkg-reconfigure locales
```
