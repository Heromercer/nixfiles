{
  description = "Flake for my machines";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";

    nvf = {
      url = "github:notashelf/nvf";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {nixpkgs, ...}: {
    nixosConfigurations = {
      majula = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          {
            _module.args = {inherit inputs;};
          }
          ./hosts/majula/configuration.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.alec = import ./hosts/majula/home.nix;
              backupFileExtension = "backup";
              extraSpecialArgs = {inherit inputs;};
            };
          }
        ];
      };
      installerIso = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/isoImage/configuration.nix
        ];
      };
    };
  };
}
