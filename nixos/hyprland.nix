{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  programs.hyprland.enable = false;
  #programs.hyprland.package = inputs.hyprland.packages."${pkgs.stdenv.hostPlatform.system}".hyprland;
}
