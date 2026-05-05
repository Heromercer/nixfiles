{
  mercer.services.provides.navidrome = {
    nixos =
      { pkgs, ... }:
      {
        services.navidrome = {
          enable = true;
          settings = {
            Address = "0.0.0.0";
            MusicFolder = "/music/";
          };
        };
        networking.firewall.allowedTCPPorts = [ 4533 ];
      };
  };
}
