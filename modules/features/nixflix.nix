{
  inputs,
  ...
}:
{
  mercer.arr = {
    nixos =
      { config, ... }:
      {
        sops.secrets =
          let
            sopsFile = ../../secrets.yaml;
          in
          {
            "nixflix/jellyfin/admin_password" = { inherit sopsFile; };
            "nixflix/jellyfin/api_key" = { inherit sopsFile; };
            "nixflix/seerr/api_key" = { inherit sopsFile; };
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

          sonarr = {
            enable = true;
            config = {
              apikey._secret = config.sops.secrets."nixflix/sonarr/api_key.path";
            };
          };

          jellyfin = {
            enable = true;
            apiKey._secret = config.sops.secrets."nixflix/jellyfin/api_key".path;
            users.admin = {
              policy.isAdministrator = true;
              password._secret = config.sops.secrets."nixflix/jellyfin/admin_password".path;
            };
          };

          # seerr = {
          #   enable = true;
          #   apiKey._secret = config.sops.secrets."nixflix/seerr/api_key".path;
          # };
        };
      };
  };
}
