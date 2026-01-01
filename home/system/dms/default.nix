{
  pkgs,
  nixpkgs-unstable,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.dms.homeModules.dankMaterialShell.default
    inputs.dms.homeModules.dankMaterialShell.niri
  ];

  programs.dankMaterialShell = {
    enable = true;
    quickshell.package = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.quickshell;
    dgop.package = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.dgop;
    niri = {
      enableKeybinds = false;
      enableSpawn = true;
    };

    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
  };
}
