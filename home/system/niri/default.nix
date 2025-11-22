{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri
  ];
  #xdg.configFile."niri/config.kdl".source = ./config.kdl;

  #services.hyprpolkitagent.enable = true;
  programs.niri.settings = {
    prefer-no-csd = true;

    input = {
      keyboard = {
        repeat-rate = 25;
        repeat-delay = 200;
        numlock = true;
        xkb = {};
      };
      mouse = {
        enable = true;
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
    };

    binds = with config.lib.niri.actions; {
      "Mod+Shift+Slash".action = show-hotkey-overlay;
      "Mod+Return".action.spawn-sh = "kitty -e fish -c 'fastfetch; exec fish'";
      "Mod+Q" = {
        action = close-window;
        repeat = false;
      };
      "Mod+O" = {
        action = toggle-overview;
        repeat = false;
      };

      "Mod+H".action = focus-column-left;
      "Mod+L".action = focus-column-right;
      "Mod+K".action = focus-window-up;
      "Mod+J".action = focus-window-down;
      "Mod+Left".action = focus-column-left;
      "Mod+Right".action = focus-column-right;
      "Mod+Up".action = focus-window-up;
      "Mod+Down".action = focus-window-down;

      "Mod+Ctrl+H".action = move-column-left;
      "Mod+Ctrl+L".action = move-column-right;
      "Mod+Ctrl+K".action = move-window-up;
      "Mod+Ctrl+J".action = move-window-down;
      "Mod+Ctrl+Left".action = move-column-left;
      "Mod+Ctrl+Right".action = move-column-right;
      "Mod+Ctrl+Up".action = move-window-up;
      "Mod+Ctrl+Down".action = move-window-down;

      "Mod+Home".action = focus-column-first;
      "Mod+End".action = focus-column-last;
      "Mod+Ctrl+Home".action = move-column-to-first;
      "Mod+Ctrl+End".action = move-column-to-last;

      "Mod+Shift+H".action = focus-monitor-left;
      "Mod+Shift+L".action = focus-monitor-right;
      "Mod+Shift+K".action = focus-monitor-up;
      "Mod+Shift+J".action = focus-monitor-down;
      "Mod+Shift+Left".action = focus-monitor-left;
      "Mod+Shift+Right".action = focus-monitor-right;
      "Mod+Shift+Up".action = focus-monitor-up;
      "Mod+Shift+Down".action = focus-monitor-down;

      "Mod+Shift+Ctrl+H".action = move-column-to-monitor-left;
      "Mod+Shift+Ctrl+L".action = move-column-to-monitor-right;
      "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
      "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
      "Mod+Shift+Ctrl+Left".action = move-column-to-monitor-left;
      "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
      "Mod+Shift+Ctrl+Up".action = move-column-to-monitor-up;
      "Mod+Shift+Ctrl+Down".action = move-column-to-monitor-down;

      "Mod+U".action = focus-workspace-up;
      "Mod+I".action = focus-workspace-down;
      "Mod+Ctrl+U".action = move-column-to-workspace-up;
      "Mod+Ctrl+I".action = move-column-to-workspace-down;

      "Mod+Shift+U".action = move-workspace-up;
      "Mod+Shift+I".action = move-workspace-down;

      "Mod+1".action = focus-workspace 1;
      "Mod+2".action = focus-workspace 2;
      "Mod+3".action = focus-workspace 3;
      "Mod+4".action = focus-workspace 4;
      "Mod+5".action = focus-workspace 5;
      "Mod+6".action = focus-workspace 6;
      "Mod+7".action = focus-workspace 7;
      "Mod+8".action = focus-workspace 8;
      "Mod+9".action = focus-workspace 9;
    };

    gestures = {
      hot-corners.enable = false;
    };
  };
}
