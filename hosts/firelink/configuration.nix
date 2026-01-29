{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ../../nixos/appimage.nix
    ../../nixos/arr.nix
    ../../nixos/audio.nix
    ../../nixos/bluetooth.nix
    ../../nixos/dankgreeter.nix
    ../../nixos/drives.nix
    ../../nixos/fonts.nix
    ../../nixos/gaming.nix
    ../../nixos/home-manager.nix
    ../../nixos/hyprland.nix
    ../../nixos/niri.nix
    ../../nixos/nix.nix
    #    ../../nixos/tuigreet.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/virtualisation.nix
    ./hardware-configuration.nix
    ./variables.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot = {
    supportedFilesystems = [ "zfs" ];
    zfs.extraPools = [ "games" ];
  };

  services.printing.enable = true;

  home-manager.users."${config.var.username}" = import ./home.nix;

  networking = {
    interfaces.enp8s0.ipv4.addresses = [
      {
        address = "192.168.50.2";
        prefixLength = 24;
      }
    ];
    defaultGateway = "192.168.50.1";
    nameservers = [ "8.8.8.8" ];
  };

  system.stateVersion = "25.05";
}
