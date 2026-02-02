{ config, ... }:
{
  flake = {
    meta.users.default = {
      # TODO change your info
      username = "alec";
      name = "My Username";
      authorizedKeys = [
        # TODO add any ssh keys that should be able to access your user over ssh
      ];
    };

    modules.nixos.nixos =
      { pkgs, ... }:
      {
        users = {
          users = {
            # TODO change user to your name
            ${config.flake.meta.users.default.username} = {
              isNormalUser = true;
              description = config.flake.meta.users.default.name;
              shell = pkgs.fish;
              # TODO change after install!!!
              initialPassword = "password";
              extraGroups = [
                "wheel"
                "input"
              ];
              openssh.authorizedKeys.keys = config.flake.meta.users.default.authorizedKeys;
            };

            root = {
              hashedPassword = null;
              # uncomment the line below to be able to access the root user over ssh too
              # openssh.authorizedKeys.keys = config.flake.meta.users.default.authorizedKeys;
            };
          };
        };
      };
  };
}
