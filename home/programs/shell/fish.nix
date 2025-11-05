{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.fish = {
    enable = true;

    shellAliases = {
      nhs = "nh os switch";
      nhsu = "nh os switch -u";
      check = "sudo nix flake check";
      nf = "cd .nixfiles";
    };
  };
}
