{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./aesthetics.nix
    ./autostart.nix
    ./binds.nix
    ./monitors.nix
    ./windowRules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];
    };
  };
}
