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
      nhh = "nh home switch";
      check = "sudo nix flake check";
      nf = "cd .nixfiles";
    };
  };
}
