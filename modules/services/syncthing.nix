{
  mercer.services.provides.syncthing = {
    nixos = { config, ... }: {
      sops.secrets =
        let
          sopsFile = ../../secrets.yaml;
        in
        {
          "syncthing/password" = { inherit sopsFile; };
        };
      services.syncthing = {
        enable = true;
        openDefaultPorts = true;
        user = "alec";
        configDir = "/home/alec/.config/syncthing";
        overrideDevices = true;
        overrideFolders = true;
        guiPasswordFile = config.sops.secrets."syncthing/password".path;
        settings = {
          gui.user = "alec";
          devices = {
            firelink.id = "UDVX4FQ-2VEM3IP-SLVKSWL-AXKBFHI-WFLR2SR-IJ7ZC4R-3A2W3XX-LMRNHQN";
            # phone.id = "KD5AMPB-XV4DR2L-K26YKNU-FBTKDAY-XJDULAV-JTC5ODG-IWXZ67L-IENUDAR";
          };
          folders.org = {
            path = "/home/alec/Documents/org";
            devices = [
              "firelink"
            ];
            versioning = {
              type = "staggered";
              params = {
                cleanInterval = "3600";
                maxAge = "15768000";
              };
            };
          };
        };
      };
    };
  };
}
