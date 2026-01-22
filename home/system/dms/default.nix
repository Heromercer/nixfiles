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
    inputs.dms-plugin-registry.modules.default
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

    plugins = {
      dockerManager.enable = true;
      amdGpuMonitor.enable = true;
    };
  };
}
