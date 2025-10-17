{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../home/programs/git
    ../../home/programs/kitty
    ../../home/programs/shell
    ../../home/programs/nvf
    ../../home/programs/discord

    ../../home/system/hyprland
    ../../home/system/niri
    #    ../../home/system/vicinae

    ./variables.nix

    ./secrets
  ];

  home.username = "alec";
  home.homeDirectory = "/home/alec";
  home.stateVersion = "25.05";

  home.packages = [
  ];
}
