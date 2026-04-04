{
  den,
  lib,
  mercer,
  ...
}:
{
  den.aspects.majula = {
    provides.to-users =
      { user, ... }:
      {
        includes = with mercer; [
          laptop
          dms
          kitty
          niri
        ];
      };

    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          amdgpu_top
          ani-cli
          calibre
          caligula
          clang
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
          wayland-protocols
          wayland-utils
          wget
        ];
        imports = [ ./_majula-hardware.nix ];
      };
  };
}
