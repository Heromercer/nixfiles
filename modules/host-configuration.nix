{ inputs, self, ... }:
{
  flake.nixosConfigurations = {
    majula = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        self.modules.nixos.hosts.majula
      ];
    };

    firelink = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        self.home-manager.nixosModules.home-manager
        self.modules.nixos.hosts.firelink
      ];
    };
  };
}
