{inputs, ...}: {
  imports = [
    inputs.nixcord.homeModules.nixcord
    ../themes/tokyoNight.nix
  ];
  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    config = {
      frameless = true;
      autoUpdate = true;
      enabledThemes = ["tokyoNight"];
    };
  };
}
