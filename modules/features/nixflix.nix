{ inputs, ... }:
{
  mercer.arr = {
    nixos = {
      imports = [ inputs.nixflix.nixosModules.default ];

      nixflix = {
        enable = true;
        mediaDir = "/data/media/";
        stateDir = "/media/.state";

        nginx.enable = true;

        jellyfin = {
          enable = true;
          users.admin = {
            policy.isAdministrator = true;
          };
        };
      };
    };
  };
}
