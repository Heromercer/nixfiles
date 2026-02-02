{ config, ... }:
{
  flake = {
    nixosConfigurations.my-laptop = config.flake.lib.mkSystems.linux "majula";

    modules.nixos.majula = {
      imports = with config.flake.modules.nixos; [
        {
          home-manager.users.${config.flake.meta.users.default.username}.imports =
            with config.flake.modules.homeManager;
            [ ];
        }
      ];
    };
  };
}
