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
              common.default = [
                "gtk"
              ];
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
