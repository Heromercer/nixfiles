{
  pkgs,
  nixpkgs-unstable,
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
  ];

  programs.dank-material-shell = {
    enable = true;
    quickshell.package = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.quickshell;
    dgop.package = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.dgop;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    niri = {
      enableKeybinds = false;
    };

    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
  };
}
