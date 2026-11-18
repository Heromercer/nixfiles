{ inputs, ... }:
{
  mercer.services.provides.bookorbit = {
    nixos = { inputs', ... }: {
      imports = [ "${inputs.nixpkgs-unstable}/nixos/modules/services/web-apps/bookorbit.nix" ];
      services.bookorbit = {
        enable = true;
        package = inputs'.nixpkgs-unstable.legacyPackages.bookorbit;
        createDatabaseLocally = true;
      };
    };
  };
}
