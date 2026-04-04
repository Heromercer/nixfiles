{
  den,
  lib,
  mercer,
  ...
}:
{
  den.ctx.host.includes = [ mercer.nix ];

  mercer.nix = {
    nixos = {
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
