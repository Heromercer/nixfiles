{ inputs, ... }:
{
  mercer.services.provides.flux = {
    nixos =
      { pkgs, ... }:
      {
        imports = [ inputs.flux.nixosModules.default ];
        nixpkgs.overlays = [ inputs.flux.overlays.default ];

        flux = {
          enable = true;
          servers = {
            realm = {
              package = pkgs.mkMinecraftServer {
                name = "realm";
                src = ./mcman;
                hash = "sha256-j9iDHXyr9DtKDatAPo9zUGr8TQYne5U13uYVis+tPSs=";
              };
            };
          };
        };
      };
  };
}
