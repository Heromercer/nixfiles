{ inputs, ... }:
{
  mercer.services.provides.mcServer = {
    nixos =
      { pkgs, ... }:
      {
        imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
        nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

        services.minecraft-servers = {
          enable = true;
          eula = true;
          openFirewall = true;
          servers = {
            vanillaRealm = {
              enable = true;
              jvmOpts = "-Xmx8G -Xms4G";
              operators = {
                Big_Mercer = "c482adc6-4d78-494a-bd2b-85f8b36f86ef";
              };
              serverProperties = {
                level-name = "realm";
                level-seed = "23487324737642987198237892173232323121dsa";
              };

              package = pkgs.minecraftServers.vanilla;
            };
          };
        };
      };
  };
}
