{ self, inputs, ... }:
{
  flake.nixosModules.base =
    { config, pkgs, ... }:
    {
      nix = {
        settings = {
          auto-optimise-store = true;
          experimental-features = [
            "nix-command"
            "flakes"
          ];
        };
      };
    };
}
