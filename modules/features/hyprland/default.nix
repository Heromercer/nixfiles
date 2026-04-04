{ den, lib, ... }:
{
  den.aspects.hyprland = {
    homeManager = {
      imports = [
        ./_aesthetics.nix
        ./_autostart.nix
        ./_binds.nix
        ./_monitors.nix
        ./_windowRules.nix
      ];

      wayland.windowManager.hyprland = {
        enable = false;
        xwayland.enable = true;

        settings = {
          env = [
            "XCURSOR_SIZE,24"
            "HYPRCURSOR_SIZE,24"
          ];
        };
      };
    };
  };
}
