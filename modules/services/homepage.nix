{
  mercer.services.provides.homepage = {
    nixos = {
      services = {
        homepage-dashboard = {
          enable = true;
          openFirewall = true;
          allowedHosts = "localhost:8082,127.0.0.1:8082,192.168.50.2:8082,100.74.74.58:8082";
          widgets = [
            {
              resources = {
                cpu = true;
                disk = "/";
                memory = true;
              };
            }
          ];
          services = [
            {
              "Group 1" = [
                {
                  "Soul Sync" = {
                    description = "Soul Sync Music";
                    href = "http://100.74.74.58:8008";
                  };
                }
              ];
            }
          ];
        };
      };
    };
  };
}
