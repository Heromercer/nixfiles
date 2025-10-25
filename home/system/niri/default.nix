{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri
  ];
  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  services.hyprpolkitagent.enable = true;
}
