{
  inputs,
  ...
}:
{
  mercer.arr = {
    nixos =
      { config, ... }:
      let
        fromRepo = inputs.nixflix.lib.jellyfinPlugins.fromRepo;
      in
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
            "nixflix/sonarr_anime/api_key" = { inherit sopsFile; };
            "nixflix/sonarr_anime/password" = { inherit sopsFile; };
            "nixflix/sonarr_anime/username" = { inherit sopsFile; };
            "nixflix/radarr/api_key" = { inherit sopsFile; };
            "nixflix/radarr/password" = { inherit sopsFile; };
            "nixflix/radarr/username" = { inherit sopsFile; };
            "nixflix/lidarr/api_key" = { inherit sopsFile; };
            "nixflix/lidarr/password" = { inherit sopsFile; };
            "nixflix/lidarr/username" = { inherit sopsFile; };
            "nixflix/navidrome/password" = { inherit sopsFile; };
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
            "nixflix/prowlarr/indexer_api_keys/NZBgeek" = { inherit sopsFile; };
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

          # nginx = {
          #   enable = true;
          #   addHostsEntries = true;
          # };

          recyclarr = {
            enable = true;
          };

          postgres.enable = true;

          flaresolverr.enable = true;

          sonarr = {
            enable = true;
            openFirewall = true;
            config = {
              apiKey._secret = config.sops.secrets."nixflix/sonarr/api_key".path;
              hostConfig.password._secret = config.sops.secrets."nixflix/sonarr/password".path;
              hostConfig.username._secret = config.sops.secrets."nixflix/sonarr/username".path;
              hostConfig.bindAddress = "192.168.50.224";
              # hostConfig.bindAddress = "192.168.50.2";
            };
          };

          sonarr-anime = {
            enable = true;
            openFirewall = true;
            config = {
              apiKey._secret = config.sops.secrets."nixflix/sonarr_anime/api_key".path;
              hostConfig.password._secret = config.sops.secrets."nixflix/sonarr_anime/password".path;
              hostConfig.username._secret = config.sops.secrets."nixflix/sonarr_anime/username".path;
              hostConfig.bindAddress = "192.168.50.224";
              # hostConfig.bindAddress = "192.168.50.2";
            };
          };

          radarr = {
            enable = true;
            openFirewall = true;
            config = {
              apiKey._secret = config.sops.secrets."nixflix/radarr/api_key".path;
              hostConfig.password._secret = config.sops.secrets."nixflix/radarr/password".path;
              hostConfig.username._secret = config.sops.secrets."nixflix/radarr/username".path;
              hostConfig.bindAddress = "192.168.50.224";
              # hostConfig.bindAddress = "192.168.50.2";
            };
          };

          lidarr = {
            enable = true;
            openFirewall = true;
            config = {
              apiKey._secret = config.sops.secrets."nixflix/lidarr/api_key".path;
              hostConfig.password._secret = config.sops.secrets."nixflix/lidarr/password".path;
              hostConfig.username._secret = config.sops.secrets."nixflix/lidarr/username".path;
              hostConfig.bindAddress = "192.168.50.224";
              # hostConfig.bindAddress = "192.168.50.2";
            };
          };

          navidrome = {
            enable = true;
            users = {
              "Alec" = {
                userName = "alec";
                isAdmin = true;
                password._secret = config.sops.secrets."nixflix/navidrome/password".path;
              };
            };
            settings = {
              # Address = "100.74.74.58";
              Address = "192.168.50.224";
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
              localNetworkAddresses = [ "192.168.50.224" ];
            };
            plugins = {
              "Intro Skipper" = {
                package = fromRepo {
                  version = "1.10.11.17";
                  hash = "";
                };
                config = {
                  ExcludeSeries = "";
                  AutoDetectIntros = true;
                  AnalyzeSeasonZero = false;
                  PreferChromaprint = false;
                  CacheFingerprints = true;
                  UseAlternativeBlackFrameAnalyzer = false;
                  UpdateMediaSegments = true;
                  RebuildMediaSegments = true;
                  ScanIntroduction = true;
                  ScanCredits = true;
                  ScanRecap = true;
                  ScanPreview = true;
                  ScanCommercial = false;
                  AnalysisPercent = "25";
                  AnalysisLengthLimit = "10";
                  FullLengthChapters = false;
                  SkipFirstEpisode = false;
                  SkipFirstEpisodeAnime = false;
                  MinimumIntroDuration = "15";
                  MaximumIntroDuration = "120";
                  MinimumCreditsDuration = "15";
                  MaximumCreditsDuration = "450";
                  MaximumMovieCreditsDuration = "900";
                  MinimumRecapDuration = "15";
                  MaximumRecapDuration = "120";
                  MinimumPreviewDuration = "15";
                  MaximumPreviewDuration = "120";
                  MinimumCommercialDuration = "15";
                  MaximumCommercialDuration = "120";
                  BlackFrameMinimumPercentage = "85";
                  BlackFrameThreshold = "28";
                  UseChapterMarkersBlackFrame = true;
                  AdjustIntroBasedOnChapters = true;
                  AdjustIntroBasedOnSilence = true;
                  SnapToKeyframe = true;
                  EndSnapThreshold = "2";
                  AdjustWindowInward = "5";
                  AdjustWindowOutward = "2";
                  ChapterAnalyzerIntroductionPattern = "(^|\\s)(Intro|Introduction|OP|Opening)(?!\\sEnd)(\\s|$)";
                  ChapterAnalyzerEndCreditsPattern = "(^|\\s)(Credits?|ED|Ending|Outro)(?!\\sEnd)(\\s|$)";
                  ChapterAnalyzerPreviewPattern = "(^|\\s)(Preview|PV|Sneak\\s?Peek|Coming\\s?(Up|Soon)|Next\\s+(time|on|episode)|Extra|Teaser|Trailer)(?!\\sEnd)(\\s|:|$)";
                  ChapterAnalyzerRecapPattern = "(^|\\s)(Re?cap|Sum{1,2}ary|Prev(ious(ly)?)?|(Last|Earlier)(\\s\\w+)?|Catch[ -]up)(?!\\sEnd)(\\s|:|$)";
                  ChapterAnalyzerCommercialPattern = "(^|\\s)(Ad(vert(isement)?)?|Commercial)(?!\\sEnd)(\\s|$)";
                  IntroEndOffset = "0";
                  IntroStartOffset = "0";
                  MaximumFingerprintPointDifferences = 6;
                  MaximumTimeSkip = 3.5;
                  InvertedIndexShift = 2;
                  SilenceDetectionMaximumNoise = "-50";
                  SilenceDetectionMinimumDuration = "0.33";
                  MaxParallelism = "2";
                  ProcessThreads = "0";
                  ProcessPriority = "BelowNormal";
                  UseFileTransformationPlugin = false;
                  SkipbuttonHideDelay = "8";
                  EnableMainMenu = true;
                  FileTransformationPluginEnabled = false;
                };
              };
            };
          };

          seerr = {
            enable = true;
            openFirewall = true;
            apiKey._secret = config.sops.secrets."nixflix/seerr/api_key".path;
          };

          prowlarr = {
            enable = true;
            openFirewall = true;
            config = {
              apiKey._secret = config.sops.secrets."nixflix/prowlarr/api_key".path;
              hostConfig.password._secret = config.sops.secrets."nixflix/prowlarr/password".path;
              hostConfig.username._secret = config.sops.secrets."nixflix/prowlarr/username".path;
              hostConfig.bindAddress = "192.168.50.224";
              # hostConfig.bindAddress = "192.168.50.2";
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
                {
                  name = "NZBgeek";
                  apiKey._secret = config.sops.secrets."nixflix/prowlarr/indexer_api_keys/NZBgeek".path;
                }
              ];
            };
          };

          usenetClients.sabnzbd = {
            enable = true;
            openFirewall = true;

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
