{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
  ];

  programs.dankMaterialShell = {
    enable = true;
    quickshell.package = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.quickshell;
    niri = {
      enableKeybinds = false;
      enableSpawn = true;
    };

    enableSystemMonitoring = true;
    enableClipboard = true;
    enableVPN = true;
    enableBrightnessControl = true;
    enableColorPicker = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableSystemSound = true;
  };
}
