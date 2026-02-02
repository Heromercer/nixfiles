{ config, ... }:
{
  flake.modules.nixos.hosts.majula =
    { lib, pkgs, ... }:
    {
      networking.hostName = "majula";

      boot = {
        loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
        };
      };

      services.printing.enable = true;

      system.stateVersion = "25.05";
    };
}
