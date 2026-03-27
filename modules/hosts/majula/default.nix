{ self, inputs, ... }:
{
  flake.nixosConfigurations.majula = inputs.nixpkgs.lib.nixosSystem {
    modules = [ self.nixosModules.majulaConfiguration ];
  };
}
