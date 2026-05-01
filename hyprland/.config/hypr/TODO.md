# TODO Hyprland

## Prioridad alta
- [ ] Arreglar `Lock screen` desde `wofi-power-menu`:
  1. Crear `~/.config/hypr/hypridle.conf` con:
     ```ini
     general {
         lock_cmd = pidof hyprlock || hyprlock
         before_sleep_cmd = loginctl lock-session
     }
     ```
  2. Añadir en `hyprland-autostart.conf`:
     - `exec-once = hypridle`
  3. Recargar Hyprland (`hyprctl reload`) o reiniciar sesión.

- [ ] Eliminar redundancia de teclado:
  - Quitar `setxkbmap -option caps:swapescape` de `startup.sh`
  - Mantener solo `kb_options = caps:swapescape` en `hyprland-inputs.conf`

## Prioridad media
- [ ] Simplificar autostart en `hyprland-autostart.conf`:
  - Separar procesos en líneas individuales (`nm-applet`, `waybar`, `hyprpaper`)
  - Evitar usar `&` dentro de `exec-once`

- [ ] Añadir keybinds de calidad de vida en `hyprland-keybinding.conf`:
  - `bind = $mainMod, I, pin`
  - `bind = $mainMod, G, centerwindow`

- [ ] Añadir reglas de ventanas flotantes para utilidades en `hyprland-windows.conf`:
  - `pavucontrol`
  - diálogos/confirmaciones
  - calculadora
  - selectores de archivo

## Prioridad baja
- [ ] Añadir fallback de monitor en `UserConfigs/monitors.conf` o `hyprland-monitors.conf`:
  - `monitor=,preferred,auto,1`

- [ ] Corregir comentario de screenshot en `hyprland-keybinding.conf`
  - Ahora dice "full screen" pero usa `hyprshot -m region`

## Opcional (mejora futura)
- [ ] Revisar reglas por app para abrir centradas y con tamaño consistente (`size 60% 70%`, `center`)
- [ ] Documentar atajos personalizados al inicio de `hyprland-keybinding.conf`

## Hecho hoy
- [x] Waybar: click en icono de volumen abre `pavucontrol`
  - Archivo: `~/.config/waybar/config.jsonc`
  - Cambio aplicado en módulo `pulseaudio`:
    - `"on-click": "pavucontrol"`
