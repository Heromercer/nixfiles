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

    homeManager = { pkgs, ... }: {
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
            "x-scheme-handler/http" = "vivaldi-stable.desktop";
            "x-scheme-handler/https" = "vivaldi-stable.desktop";
            "text/html" = "vivaldi-stable.desktop";
          };
          associations.removed = {
            "inode/directory" = [ "easytag.desktop" ];
          };
        };

        desktopEntries.yazi = {
          name = "Yazi";
          icon = "yazi";
          genericName = "Terminal File Manager";
          comment = "Blazing fast terminal file manager written in Rust, based on async I/O";
          terminal = false;
          exec = "${lib.getExe pkgs.kitty} --class=kitty.yazi -e ${pkgs.yazi}/bin/yazi %u";
          type = "Application";
          mimeType = [ "inode/directory" ];
          categories = [
            "Utility"
            "Core"
            "System"
            "FileTools"
            "FileManager"
          ];
        };
      };
    };
  };
}
