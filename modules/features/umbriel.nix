{ mercer, inputs, ... }:
{
  mercer.umbriel = {
    homeManager = {
      imports = [ inputs.umbriel.homeModules.default ];

      programs.umbriel = {
        enable = true;
        settings = {
          general.autostart = [ "noctalia" ];
          keybinds = {
            "Mod+Return" = "spawn kitty -e fish -c 'fastfetch; exec fish'";
            "Mod+D" = "spawn noctalia msg panel-toggle launcher";
            "Mod+B" = "spawn vivaldi";
            "Mod+Q" = "window-close";
            "Mod+H" = "window-focus-left";
            "Mod+L" = "window-focus-right";
            "Mod+J" = "window-focus-up";
            "Mod+K" = "window-focus-down";
            "Mod+F" = "window-toggle-maximize";
            "Mod+Shift+F" = "window-toggle-fullscreen";
          };

          input = {
            focus = {
              follows_mouse = true;
              follows_mouse_max_scroll = 0.5;
              hover_raises = true;
            };
            keyboard = {
              repeat_rate = 25;
              repeat_delay = 200;
              numlock_toggle = true;
            };
          };

          output = {
            DP-1 = {
              mode = "2560x1440@144";
              scale = 1;
            };
            DP-3 = {
              mode = "2560x1440@144";
              scale = 1;
            };
          };
        };
      };
    };

    nixos = {
      nix.settings = {
        extra-substituters = [ "https://umbriel.cachix.org" ];
        extra-trusted-public-keys = [
          "umbriel.cachix.org-1:JfNq/2yg2S6D6z4Z2dVSZrZlDPQTKtexB6GAVLD98nw="
        ];
      };
    };
  };
}
