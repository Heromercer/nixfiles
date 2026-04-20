{
  den,
  lib,
  mercer,
  inputs,
  ...
}:
{
  den.ctx.host.includes = [ mercer.nix ];

  mercer.nix = {
    nixos = {
      imports = [ inputs.nix-index-database.nixosModules.default ];
      programs.nix-index-database.comma.enable = true;
      nixpkgs.config = {
        allowUnfree = true;
        allowBroken = false;
      };

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
  };
}
