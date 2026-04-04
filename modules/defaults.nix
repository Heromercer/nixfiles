{ lib, den, ... }:
{
  den.default = {
    includes = [
      den._.inputs'
      den.provides.hostname
    ];

    nixos = {
      system.stateVersion = "25.05";
      time.timeZone = "America/New_York";
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      security.polkit.enable = true;
      networking.networkmanager.enable = true;
      services.xserver.enable = false;
      systemd.services.NetworkManager-wait-online.enable = false;
      environment.variables = {
        EDITOR = "nvim";
      };
    };

    homeManager = {
      home.stateVersion = "25.05";
    };
  };
}
