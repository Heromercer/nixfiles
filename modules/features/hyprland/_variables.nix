{
  pkgs,
  config,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    settings = {
      "$mainMod" = "SUPER";
      "$shiftMod" = "SUPER_SHIFT";
      "$terminal" = "kitty";
      bind = [
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, Q, killactive"
      ];
    };
  };
}
