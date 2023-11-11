# DotFiles

Proyecto para la gestión de mis dotfiles.

# Instrucciones

## Dependencias

Enlaces a los proyectos de las dependencias:
- [github bash-it/bash-it](https://github.com/Bash-it/bash-it.git)
- [gitlab opeshm/bash-utils](https://gitlab.com/opeshm/bash-utils)
- [gitlab opeshm/wallpapers](https://gitlab.com/opeshm/wallpapers)
- [github ryanoasis/Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
- [SpaceVim](https://spacevim.org/)

### Instalación de dependencias obligatorias
* Instalar bash-it
  ```bash
  git clone https://github.com/bash-it/bash-it.git .config/bash_it
  ```
* Instalar bash-utils
  ```bash
  git clone https://gitlab.com/opeshm/bash-utils.git .config/bash-utils
  ```

## Instalación

* Primero clonamos el repositorio dentro de la carpeta .config del usuario:
  ```bash
  git clone --bare https://gitlab.com/opeshm/dotfiles ~/.config/dotfiles
  ```
  > Importante usar la opcion --bare del clone.

* Creamos un alias termporal para trabajar con el repositorio
  ```bash
  alias config='/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME'
  ```

* Hacemos un reset del repo para que descarte posibles conflictos entre los archivos actuales y los del repositorio.
  ```bash
  config reset --hard
  ```
* Actualizamos todos nuestros archivos locales
  ```bash
  config checkout .
  ```

# Enlaces de interes

- [Arch Linux wiki - Dotfiles](https://wiki.archlinux.org/title/Dotfiles)

# Kown Issues

## setlocale: LC_ALL
`-bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8): No such file or directory`
Por lo general, este error sale en los WSL. Para corregirlo, solo ejecutar la reconfiguración del packet locales
y seguir las instrucciones
```bash
sudo dpkg-reconfigure locales
```
