{ config, self, ... }:
{
  flake.modules.nixos.majula =
    { pkgs, ... }:
    {
      imports = with config.flake.modules.nixos; [
        facter
      ];
      boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };

      facter.reportPath = ./facter.json;
      system.stateVersion = "25.05";
    };
}
