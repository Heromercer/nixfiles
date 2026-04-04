{ inputs, ... }:
{
  mercer.discord = {
    homeManager = {
      imports = [
        inputs.nixcord.homeModules.nixcord
        ./themes/_tokyoNight.nix
        ./themes/_catppuccinMacchiato.nix
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
    };
  };
}
