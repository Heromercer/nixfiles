{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.fish = {
    enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/.nixfiles#${config.var.hostname}";
      check = "sudo nix flake check";
    };
  };
}
