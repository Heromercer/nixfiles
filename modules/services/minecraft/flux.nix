{ inputs, ... }:
{
  mercer.services.provides.flux = {
    nixos =
      { pkgs, ... }:
      {
        imports = [ inputs.flux.nixosModules.default ];
        nixpkgs.overlays = [ inputs.flux.overlays.default ];

        flux = {
          enable = false;
          servers = {
            realm2 = {
              package = (pkgs.mkMinecraftServer.override { jre = pkgs.javaPackages.compiler.openjdk25; }) {
                name = "";
                # src = ;
                hash = "";
              };
            };
          };
        };
      };
  };
}
