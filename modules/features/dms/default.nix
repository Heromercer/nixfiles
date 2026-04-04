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
        inputs.dms.nixosModules.greeter
      ];

      programs.dank-material-shell.greeter = {
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

        home.packages = with pkgs; [
          cava
          cliphist
          matugen
          wl-clipboard
        ];
      };
  };
}
