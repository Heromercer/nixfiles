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
            "nixflix/sonarr/api_key" = { inherit sopsFile; };
            "nixflix/sonarr/password" = { inherit sopsFile; };
            "nixflix/sonarr/username" = { inherit sopsFile; };
            "nixflix/radarr/api_key" = { inherit sopsFile; };
            "nixflix/radarr/password" = { inherit sopsFile; };
            "nixflix/radarr/username" = { inherit sopsFile; };
            "nixflix/lidarr/api_key" = { inherit sopsFile; };
            "nixflix/lidarr/password" = { inherit sopsFile; };
            "nixflix/lidarr/username" = { inherit sopsFile; };
            "nixflix/sabnzbd/api_key" = { inherit sopsFile; };
            "nixflix/sabnzbd/nzb_key" = { inherit sopsFile; };
            "nixflix/sabnzbd/password" = { inherit sopsFile; };
            "nixflix/sabnzbd/username" = { inherit sopsFile; };
            "nixflix/sabnzbd/eweka/username" = { inherit sopsFile; };
            "nixflix/sabnzbd/eweka/password" = { inherit sopsFile; };
            "nixflix/sabnzbd/newsgroupdirect/password" = { inherit sopsFile; };
            "nixflix/sabnzbd/newsgroupdirect/username" = { inherit sopsFile; };
            "nixflix/prowlarr/api_key" = { inherit sopsFile; };
            "nixflix/prowlarr/password" = { inherit sopsFile; };
            "nixflix/prowlarr/username" = { inherit sopsFile; };
            "nixflix/prowlarr/indexer_api_keys/NZBFinder" = { inherit sopsFile; };
            "nixflix/prowlarr/indexer_api_keys/NzbPlanet" = { inherit sopsFile; };
          };

        imports = [ inputs.nixflix.nixosModules.default ];

        nixflix = {
          enable = true;
          mediaDir = "/data/media";
          stateDir = "/data/.state";
          mediaUsers = [ "alec" ];

          theme = {
            enable = true;
            name = "catppuccin-mocha";
          };

          nginx = {
            enable = true;
            addHostsEntries = true;
          };

          recyclarr = {
            enable = true;
          };

          postgres.enable = true;

          flaresolverr.enable = true;

          sonarr = {
            enable = true;
            group = "media";
            config = {
              apiKey._secret = config.sops.secrets."nixflix/sonarr/api_key".path;
              hostConfig.password._secret = config.sops.secrets."nixflix/sonarr/password".path;
              hostConfig.username._secret = config.sops.secrets."nixflix/sonarr/username".path;
            };
          };

          radarr = {
            enable = true;
            config = {
              apiKey._secret = config.sops.secrets."nixflix/radarr/api_key".path;
              hostConfig.password._secret = config.sops.secrets."nixflix/radarr/password".path;
              hostConfig.username._secret = config.sops.secrets."nixflix/radarr/username".path;
            };
          };

          lidarr = {
            enable = true;
            config = {
              apiKey._secret = config.sops.secrets."nixflix/lidarr/api_key".path;
              hostConfig.password._secret = config.sops.secrets."nixflix/lidarr/password".path;
              hostConfig.username._secret = config.sops.secrets."nixflix/lidarr/username".path;
            };
          };

          jellyfin = {
            enable = true;
            openFirewall = true;
            apiKey._secret = config.sops.secrets."nixflix/jellyfin/api_key".path;
            users = {
              admin = {
                policy.isAdministrator = true;
                password._secret = config.sops.secrets."nixflix/jellyfin/admin_password".path;
              };
            };
            network = {
              localNetworkAddresses = [ "192.168.50.2" ];
            };
          };

          seerr = {
            enable = true;
            apiKey._secret = config.sops.secrets."nixflix/seerr/api_key".path;
          };

          prowlarr = {
            enable = true;
            config = {
              apiKey._secret = config.sops.secrets."nixflix/prowlarr/api_key".path;
              hostConfig.password._secret = config.sops.secrets."nixflix/prowlarr/password".path;
              hostConfig.username._secret = config.sops.secrets."nixflix/prowlarr/username".path;
              indexers = [
                # {
                #   name = "DrunkenSlug";
                #   apiKey._secret = config.sops.secrets."indexer-api-keys/DrunkenSlug".path;
                # }
                {
                  name = "NZBFinder";
                  apiKey._secret = config.sops.secrets."nixflix/prowlarr/indexer_api_keys/NZBFinder".path;
                }
                {
                  name = "NzbPlanet";
                  apiKey._secret = config.sops.secrets."nixflix/prowlarr/indexer_api_keys/NzbPlanet".path;
                }
              ];
            };
          };

          usenetClients.sabnzbd = {
            enable = true;

            settings = {
              misc = {
                api_key._secret = config.sops.secrets."nixflix/sabnzbd/api_key".path;
                nzb_key._secret = config.sops.secrets."nixflix/sabnzbd/nzb_key".path;
                username._secret = config.sops.secrets."nixflix/sabnzbd/username".path;
                password._secret = config.sops.secrets."nixflix/sabnzbd/password".path;
              };

              servers = [
                {
                  name = "Eweka";
                  host = "sslreader.eweka.nl";
                  port = 563;
                  username._secret = config.sops.secrets."nixflix/sabnzbd/eweka/username".path;
                  password._secret = config.sops.secrets."nixflix/sabnzbd/eweka/password".path;
                  connections = 20;
                  ssl = true;
                  priority = 1;
                  optional = true;
                  retention = 3000;
                }
                {
                  name = "NewsgroupDirect";
                  host = "news.newsgroupdirect.com";
                  port = 563;
                  username._secret = config.sops.secrets."nixflix/sabnzbd/newsgroupdirect/username".path;
                  password._secret = config.sops.secrets."nixflix/sabnzbd/newsgroupdirect/password".path;
                  connections = 10;
                  ssl = true;
                  priority = 0;
                  backup = true;
                }
              ];
            };
          };

        };
      };
  };
}
