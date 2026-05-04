{
  den,
  lib,
  mercer,
  ...
}:
{
  den.aspects.firelink = {
    provides.to-users =
      { user, ... }:
      {
        includes = with mercer; [
          desktop
          dms
          kitty
          niri
          rmpc
        ];
      };

    nixos =
      { pkgs, inputs', ... }:
      {
        networking = {
          hostId = "6ec5787a";
          interfaces.enp8s0.ipv4.addresses = [
            {
              address = "192.168.50.2";
              prefixLength = 24;
            }
          ];
          defaultGateway = "192.168.50.1";
          nameservers = [ "8.8.8.8" ];
        };

        boot = {
          supportedFilesystems = [ "zfs" ];
          zfs.extraPools = [ "games" ];
        };

        fileSystems = {
          "/mnt/gamesHDD" = {
            device = "/dev/disk/by-uuid/0d946588-87ee-45d0-8b4f-2214199cd264";
            fsType = "ext4";
            options = [
              "defaults"
              "nofail"
            ];
          };

          "/mnt/archive" = {
            device = "/dev/disk/by-uuid/2b318b3c-5cff-4c00-84a7-0a10fb310058";
            fsType = "ext4";
            options = [
              "defaults"
              "nofail"
            ];
          };

          "/mnt/media" = {
            device = "/dev/disk/by-uuid/fbbe779f-985b-4a97-b8f6-fbb37eb0dc43";
            fsType = "ext4";
            options = [
              "defaults"
              "nofail"
            ];
          };
        };

        virtualisation.docker = {
          enable = true;
        };
        users.users.alec = {
          extraGroups = [ "docker" ];
        };

        environment.systemPackages =
          (with pkgs; [
            amdgpu_top
            calibre
            caligula
            clang
            comma
            coreutils
            dconf
            direnv
            glib
            gparted
            jdk
            libva
            libreoffice-still
            meson
            nix-init
            nodejs
            python315
            unzip
            vivaldi
            wayland-protocols
            wayland-utils
            wget
          ])
          ++ (with inputs'.nixpkgs-unstable.legacyPackages; [
            ani-cli
          ]);
        imports = [ ./_firelink-hardware.nix ];
      };
  };
}
