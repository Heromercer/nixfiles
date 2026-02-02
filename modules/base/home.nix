{ config, inputs, ... }:
{
  flake.modules = {
    nixos.nixos = {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      home-manager = {
        backupFileExtension = "backup";
        useGlobalPkgs = true;
        useUserPackages = true;
      };
    };

    homeManager.homeManager =
      { osConfig, ... }:
      {
        home =
          let
            inherit (config.flake.meta.users.default) username;
          in
          {
            inherit username;
            homeDirectory = "/home/${username}";
            inherit (osConfig.system) stateVersion;
          };
      };
  };
}
