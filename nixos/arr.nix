{
  inputs,
  config,
  ...
}: let
  hostId = config.var.hostId;
in {
  imports = [inputs.nixarr.nixosModules.default];

  networking = {
    hostId = hostId;
  };

  nixarr = {
    enable = false;
    jellyfin.enable = false;
  };
}
