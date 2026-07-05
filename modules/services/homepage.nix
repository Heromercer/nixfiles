{
  mercer.services.provides.homepage = {
    nixos = {
      services = {
        homepage-dashboard = {
          enable = true;
          openFirewall = true;
          widgets = [
            {
              resources = {
                cpu = true;
                disk = "/";
                memory = true;
              };
            }
          ];
        };
      };
    };
  };
}
