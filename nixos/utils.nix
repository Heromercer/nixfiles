{
  pkgs,
  config,
  ...
}: let
  hostname = config.var.hostname;
in {
  networking.hostName = hostname;

  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
  environment.variables = {EDITOR = "nvim";};
}
