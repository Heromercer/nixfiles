{ lib, den, ... }:
{
  den.default = {
    includes = [
      den._.inputs'
      den.provides.hostname
    ];

    nixos =
      { pkgs, ... }:
      {
        system.stateVersion = "25.05";
        time.timeZone = "America/New_York";
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;
        boot.loader.systemd-boot.consoleMode = "max";
        security.polkit.enable = true;
        networking.networkmanager.enable = true;
        services.xserver.enable = false;
        systemd.services.NetworkManager-wait-online.enable = false;
        environment.variables = {
          EDITOR = "emacs";
          DOTNET_ROOT = "${pkgs.dotnet-sdk_9}/share/dotnet";
        };
      };

    homeManager = {
      home.stateVersion = "25.05";
    };
  };
}
