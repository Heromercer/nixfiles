{ config, pkgs, ... }:
{
  programs.appimage = {
    enable = true;
    binfmt = true;
    programs.appimage.package = pkgs.appimage-run.override {
      extraPkgs = pkgs: [
        pkgs.freetype
      ];
    };
  };
}
