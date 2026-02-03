{ inputs, self, ... }:
{
  flake.nixosConfigurations.majula = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.modules.nixos.majula
    ];
  };
}
