{ inputs, ... }:
{
  mercer.umbriel = {
    homeManager = {
      imports = [
        inputs.umbriel.homeModules.default
      ];

      programs.umbriel = {
        enable = true;
        settings = {
          general.autostart = [ "noctalia" ];
          keybinds = {
            "Mod+Return" = "spawn kitty -e fish -c 'fastfetch; exec fish'";
            "Mod+E" = "spawn kitty -e fish -c 'y; exec fish'";
            "Mod+Shift+E" = "spawn emacs";
            "Mod+B" = "spawn vivaldi";

            "Mod+Q" = "window-close";
            "Mod+D" = "spawn noctalia msg panel-toggle launcher";
            "Mod+F" = "window-toggle-maximize";
            "Mod+Shift+F" = "window-toggle-fullscreen";
            "Mod+X" = "spawn noctalia msg panel-toggle session";
            "Mod+Shift+W" = "spawn noctalia msg panel-toggle wallpaper";
            "Mod+O" = "overview-toggle";
            "Ctrl+Shift+Home" = "spawn noctalia msg screenshot-region";

            "Mod+H" = "window-focus-left";
            "Mod+L" = "window-focus-right";
            "Mod+J" = "window-focus-up";
            "Mod+K" = "window-focus-down";
            "Mod+U" = "window-focus-or-workspace-up";
            "Mod+I" = "window-focus-or-workspace-down";

            "Mod+Shift+H" = "output-focus-left";
            "Mod+Shift+L" = "output-focus-right";
            "Mod+Shift+K" = "output-focus-up";
            "Mod+Shift+J" = "output-focus-down";

            # Volume and brightness control
            "XF86AudioRaiseVolume" = {
              action = "spawn noctalia msg volume-up";
              allow_when_locked = true;
            };
            "XF86AudioLowerVolume" = {
              action = "spawn noctalia msg volume-down";
              allow_when_locked = true;
            };
            "XF86AudioMute" = {
              action = "spawn noctalia msg volume-mute";
              allow_when_locked = true;
              repeat = false;
            };
            "XF86AudioNext" = {
              action = "spawn noctalia msg volume-next";
              allow_when_locked = true;
              repeat = false;
            };
            "XF86AudioPrev" = {
              action = "spawn noctalia msg volume-previous";
              allow_when_locked = true;
              repeat = false;
            };
            "XF86MonBrightnessUp" = {
              action = "spawn noctalia msg brightness-up";
              allow_when_locked = true;
            };
            "XF86MonBrightnessDown" = {
              action = "spawn noctalia msg brightness-down";
              allow_when_locked = true;
            };
          };

          appearance = {
            prefer_no_csd = true;
            border_width = 2;
            corner_radius = 10;
            blur = {
              enabled = true;
              optimized = true;
              passes = 2;
              radius = 3;
              noise = 0.02;
              brightness = 0.9;
              contrast = 0.9;
              saturation = 1.1;
            };
          };

          input = {
            focus = {
              follows_mouse = "always";
              follows_mouse_max_scroll = 0.0;
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
              workspaces = "dynamic";
            };
            DP-3 = {
              mode = "2560x1440@144";
              scale = 1;
              workspaces = "dynamic";
            };
            HDMI-A-2 = {
              mode = "3840x2160@60";
              scale = 2;
            };
          };

          layout = {
            gap = 15;
          };

          # workspace = [
          #   {
          #     name = "CHAT";
          #     layout.mode = "dwindle";
          #     output = "DP-3";
          #   }
          # ];

          window_rule = [
            {
              match.app_id = "^vivaldi-stable$|^vesktop$";
              default_output = "DP-3";
              default_maximize = true;
            }

            {
              match.app_id = "^emacs$|^steam$";
              default_output = "DP-1";
              default_maximize = true;
            }

            {
              match.app_id = "^steam_app_.*$";
              confine_pointer = true;
              default_fullscreen = true;
            }

            {
              match.app_id = "^steam$";
              match.title = [
                "^Friends List$"
                "^Steam Settings$"
              ];
              default_floating = true;
            }
          ];
        };
      };
    };

    nixos = { pkgs, ... }: {
      imports = [ inputs.umbriel.nixosModules.default ];

      programs.umbriel.enable = true;

      environment.systemPackages = with pkgs; [
        brightnessctl
        playerctl
      ];

      nix.settings = {
        extra-substituters = [ "https://umbriel.cachix.org" ];
        extra-trusted-public-keys = [
          "umbriel.cachix.org-1:JfNq/2yg2S6D6z4Z2dVSZrZlDPQTKtexB6GAVLD98nw="
        ];
      };
    };
  };
}
