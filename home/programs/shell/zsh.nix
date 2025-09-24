{ pkgs, lib, config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
    };

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixfiles#The-Bunker";
    };
  };
}
