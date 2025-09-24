{
  description = "Flake for my machines";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ nixpkgs, ... }: {
    nixosConfigurations = { 
      The-Bunker = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  {
            _module.args = { inherit inputs; };
	  }
          ./hosts/desktop/configuration.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.alec = import ./hosts/desktop/home.nix;
              backupFileExtension = "backup";
            };
           }
        ];
      };
    };
  };
}
