{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../home/programs/fastfetch
    ../../home/programs/git
    ../../home/programs/kitty
    ../../home/programs/nvf
    ../../home/programs/shell
    ../../home/programs/yazi

    ../../home/pkgs

    ./variables.nix
  ];

  home.enableNixpkgsReleaseCheck = false;

  home.username = "alec";
  home.homeDirectory = "/home/alec";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
  ];
}
