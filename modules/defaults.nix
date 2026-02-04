{
  den,
  __findFile,
  inputs,
  ...
}:
{
  den.default = {
    nixos.system.stateVersion = "25.05";
    homeManager.home.stateVersion = "25.05";

    nixos = {
      imports = [
        inputs.nix-index-database.nixosModules.nix-index
      ];

      nixpkgs.config.allowUnfree = true;
      programs.nix-index-database.comma.enable = true;
      programs.nix-ld.enable = true;

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
      };

      nix = {
        settings = {
          warn-dirty = false;
          extra-system-features = [ "recursive-nix" ];
          experimental-features = [
            "nix-command"
            "flakes"
            "pipe-operators"
            "recursive-nix"
          ];
          trusted-users = [
            "root"
            "@wheel"
          ];
        };
      };
    };

    homeManager = {
      systemd.user.startServices = "sd-switch";
    };

  };

  den.default.includes = [
    # Enable home-manager on all hosts.
    <den/home-manager>

    # Automatically create the user on host.
    <den/primary-user>

    # Autoset hostname
    (den.lib.take.exactly (
      { OS, host }:
      den.lib.take.unused OS {
        nixos.networking.hostName = host.hostName;
      }
    ))
  ];
}
