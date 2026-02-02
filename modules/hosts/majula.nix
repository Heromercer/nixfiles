{ config, self, ... }:
{
  flake.modules.nixos.majula =
    { pkgs, ... }:
    {
      boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };

      system.stateVersion = "25.05";
    };
}
