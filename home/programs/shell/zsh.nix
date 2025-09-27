{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.fish = {
    enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/.nixfiles#The-Bunker";
    };
  };
}
