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
  ];

  home.username = "alec";
  home.homeDirectory = "/home/alec";
  programs.git.enable = true;
  home.stateVersion = "25.05";

  home.packages = [
  ];
}
