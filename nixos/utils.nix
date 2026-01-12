{
  pkgs,
  config,
  ...
}: let
  hostname = config.var.hostname;
  timezone = config.var.timeZone;
  hostId = config.var.hostId;
in {
  networking.hostName = hostname;
  time.timeZone = timezone;

  networking = {
    networkmanager.enable = true;
  };

  systemd.services.NetworkManager-wait-online.enable = false;
  environment.variables = {EDITOR = "nvim";};

  boot = {
    supportedFilesystems = ["zfs"];
    zfs.extraPools = ["games"];
  };

  services = {
    gnome.gnome-keyring = {
      enable = true;
    };

    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };

    openssh = {
      enable = true;
    };

    udisks2 = {
      enable = true;
    };

    xserver = {
      enable = false;
    };

    zfs = {
      autoScrub.enable = true;
      trim.enable = true;
    };
  };

  security.polkit.enable = true;

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    clang
    coreutils
    fd
    git
    gparted
    kitty
    neovim
    nix-init
    nodejs
    polkit
    ripgrep
    tree-sitter
    udiskie
    wget
  ];
}
