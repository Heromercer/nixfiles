{
  pkgs,
  pkgs-unstable,
  config,
  ...
}:
let
  hostname = config.var.hostname;
  timezone = config.var.timeZone;
in
{
  networking.hostName = hostname;
  time.timeZone = timezone;

  networking = {
    networkmanager.enable = true;
    interfaces.enp8s0.ipv4.addresses = [
      {
        address = "192.168.50.2";
        prefixLength = 24;
      }
    ];
    defaultGateway = "192.168.50.1";
    nameservers = [ "8.8.8.8" ];
  };

  systemd.services.NetworkManager-wait-online.enable = false;
  environment.variables = {
    EDITOR = "nvim";
  };

  boot = {
    supportedFilesystems = [ "zfs" ];
    zfs.extraPools = [ "games" ];
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

  environment.systemPackages =
    with pkgs;
    [
      amdgpu_top
      appimage-run
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
      python315
      ripgrep
      tree-sitter
      udiskie
      unzip
      wget
    ]
    ++ [ pkgs-unstable.dms-shell ];
}
