{
  inputs,
  ...
}:
{
  mercer.arr = {
    nixos =
      { config, ... }:
      {
        sops.secrets = {
          "nixflix/jellyfin/admin_password" = { };
          "nixflix/jellyfin/api_key" = { };
          "nixflix/seerr/api_key" = { };
        };

        imports = [ inputs.nixflix.nixosModules.default ];

        nixflix = {
          enable = true;
          mediaDir = "/data/media";
          stateDir = "/data/.state";
          mediaUsers = [ "alec" ];

          theme = {
            enable = true;
            name = "overseerr";
          };

          nginx = {
            enable = true;
            addHostsEntries = true;
          };

          postgres.enable = true;

          jellyfin = {
            enable = true;
            apiKey._secret = config.sops.secrets."nixflix/jellyfin/api_key".path;
            users.admin = {
              policy.isAdministrator = true;
              password._secret = config.sops.secrets."nixflix/jellyfin/admin_password".path;
            };
          };

          seerr = {
            enable = true;
            apiKey._secret = config.sops.secrets."nixflix/seerr/api_key".path;
          };
        };
      };
  };
}
