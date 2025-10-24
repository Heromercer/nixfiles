{
  pkgs,
  config,
  ...
}: let
  hostname = config.var.hostname;
  timezone = config.var.timeZone;
in {
  networking.hostName = hostname;
  time.timeZone = timezone;

  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
  environment.variables = {EDITOR = "nvim";};

  services = {
    xserver = {
      enable = false;
    };

    openssh = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    neovim
    alacritty
    git
    kitty
  ];
}
