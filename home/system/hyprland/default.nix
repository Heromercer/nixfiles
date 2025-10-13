{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./aesthetics.nix
    ./binds.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
