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

    gnome.gnome-keyring = {
      enable = true;
    };
  };

  security.polkit.enable = true;

  xdg = {
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    alacritty
    clang
    coreutils
    fd
    git
    gparted
    kitty
    neovim
    nodejs
    polkit
    ripgrep
    tree-sitter
    wget
  ];
}
