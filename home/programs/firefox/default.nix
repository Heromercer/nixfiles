{
  config,
  lib,
  inputs,
  ...
}: {
  imports = [inputs.textfox.homeManagerModules.default];
  programs.firefox.enable = true;
  textfox = {
    enable = true;
    profiles = ["main"];
    config = {
      background = {
        color = "#1e1e2e"; # Catppuccin Mocha Base
      };
      border = {
        color = "#cba6f7"; # Catppuccin Mocha Mauve
        width = "2px";
        transition = "1.0s ease";
        radius = "3px";
      };
      displayWindowControls = true;
      displayNavButtons = true;
      displayUrlbarIcons = true;
      displaySidebarTools = false;
      displayTitles = false;
      newtabLogo = "";
      font = {
        family = "Fira Code";
        size = "15px";
        accent = "#cba6f7"; # Catppuccin Mocha Mauve
      };
      tabs = {
        horizontal = {
          enable = true;
        };
        vertical = {
          margin = "1.0rem";
        };
      };
    };
  };
}
