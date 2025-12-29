{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri
    ./binds.nix
    ./windowRules.nix
  ];
  services.hyprpolkitagent.enable = true;
  programs.niri.settings = {
    prefer-no-csd = true;

    screenshot-path = "~/Pictures/screenshots";

    input = {
      keyboard = {
        repeat-rate = 25;
        repeat-delay = 200;
        numlock = true;
        xkb = {};
      };
      mouse = {
        enable = true;
        accel-speed = -0.7;
      };
      touchpad = {
        enable = true;
        tap = true;
      };
      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "0%";
      };
    };

    outputs = {
      "DP-1" = {
        mode = {
          width = 2560;
          height = 1440;
          refresh = 144.006;
        };
        scale = 1;
      };

      "DP-3" = {
        mode = {
          width = 2560;
          height = 1440;
          refresh = 144.006;
        };
        scale = 1;
      };
    };

    cursor = {
      theme = config.home.pointerCursor.name;
      size = config.home.pointerCursor.size;
      hide-after-inactive-ms = 500;
    };

    environment = {
      XDG_CURRENT_DESKTOP = "niri";
      QT_QPA_PLATFORM = "wayland";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      QT_QPA_PLATFORMTHEME = "gtk3";
      QT_QPA_PLATFORMTHEME_QT6 = "gtk3";
    };

    layout = {
      border.enable = false;
      focus-ring.enable = false;
    };

    gestures = {
      hot-corners.enable = false;
    };
  };
}
