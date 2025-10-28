{inputs, ...}: {
  imports = [
    inputs.nixcord.homeModules.nixcord
    ./themes/tokyoNight.nix
  ];
  programs.nixcord = {
    enable = true;
    discord = {
      enable = false;
    };
    vesktop.enable = true;
    config = {
      frameless = true;
      autoUpdate = true;
      enabledThemes = ["tokyoNight"];
    };
  };
}
