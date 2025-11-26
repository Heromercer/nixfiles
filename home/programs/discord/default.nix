{
  inputs,
  pkgs-unstable,
  ...
}: {
  imports = [
    inputs.nixcord.homeModules.nixcord
    ./themes/tokyoNight.nix
    ./themes/catppuccinMacchiato.nix
  ];
  programs.nixcord = {
    enable = true;
    discord = {
      enable = false;
    };
    vesktop = {
      enable = true;
    };
    config = {
      frameless = true;
      autoUpdate = true;
      enabledThemes = [
        "tokyo-night.css"
      ];
    };
  };
}
