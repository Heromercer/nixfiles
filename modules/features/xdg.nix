{ den, lib, ... }:
{
  mercer.xdg = {
    nixos =
      { pkgs, ... }:
      {
        xdg = {
          portal = {
            enable = true;
            xdgOpenUsePortal = true;
            extraPortals = [
              pkgs.xdg-desktop-portal-gtk
              pkgs.xdg-desktop-portal-gnome
            ];
          };
        };
      };

    homeManager = {
      xdg = {
        enable = true;
        userDirs = {
          enable = true;
          createDirectories = true;
        };
      };
    };
  };
}
