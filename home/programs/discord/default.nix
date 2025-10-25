{inputs, ...}: {
  imports = [inputs.nixcord.homeModules.nixcord];
  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    config = {
      frameless = true;
      autoUpdate = true;
      themeLinks = [
        "https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/theme/flavors/system24-catppuccin-mocha.theme.css"
        "https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/theme/flavors/system24-catppuccin-macchiato.theme.css"
        "https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/theme/flavors/system24-everforest.theme.css"
        "https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/theme/flavors/system24-rose-pine.theme.css"
        "https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/theme/flavors/system24-rose-pine-moon.theme.css"
        "https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/theme/flavors/system24-tokyo-night.theme.css"
        "https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/theme/flavors/system24-nord.theme.css"
        "https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/theme/flavors/system24-vencord.theme.css"
      ];
    };
  };
}
