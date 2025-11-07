{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../home/programs/discord
    ../../home/programs/fastfetch
    ../../home/programs/firefox
    ../../home/programs/git
    ../../home/programs/kitty
    ../../home/programs/mpd
    ../../home/programs/nh
    ../../home/programs/nvf
    ../../home/programs/rmpc
    ../../home/programs/shell
    ../../home/programs/yazi

    ../../home/system/dms
    ../../home/system/homeDir
    ../../home/system/hyprland
    ../../home/system/niri

    ../../home/pkgs

    ./variables.nix

    ./secrets
  ];

  home.enableNixpkgsReleaseCheck = false;

  home.username = "alec";
  home.homeDirectory = "/home/alec";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
  ];
}
