{
  pkgs,
  config,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      bind = [
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, Q, killactive"
      ];
    };
  };
}
