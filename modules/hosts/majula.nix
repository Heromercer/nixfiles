{ inputs, self, ... }:
{
  flake.modules.nixos.majula =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      imports = with config.flake.modules.nixos; [
        base

        alec
      ];

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostname = "majula";
      time.timeZone = "America/New_York";

      networking.networkmanager.enable = true;

      systemd.services.NetworkManager-wait-online.enable = false;

      boot.initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "uas"
        "sd_mod"
        "sdhci_pci"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-amd" ];
      boot.extraModulePackages = [ ];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/a42d368a-8284-41f9-88c0-2c72b00a0d12";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/5CCC-70D8";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      swapDevices = [
        { device = "/dev/disk/by-uuid/262d9a59-e95f-435c-8649-91f2c0528677"; }
      ];

      networking.useDHCP = lib.mkDefault true;

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

      system.stateVersion = "25.05";
    };
}
