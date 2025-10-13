{config, ...}: {
  wayland.windowManager.hyprland.settings.windowrulev2 = [
    # Opacity rules
    "opacity 0.9 override 0.7, class:kitty"

    # ===== MAIN STEAM WINDOW (TILED) =====
    "workspace 5, class:^(steam)$, title:^(Steam)$"
    "monitor DP-1, class:^(steam)$, title:^(Steam)$"
    "float, class:steam"
    "tile, class:steam, title:Steam"

    # ===== GAMES (FULLSCREEN ON WORKSPACE 8, DP-1) =====
    "workspace 8, class:^(steam_app_.*|steam_proton_.*)$"
    "monitor DP-1, class:^(steam_app_.*|steam_proton_.*)$"
    "fullscreen, class:^(steam_app_.*|steam_proton_.*)$"

    # Browser rules (Zen Browser)
    "workspace 2, class:firefox"
    "monitor eDP-1, class:firefox"

    # Discord rules (Vesktop)
    "workspace 7, class:vesktop"
    "monitor eDP-1, class:vesktop"

    # MPV rule
    "fullscreen, class:mpv"

    # ATLauncher
    "float, class:com-atlauncher-App"

    # Waypaper
    "float, class:waypaper"

    # Eye of Gnome
    "float, class:org.gnome.eog"
  ];
}
