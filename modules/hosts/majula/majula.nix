{ config, self, ... }:
{
  flake.modules.nixos.majula =
    { pkgs, ... }:
    {
      imports = [
        ./hardware-configuration.nix
      ];
      boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };

      facter.reportPath = ./facter.json;
      system.stateVersion = "25.05";
    };
}
