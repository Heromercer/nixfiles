{ den, lib, ... }:
{
  mercer.xdg = {
    nixos =
      { pkgs, ... }:
      {
        xdg = {
          portal = {
            enable = true;
            extraPortals = [
              pkgs.xdg-desktop-portal-gtk
              pkgs.xdg-desktop-portal-gnome
            ];
            config = {
              niri = {
                "org.freedesktop.impl.portal.ScreenCast" = [
                  "gnome"
                ];
              };
            };
          };
        };
      };

    homeManager = {
      xdg = {
        enable = true;
        userDirs = {
          enable = true;
          createDirectories = true;
          setSessionVariables = false;
        };
        mimeApps = {
          enable = true;
          defaultApplications = {
            "inode/directory" = [ "yazi.desktop" ];
          };
          associations.removed = {
            "inode/directory" = [ "easytag.desktop" ];
          };
        };
      };
    };
  };
}
