{
  den,
  lib,
  inputs,
  ...
}:
{
  mercer.dms = {
    nixos = {
      imports = [
        inputs.dank-greeter.nixosModules.default
      ];

      programs.dms-greeter = {
        enable = true;
        compositor.name = "niri";
        configHome = "/home/alec";
        quickshell.package = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.quickshell;
      };
    };

    homeManager =
      { pkgs, ... }:
      {
        imports = [
          inputs.dms.homeModules.dank-material-shell
          inputs.dms.homeModules.niri
          inputs.dms-plugin-registry.nixosModules.default
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
            amdGpuMonitor.enable = true;
            dockerManager.enable = true;
            screenRecorder.enable = true;
          };
        };

        home.packages = with pkgs; [
          cava
          cliphist
          gpu-screen-recorder
          matugen
          wl-clipboard
        ];
      };
  };
}
