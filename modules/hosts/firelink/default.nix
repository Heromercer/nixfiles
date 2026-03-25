{ self, inputs, ... }:
{
  flake.nixosConfigurations.firelink = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.firelinkConfiguration
    ];
  };
}
